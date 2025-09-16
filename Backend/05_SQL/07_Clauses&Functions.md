# Clauses and Aggregate Functions

This section details the most common clauses and functions used in `SELECT` statements for data aggregation, filtering, sorting, and limiting results.

## **1. Aggregate Functions**

Aggregate functions perform a calculation on a set of values and return a single value. They are often used with the `GROUP BY` clause.

  * `COUNT()`: Returns the number of rows.
  * `SUM()`: Calculates the total sum of a numeric column.
  * `AVG()`: Calculates the average value of a numeric column.
  * `MIN()`: Returns the minimum value in a column.
  * `MAX()`: Returns the maximum value in a column.

<!-- end list -->

```sql
-- Calculates the total number of products, the average price, and the total stock.
SELECT
    COUNT(*) AS TotalProducts,
    AVG(Price) AS AveragePrice,
    SUM(StockQuantity) AS TotalStock
FROM
    Products;
```

## **2. `GROUP BY` Clause**

The `GROUP BY` clause is used to group rows that have the same values into summary rows, typically with aggregate functions.

```sql
-- Assume a `Category` column exists in the `Products` table.
-- Groups products by their category and calculates the total stock for each category.
SELECT
    Category,
    SUM(StockQuantity) AS TotalStock
FROM
    Products
GROUP BY
    Category;
```

## **3. `HAVING` Clause**

The `HAVING` clause filters the results of a `GROUP BY` clause. Unlike `WHERE`, which filters individual rows, `HAVING` filters the groups created by `GROUP BY`.

```sql
-- Finds categories where the total stock is less than 100.
SELECT
    Category,
    SUM(StockQuantity) AS TotalStock
FROM
    Products
GROUP BY
    Category
HAVING
    TotalStock < 100;
```

## **4. `ORDER BY` Clause**

The `ORDER BY` clause sorts the result set in either ascending (`ASC`) or descending (`DESC`) order. The default sort order is `ASC`.

```sql
-- Selects all products and sorts them by price in descending order.
SELECT
    ProductName,
    Price
FROM
    Products
ORDER BY
    Price DESC;
```

## **5. `LIMIT` Clause**

The `LIMIT` clause is used to restrict the number of rows returned by a query. It is often used for pagination.

```sql
-- Selects the 5 most expensive products.
-- This clause is typically used with `ORDER BY`.
SELECT
    ProductName,
    Price
FROM
    Products
ORDER BY
    Price DESC
LIMIT 5;
```

## **6. General Order of Execution**

Understanding the logical order in which MySQL processes these clauses is crucial for writing effective queries. The query is executed in the following sequence:

1.  **`FROM`**: Identifies the table(s) to query.
2.  **`WHERE`**: Filters the individual rows based on a condition.
3.  **`GROUP BY`**: Groups the filtered rows.
4.  **`HAVING`**: Filters the grouped rows.
5.  **`SELECT`**: Retrieves and evaluates the specified expressions (columns, aggregates).
6.  **`ORDER BY`**: Sorts the final result set.
7.  **`LIMIT`**: Restricts the number of rows in the final result set.