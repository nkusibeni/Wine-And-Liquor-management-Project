-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2023 at 06:38 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wine_liquor_store`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_customer` (IN `Cus_ID` INT(5))   BEGIN
DELETE FROM customer WHERE Customer_ID=Cus_ID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_employees` (IN `Emp_ID` VARCHAR(5), `Role` VARCHAR(30))   BEGIN
DELETE FROM employees  WHERE Employee_ID=Emp_ID AND Position=Role;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_customer` (IN `Customer_ID` INT(5), `Customer_Name` VARCHAR(25), `Address` VARCHAR(50), `Phone` VARCHAR(13))   BEGIN
INSERT INTO customer VALUES(Customer_ID	,Customer_Name, Address ,Phone);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_employees` (IN `Employee_ID` VARCHAR(5), `First_Name` VARCHAR(15), `Last_Name` VARCHAR(15), `Address` VARCHAR(50), `Phone` VARCHAR(13), `Email` VARCHAR(30), `Position` VARCHAR(20))   BEGIN
INSERT INTO employees VALUES(Employee_ID,First_Name, Last_Name , Address, Phone , Email ,Position );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_inventory` (IN `Prod_ID` INT(5), `Supplier_Price` DOUBLE, `Demand_Price` DOUBLE, `Quantity_in_stock` INT(4), `SubCategory` VARCHAR(15), `Product_ID` VARCHAR(5), `Liters` FLOAT, `Updated_At` TIMESTAMP, `Updated_By` INT(5))   BEGIN
INSERT INTO inventory VALUES(Prod_ID, Supplier_Price, Demand_Price, Quantity_in_stock, SubCategory,Product_ID	, Liters , Updated_At , Updated_By );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_products` (IN `Product_ID` VARCHAR(5), `Product_Name` VARCHAR(20), `Category` VARCHAR(15), `Year_Produced` DATE, `Volume` FLOAT(4), `Brand` VARCHAR(15), `Product_description` VARCHAR(50), `Supplier_ID` VARCHAR(5))   BEGIN
INSERT INTO products VALUES(Product_ID , Product_Name,Category  ,Year_Produced ,Volume ,Brand , Product_description  , Supplier_ID);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_sales` (IN `Sales_ID` INT(5), `Sales_Date` DATETIME, `Customer_ID` INT(5), `Done_By` INT(5))   BEGIN
INSERT INTO sales VALUES(Sales_ID	, Sales_Date	, Customer_ID , Done_By );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_sale_details` (IN `Sale_detail_ID` INT(5), `Prod_ID` INT(5), `Sales_ID` INT(5), `Unit_Price` DOUBLE, `Sales_Quantity` INT(4), `Discount` DOUBLE, `Total_Amount` DOUBLE)   BEGIN
INSERT INTO sale_details VALUES(Sale_detail_ID	, Prod_ID	,Sales_ID , Unit_Price , Sales_Quantity	, Discount	, Total_Amount );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_supplier` (IN `Supplier_ID` VARCHAR(5), `Supplier_Name` VARCHAR(30), `Address` VARCHAR(50), `Phone` VARCHAR(13), `Email` VARCHAR(30), `Supplier_Description` VARCHAR(100))   BEGIN
INSERT INTO supplier VALUES(Supplier_ID	, Supplier_Name	,Address ,Phone	,Email, Supplier_Description );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_user_login` (IN `User_ID` INT(5), `User_Name` VARCHAR(15), `Password` VARCHAR(20), `Employee_ID` VARCHAR(5))   BEGIN
INSERT INTO user_login VALUES(User_ID,User_Name, Password ,Employee_ID);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `the_list_of_customers` ()   BEGIN
SELECT * FROM customer;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `the_list_of_employees` ()   BEGIN
SELECT * FROM employees;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `the_list_of_inventory` ()   BEGIN
SELECT * FROM inventory;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `the_list_of_liquor_above_AVG` ()   BEGIN
SELECT products.Product_ID, products.Product_Name,products.Category, inventory.SubCategory,inventory.Liters, products.Year_Produced,inventory.Quantity_in_stock FROM inventory JOIN products ON inventory.Product_ID=products.Product_ID WHERE  inventory.Quantity_in_stock>(SELECT AVG(inventory.Quantity_in_stock) FROM inventory JOIN products on inventory.Product_ID=products.Product_ID WHERE products.Category='Liquor');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `the_list_of_products` ()   BEGIN
SELECT * FROM products;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `the_list_of_sales` ()   BEGIN
SELECT * FROM sales;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `the_list_of_sale_details` ()   BEGIN
SELECT * FROM sale_details;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `the_list_of_suppliers` ()   BEGIN
SELECT * FROM supplier;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `the_list_of_users` ()   BEGIN
SELECT * FROM user_login;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_customer` (IN `Cus_ID` INT(5), `Contact` VARCHAR(30))   BEGIN
UPDATE customer SET Phone=Contact WHERE Customer_ID=Cus_ID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_employees` (IN `Emp_ID` VARCHAR(5), `Email_Address` VARCHAR(30))   BEGIN
UPDATE employees SET Email=Email_Address WHERE Employee_ID=Emp_ID;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` int(5) NOT NULL,
  `Customer_Name` varchar(25) NOT NULL,
  `Address` varchar(20) DEFAULT NULL,
  `Phone` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_ID`, `Customer_Name`, `Address`, `Phone`) VALUES
(1, 'JIMMY', 'Nyanza', '+250788922321'),
(2, 'Grace', 'Kigali, KK 777 st', '+250781239094'),
(3, 'Aime', 'KENYA', '+25470089623'),
(4, 'Nshimiye', 'Kigali', '+250788922321');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `Employee_ID` varchar(5) NOT NULL,
  `First_Name` varchar(15) NOT NULL,
  `Last_Name` varchar(15) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Phone` varchar(13) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Position` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`Employee_ID`, `First_Name`, `Last_Name`, `Address`, `Phone`, `Email`, `Position`) VALUES
('KLP01', 'Lucky', 'Paccy', 'Nyamata, EB 209 st', '+250708771112', 'Lucky@gmail.com', 'Cashier'),
('ML001', 'Tiffah', 'Bst', 'Nyamata, EB 209 st', '+250708779332', 'tiffah@gmail.com', 'Store Keeper'),
('NF001', 'Fahd', 'Niyo', 'Kigali, KK100 st', '+250789092234', 'fahad@gmail.com', 'Manager'),
('TB', 'Tumukunde', 'Blandine', 'Gatsibo', '+250788092415', 'tumublandine@gmail.com', 'Cashier');

--
-- Triggers `employees`
--
DELIMITER $$
CREATE TRIGGER `after_insert_employees` AFTER INSERT ON `employees` FOR EACH ROW BEGIN
INSERT INTO user_login VALUES('',NEW.Email, CONCAT(NEW.First_Name,'@12345'), NEW.Employee_ID);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `Prod_ID` int(5) NOT NULL,
  `Supplier_Price` double DEFAULT NULL,
  `Demand_Price` double DEFAULT NULL,
  `Quantity_in_stock` int(4) DEFAULT NULL,
  `SubCategory` varchar(15) NOT NULL,
  `Liters` float NOT NULL,
  `Product_ID` varchar(5) NOT NULL,
  `Updated_At` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Updated_By` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`Prod_ID`, `Supplier_Price`, `Demand_Price`, `Quantity_in_stock`, `SubCategory`, `Liters`, `Product_ID`, `Updated_At`, `Updated_By`) VALUES
(1, 80000, 100000, 37, 'Large', 5, 'WINE1', '2023-01-09 17:39:58', 1),
(2, 4500, 6000, 66, 'Large', 1, 'LIQ4', '2022-07-20 18:49:45', 4),
(3, 800, 1000, 17, 'Small', 0.25, 'LIQ02', '2023-01-09 17:40:55', 1),
(4, 4000, 6500, 45, 'Large', 1, 'LIQ02', '2022-07-20 20:52:43', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `list_of_customers`
-- (See below for the actual view)
--
CREATE TABLE `list_of_customers` (
`Customer_ID` int(5)
,`Customer_Name` varchar(25)
,`Address` varchar(20)
,`Phone` varchar(13)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `list_of_employees`
-- (See below for the actual view)
--
CREATE TABLE `list_of_employees` (
`Employee_ID` varchar(5)
,`First_Name` varchar(15)
,`Last_Name` varchar(15)
,`Address` varchar(50)
,`Phone` varchar(13)
,`Email` varchar(30)
,`Position` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `list_of_inventory`
-- (See below for the actual view)
--
CREATE TABLE `list_of_inventory` (
`Prod_ID` int(5)
,`Supplier_Price` double
,`Demand_Price` double
,`Quantity_in_stock` int(4)
,`SubCategory` varchar(15)
,`Liters` float
,`Product_ID` varchar(5)
,`Updated_At` timestamp
,`Updated_By` int(5)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `list_of_products`
-- (See below for the actual view)
--
CREATE TABLE `list_of_products` (
`Product_ID` varchar(5)
,`Product_Name` varchar(20)
,`Category` varchar(15)
,`Year_Produced` date
,`Volume` float
,`Brand` varchar(15)
,`Product_description` varchar(50)
,`Supplier_ID` varchar(5)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `list_of_sales`
-- (See below for the actual view)
--
CREATE TABLE `list_of_sales` (
`Sales_ID` int(5)
,`Sales_Date` datetime
,`Customer_ID` int(5)
,`Done_By` int(5)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `list_of_suppliers`
-- (See below for the actual view)
--
CREATE TABLE `list_of_suppliers` (
`Supplier_ID` varchar(5)
,`Supplier_Name` varchar(30)
,`Address` varchar(20)
,`Phone` varchar(13)
,`Email` varchar(30)
,`Supplier_Description` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `list_of_transactions`
-- (See below for the actual view)
--
CREATE TABLE `list_of_transactions` (
`Sale_detail_ID` int(5)
,`Prod_ID` int(5)
,`Sales_ID` int(5)
,`Unit_Price` double
,`Sales_Quantity` int(4)
,`Discount` double
,`Total_Amount` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `list_of_user`
-- (See below for the actual view)
--
CREATE TABLE `list_of_user` (
`User_ID` int(5)
,`User_Name` varchar(50)
,`Password` varchar(50)
,`Employee_ID` varchar(5)
);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Product_ID` varchar(5) NOT NULL,
  `Product_Name` varchar(20) NOT NULL,
  `Category` varchar(15) NOT NULL,
  `Year_Produced` date DEFAULT NULL,
  `Volume` float NOT NULL,
  `Brand` varchar(15) DEFAULT NULL,
  `Product_description` varchar(50) DEFAULT NULL,
  `Supplier_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Product_ID`, `Product_Name`, `Category`, `Year_Produced`, `Volume`, `Brand`, `Product_description`, `Supplier_ID`) VALUES
('LIQ02', 'Coffee gin', 'Liquor', '2015-07-10', 42.5, 'Esperanza', 'Coffee pure', 'ESP01'),
('LIQ4', 'RED WARAGI', 'Liquor', '2022-07-16', 42.5, 'Ngufu Waragis', 'A good Liquor for Winter', 'NGV00'),
('WINE1', 'Golden Lion', 'Wine', '2022-07-16', 40, 'Bulgaria', 'Red dry wine/ Traditional Bulgarian', 'TERR0');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `Sales_ID` int(5) NOT NULL,
  `Sales_Date` datetime NOT NULL,
  `Customer_ID` int(5) NOT NULL,
  `Done_By` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`Sales_ID`, `Sales_Date`, `Customer_ID`, `Done_By`) VALUES
(1, '2022-07-17 01:12:38', 1, 3),
(2, '2022-07-17 01:12:38', 2, 3),
(3, '2022-07-17 07:04:37', 3, 4),
(4, '2022-07-20 10:50:51', 4, 4),
(5, '2022-07-20 12:45:20', 4, 4),
(6, '2023-01-09 19:44:05', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `sale_details`
--

CREATE TABLE `sale_details` (
  `Sale_detail_ID` int(5) NOT NULL,
  `Prod_ID` int(5) NOT NULL,
  `Sales_ID` int(5) NOT NULL,
  `Unit_Price` double NOT NULL,
  `Sales_Quantity` int(4) NOT NULL,
  `Discount` double DEFAULT NULL,
  `Total_Amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sale_details`
--

INSERT INTO `sale_details` (`Sale_detail_ID`, `Prod_ID`, `Sales_ID`, `Unit_Price`, `Sales_Quantity`, `Discount`, `Total_Amount`) VALUES
(1, 2, 1, 6000, 4, 0, 24000),
(2, 1, 2, 100000, 1, 0, 100000),
(3, 3, 3, 1000, 50, 0, 50000),
(6, 2, 4, 6000, 20, 0, 120000),
(12, 3, 4, 1000, 33, 0, 33000),
(14, 1, 6, 100000, 2, 0, 200000),
(15, 3, 6, 1000, 10, 2.2, 9780);

--
-- Triggers `sale_details`
--
DELIMITER $$
CREATE TRIGGER `after_delete_sale_details` AFTER DELETE ON `sale_details` FOR EACH ROW BEGIN
UPDATE inventory SET inventory.Quantity_in_stock=Quantity_in_stock+OLD.Sales_Quantity WHERE OLD.Prod_ID=inventory.Prod_ID;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_sale_details` AFTER INSERT ON `sale_details` FOR EACH ROW BEGIN
DECLARE UserID INT(5);
SELECT user_login.User_ID INTO UserID FROM user_login WHERE user_login.User_ID=1;
UPDATE inventory,sale_details SET inventory.Quantity_in_stock=inventory.Quantity_in_stock-NEW.sales_quantity, inventory.Updated_By=UserID WHERE inventory.Prod_ID=NEW.Prod_ID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `stock_report`
-- (See below for the actual view)
--
CREATE TABLE `stock_report` (
`Product_ID` varchar(5)
,`Product_Name` varchar(20)
,`Category` varchar(15)
,`SubCategory` varchar(15)
,`Liters` float
,`Year_Produced` date
,`Quantity_in_stock` int(4)
);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `Supplier_ID` varchar(5) NOT NULL,
  `Supplier_Name` varchar(30) NOT NULL,
  `Address` varchar(20) NOT NULL,
  `Phone` varchar(13) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Supplier_Description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`Supplier_ID`, `Supplier_Name`, `Address`, `Phone`, `Email`, `Supplier_Description`) VALUES
('ESP01', 'Esperanza industries', 'Kigali, economic zon', '+25078880000', 'esperanzaindustries@info.rw', 'They make best quality at all!'),
('NGV00', 'Ngufu Gin Ltd', 'Ruyenzi', '+250788812320', 'nguvuginltd@info.rw', 'The biggest and best industry to produce liquor in Rwanda'),
('TERR0', 'Terrassa Wines', 'Kigali, KG100 st', '+250787890312', 'terrassawines@gmail.com', 'Best Wines distributors with European Priceless Wines and Liquor');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `User_ID` int(5) NOT NULL,
  `User_Name` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Employee_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`User_ID`, `User_Name`, `Password`, `Employee_ID`) VALUES
(1, 'Tiffah Nana', 'Nana@1', 'ML001'),
(3, 'Fahad Niyo', 'Niyo@1', 'NF001'),
(4, 'Jaem Lucky', 'Jaem@1', 'KLP01'),
(16, 'tumublandine@gmail.com', 'Tumukunde@12345', 'TB');

--
-- Triggers `user_login`
--
DELIMITER $$
CREATE TRIGGER `after_delete_user_login` AFTER DELETE ON `user_login` FOR EACH ROW BEGIN
DELETE FROM employees WHERE employees.Employee_ID=Old.Employee_ID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `list_of_customers`
--
DROP TABLE IF EXISTS `list_of_customers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list_of_customers`  AS SELECT `customer`.`Customer_ID` AS `Customer_ID`, `customer`.`Customer_Name` AS `Customer_Name`, `customer`.`Address` AS `Address`, `customer`.`Phone` AS `Phone` FROM `customer``customer`  ;

-- --------------------------------------------------------

--
-- Structure for view `list_of_employees`
--
DROP TABLE IF EXISTS `list_of_employees`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list_of_employees`  AS SELECT `employees`.`Employee_ID` AS `Employee_ID`, `employees`.`First_Name` AS `First_Name`, `employees`.`Last_Name` AS `Last_Name`, `employees`.`Address` AS `Address`, `employees`.`Phone` AS `Phone`, `employees`.`Email` AS `Email`, `employees`.`Position` AS `Position` FROM `employees``employees`  ;

-- --------------------------------------------------------

--
-- Structure for view `list_of_inventory`
--
DROP TABLE IF EXISTS `list_of_inventory`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list_of_inventory`  AS SELECT `inventory`.`Prod_ID` AS `Prod_ID`, `inventory`.`Supplier_Price` AS `Supplier_Price`, `inventory`.`Demand_Price` AS `Demand_Price`, `inventory`.`Quantity_in_stock` AS `Quantity_in_stock`, `inventory`.`SubCategory` AS `SubCategory`, `inventory`.`Liters` AS `Liters`, `inventory`.`Product_ID` AS `Product_ID`, `inventory`.`Updated_At` AS `Updated_At`, `inventory`.`Updated_By` AS `Updated_By` FROM `inventory``inventory`  ;

-- --------------------------------------------------------

--
-- Structure for view `list_of_products`
--
DROP TABLE IF EXISTS `list_of_products`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list_of_products`  AS SELECT `products`.`Product_ID` AS `Product_ID`, `products`.`Product_Name` AS `Product_Name`, `products`.`Category` AS `Category`, `products`.`Year_Produced` AS `Year_Produced`, `products`.`Volume` AS `Volume`, `products`.`Brand` AS `Brand`, `products`.`Product_description` AS `Product_description`, `products`.`Supplier_ID` AS `Supplier_ID` FROM `products``products`  ;

-- --------------------------------------------------------

--
-- Structure for view `list_of_sales`
--
DROP TABLE IF EXISTS `list_of_sales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list_of_sales`  AS SELECT `sales`.`Sales_ID` AS `Sales_ID`, `sales`.`Sales_Date` AS `Sales_Date`, `sales`.`Customer_ID` AS `Customer_ID`, `sales`.`Done_By` AS `Done_By` FROM `sales``sales`  ;

-- --------------------------------------------------------

--
-- Structure for view `list_of_suppliers`
--
DROP TABLE IF EXISTS `list_of_suppliers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list_of_suppliers`  AS SELECT `supplier`.`Supplier_ID` AS `Supplier_ID`, `supplier`.`Supplier_Name` AS `Supplier_Name`, `supplier`.`Address` AS `Address`, `supplier`.`Phone` AS `Phone`, `supplier`.`Email` AS `Email`, `supplier`.`Supplier_Description` AS `Supplier_Description` FROM `supplier``supplier`  ;

-- --------------------------------------------------------

--
-- Structure for view `list_of_transactions`
--
DROP TABLE IF EXISTS `list_of_transactions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list_of_transactions`  AS SELECT `sale_details`.`Sale_detail_ID` AS `Sale_detail_ID`, `sale_details`.`Prod_ID` AS `Prod_ID`, `sale_details`.`Sales_ID` AS `Sales_ID`, `sale_details`.`Unit_Price` AS `Unit_Price`, `sale_details`.`Sales_Quantity` AS `Sales_Quantity`, `sale_details`.`Discount` AS `Discount`, `sale_details`.`Total_Amount` AS `Total_Amount` FROM `sale_details``sale_details`  ;

-- --------------------------------------------------------

--
-- Structure for view `list_of_user`
--
DROP TABLE IF EXISTS `list_of_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list_of_user`  AS SELECT `user_login`.`User_ID` AS `User_ID`, `user_login`.`User_Name` AS `User_Name`, `user_login`.`Password` AS `Password`, `user_login`.`Employee_ID` AS `Employee_ID` FROM `user_login``user_login`  ;

-- --------------------------------------------------------

--
-- Structure for view `stock_report`
--
DROP TABLE IF EXISTS `stock_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stock_report`  AS SELECT `products`.`Product_ID` AS `Product_ID`, `products`.`Product_Name` AS `Product_Name`, `products`.`Category` AS `Category`, `inventory`.`SubCategory` AS `SubCategory`, `inventory`.`Liters` AS `Liters`, `products`.`Year_Produced` AS `Year_Produced`, `inventory`.`Quantity_in_stock` AS `Quantity_in_stock` FROM (`inventory` join `products` on(`inventory`.`Product_ID` = `products`.`Product_ID`)) WHERE `inventory`.`Quantity_in_stock` > (select avg(`inventory`.`Quantity_in_stock`) from (`inventory` join `products` on(`inventory`.`Product_ID` = `products`.`Product_ID`)) where `products`.`Category` = 'Liquor')  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`Employee_ID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`Prod_ID`),
  ADD KEY `Product_ID` (`Product_ID`),
  ADD KEY `Updated_By` (`Updated_By`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `Supplier_ID` (`Supplier_ID`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`Sales_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Done_By` (`Done_By`);

--
-- Indexes for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`Sale_detail_ID`),
  ADD KEY `Prod_ID` (`Prod_ID`),
  ADD KEY `Sales_ID` (`Sales_ID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Supplier_ID`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`User_ID`),
  ADD KEY `Employee_ID` (`Employee_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Customer_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `Prod_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `Sales_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `Sale_detail_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_login`
--
ALTER TABLE `user_login`
  MODIFY `User_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `products` (`Product_ID`),
  ADD CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`Updated_By`) REFERENCES `user_login` (`User_ID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`Supplier_ID`) REFERENCES `supplier` (`Supplier_ID`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`Done_By`) REFERENCES `user_login` (`User_ID`);

--
-- Constraints for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD CONSTRAINT `sale_details_ibfk_1` FOREIGN KEY (`Prod_ID`) REFERENCES `inventory` (`Prod_ID`),
  ADD CONSTRAINT `sale_details_ibfk_2` FOREIGN KEY (`Sales_ID`) REFERENCES `sales` (`Sales_ID`);

--
-- Constraints for table `user_login`
--
ALTER TABLE `user_login`
  ADD CONSTRAINT `user_login_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employees` (`Employee_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
