-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2024 at 11:15 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `autodata1`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `username` varchar(255) NOT NULL,
  `pass` text NOT NULL,
  `email` text NOT NULL,
  `names` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`username`, `pass`, `email`, `names`) VALUES
('alabala', 'alabala', 'alalal@alabala.com', 'Ala BG'),
('joanbg', 'joanbg', 'joanbg@alabala.com', 'Joan BG'),
('kokoebot', 'Koko123', 'kokoe@abv.bg', 'KOKO');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `b_id` int(11) NOT NULL,
  `b_name` text DEFAULT NULL,
  `picture` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`b_id`, `b_name`, `picture`) VALUES
(1, 'Audi', NULL),
(2, 'BMW', NULL),
(3, 'Honda', NULL),
(4, 'Infinity', NULL),
(5, 'Lexus', NULL),
(6, 'Mazda', NULL),
(7, 'Mercedes-Benz', NULL),
(8, 'Subaru', NULL),
(9, 'Toyota', NULL),
(10, 'Volkswagen', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `car_type`
--

CREATE TABLE `car_type` (
  `ct_id` int(11) NOT NULL,
  `ct_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car_type`
--

INSERT INTO `car_type` (`ct_id`, `ct_name`) VALUES
(1, 'Кабриолет'),
(2, 'Купе'),
(3, 'Седан'),
(4, 'Комби'),
(5, 'Хечбек'),
(6, 'SUV');

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `f_acc` varchar(255) DEFAULT NULL,
  `f_model` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `m_id` int(11) NOT NULL,
  `m_name` text DEFAULT NULL,
  `m_year` varchar(11) DEFAULT NULL,
  `m_brand` int(11) DEFAULT NULL,
  `m_motor` int(11) DEFAULT NULL,
  `m_doors` int(11) NOT NULL,
  `m_type` int(11) DEFAULT NULL,
  `m_weight` int(11) NOT NULL,
  `m_seats` int(5) DEFAULT NULL,
  `m_fuel` double(10,1) DEFAULT NULL,
  `m_acceleration` double(10,1) DEFAULT NULL,
  `m_speed` int(5) DEFAULT NULL,
  `m_fueltank` int(5) DEFAULT NULL,
  `m_drivewheel` varchar(30) DEFAULT NULL,
  `m_geartype` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`m_id`, `m_name`, `m_year`, `m_brand`, `m_motor`, `m_doors`, `m_type`, `m_weight`, `m_seats`, `m_fuel`, `m_acceleration`, `m_speed`, `m_fueltank`, `m_drivewheel`, `m_geartype`) VALUES
(1, 'civic', '1991-1995', 3, 1, 5, 5, 1080, 5, 7.5, 7.3, 225, 45, 'Front wheel drive', '5 gears, manual transmission'),
(2, 'CRV-III', '2006-2009', 3, 2, 5, 6, 1537, 5, 11.8, 11.0, 190, 58, 'Front wheel drive', '5 gears, automatic transmissio'),
(3, 'Accord VII', '2002-2007', 3, 3, 4, 3, 1390, 5, 9.0, 7.9, 227, 65, 'Front wheel drive', '6 gears, manual transmission'),
(4, 'S2000', '2004-2008', 3, 4, 2, 1, 1270, 2, 9.9, 6.2, 240, 50, 'Rear wheel drive', '6 gears, manual transmission'),
(5, 'Prelude V', '1998-2001', 3, 5, 2, 2, 1320, 4, 10.6, 6.8, 228, 60, 'Front wheel drive', '5 gears, manual transmission'),
(6, 'Q7', '2009-2014', 1, 6, 5, 6, 2680, 5, 11.3, 5.5, 250, 100, 'All wheel drive (4x4)', '6 gears, automatic transmission tiptronic'),
(7, 'RS6', '2015-2018', 1, 7, 5, 4, 1950, 5, 9.6, 3.7, 250, 75, 'All wheel drive (4x4)', '8 gears, automatic transmission tiptronic'),
(8, 'TT RS', '2009-2010', 1, 8, 3, 2, 1450, 4, 9.2, 4.6, 250, 60, 'All wheel drive (4x4)', '6 gears, manual transmission');

-- --------------------------------------------------------

--
-- Table structure for table `motor`
--

CREATE TABLE `motor` (
  `mt_id` int(11) NOT NULL,
  `mt_name` text DEFAULT NULL,
  `mt_power` int(11) DEFAULT NULL,
  `mt_fuel` varchar(11) DEFAULT NULL,
  `mt_volume` int(11) DEFAULT NULL,
  `mt_cylinders` int(11) DEFAULT NULL,
  `mt_torque` int(5) DEFAULT NULL,
  `mt_enginelayout` varchar(20) DEFAULT NULL,
  `mt_engineconfiguration` varchar(20) DEFAULT NULL,
  `mt_compressionratio` varchar(20) DEFAULT NULL,
  `mt_engineaspiration` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `motor`
--

INSERT INTO `motor` (`mt_id`, `mt_name`, `mt_power`, `mt_fuel`, `mt_volume`, `mt_cylinders`, `mt_torque`, `mt_enginelayout`, `mt_engineconfiguration`, `mt_compressionratio`, `mt_engineaspiration`) VALUES
(1, 'B16A2', 160, 'Gasoline', 1595, 4, 150, 'Front', 'Inline', '10.2:1', '	Naturally aspirated'),
(2, 'K24Z1', 166, 'Gasoline', 2354, 4, 218, 'Front', 'Inline', '9.7:1', 'Naturally aspirated'),
(3, 'K24', 190, 'Gasoline', 2354, 4, 220, 'Front', 'Inline', '10.5:1', 'Naturally aspirated '),
(4, 'F20C', 240, 'Gasoline', 1997, 4, 208, 'Front', 'Inline', '11:1', 'Naturally aspirated '),
(5, 'H22A4', 200, 'Gasoline', 2157, 4, 210, 'Front', 'Inline', '11:1', 'Naturally aspirated '),
(6, 'CCGA', 500, 'Diesel', 5934, 12, 1000, 'Front', 'V-engine', '16:1', 'Twin-Turbo, Intercooler'),
(7, 'CWUC', 605, 'Gasoline', 3993, 8, 750, 'Front', 'V-engine', '9.3:1', 'BiTurbo, Intercooler'),
(8, 'CEPA', 340, 'Gasoline', 2480, 5, 450, 'Front', 'Inline', '10:1', 'Turbocharger, Intercooler');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`b_id`);

--
-- Indexes for table `car_type`
--
ALTER TABLE `car_type`
  ADD PRIMARY KEY (`ct_id`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD KEY `f_acc` (`f_acc`),
  ADD KEY `f_model` (`f_model`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`m_id`),
  ADD KEY `m_brand` (`m_brand`),
  ADD KEY `m_motor` (`m_motor`),
  ADD KEY `fk_model_type` (`m_type`);

--
-- Indexes for table `motor`
--
ALTER TABLE `motor`
  ADD PRIMARY KEY (`mt_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `favourites_ibfk_1` FOREIGN KEY (`f_acc`) REFERENCES `account` (`username`),
  ADD CONSTRAINT `favourites_ibfk_2` FOREIGN KEY (`f_model`) REFERENCES `model` (`m_id`);

--
-- Constraints for table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `fk_model_brand` FOREIGN KEY (`m_brand`) REFERENCES `brand` (`b_id`),
  ADD CONSTRAINT `fk_model_motor` FOREIGN KEY (`m_motor`) REFERENCES `motor` (`mt_id`),
  ADD CONSTRAINT `fk_model_type` FOREIGN KEY (`m_type`) REFERENCES `car_type` (`ct_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
