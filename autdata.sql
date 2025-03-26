-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2024 at 11:26 AM
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
-- Database: `autdata`
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
(4, 'Peugeot', NULL),
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
(8, 'TT RS', '2009-2010', 1, 8, 3, 2, 1450, 4, 9.2, 4.6, 250, 60, 'All wheel drive (4x4)', '6 gears, manual transmission'),
(9, 'A8', '2013-2017', 1, 9, 4, 3, 1830, 5, 7.8, 5.7, 250, 82, 'All wheel drive (4x4)', '8 gears, automatic transmission tiptronic'),
(10, 'A3', '2016-2018', 1, 10, 4, 3, 1525, 5, 7.4, 5.8, 210, 55, 'All wheel drive (4x4)', '6 gears, automatic transmission S tronic'),
(11, 'M5 E60', '2007-2010', 2, 11, 4, 3, 1780, 5, 14.4, 4.7, 250, 70, 'Rear wheel drive', '7 gears, automatic transmission SMG'),
(12, '5 Series E39', '2000-2004', 2, 12, 4, 3, 1585, 5, 13.3, 6.2, 250, 70, 'Rear wheel drive', '6 gears, manual transmission'),
(13, 'M4 F82', '2016-2017', 2, 13, 2, 2, 1510, 2, 8.5, 3.8, 305, 60, 'Rear wheel drive', '7 gears, automatic transmission DCT'),
(14, '5 Series E34', '1992-1995', 2, 14, 4, 3, 1605, 5, 11.4, 6.8, 250, 80, 'Rear wheel drive', '	5 gears, automatic transmission'),
(15, '1 Series Coupe E82', '2012-2013', 2, 15, 2, 2, 1560, 4, 11.3, 4.8, 241, 53, 'Rear wheel drive', '7 gears, automatic transmission DCT'),
(16, '307 CC', '2003-2005', 4, 16, 2, 1, 1457, 4, 8.2, 10.9, 207, 60, 'Front wheel drive', '5 gears, manual transmission'),
(17, '406 Phase II', '2000-2004', 4, 17, 4, 3, 1455, 5, 10.5, 8.1, 240, 70, 'Front wheel drive', '5 gears, manual transmission'),
(18, 'RCZ', '2013-2015', 4, 18, 2, 2, 1280, 4, 6.3, 5.9, 250, 55, 'Front wheel drive', '6 gears, manual transmission'),
(19, '404', '1963-1975', 4, 19, 4, 3, 1100, 5, 7.5, 25.0, 128, 55, 'Rear wheel drive', '4 gears, manual transmission'),
(20, '308', '2014-2017', 4, 20, 5, 5, 1290, 5, 3.8, 8.6, 2018, 53, 'Front wheel drive', '6 gears, manual transmission');

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
(1, 'B16A2', 160, 'Gasoline', 1595, 4, 150, 'Front', 'Inline', '10.2:1', 'Naturally aspirated'),
(2, 'K24Z1', 166, 'Gasoline', 2354, 4, 218, 'Front', 'Inline', '9.7:1', 'Naturally aspirated'),
(3, 'K24', 190, 'Gasoline', 2354, 4, 220, 'Front', 'Inline', '10.5:1', 'Naturally aspirated '),
(4, 'F20C', 240, 'Gasoline', 1997, 4, 208, 'Front', 'Inline', '11:1', 'Naturally aspirated '),
(5, 'H22A4', 200, 'Gasoline', 2157, 4, 210, 'Front', 'Inline', '11:1', 'Naturally aspirated '),
(6, 'CCGA', 500, 'Diesel', 5934, 12, 1000, 'Front', 'V-engine', '16:1', 'Twin-Turbo, Intercooler'),
(7, 'CWUC', 605, 'Gasoline', 3993, 8, 750, 'Front', 'V-engine', '9.3:1', 'BiTurbo, Intercooler'),
(8, 'CEPA', 340, 'Gasoline', 2480, 5, 450, 'Front', 'Inline', '10:1', 'Turbocharger, Intercooler'),
(9, 'EA837 evo / CREA', 310, 'Gasoline', 2995, 6, 440, 'Front', 'V-engine', '10.8:1', 'Supercharger, Intercooler'),
(10, 'EA888 / CNTC', 220, 'Gasoline', 1984, 4, 350, 'Front', 'Inline', '9.6:1', 'Turbocharger, Intercooler'),
(11, 'S85B50A', 507, 'Gasoline', 4999, 10, 520, 'Front', 'V-engine', '12:1', 'Naturally aspirated engine'),
(12, 'M62B44', 286, 'Gasoline', 4398, 8, 440, 'Front', 'V-engine', '10:1', 'Naturally aspirated engine'),
(13, 'S55B30', 500, 'Gasoline', 2979, 6, 600, 'Front', 'Inline', '10.2:1', 'Twin-power turbo, Intercooler'),
(14, 'M60B40', 286, 'Gasoline', 3982, 8, 400, 'Front', 'V-engine', '10:1', 'Naturally aspirated engine'),
(15, 'N55B30', 320, 'Gasoline', 2979, 6, 430, 'Front', 'Inline', '10.2:1', 'Twin-power turbo, Intercooler'),
(16, 'RFN EW10J4', 136, 'Gasoline', 1997, 4, 190, 'Front', 'Inline', '10.8:1', 'Naturally aspirated engine'),
(17, 'XFX ES9J4S', 207, 'Gasoline', 2946, 6, 285, 'Front', 'V-engine', '10.9:1', 'Naturally aspirated engine'),
(18, '5FG EP6CDTR', 270, 'Gasoline', 1598, 4, 330, 'Front', 'Inline', '10.5:1', 'Turbocharger, Intercooler'),
(19, 'XD88', 57, 'Diesel', 1948, 4, 145, 'Front', 'Inline', '21:1', 'Naturally aspirated engine'),
(20, 'DW10FD', 150, 'Diesel', 1997, 4, 370, 'Front', 'Inline', '16:1', 'Turbocharger, Intercooler');

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
