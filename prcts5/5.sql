CREATE TABLE Authors (
    author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR NOT NULL,
    published_year INT,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

ALTER TABLE Books ADD COLUMN genre VARCHAR(100);

ALTER TABLE Books ADD CONSTRAINT published_year CHECK (published_year <= 2025);

ALTER TABLE Books DROP COLUMN author_id;

CREATE TABLE Book_authors(
    book_id INT NOT NULL, 
    author_id INT NULL,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN Key (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Temp_Table (
    temp_column INT
)

DROP TABLE temp_table