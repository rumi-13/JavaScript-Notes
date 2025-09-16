# Database and Table Management

## 1. Database Management

MySQL provides straightforward commands for creating, using, and deleting databases. A database serves as a container for related tables and other objects.


### **1.1. Creating a Database**

The `CREATE DATABASE` statement is used to create a new, empty database.

```sql
-- Creates a database named 'ProjectManagement'
CREATE DATABASE ProjectManagement;
```

### **1.2. Using a Database**

The `USE` statement is essential to specify which database you want to work with. All subsequent commands (e.g., creating tables) will apply to this selected database.

```sql
-- Selects 'ProjectManagement' for use
USE ProjectManagement;
```

### **1.3. Deleting a Database**

The `DROP DATABASE` statement permanently deletes a database and all its contents (tables, views, etc.). This action is irreversible.

```sql
-- Deletes the 'ProjectManagement' database
DROP DATABASE ProjectManagement;
```

## **2. Table Management**

Tables are the core components of a relational database, where data is organized into rows and columns. MySQL provides commands to create and delete tables within a selected database.

### **2.1. Creating a Table**

The `CREATE TABLE` statement defines a new table with its columns, data types, and constraints.

```sql
-- First, ensure you are using the correct database
USE ProjectManagement;

-- Creates a table named 'Tasks'
CREATE TABLE Tasks (
    TaskID INT PRIMARY KEY,
    TaskName VARCHAR(100) NOT NULL,
    Status VARCHAR(20) DEFAULT 'Pending',
    AssignedTo VARCHAR(50)
);
```

### **2.2. Deleting a Table**

The `DROP TABLE` statement permanently removes a table and all its data. Use with caution as this operation cannot be undone.

```sql
-- Deletes the 'Tasks' table
DROP TABLE Tasks;
```