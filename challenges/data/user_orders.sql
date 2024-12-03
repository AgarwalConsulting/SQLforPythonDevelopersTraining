CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO users (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com');

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    amount DECIMAL(10, 2),
    order_date TIMESTAMP
);

INSERT INTO orders (user_id, amount, order_date) VALUES
(1, 100.00, '2024-12-01'),
(2, 200.00, '2024-12-02'),
(3, 300.00, '2024-12-03'),
(1, 150.00, '2024-12-02'),
(2, 250.00, '2024-12-03');

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO products (name, price) VALUES
('Product A', 50.00),
('Product B', 150.00),
('Product C', 200.00);

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT
);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3),
(4, 2, 1),
(5, 1, 3);
