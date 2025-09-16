# Operators

Operators are special symbols or keywords used in SQL statements to perform operations on one or more values. They are essential for calculations, comparisons, and creating complex conditions in queries.

## **1. Arithmetic Operators**

These operators are used to perform mathematical calculations. They are commonly used in the `SELECT` clause.

  * `+` (Addition)
  * `-` (Subtraction)
  * `*` (Multiplication)
  * `/` (Division)
  * `%` (Modulo - returns the remainder of a division)

<!-- end list -->

```sql
-- Calculates the sales price for each product with a 10% discount.
-- Also calculates the remaining stock after selling 10 units.
SELECT
    ProductName,
    Price,
    Price * 0.9 AS DiscountedPrice,
    StockQuantity - 10 AS RemainingStock
FROM
    Products;
```

## **2. Comparison Operators**

These operators are used in the `WHERE` clause to compare values and filter records. They return a boolean value (`TRUE`, `FALSE`, or `NULL`).

  * `=` (Equal to)
  * `!=` or `<>` (Not equal to)
  * `>` (Greater than)
  * `<` (Less than)
  * `>=` (Greater than or equal to)
  * `<=` (Less than or equal to)

<!-- end list -->

```sql
-- Selects products with a price of exactly 75.00.
SELECT ProductName, Price FROM Products
WHERE Price = 75.00;

-- Selects products with a price not equal to 35.00.
SELECT ProductName, Price FROM Products
WHERE Price <> 35.00;

-- Selects products that have a stock quantity of 100 or more.
SELECT ProductName, StockQuantity FROM Products
WHERE StockQuantity >= 100;
```

## **3. Logical Operators**

These operators are used to combine multiple conditions in the `WHERE` clause.

  * `AND`: Returns `TRUE` if both conditions are `TRUE`.
  * `OR`: Returns `TRUE` if at least one of the conditions is `TRUE`.
  * `NOT`: Negates a condition (returns `TRUE` if the condition is `FALSE`).
  * `IN`: Checks if a value is present in a list of values.
  * `BETWEEN`: Checks if a value is within a specified range.
  * `LIKE`: Used for pattern matching.

<!-- end list -->

```sql
-- Selects products that cost more than 100 AND have a stock quantity less than 150.
SELECT ProductName, Price, StockQuantity
FROM Products
WHERE Price > 100 AND StockQuantity < 150;

-- Selects products that cost less than 50 OR have a stock quantity less than 20.
SELECT ProductName, Price, StockQuantity
FROM Products
WHERE Price < 50 OR StockQuantity < 20;

-- Selects products that are NOT a 'Monitor'.
SELECT ProductName FROM Products
WHERE NOT ProductName = 'Monitor';
```
