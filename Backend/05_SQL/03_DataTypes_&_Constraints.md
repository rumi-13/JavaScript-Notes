# Data Types and Constraints

This section outlines the essential data types and constraints used in MySQL, which are crucial for defining the structure and ensuring the integrity of your data.

## **1. Data Types**

A data type specifies the kind of value that can be stored in a column (e.g., text, numbers, dates). Choosing the correct data type is important for optimizing storage, ensuring data validity, and improving performance.

  * **Numeric Data Types:**

      * `INT`: A standard integer (whole number).
      * `DECIMAL(p, s)`: A fixed-point number, ideal for monetary values, where `p` is the total number of digits and `s` is the number of digits after the decimal point.
      * `FLOAT` / `DOUBLE`: Used for floating-point (approximate) numbers.

  * **String Data Types:**

      * `VARCHAR(n)`: A variable-length string. `n` specifies the maximum length. It's space-efficient as it only stores the characters provided.
      * `CHAR(n)`: A fixed-length string. It always uses `n` characters of storage, even if the value is shorter.
      * `TEXT`: Used for storing large blocks of text.

  * **Date and Time Data Types:**

      * `DATE`: Stores the date in `YYYY-MM-DD` format.
      * `TIME`: Stores the time in `HH:MM:SS` format.
      * `DATETIME`: Stores both date and time in `YYYY-MM-DD HH:MM:SS` format.
      * `TIMESTAMP`: Stores a point in time, often used for recording the creation or last modification of a record.

## **2. Constraints**

Constraints are rules applied to columns in a table to limit the type of data that can be inserted or updated. They help maintain the accuracy, reliability, and integrity of the data.

  * **`NOT NULL`**: Ensures that a column cannot have a `NULL` value.
  * **`UNIQUE`**: Guarantees that all values in a column are unique.
  * **`PRIMARY KEY`**: A combination of `NOT NULL` and `UNIQUE`. It uniquely identifies each record in a table and is the most important constraint for creating relationships between tables.
  * **`FOREIGN KEY`**: Establishes a link between two tables. It enforces referential integrity by ensuring that a value in a column of one table corresponds to a value in the primary key of another table.
  * **`DEFAULT`**: Specifies a default value for a column if no value is provided during an `INSERT` operation.
  * **`CHECK`**: Enforces that a value in a column satisfies a specific condition.

### **MySQL Code Snippets: Data Types and Constraints**

This example demonstrates how to apply various data types and constraints when creating a `Products` table for an e-commerce application.

```sql
-- Use the 'Shop' database (assuming it has been created)
USE Shop;

-- Creates a 'Products' table with various data types and constraints
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(255) NOT NULL UNIQUE,
    Price DECIMAL(10, 2) NOT NULL CHECK (Price > 0),
    StockQuantity INT NOT NULL DEFAULT 0,
    Description TEXT,
    DateAdded DATE NOT NULL,
    LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Example of creating a foreign key to link to a 'Suppliers' table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(255) NOT NULL
);

CREATE TABLE ProductSuppliers (
    ProductID INT,
    SupplierID INT,
    PRIMARY KEY (ProductID, SupplierID), -- Composite primary key
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID) ON DELETE CASCADE
);
```