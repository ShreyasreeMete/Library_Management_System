# Library Management System

A SQL-based **Library Management System** designed to demonstrate relational database design, data management, constraints, and SQL querying.

## 📌 Project Overview

This project implements a library database using SQL. It manages:

- Library members
- Authors
- Books
- Book borrowings
- Borrowing status
- Review scores and ratings

The database is named `library_management_system`.

## 🗂️ Database Structure

The project contains four main tables:

### 1. `members`

Stores information about library members.

| Column | Description |
|---|---|
| `member_id` | Primary key, auto-incremented |
| `member_name` | Member's name |
| `email` | Unique email address |
| `phone` | Unique phone number |
| `age` | Member age; must be 18 or above |
| `gender` | Male, Female, or Other |
| `city` | Member's city |
| `registration_date` | Registration date |

### 2. `authors`

Stores information about book authors.

| Column | Description |
|---|---|
| `author_id` | Primary key, auto-incremented |
| `author_name` | Author's name |
| `email` | Unique email address |
| `genre` | Author's genre |
| `years_active` | Number of active years |

### 3. `books`

Stores information about books.

| Column | Description |
|---|---|
| `book_id` | Primary key, auto-incremented |
| `title` | Unique book title |
| `category` | Book category |
| `loan_period_days` | Allowed loan period |
| `price` | Book price |
| `author_id` | Foreign key referencing `authors` |

### 4. `borrowings`

Tracks books borrowed by members.

| Column | Description |
|---|---|
| `borrowing_id` | Primary key, auto-incremented |
| `member_id` | Foreign key referencing `members` |
| `book_id` | Foreign key referencing `books` |
| `borrow_date` | Date the book was borrowed |
| `status` | `BORROWED`, `RETURNED`, or `LOST` |
| `review_score` | Score from 0 to 100 |
| `rating` | Grade such as A, B, C, D, or F |

## 🔗 Relationships

The database uses foreign keys to maintain relationships between tables:

```text
authors
   │
   └──< books
           │
           └──< borrowings >── members
```

- One author can be associated with multiple books.
- A member can have borrowing records.
- A book can appear in borrowing records.
- `borrowings.member_id` references `members.member_id`.
- `borrowings.book_id` references `books.book_id`.
- `books.author_id` references `authors.author_id`.

## 🛡️ Data Integrity

The database uses several SQL constraints:

- `PRIMARY KEY` for unique record identification
- `AUTO_INCREMENT` for generated IDs
- `NOT NULL` for required fields
- `UNIQUE` for email, phone, and book title
- `CHECK` constraints for valid age, gender, loan period, price, status, review score, and rating
- `FOREIGN KEY` constraints for relationships
- `ON DELETE CASCADE` for member-related borrowing records
- A composite `UNIQUE (member_id, book_id)` constraint in `borrowings`

## 📊 Sample Data

The project includes sample records for:

- 4 authors
- 5 books
- 6 members
- 10 borrowing transactions

The sample data covers Fiction, Science, History, and Self-Help categories.

## 🔎 SQL Concepts Demonstrated

This project demonstrates practical SQL operations including:

- Database creation
- Table creation
- Data insertion using `INSERT`
- Data retrieval using `SELECT`
- Column selection and aliases
- Filtering with `WHERE`
- Logical operators `AND` and `OR`
- `BETWEEN`
- `IN`
- Pattern matching with `LIKE`
- Sorting using `ORDER BY`
- Limiting results using `LIMIT`
- Removing duplicate values with `DISTINCT`
- Updating records using `UPDATE`
- Deleting records using `DELETE`
- Primary keys and foreign keys
- Data validation using `CHECK`
- Referential integrity

## 🚀 How to Run

### Prerequisites

Install a MySQL-compatible database environment such as:

- MySQL Shell

### Steps

1. Clone this repository:

```bash
git clone <your-repository-url>
```

2. Open the SQL file:

```text
Library_Management_System.sql
```

3. Run the SQL script in MySQL Workbench or your preferred MySQL client.

4. The script creates the database:

```sql
library_management_system
```

5. Select the database:

```sql
USE library_management_system;
```

6. Execute the queries to explore the tables and sample data.

## 📁 Project Files

```text
Library-Management-System/
│
├── Library_Management_System.sql
├── Library_Management_System.docx
└── README.md
```

## 💡 Example Queries

Find members from Kolkata:

```sql
SELECT *
FROM members
WHERE city = 'Kolkata';
```

Find members between ages 21 and 23:

```sql
SELECT *
FROM members
WHERE age BETWEEN 21 AND 23;
```

Find members whose names start with A:

```sql
SELECT *
FROM members
WHERE member_name LIKE 'A%';
```

Display the three oldest members:

```sql
SELECT *
FROM members
ORDER BY age DESC
LIMIT 3;
```

Display unique cities:

```sql
SELECT DISTINCT city
FROM members;
```

## 🎯 Learning Outcomes

This project helps demonstrate practical understanding of:

- Relational database design
- SQL table creation
- Primary and foreign keys
- Data integrity and validation
- CRUD operations
- Filtering and sorting data
- Basic database relationships
- Writing structured SQL queries

## 👩‍💻 Author

**Shreyasree Mete**

This project was created as a practical SQL/database project to demonstrate database design and SQL querying skills.
