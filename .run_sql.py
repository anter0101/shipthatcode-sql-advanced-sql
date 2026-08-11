#!/usr/bin/env python3
"""Run a SQL script in an in-memory SQLite DB and print query results.

Mimics `sqlite3 -batch -noheader :memory: < script.sql` output:
columns joined by `|`, one row per line.
"""
from __future__ import annotations

import sqlite3
import sys


def split_statements(sql: str) -> list[str]:
    parts: list[str] = []
    acc: list[str] = []
    in_str: str | None = None
    i = 0
    n = len(sql)
    while i < n:
        c = sql[i]
        if in_str is not None:
            acc.append(c)
            if c == in_str:
                # doubled quote escape
                if i + 1 < n and sql[i + 1] == in_str:
                    acc.append(sql[i + 1])
                    i += 2
                    continue
                in_str = None
            i += 1
            continue
        if c in ("'", '"'):
            in_str = c
            acc.append(c)
            i += 1
            continue
        if c == ";":
            stmt = "".join(acc).strip()
            if stmt:
                parts.append(stmt)
            acc = []
            i += 1
            continue
        acc.append(c)
        i += 1
    stmt = "".join(acc).strip()
    if stmt:
        parts.append(stmt)
    return parts


def strip_line_comments(stmt: str) -> str:
    lines = []
    for line in stmt.splitlines():
        if line.lstrip().startswith("--"):
            continue
        lines.append(line)
    return "\n".join(lines).strip()


def main() -> int:
    if len(sys.argv) < 2:
        print("usage: run_sql.py <script.sql> [extra.sql-from-stdin-file]", file=sys.stderr)
        return 2

    chunks: list[str] = []
    # Optional stdin / .in file may prepend setup SQL (empty for this course).
    if len(sys.argv) >= 3 and sys.argv[2] != "-":
        with open(sys.argv[2], encoding="utf-8") as f:
            chunks.append(f.read())
    elif not sys.stdin.isatty():
        chunks.append(sys.stdin.read())

    with open(sys.argv[1], encoding="utf-8") as f:
        chunks.append(f.read())

    sql = "\n".join(chunks)
    conn = sqlite3.connect(":memory:")
    cur = conn.cursor()
    out_lines: list[str] = []

    for raw in split_statements(sql):
        stmt = strip_line_comments(raw)
        if not stmt:
            continue
        try:
            cur.execute(stmt)
        except sqlite3.Error as e:
            print(e, file=sys.stderr)
            return 1
        if cur.description is not None:
            for row in cur.fetchall():
                out_lines.append(
                    "|".join("" if v is None else str(v) for v in row)
                )

    sys.stdout.write("\n".join(out_lines))
    if out_lines:
        sys.stdout.write("\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
