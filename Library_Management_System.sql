DROP DATABASE IF EXISTS library_management_db;
CREATE DATABASE IF NOT EXISTS library_management_db;
USE library_management_db;


CREATE TABLE members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    member_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    age INT CHECK (age >= 18),
    gender VARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Other')),
    city VARCHAR(50),
    registration_date DATE DEFAULT (CURRENT_DATE)
);


CREATE TABLE authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    genre VARCHAR(100) NOT NULL,
    years_active INT CHECK (years_active >= 0)
);


CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL UNIQUE,
    category VARCHAR(50) NOT NULL,
    loan_period_days INT CHECK (loan_period_days > 0),
    price DECIMAL(10,2) CHECK (price >= 0),
    author_id INT,
    CONSTRAINT fk_book_author
        FOREIGN KEY (author_id)
        REFERENCES authors(author_id)
);


CREATE TABLE borrowings (
    borrowing_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT NOT NULL,
    book_id INT NOT NULL,
    borrow_date DATE DEFAULT (CURRENT_DATE),
    status VARCHAR(20) DEFAULT 'BORROWED'
        CHECK (status IN ('BORROWED', 'RETURNED', 'LOST')),
    review_score DECIMAL(5,2)
        CHECK (review_score IS NULL OR (review_score >= 0 AND review_score <= 100)),
    rating CHAR(1)
        CHECK (rating IS NULL OR rating IN ('A', 'B', 'C', 'D', 'F')),
    CONSTRAINT fk_borrowing_member
        FOREIGN KEY (member_id)
        REFERENCES members(member_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_borrowing_book
        FOREIGN KEY (book_id)
        REFERENCES books(book_id),
    CONSTRAINT uk_member_book
        UNIQUE (member_id, book_id)
);

INSERT INTO authors
(author_name, email, genre, years_active)
VALUES
('Rahul Sharma', 'rahul@library.com', 'Fiction', 8),
('Priya Singh', 'priya@library.com', 'Science', 6),
('Amit Kumar', 'amit@library.com', 'History', 10),
('Sneha Das', 'sneha@library.com', 'Self-Help', 7);


SELECT * FROM authors;


INSERT INTO books
(title, category, loan_period_days, price, author_id)
VALUES
('The Silent River', 'Fiction', 14, 450, 1),
('Wonders of Physics', 'Science', 14, 550, 2),
('Empires of the East', 'History', 21, 650, 3),
('The Habit Blueprint', 'Self-Help', 14, 400, 4),
('Beyond the Horizon', 'Fiction', 21, 500, 3);


INSERT INTO members
(member_name, email, phone, age, gender, city)
VALUES
('Arjun Mehta', 'arjun@gmail.com', '9876543210', 22, 'Male', 'Kolkata'),
('Neha Roy', 'neha@gmail.com', '9876543211', 23, 'Female', 'Delhi'),
('Rahul Das', 'rahul.das@gmail.com', '9876543212', 21, 'Male', 'Kolkata'),
('Priya Sen', 'priya.sen@gmail.com', '9876543213', 24, 'Female', 'Mumbai'),
('Amit Roy', 'amit.roy@gmail.com', '9876543214', 25, 'Male', 'Delhi'),
('Sneha Paul', 'sneha.paul@gmail.com', '9876543215', 22, 'Female', 'Kolkata');


INSERT INTO borrowings
(member_id, book_id, borrow_date, status, review_score, rating)
VALUES
(1, 1, '2026-01-10', 'RETURNED', 85, 'A'),
(1, 3, '2026-01-15', 'RETURNED', 92, 'A'),
(2, 2, '2026-02-01', 'RETURNED', 78, 'B'),
(2, 4, '2026-02-10', 'BORROWED', NULL, NULL),
(3, 3, '2026-01-20', 'RETURNED', 88, 'A'),
(3, 5, '2026-02-05', 'BORROWED', NULL, NULL),
(4, 1, '2026-01-12', 'RETURNED', 72, 'B'),
(4, 4, '2026-02-15', 'BORROWED', NULL, NULL),
(5, 2, '2026-03-01', 'BORROWED', NULL, NULL),
(6, 3, '2026-01-25', 'RETURNED', 95, 'A');


SELECT * FROM members;


SELECT member_id, member_name, email FROM members;


SELECT member_name AS name, email AS email_address FROM members;


SELECT * FROM members WHERE city = 'Kolkata';

SELECT * FROM members WHERE age > 22;


SELECT * FROM members WHERE city = 'Kolkata' AND age >= 22;


SELECT * FROM members WHERE city = 'Kolkata' OR city = 'Delhi';


SELECT * FROM members WHERE age BETWEEN 21 AND 23;


SELECT * FROM members WHERE city IN ('Kolkata', 'Delhi');


SELECT * FROM members WHERE member_name LIKE 'A%';


SELECT * FROM members WHERE member_name LIKE '%a';


SELECT * FROM members WHERE member_name LIKE '%Roy%';


SELECT * FROM members ORDER BY age ASC;


SELECT * FROM members ORDER BY age DESC;


SELECT * FROM members ORDER BY city ASC, age DESC;


SELECT * FROM members ORDER BY age DESC LIMIT 3;


SELECT DISTINCT city FROM members;


UPDATE members SET city = 'Bangalore' WHERE member_id = 1;


DELETE FROM members WHERE member_id = 6;





