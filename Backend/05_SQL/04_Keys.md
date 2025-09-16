# Keys

This section explains the fundamental concept of keys in relational databases, focusing on `PRIMARY KEY` and `FOREIGN KEY`, which are crucial for defining relationships and maintaining data integrity.

## **1. Primary Key**

A `PRIMARY KEY` is a column or a set of columns that uniquely identifies each record in a table. A table can only have one primary key. The values in a primary key column must be `UNIQUE` and `NOT NULL`.

```sql
-- Creates a 'Students' table with 'StudentID' as the primary key.
-- This ensures every student record has a unique and non-null ID.
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE
);
```

## **2. Foreign Key**

A `FOREIGN KEY` is a column or a set of columns in one table that refers to the `PRIMARY KEY` of another table. It establishes a link between the two tables, enforcing **referential integrity**. This means that a value in the foreign key column must exist in the primary key column it references.

```sql
-- Creates a 'Courses' table with 'CourseID' as the primary key.
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100) NOT NULL,
    Instructor VARCHAR(50)
);

-- Creates an 'Enrollments' table to link students and courses.
-- The table uses 'StudentID' and 'CourseID' as foreign keys.
-- The 'FOREIGN KEY' constraint links this table back to the 'Students' and 'Courses' tables.
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
```