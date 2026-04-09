# POS System Database

A relational database project for a **Point of Sale (POS) system**, designed and implemented in SQL. The database models a small retail store's daily operations — tracking customers, products, suppliers, sales, payments, returns, inventory, and staff users.

**Author:** Md Abdullah Al Amin 
Connect with me on [LinkedIn](https://www.linkedin.com/in/mdabdullah-amin)
---

## 📋 Project Overview

This project demonstrates the design of a normalized relational database for a retail POS system. It includes table creation with primary and foreign keys, sample data for realistic testing, and analytical SQL queries that extract business insights from the data.

The database was originally developed in MySQL (via phpMyAdmin) and has been made available in SQLite format for easy exploration using [DB Browser for SQLite](https://sqlitebrowser.org).

---

## 🗂️ Database Schema

The database consists of **10 interrelated tables**:

| Table | Description |
|---|---|
| `customers` | Customer information and loyalty points |
| `products` | Product catalog with pricing and stock |
| `suppliers` | Supplier contact details |
| `users` | Staff accounts (admin, cashier, manager) |
| `sales` | Sales transactions (header) |
| `saledetails` | Line items for each sale |
| `payments` | Payment records per sale |
| `discounts` | Discounts applied to sales |
| `returns` | Returned items and reasons |
| `inventory` | Stock movement tracking |

### Schema Overview

![Database Structure](screenshots/01_database_structure.png)

---

## 📊 Sample Data

### Customers
![Customers Table](screenshots/02_customers.png)

### Products
![Products Table](screenshots/03_products.png)

### Sales
![Sales Table](screenshots/04_sales.png)

### Sale Details
![Sale Details Table](screenshots/05_saledetails.png)

### Suppliers
![Suppliers Table](screenshots/06_suppliers.png)

### Users
![Users Table](screenshots/07_users.png)

---

## 🔍 Analytical Queries

Four SQL queries were written to demonstrate meaningful business insights that the database can provide.

### Query 1: Products Sorted by Price
Lists all products from most expensive to cheapest.

```sql
SELECT * FROM products ORDER BY Price DESC;
```

![Query 1 Result](screenshots/08_query_products_by_price.png)

---

### Query 2: Top Customers by Spending
Identifies the highest-spending customers using a `JOIN` with aggregation.

```sql
SELECT c.FirstName, c.LastName,
       COUNT(s.SaleID) AS TotalOrders,
       SUM(s.TotalAmount) AS TotalSpent
FROM customers c
JOIN sales s ON c.CustomerID = s.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalSpent DESC;
```

![Query 2 Result](screenshots/09_query_top_customers.png)

---

### Query 3: Best Selling Products
Ranks products by total quantity sold across all transactions.

```sql
SELECT p.ProductName, SUM(sd.Quantity) AS TotalSold
FROM products p
JOIN saledetails sd ON p.ProductID = sd.ProductID
GROUP BY p.ProductID
ORDER BY TotalSold DESC;
```

![Query 3 Result](screenshots/10_query_best_sellers.png)

---

### Query 4: Full Sales Report
A complete sales report combining customer and cashier information using a 3-table join.

```sql
SELECT s.SaleID,
       c.FirstName || ' ' || c.LastName AS Customer,
       u.FullName AS Cashier,
       s.TotalAmount,
       s.SaleDate
FROM sales s
JOIN customers c ON s.CustomerID = c.CustomerID
JOIN users u ON s.UserID = u.UserID;
```

![Query 4 Result](screenshots/11_query_sales_report.png)

---

## 🛠️ How to Run This Project

1. Download [DB Browser for SQLite](https://sqlitebrowser.org) (free).
2. Clone or download this repository.
3. Open DB Browser → **File → Open Database** → select `pos_system.db`.
4. Use the **Browse Data** tab to view tables.
5. Use the **Execute SQL** tab to run the queries above.

Alternatively, you can import `pos_system_sqlite.sql` into any SQLite-compatible tool to recreate the database from scratch.

---

## 🧠 SQL Concepts Demonstrated

- Database design and normalization
- `CREATE TABLE` with primary and foreign keys
- `INSERT INTO` with sample data
- `SELECT` with `ORDER BY`, `WHERE`, and column aliases
- Inner `JOIN` across multiple tables (up to 3-table joins)
- Aggregate functions: `COUNT()`, `SUM()`
- Grouping with `GROUP BY`
- String concatenation using `||`

---

## 📁 Repository Structure

```
pos-system-database/
├── README.md
├── pos_system_sqlite.sql
├── pos_system.db
└── screenshots/
    ├── 01_database_structure.png
    ├── 02_customers.png
    ├── 03_products.png
    ├── 04_sales.png
    ├── 05_saledetails.png
    ├── 06_suppliers.png
    ├── 07_users.png
    ├── 08_query_products_by_price.png
    ├── 09_query_top_customers.png
    ├── 10_query_best_sellers.png
    └── 11_query_sales_report.png
```

---

## 📝 Notes

This project was built with sample (hypothetical) data for demonstration purposes. It showcases the design and querying of a relational database and is intended as a learning portfolio project.
