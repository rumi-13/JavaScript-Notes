# Introduction to SQL

## 1.1. What is a Database?**

A database is an organized collection of structured information, or data, typically stored electronically in a computer system. It is designed to facilitate the storage, retrieval, modification, and deletion of data efficiently. Databases are essential for managing large volumes of information and are used in a wide range of applications, from simple websites to complex enterprise systems.

Databases are typically managed by a Database Management System (DBMS), which is a software application that interacts with the user, the database, and the database itself. MySQL is a popular open-source relational DBMS.

## 1.2. What is SQL?

SQL, or Structured Query Language, is a standard language for managing and manipulating relational databases. It is a declarative language, meaning that you specify what you want to achieve, and the database system figures out how to execute it. SQL is used for:

  * **Data Definition Language (DDL):** Used for creating and modifying the structure of database objects (e.g., tables, views, indexes).
  * **Data Manipulation Language (DML):** Used for manipulating data within the database (e.g., inserting, updating, deleting data).
  * **Data Control Language (DCL):** Used for controlling access to data (e.g., granting and revoking user permissions).
  * **Transaction Control Language (TCL):** Used for managing transactions (e.g., committing or rolling back changes).

## 1.3. SQL vs. NoSQL

SQL (Relational) and NoSQL (Non-relational) databases represent two fundamentally different approaches to data storage and retrieval.

  * **SQL Databases:**

      * **Structure:** Follow a rigid, predefined schema where data is organized into tables with rows and columns.
      * **Data Integrity:** Enforce data integrity through relationships, constraints, and transactions (ACID properties: Atomicity, Consistency, Isolation, Durability).
      * **Scalability:** Traditionally scale vertically by upgrading hardware, though horizontal scaling is possible.
      * **Best for:** Applications requiring complex queries, transactions, and a consistent data structure, such as financial systems or e-commerce platforms.

  * **NoSQL Databases:**

      * **Structure:** Do not require a fixed schema. Data is stored in various formats, such as key-value pairs, documents, wide-column stores, or graphs.
      * **Data Integrity:** Prioritize availability and partition tolerance over strict consistency (BASE properties: Basically Available, Soft state, Eventually consistent).
      * **Scalability:** Designed for horizontal scaling, allowing them to handle massive amounts of data by adding more servers.
      * **Best for:** Handling unstructured or semi-structured data, high-volume and high-velocity data, and applications requiring rapid development and flexible schemas, such as social media feeds or IoT data.
