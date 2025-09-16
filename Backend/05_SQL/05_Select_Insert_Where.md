# Data Manipulation

This section provides an in-depth look at the `SELECT`, `INSERT`, and `WHERE` commands, exploring their various forms and advanced functionalities for more precise data management.

## **1. The `SELECT` Statement: Forms and Functions**

The `SELECT` statement is the most powerful command for retrieving data. Its versatility allows for simple queries as well as complex aggregations and joins.

  * **Selecting All Columns:**

    ```sql
    -- Retrieves all columns for all records in the `Products` table.
    SELECT * FROM Products;
    ```

  * **Selecting Specific Columns:**

    ```sql
    -- Retrieves only the `ProductName` and `Price` columns.
    -- This is more efficient than `SELECT *` for large tables.
    SELECT ProductName, Price FROM Products;
    ```



  * **Filtering Aggregated Data with `HAVING`:**

    ```sql
    -- Selects only those categories where the average price is over $50.
    -- `HAVING` is used to filter `GROUP BY` results, whereas `WHERE` filters individual rows.
    SELECT Category, AVG(Price) AS AveragePrice
    FROM Products
    GROUP BY Category
    HAVING AveragePrice > 50;
    ```

## **2. The `INSERT` Statement: Multiple Forms**

While the basic `INSERT` statement adds one row at a time, there are more efficient ways to handle data insertion.

  * **Standard Insertion (Specifying Columns):**

    ```sql
    -- Inserts a new product by specifying the columns and their values.
    INSERT INTO Products (ProductID, ProductName, Price, StockQuantity, DateAdded)
    VALUES (2, 'Keyboard', 75.00, 150, '2025-09-16');
    ```

  * **Inserting Multiple Rows at Once:**

    ```sql
    -- Adds multiple products in a single statement for efficiency.
    INSERT INTO Products (ProductID, ProductName, Price, StockQuantity, DateAdded)
    VALUES
    (3, 'Mouse', 35.00, 200, '2025-09-16'),
    (4, 'Monitor', 250.00, 75, '2025-09-17');
    ```

  * **Inserting Data from Another Table:**

    ```sql
    -- Inserts data into a new table (e.g., `LowStockProducts`) from an existing table.
    CREATE TABLE LowStockProducts (ProductID INT, ProductName VARCHAR(255));
    INSERT INTO LowStockProducts (ProductID, ProductName)
    SELECT ProductID, ProductName
    FROM Products
    WHERE StockQuantity < 100;
    ```

## **3. The `WHERE` Clause: Advanced Conditions**

The `WHERE` clause can use a variety of operators and conditions to create complex and specific filters.

  * **Using `BETWEEN`:**

    ```sql
    -- Retrieves products with a price between 50 and 150 (inclusive).
    SELECT ProductName, Price FROM Products
    WHERE Price BETWEEN 50 AND 150;
    ```

  * **Using `IN`:**

    ```sql
    -- Selects products that are a 'Laptop' or a 'Monitor'.
    -- `IN` is a concise alternative to multiple `OR` conditions.
    SELECT ProductName, Price FROM Products
    WHERE ProductName IN ('Laptop', 'Monitor');
    ```

  * **Using `LIKE` with Wildcards:**

    ```sql
    -- The '%' wildcard matches any sequence of characters.
    -- Finds all products with a name starting with 'M'.
    SELECT ProductName FROM Products
    WHERE ProductName LIKE 'M%';

    -- The '_' wildcard matches a single character.
    -- Finds all 4-letter names starting with 'M'.
    SELECT ProductName FROM Products
    WHERE ProductName LIKE 'M___';
    ```

  * **Checking for `NULL` values:**

    ```sql
    -- Selects records where the `Description` column has no value.
    SELECT ProductID, ProductName FROM Products
    WHERE Description IS NULL;
    ```