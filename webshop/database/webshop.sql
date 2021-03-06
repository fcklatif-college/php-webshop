-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 05, 2021 at 03:32 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `active`
--

CREATE TABLE `active` (
  `active_id` int(11) NOT NULL,
  `active_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `active`
--

INSERT INTO `active` (`active_id`, `active_type`) VALUES
(0, 'no'),
(1, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `admin_user_id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `password_token` varchar(255) DEFAULT NULL,
  `password_changed` timestamp NULL DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`admin_user_id`, `email`, `password`, `password_token`, `password_changed`, `datetime`) VALUES
(1, 'test@test.nl', '$2y$10$3eJXM2NBYpOH8opTNAHVye/uRtxMhWNLS0NX9qpp1WqygPBnX4vjS', '77aa4703ebb0ed94e3e7c8c9ab2f3e141b61302d', '2021-02-18 15:06:05', '2021-02-17 14:32:17'),
(2, 'admin@test.nl', '$2y$10$nnWWErVJGYn/PJ9Yx.MGpelSqsZqqe1GQzTaxk4p77IiG.mtw9FVe', 'cf7146035ec5ed69f13ce21fa17a86f0592423ae', '2021-04-25 15:02:19', '2021-04-21 08:04:20'),
(3, 'test2222@admin.nl', NULL, NULL, NULL, '2021-04-25 17:47:35'),
(4, 'test24@test.nl', '$2y$10$0AtnE/KwXhrxIejMQeMnJuiyRnb9Dm9awvm4WZUBBo2upubBDwFQ2', '', '2021-05-03 21:15:35', '2021-04-25 17:50:10');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(510) DEFAULT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`, `description`, `active`) VALUES
(1, 'tafellamp', 'Tafellampen zijn binnenlampen voor op tafel.', 0),
(2, 'buitenlamp', 'Buitenlampen zijn lampen voor buiten.', 0),
(3, 'designlamp', 'Designlampen zijn binnenlampen voor je interieur.', 0),
(4, 'bureaulamp', 'Bureaulampen zijn binnenlampen voor op een bureau.', 0),
(5, 'condenser', 'Condenser microphones.', 0),
(6, 'dynamic', 'Dynamic microphones.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) UNSIGNED NOT NULL,
  `gender` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `house_number` int(11) NOT NULL,
  `house_number_addon` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `emailadres` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `newsletter_subscription` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `gender`, `first_name`, `middle_name`, `last_name`, `street`, `house_number`, `house_number_addon`, `zip_code`, `city`, `phone`, `emailadres`, `password`, `newsletter_subscription`, `date_added`) VALUES
(1, 'Man', 'Maarten', NULL, 'Bos', 'Ooievaarsbek', 52, NULL, '3621TG', 'Breukelen', '0615302473', 'arieisraargekdom@gmail.com', NULL, 1, '2021-04-25 03:34:23'),
(2, 'Overig', 'Daan', NULL, 'de Ruiter', 'Damastbloem', 7, NULL, '3621RX', 'Breukelen', NULL, NULL, NULL, 0, '2021-04-25 03:34:23'),
(3, 'Man', 'Latif', '', 'Hensbergen', 'Binguslaan', 69, '', '4200 BG', 'Breukelen', '', 'kir@crybaby.tech', NULL, 1, '2021-04-25 03:34:23'),
(4, 'Overig', 'Test', '', 'Persoon', 'Straat', 2, '', '6969AA', 'Amsterdam', '', '', NULL, 0, '2021-04-25 03:34:23'),
(5, 'Overig', 'Nummer', '', 'Vijf', 'Bingus', 2, 'B', '4204 HH', 'Breukelen', '', '', NULL, 0, '2021-04-25 03:34:23');

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `gender_id` int(11) NOT NULL,
  `gender_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`gender_id`, `gender_type`) VALUES
(1, 'Vrouw'),
(2, 'Man'),
(3, 'Overig');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`image_id`, `product_id`, `image`, `active`) VALUES
(1, 10, 'shure-sm7b-1.jpg', 1),
(2, 11, 'blue-yeti-1.jpg', 1),
(3, 12, 'ev-re20-1.jpg', 1),
(4, 13, 'shure-mv7-1.jpg', 1),
(5, 14, 'shure-sm58-1.jpg', 1),
(6, 15, 'blue-snowball-1.jpg', 1),
(7, 16, 'blue-spark-sl-1.jpg', 1),
(8, 17, 'hyperx-quadcast-1.jpg', 1),
(9, 18, 'hyperx-solocast-1.jpg', 1),
(10, 19, 'rode-nt-usb-1.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `price_per_piece` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(510) NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `name`, `description`, `category_id`, `price`, `color`, `weight`, `active`) VALUES
(10, 'Shure SM7B', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Posuere lorem ipsum dolor sit amet.', 6, '369.95', 'black', 766, 1),
(11, 'Blue Yeti', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Posuere lorem ipsum dolor sit amet.', 5, '119.95', 'grey, white, black, blue, red', 678, 1),
(12, 'Electro-Voice RE20', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Posuere lorem ipsum dolor sit amet.', 6, '569.95', 'beige', 455, 1),
(13, 'Shure MV7', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Posuere lorem ipsum dolor sit amet.', 6, '254.95', 'black', 760, 1),
(14, 'Shure SM58', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Posuere lorem ipsum dolor sit amet.', 6, '99.95', 'black', 298, 1),
(15, 'Blue Snowball', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Posuere lorem ipsum dolor sit amet.', 5, '59.95', 'black, white', 460, 1),
(16, 'Blue Spark SL', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Posuere lorem ipsum dolor sit amet.', 5, '199.95', 'red, black, blue, green', 336, 1),
(17, 'HyperX Quadcast', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Posuere lorem ipsum dolor sit amet.', 5, '134.95', 'black/red', 254, 1),
(18, 'HyperX Solocast', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Posuere lorem ipsum dolor sit amet.', 5, '74.95', 'black', 429, 1),
(19, 'Rode NT-USB', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Posuere lorem ipsum dolor sit amet.', 5, '154.95', 'matte black', 648, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`product_image_id`, `product_id`, `image`, `active`) VALUES
(1, 1, 'arstid.jpg', 0),
(2, 2, 'buitenlamp.jpg', 0),
(3, 2, 'buitenlamp2.jpg', 0),
(4, 3, 'gans.jpg', 0),
(5, 4, 'giraf.jpg', 0),
(6, 4, 'giraf2.jpg', 0),
(7, 5, 'hektar.jpg', 0),
(8, 6, 'jesse.png', 0),
(9, 7, 'lampje.jpg', 0),
(10, 8, 'llahra.png', 0),
(11, 9, 'struisvogel.jpg', 0),
(12, 10, 'shure-sm7b-1.jpg', 1),
(13, 10, 'shure-sm7b-2.jpg', 1),
(14, 10, 'shure-sm7b-3.jpg', 1),
(15, 11, 'blue-yeti-1.jpg', 1),
(16, 11, 'blue-yeti-2.jpg', 1),
(17, 11, 'blue-yeti-3.jpg', 1),
(18, 12, 'ev-re20-1.jpg', 1),
(19, 12, 'ev-re20-2.jpg', 1),
(20, 12, 'ev-re20-3.jpg', 1),
(21, 13, 'shure-mv7-1.jpg', 1),
(22, 13, 'shure-mv7-2.jpg', 1),
(23, 13, 'shure-mv7-3.jpg', 1),
(24, 14, 'shure-sm58-1.jpg', 1),
(25, 14, 'shure-sm58-2.jpg', 1),
(26, 14, 'shure-sm58-3.jpg', 1),
(27, 15, 'blue-snowball-1.jpg', 1),
(28, 15, 'blue-snowball-2.jpg', 1),
(29, 15, 'blue-snowball-3.jpg', 1),
(30, 16, 'blue-spark-sl-1.jpg', 1),
(31, 16, 'blue-spark-sl-2.jpg', 1),
(32, 16, 'blue-spark-sl-3.jpg', 1),
(33, 17, 'hyperx-quadcast-1.jpg', 1),
(34, 17, 'hyperx-quadcast-2.jpg', 1),
(35, 17, 'hyperx-quadcast-3.jpg', 1),
(36, 18, 'hyperx-solocast-1.jpg', 1),
(37, 18, 'hyperx-solocast-2.jpg', 1),
(38, 18, 'hyperx-solocast-3.jpg', 1),
(39, 19, 'rode-nt-usb-1.jpg', 1),
(40, 19, 'rode-nt-usb-2.jpg', 1),
(41, 19, 'rode-nt-usb-3.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

CREATE TABLE `subscribe` (
  `subscribe_id` int(11) NOT NULL,
  `subscribe_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`subscribe_id`, `subscribe_type`) VALUES
(0, 'no'),
(1, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `house_number` int(11) NOT NULL,
  `house_number_addon` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `total_price` decimal(11,2) NOT NULL,
  `shipping_costs` decimal(11,2) NOT NULL,
  `payment_method` set('iDeal','PayPal','CryptoWallet') NOT NULL,
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shipping_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `active`
--
ALTER TABLE `active`
  ADD PRIMARY KEY (`active_id`);

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`admin_user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`order_product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`product_image_id`);

--
-- Indexes for table `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`subscribe_id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `active`
--
ALTER TABLE `active`
  MODIFY `active_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `admin_user_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `gender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `order_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `subscribe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
