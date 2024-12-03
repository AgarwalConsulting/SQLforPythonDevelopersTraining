-- Authors Table
CREATE TABLE Authors (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    birthdate DATE,
    nationality VARCHAR(50)
);

-- Books Table -- 10,000
CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(150),
    author_id INT REFERENCES Authors(author_id),
    genre VARCHAR(50),
    publication_year INT,
    price DECIMAL(10, 2)
);

-- 'Fiction', 'Non-Fiction', 'Fantasy', 'Mystery'

-- Sales Table
CREATE TABLE Sales (
    sale_id SERIAL PRIMARY KEY,
    book_id INT REFERENCES Books(book_id),
    sale_date DATE,
    quantity INT,
    total_price DECIMAL(10, 2)
);


-- CREATE INDEX ON sales(book_id);
-- CREATE INDEX ON books(author_id);
-- CREATE INDEX ON books(genre);
-- CREATE INDEX ON authors(nationality);
