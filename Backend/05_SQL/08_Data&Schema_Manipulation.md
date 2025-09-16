# Data and Schema Modification

This section provides a detailed overview of commands used to modify data (`UPDATE`, `DELETE`) and the structure of a table (`ALTER`, `TRUNCATE`).

## **1. `UPDATE` Statement**

The `UPDATE` statement is used to modify existing data in a table. It is crucial to use a `WHERE` clause to specify which rows to change; otherwise, all rows in the table will be updated.

```sql
-- Updates the `Price` and `StockQuantity` for a specific product.
-- The WHERE clause targets the row with `ProductID` 2.
UPDATE Products
SET
    Price = 80.00,
    StockQuantity = 175
WHERE
    ProductID = 2;
```

## **2. `DELETE` Statement**

The `DELETE` statement is used to remove one or more rows from a table. Without a `WHERE` clause, it will remove all rows, but the table structure and its indexes will remain.

```sql
-- Deletes a single row from the `Products` table.
DELETE FROM Products
WHERE ProductID = 4;

-- Deletes all rows from the `Products` table.
-- WARNING: This is a permanent operation.
-- DELETE FROM Products;
```

## **3. `ALTER TABLE` Statement**

The `ALTER TABLE` statement is a Data Definition Language (DDL) command used to add, modify, or drop columns, or to add and drop constraints after a table has been created.

  * **Adding a Column:**

    ```sql
    -- Adds a new column named `SupplierID` to the `Products` table.
    ALTER TABLE Products
    ADD SupplierID INT;
    ```

  * **Modifying a Column:**

    ```sql
    -- Modifies the `ProductName` column to a longer character limit.
    ALTER TABLE Products
    MODIFY COLUMN ProductName VARCHAR(300) NOT NULL;
    ```

  * **Dropping a Column:**

    ```sql
    -- Removes the `SupplierID` column from the `Products` table.
    ALTER TABLE Products
    DROP COLUMN SupplierID;
    ```

## **4. `TRUNCATE TABLE` Statement**

The `TRUNCATE TABLE` statement is a DDL command that quickly deletes all rows from a table. It is much faster and more efficient than `DELETE FROM table` for removing all data because it does not log individual row deletions. It also resets the auto-increment counter.

```sql
-- Removes all data from the `Products` table.
-- This operation is faster than DELETE FROM Products.
-- It also resets the AUTO_INCREMENT counter for the table.
TRUNCATE TABLE Products;
```