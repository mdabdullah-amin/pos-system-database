-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2025 at 10:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

--
-- Database: "pos_system"
--

-- --------------------------------------------------------

--
-- Table structure for table "customers"
--

CREATE TABLE "customers" (
  "CustomerID" INTEGER NOT NULL,
  "FirstName" TEXT NOT NULL,
  "LastName" TEXT NOT NULL,
  "Email" TEXT DEFAULT NULL,
  "PhoneNumber" TEXT DEFAULT NULL,
  "LoyaltyPoints" INTEGER DEFAULT 0
);

--
-- Dumping data for table "customers"
--

INSERT INTO "customers" ("CustomerID", "FirstName", "LastName", "Email", "PhoneNumber", "LoyaltyPoints") VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '1234567890', 100),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', 150),
(3, 'John', 'Doe', 'john.doe@example.com', '1234567890', 100),
(4, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', 150),
(5, 'John', 'Doe', 'john.doe@example.com', '1234567890', 100),
(6, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', 150),
(7, 'John', 'Doe', 'john.doe@example.com', '1234567890', 100),
(8, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', 150),
(9, 'John', 'Doe', 'john.doe@example.com', '1234567890', 100),
(10, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', 150),
(11, 'John', 'Doe', 'john.doe@example.com', '1234567890', 100),
(12, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', 150),
(13, 'John', 'Doe', 'john.doe@example.com', '1234567890', 100),
(14, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', 150),
(15, 'John', 'Doe', 'john.doe@example.com', '1234567890', 100),
(16, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', 150),
(17, 'John', 'Doe', 'john.doe@example.com', '1234567890', 100),
(18, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', 150),
(19, 'John', 'Doe', 'john.doe@example.com', '1234567890', 100),
(20, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', 150),
(21, 'John', 'Doe', 'john.doe@example.com', '1234567890', 100),
(22, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', 150),
(23, 'John', 'Doe', 'john.doe@example.com', '1234567890', 100),
(24, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', 150),
(25, 'John', 'Doe', 'john.doe@example.com', '1234567890', 100),
(26, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', 150);

-- --------------------------------------------------------

--
-- Table structure for table "discounts"
--

CREATE TABLE "discounts" (
  "DiscountID" INTEGER NOT NULL,
  "SaleID" INTEGER DEFAULT NULL,
  "DiscountAmount" REAL DEFAULT NULL,
  "DiscountType" TEXT NOT NULL
);

--
-- Dumping data for table "discounts"
--

INSERT INTO "discounts" ("DiscountID", "SaleID", "DiscountAmount", "DiscountType") VALUES
(3, 3, 20.00, 'Fixed Amount'),
(4, 4, 5.00, 'Percentage');

-- --------------------------------------------------------

--
-- Table structure for table "inventory"
--

CREATE TABLE "inventory" (
  "InventoryID" INTEGER NOT NULL,
  "ProductID" INTEGER DEFAULT NULL,
  "QuantityAdded" INTEGER DEFAULT NULL,
  "DateAdded" datetime DEFAULT CURRENT_TIMESTAMP
);

--
-- Dumping data for table "inventory"
--

INSERT INTO "inventory" ("InventoryID", "ProductID", "QuantityAdded", "DateAdded") VALUES
(9, 1, 20, '2025-01-30 12:00:00'),
(10, 2, 30, '2025-01-30 13:00:00');

-- --------------------------------------------------------

--
-- Table structure for table "payments"
--

CREATE TABLE "payments" (
  "PaymentID" INTEGER NOT NULL,
  "SaleID" INTEGER DEFAULT NULL,
  "PaymentMethod" TEXT NOT NULL,
  "PaymentDate" datetime DEFAULT NULL,
  "Amount" REAL NOT NULL,
  "UserID" INTEGER DEFAULT NULL
);

--
-- Dumping data for table "payments"
--

INSERT INTO "payments" ("PaymentID", "SaleID", "PaymentMethod", "PaymentDate", "Amount", "UserID") VALUES
(32, 3, 'Credit', '2025-01-30 10:00:00', 150.00, NULL),
(33, 4, 'Cash', '2025-01-30 11:00:00', 55.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table "products"
--

CREATE TABLE "products" (
  "ProductID" INTEGER NOT NULL,
  "ProductName" TEXT NOT NULL,
  "Category" TEXT DEFAULT NULL,
  "Price" REAL NOT NULL,
  "StockQuantity" INTEGER NOT NULL,
  "ProductDescription" text DEFAULT NULL
);

--
-- Dumping data for table "products"
--

INSERT INTO "products" ("ProductID", "ProductName", "Category", "Price", "StockQuantity", "ProductDescription") VALUES
(1, 'Product 1', NULL, 25.00, 0, 'Description for Product 1'),
(2, 'Product 2', NULL, 30.00, 0, 'Description for Product 2'),
(3, 'Product 1', NULL, 25.00, 0, 'Description for Product 1'),
(4, 'Product 2', NULL, 30.00, 0, 'Description for Product 2'),
(5, 'Product 3', NULL, 50.00, 0, 'Description for Product 3');

-- --------------------------------------------------------

--
-- Table structure for table "returns"
--

CREATE TABLE "returns" (
  "ReturnID" INTEGER NOT NULL,
  "SaleID" INTEGER DEFAULT NULL,
  "ReturnDate" datetime DEFAULT NULL,
  "AmountRefunded" REAL DEFAULT NULL
);

--
-- Dumping data for table "returns"
--

INSERT INTO "returns" ("ReturnID", "SaleID", "ReturnDate", "AmountRefunded") VALUES
(2, 3, '2025-01-31 15:00:00', 50.00);

-- --------------------------------------------------------

--
-- Table structure for table "saledetails"
--

CREATE TABLE "saledetails" (
  "SaleDetailID" INTEGER NOT NULL,
  "SaleID" INTEGER DEFAULT NULL,
  "ProductID" INTEGER DEFAULT NULL,
  "Quantity" INTEGER NOT NULL,
  "Subtotal" REAL NOT NULL
);

--
-- Dumping data for table "saledetails"
--

INSERT INTO "saledetails" ("SaleDetailID", "SaleID", "ProductID", "Quantity", "Subtotal") VALUES
(5, 3, 4, 5, 0.00),
(6, 4, 3, 3, 0.00),
(7, 3, 5, 4, 0.00),
(8, 3, 4, 6, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table "sales"
--

CREATE TABLE "sales" (
  "SaleID" INTEGER NOT NULL,
  "CustomerID" INTEGER DEFAULT NULL,
  "SaleDate" datetime DEFAULT CURRENT_TIMESTAMP,
  "TotalAmount" REAL NOT NULL,
  "UserID" INTEGER DEFAULT NULL
);

--
-- Dumping data for table "sales"
--

INSERT INTO "sales" ("SaleID", "CustomerID", "SaleDate", "TotalAmount", "UserID") VALUES
(3, 1, '2025-01-30 00:44:12', 150.00, NULL),
(4, 2, '2025-01-30 00:44:12', 55.00, NULL),
(5, 1, '2025-01-30 00:45:20', 150.00, NULL),
(6, 2, '2025-01-30 00:45:20', 55.00, NULL),
(7, 1, '2025-01-30 00:45:45', 150.00, NULL),
(8, 2, '2025-01-30 00:45:45', 55.00, NULL),
(9, 1, '2025-01-30 00:46:04', 150.00, NULL),
(10, 2, '2025-01-30 00:46:04', 55.00, NULL),
(11, 1, '2025-01-30 00:47:39', 150.00, NULL),
(12, 2, '2025-01-30 00:47:39', 55.00, NULL),
(13, 1, '2025-01-30 00:51:18', 150.00, NULL),
(14, 2, '2025-01-30 00:51:18', 55.00, NULL),
(15, 1, '2025-01-30 01:10:42', 150.00, NULL),
(16, 2, '2025-01-30 01:10:42', 55.00, NULL),
(17, 1, '2025-01-30 01:12:13', 150.00, NULL),
(18, 2, '2025-01-30 01:12:13', 55.00, NULL),
(19, 1, '2025-01-30 01:15:31', 150.00, NULL),
(20, 2, '2025-01-30 01:15:31', 55.00, NULL),
(21, 1, '2025-01-30 01:16:57', 150.00, NULL),
(22, 2, '2025-01-30 01:16:57', 55.00, NULL),
(23, 1, '2025-01-30 01:21:45', 150.00, NULL),
(24, 2, '2025-01-30 01:21:45', 55.00, NULL),
(25, 1, '2025-01-30 01:23:20', 150.00, NULL),
(26, 2, '2025-01-30 01:23:20', 55.00, NULL),
(27, 1, '2025-01-30 01:27:08', 150.00, NULL),
(28, 2, '2025-01-30 01:27:08', 55.00, NULL),
(29, 1, '2025-01-30 01:29:10', 150.00, NULL),
(30, 2, '2025-01-30 01:29:10', 55.00, NULL),
(31, 1, '2025-01-30 01:29:28', 150.00, NULL),
(32, 2, '2025-01-30 01:29:28', 55.00, NULL),
(33, 1, '2025-01-30 01:30:02', 150.00, NULL),
(34, 2, '2025-01-30 01:30:02', 55.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table "suppliers"
--

CREATE TABLE "suppliers" (
  "SupplierID" INTEGER NOT NULL,
  "SupplierName" TEXT NOT NULL,
  "ContactPerson" TEXT DEFAULT NULL,
  "PhoneNumber" TEXT DEFAULT NULL,
  "Email" TEXT DEFAULT NULL,
  "Address" TEXT DEFAULT NULL
);

--
-- Dumping data for table "suppliers"
--

INSERT INTO "suppliers" ("SupplierID", "SupplierName", "ContactPerson", "PhoneNumber", "Email", "Address") VALUES
(1, 'ABC Electronics', 'John Doe', '123-456-7890', 'contact@abc.com', '123 Tech Street'),
(2, 'XYZ Supplies', 'Jane Smith', '987-654-3210', 'info@xyzsupplies.com', '456 Commerce Blvd'),
(3, 'ABC Electronics', 'John Doe', '123-456-7890', 'contact@abc.com', '123 Tech Street'),
(4, 'XYZ Supplies', 'Jane Smith', '987-654-3210', 'info@xyzsupplies.com', '456 Commerce Blvd'),
(5, 'ABC Electronics', 'John Doe', '123-456-7890', 'contact@abc.com', '123 Tech Street'),
(6, 'XYZ Supplies', 'Jane Smith', '987-654-3210', 'info@xyzsupplies.com', '456 Commerce Blvd'),
(7, 'ABC Electronics', 'John Doe', '123-456-7890', 'contact@abc.com', '123 Tech Street'),
(8, 'XYZ Supplies', 'Jane Smith', '987-654-3210', 'info@xyzsupplies.com', '456 Commerce Blvd'),
(9, 'ABC Electronics', 'John Doe', '123-456-7890', 'contact@abc.com', '123 Tech Street'),
(10, 'XYZ Supplies', 'Jane Smith', '987-654-3210', 'info@xyzsupplies.com', '456 Commerce Blvd'),
(11, 'ABC Electronics', 'John Doe', '123-456-7890', 'contact@abc.com', '123 Tech Street'),
(12, 'XYZ Supplies', 'Jane Smith', '987-654-3210', 'info@xyzsupplies.com', '456 Commerce Blvd'),
(13, 'ABC Electronics', 'John Doe', '123-456-7890', 'contact@abc.com', '123 Tech Street'),
(14, 'XYZ Supplies', 'Jane Smith', '987-654-3210', 'info@xyzsupplies.com', '456 Commerce Blvd'),
(15, 'ABC Electronics', 'John Doe', '123-456-7890', 'contact@abc.com', '123 Tech Street'),
(16, 'XYZ Supplies', 'Jane Smith', '987-654-3210', 'info@xyzsupplies.com', '456 Commerce Blvd'),
(17, 'ABC Electronics', 'John Doe', '123-456-7890', 'contact@abc.com', '123 Tech Street'),
(18, 'XYZ Supplies', 'Jane Smith', '987-654-3210', 'info@xyzsupplies.com', '456 Commerce Blvd'),
(19, 'ABC Electronics', 'John Doe', '123-456-7890', 'contact@abc.com', '123 Tech Street'),
(20, 'XYZ Supplies', 'Jane Smith', '987-654-3210', 'info@xyzsupplies.com', '456 Commerce Blvd'),
(21, 'ABC Electronics', 'John Doe', '123-456-7890', 'contact@abc.com', '123 Tech Street'),
(22, 'XYZ Supplies', 'Jane Smith', '987-654-3210', 'info@xyzsupplies.com', '456 Commerce Blvd'),
(23, 'ABC Electronics', 'John Doe', '123-456-7890', 'contact@abc.com', '123 Tech Street'),
(24, 'XYZ Supplies', 'Jane Smith', '987-654-3210', 'info@xyzsupplies.com', '456 Commerce Blvd');

-- --------------------------------------------------------

--
-- Table structure for table "users"
--

CREATE TABLE "users" (
  "UserID" INTEGER NOT NULL,
  "Username" TEXT NOT NULL,
  "Role" TEXT NOT NULL,
  "Password" TEXT NOT NULL
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table "customers"
--

--
-- Indexes for table "discounts"
--

--
-- Indexes for table "inventory"
--

--
-- Indexes for table "payments"
--

--
-- Indexes for table "products"
--

--
-- Indexes for table "returns"
--

--
-- Indexes for table "saledetails"
--

--
-- Indexes for table "sales"
--

--
-- Indexes for table "suppliers"
--

--
-- Indexes for table "users"
--

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table "customers"
--

--
-- AUTO_INCREMENT for table "discounts"
--

--
-- AUTO_INCREMENT for table "inventory"
--

--
-- AUTO_INCREMENT for table "payments"
--

--
-- AUTO_INCREMENT for table "products"
--

--
-- AUTO_INCREMENT for table "returns"
--

--
-- AUTO_INCREMENT for table "saledetails"
--

--
-- AUTO_INCREMENT for table "sales"
--

--
-- AUTO_INCREMENT for table "suppliers"
--

--
-- AUTO_INCREMENT for table "users"
--

--
-- Constraints for dumped tables
--

--
-- Constraints for table "discounts"
--

--
-- Constraints for table "inventory"
--

--
-- Constraints for table "payments"
--

--
-- Constraints for table "returns"
--

--
-- Constraints for table "saledetails"
--

--
-- Constraints for table "sales"
--

