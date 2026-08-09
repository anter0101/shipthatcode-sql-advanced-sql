CREATE TABLE users (id INTEGER PRIMARY KEY, email TEXT, country TEXT, age INTEGER);
INSERT INTO users VALUES
    (1, 'ada@x.io',   'US', 36),
    (2, 'bob@x.io',   'UK', 25),
    (3, 'carol@x.io', 'US', 40),
    (4, 'dan@x.io',   'CA', 30),
    (5, 'eve@x.io',   'US', 22),
    (6, 'frank@x.io', 'US', 55);

CREATE INDEX idx_users_country_age ON users (country, age);

SELECT email FROM users
WHERE country = 'US' AND age >= 30
ORDER BY age DESC;
