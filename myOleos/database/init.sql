-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 04, 2020 at 06:13 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1
--SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
--SET AUTOCOMMIT = 0;
--START TRANSACTION;
--SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database:  marcos y oleos 
--

-- --------------------------------------------------------

--
-- Table structure for table  cat_product 
--

CREATE TABLE  cat_product  (
   Cat_ProductID   SERIAL PRIMARY KEY ,
   Name  varchar(100) NOT NULL
);

--
-- Dumping data for table  cat_product 
--

INSERT INTO  cat_product  ( Cat_ProductID ,  Name ) VALUES
(1, 'Cuadro'),
(2, 'Oleo'),
(3, 'Base'),
(4, 'Impresión'),
(5, 'Marco'),
(6, 'Marialuisa');

-- --------------------------------------------------------

--
-- Table structure for table  cat_status 
--

CREATE TABLE  cat_status  (
   StatusID   SERIAL PRIMARY KEY,
   Name  varchar(30) NOT NULL
)  ;

--
-- Dumping data for table  cat_status 
--

INSERT INTO  cat_status  ( StatusID ,  Name ) VALUES
(1, 'Entregado'),
(2, 'Enviado'),
(3, 'En realización');

-- --------------------------------------------------------

--
-- Table structure for table  material 
--

CREATE TABLE  material  (
   MaterialID  SERIAL PRIMARY KEY,
   Name  varchar(100) NOT NULL,
   RestockNo  INT NOT NULL,
   Quantity  INT NOT NULL,
   Cost  decimal(10,0) DEFAULT NULL,
   ProductID   BIGINT DEFAULT NULL,
   FOREIGN KEY (ProductID) REFERENCES product (ProductID)
) ;

--
-- Dumping data for table  material 
--

INSERT INTO  material  ( MaterialID ,  Name ,  RestockNo ,  Quantity ,  Cost ,  ProductID ) VALUES
(1, 'Marco Negro', 2, 3, '200', 1),
(2, 'Base Roja', 2, 4, '450', 2),
(3, 'Base Verde', 2, 5, '450', 3);

-- --------------------------------------------------------

--
-- Table structure for table  orders 
--

CREATE TABLE  orders  (
   OrderID   SERIAL PRIMARY KEY,
   StartingPayment  decimal(10,0) NOT NULL,
   Type  varchar(255) NOT NULL,
   TotalCost  decimal(10,0) NOT NULL,
   Status   BIGINT NOT NULL,
   Description  varchar(255) NOT NULL,
   DueDate  date NOT NULL,
   Expenses  decimal(10,0) NOT NULL,
   StartingDate  date NOT NULL,
   UserID   BIGINT NOT NULL,
   ProductID   BIGINT NOT NULL,
   FOREIGN KEY (Status) REFERENCES cat_status (StatusID),
   FOREIGN KEY (UserID) REFERENCES users (UserID),
   FOREIGN KEY (ProductID) REFERENCES product (ProductID)
)  ;

--
-- Dumping data for table  orders 
--

INSERT INTO  orders  ( OrderID ,  StartingPayment ,  Type ,  TotalCost ,  Status ,  Description ,  DueDate ,  Expenses ,  StartingDate ,  UserID ,  ProductID ) VALUES
(1, '1000', 'domicilio', '2000', 3, 'Compra de marcos negros de Batman', '2020-06-11', '1000', '2020-06-11', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table  product 
--

CREATE TABLE  product  (
   ProductID    SERIAL PRIMARY KEY ,
   Name  varchar(100) NOT NULL,
   Type   BIGINT NOT NULL,
   Cost  decimal(10,0) NOT NULL
)  ;

--
-- Dumping data for table  product 
--

INSERT INTO  product  ( ProductID ,  Name ,  Type ,  Cost ) VALUES
(1, 'Batman Dark Knight Rises', 1, '450'),
(2, 'Elefante', 2, '600'),
(3, 'Arbol', 3, '1200');

-- --------------------------------------------------------

--
-- Table structure for table  users 
--

CREATE TABLE  users  (
   UserID   SERIAL PRIMARY KEY ,
   UserName  varchar(100) NOT NULL,
   Address  varchar(255) NOT NULL,
   Phone  varchar(20) NOT NULL,
   Password  varchar(60) NOT NULL
)  ;

--
-- Dumping data for table  users 
--

INSERT INTO  users  ( UserID ,  UserName ,  Address ,  Phone ,  Password ) VALUES
(1, 'marcosydiseños', 'Sindicato Nacional de Electricistas 29, Hab Electra, 54060 Tlalnepantla de Baz, Méx.', '55 4127 4743', 'marcosydiseños123');

-- --
-- -- Indexes for dumped tables
-- --

-- --
-- -- Indexes for table  cat_product 
-- --
-- ALTER TABLE  cat_product 
--   ADD PRIMARY KEY ( Cat_ProductID );

-- --
-- -- Indexes for table  cat_status 
-- --
-- ALTER TABLE  cat_status 
--   ADD PRIMARY KEY ( StatusID );

-- --
-- -- Indexes for table  mateial 
-- --
-- ALTER TABLE  mateial 
--   ADD PRIMARY KEY ( MaterialID ),
--   ADD FOREIGN KEY  ProductID  REFERENCES product(ProductID);

-- --
-- -- Indexes for table  orders 
-- --
-- ALTER TABLE  orders 
--   ADD PRIMARY KEY ( OrderID ),
--   ADD FOREIGN KEY  (UserID) REFERENCES  users( UserID ),
--   ADD FOREIGN KEY  (ProductID)  REFERENCES product(ProductID);,
--   ADD KEY  Status  ( Status );

-- --
-- -- Indexes for table  product 
-- --
-- ALTER TABLE  product 
--   ADD PRIMARY KEY ( ProductID ),
--   ADD KEY  FK_Type  ( Type );

-- --
-- -- Indexes for table  users 
-- --
-- ALTER TABLE  users 
--   ADD PRIMARY KEY ( UserID );

-- --
-- -- AUTO_INCREMENT for dumped tables
-- --

-- --
-- -- AUTO_INCREMENT for table  cat_product 
-- --
-- ALTER TABLE  cat_product 
--   ALTER  Cat_ProductID   BIGINT NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

-- --
-- -- AUTO_INCREMENT for table  cat_status 
-- --
-- ALTER TABLE  cat_status 
--   ALTER  StatusID   BIGINT NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

-- --
-- -- AUTO_INCREMENT for table  mateial 
-- --
-- ALTER TABLE  mateial 
--   ALTER  MaterialID  INT NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

-- --
-- -- AUTO_INCREMENT for table  orders 
-- --
-- ALTER TABLE  orders 
--   ALTER  OrderID   BIGINT NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

-- --
-- -- AUTO_INCREMENT for table  product 
-- --
-- ALTER TABLE  product 
--   ALTER  ProductID   BIGINT NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

-- --
-- -- AUTO_INCREMENT for table  users 
-- --
-- ALTER TABLE  users 
--   ALTER  UserID   BIGINT NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

-- --
-- -- Constraints for dumped tables
-- --

-- --
-- -- Constraints for table  mateial 
-- --
-- ALTER TABLE  mateial 
--   ADD CONSTRAINT  mateial_ibfk_1  FOREIGN KEY ( ProductID ) REFERENCES  product  ( ProductID );

-- --
-- -- Constraints for table  orders 
-- --
-- ALTER TABLE  orders 
--   ADD CONSTRAINT  orders_ibfk_1  FOREIGN KEY ( UserID ) REFERENCES  users  ( UserID ),
--   ADD CONSTRAINT  orders_ibfk_2  FOREIGN KEY ( ProductID ) REFERENCES  product  ( ProductID ),
--   ADD CONSTRAINT  orders_ibfk_3  FOREIGN KEY ( Status ) REFERENCES  cat_status  ( StatusID );

-- --
-- -- Constraints for table  product 
-- --
-- ALTER TABLE  product 
--   ADD CONSTRAINT  FK_Type  FOREIGN KEY ( Type ) REFERENCES  cat_product  ( Cat_ProductID );
-- COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
