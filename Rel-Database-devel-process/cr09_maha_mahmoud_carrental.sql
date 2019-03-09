-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2019 at 05:46 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_maha_mahmoud_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `car_status` varchar(60) DEFAULT NULL,
  `space` varchar(30) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `car_status`, `space`, `model`, `color`, `location_id`) VALUES
(44, 'smart', '5seats', 'BMW X5', 'red', 12),
(45, 'sport', '2seats', 'BMW Z4', 'black', 22);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postal_code` int(11) DEFAULT NULL,
  `phone` varchar(18) DEFAULT NULL,
  `license_no` int(11) DEFAULT NULL,
  `license_status` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `address`, `city`, `state`, `postal_code`, `phone`, `license_no`, `license_status`) VALUES
(8, 'Maha', 'Mahmoud', 'Villastreet 50', 'Vienna', 'Vienna', 1230, '+436789909876', 7654, 'valid'),
(9, 'doe', 'nadr', 'Bratstreet 50', 'Vienna', 'Vienna', 1210, '+43666666777', 8655, 'valid');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `postal_code` int(11) DEFAULT NULL,
  `phone` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `address`, `city`, `state`, `postal_code`, `phone`) VALUES
(11, 'Villastreet 20', 'Vienna', 'Vienna', 1140, '+4367894321457'),
(12, 'Billastreet 20', 'Vienna', 'Vienna', 1200, '+4367894311111'),
(22, 'Happinessstreet 33', 'Vienna', 'Vienna', 1110, '+436607689322');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `payment_type` varchar(13) DEFAULT NULL,
  `rental_id` int(11) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `credit_card_no` int(11) DEFAULT NULL,
  `credit_card_name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rental`
--

CREATE TABLE `rental` (
  `rental_id` int(11) NOT NULL,
  `car_id` int(11) DEFAULT NULL,
  `reservation_id` int(11) NOT NULL,
  `car_type` varchar(50) DEFAULT NULL,
  `pick_up_period` datetime DEFAULT NULL,
  `pick_up_location` varchar(60) DEFAULT NULL,
  `drop_off_location` varchar(60) DEFAULT NULL,
  `drop_off_period` datetime DEFAULT NULL,
  `customer_license_no` int(11) DEFAULT NULL,
  `payment_type` varchar(60) DEFAULT NULL,
  `car_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `car_type` varchar(50) DEFAULT NULL,
  `pick_up_location` varchar(60) DEFAULT NULL,
  `pick_up_period` datetime DEFAULT NULL,
  `drop_off_location` varchar(60) DEFAULT NULL,
  `drop_off_period` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `rental_id` (`rental_id`);

--
-- Indexes for table `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`rental_id`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`rental_id`) REFERENCES `rental` (`rental_id`);

--
-- Constraints for table `rental`
--
ALTER TABLE `rental`
  ADD CONSTRAINT `rental_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `rental_ibfk_2` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
