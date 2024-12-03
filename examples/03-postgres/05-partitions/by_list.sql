CREATE TABLE customer_accounts (
    customer_id SERIAL PRIMARY KEY,
    customer_name TEXT NOT NULL,
    region TEXT NOT NULL,
    account_balance NUMERIC
) PARTITION BY LIST (region);

CREATE TABLE customer_accounts_north PARTITION OF customer_accounts
FOR VALUES IN ('North');

CREATE TABLE customer_accounts_south PARTITION OF customer_accounts
FOR VALUES IN ('South');

CREATE TABLE customer_accounts_east PARTITION OF customer_accounts
FOR VALUES IN ('East');

CREATE TABLE customer_accounts_west PARTITION OF customer_accounts
FOR VALUES IN ('West');

-- CREATE TABLE customer_accounts_central PARTITION OF customer_accounts FOR VALUES IN ('Central');
