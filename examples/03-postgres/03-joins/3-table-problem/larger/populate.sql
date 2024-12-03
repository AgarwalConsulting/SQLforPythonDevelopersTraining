-- Populate Authors Table
DO $$
BEGIN
    FOR i IN 1..10000 LOOP
        INSERT INTO Authors (name, birthdate, nationality)
        VALUES (
            'Author ' || i,
            DATE '1950-01-01' + (i % 20000),
            CASE WHEN i % 3 = 0 THEN 'American'
                 WHEN i % 3 = 1 THEN 'British'
                 ELSE 'Canadian' END
        );
    END LOOP;
END $$;

-- Populate Books Table
DO $$
BEGIN
    FOR i IN 1..100000 LOOP
        INSERT INTO Books (title, author_id, genre, publication_year, price)
        VALUES (
            'Book ' || i,
            (i % 10000) + 1, -- Link to Authors
            CASE WHEN i % 5 = 0 THEN 'Fiction'
                 WHEN i % 5 = 1 THEN 'Non-Fiction'
                 WHEN i % 5 = 2 THEN 'Fantasy'
                 WHEN i % 5 = 3 THEN 'Mystery'
                 ELSE 'Sci-Fi' END,
            2000 + (i % 23),
            ROUND((i % 50) + 5 + RANDOM()::NUMERIC, 2) -- Cast RANDOM() to NUMERIC
        );
    END LOOP;
END $$;

-- Populate Sales Table
DO $$
BEGIN
    FOR i IN 1..100000 LOOP
        INSERT INTO Sales (book_id, sale_date, quantity, total_price)
        VALUES (
            (i % 100000) + 1, -- Link to Books
            CURRENT_DATE - (i % 365),
            (i % 10) + 1,
            ROUND(((i % 50) + 5 + RANDOM()::NUMERIC) * ((i % 10) + 1), 2) -- Cast RANDOM() to NUMERIC
        );
    END LOOP;
END $$;
