CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    sale_date DATE NOT NULL,
    region TEXT,
    sale_amount NUMERIC
);

INSERT INTO sales (sale_date, region, sale_amount) VALUES
('2023-11-01', 'North', 100),
('2023-11-02', 'North', 200),
('2023-11-03', 'North', 150),
('2023-11-01', 'South', 120),
('2023-11-02', 'South', 180),
('2023-11-03', 'South', 130);

SELECT
    region,
    sale_date,
    sale_amount,
    SUM(sale_amount) OVER (PARTITION BY region ORDER BY sale_date) AS running_total
FROM sales
ORDER BY region, sale_date;


-- PARTITION BY region: Resets the running total for each region.

-- ORDER BY sale_date: Ensures the running total is calculated in date order.
