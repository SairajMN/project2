-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2024 at 03:22 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Database: `shoppingpro`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `billingAddress` varchar(255) DEFAULT NULL,
  `biilingCity` varchar(150) DEFAULT NULL,
  `billingState` varchar(100) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `billingCountry` varchar(100) DEFAULT NULL,
  `shippingAddress` varchar(300) DEFAULT NULL,
  `shippingCity` varchar(150) DEFAULT NULL,
  `shippingState` varchar(100) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `shippingCountry` varchar(100) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `userId`, `billingAddress`, `biilingCity`, `billingState`, `billingPincode`, `billingCountry`, `shippingAddress`, `shippingCity`, `shippingState`, `shippingPincode`, `shippingCountry`, `postingDate`) VALUES
(1, 1, 'A 456 ABC Street', 'Noida', 'Uttar Pradesh', 201301, 'India', 'A 456 ABC Street', 'Noida', 'Uttar Pradesh', 201301, 'India', '2024-01-29 11:57:11'),
(2, 1, 'D 32 Bihari Puram Bye Pass Road', 'Aligarh', 'Uttar Pradesh', 202001, 'India', 'D 32 Bihari Puram Bye Pass Road', 'Aligarh', 'Uttar Pradesh', 202001, 'India', '2024-01-29 12:01:03'),
(3, 4, 'H 4556 XYZ Aparment', 'Ghaziabad', 'UP', 201017, 'India', 'H 4556 XYZ Aparment', 'Ghaziabad', 'UP', 201017, 'India', '2024-03-05 07:43:52'),
(4, 7, 'H 456 XYZ Apartment', 'Ghaziabad', 'UP', 201017, 'India', 'H 456 XYZ Apartment', 'Ghaziabad', 'UP', 201017, 'India', '2024-03-06 12:49:36');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productQty` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `userID`, `productId`, `productQty`, `postingDate`) VALUES
(14, 4, 22, 1, '2024-03-05 09:01:49'),
(15, 4, 18, 1, '2024-03-05 09:06:30'),
(16, 4, 16, 1, '2024-03-05 09:07:08');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `createdBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`, `createdBy`) VALUES
(3, 'Books', 'Books Category', '2023-12-31 19:17:37', '2024-06-07 01:19:28', 1),
(4, 'Electronics', 'Electronic Products', '2023-12-31 19:17:37', '2024-06-07 01:19:37', 1),
(5, 'Furniture', 'test', '2023-12-31 19:17:37', '2024-06-07 01:19:37', 1),
(6, 'Fashion', 'Fashion', '2023-12-31 19:17:37', '2024-06-07 01:19:37', 1),
(7, 'Test', 'Test', '2023-12-31 19:17:37', '2024-06-07 01:19:37', 1),
(9, 'Laptops', 'Laptops', '2023-12-31 19:17:37', '2024-06-07 01:19:37', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `orderNumber` bigint(12) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `addressId` int(11) DEFAULT NULL,
  `totalAmount` decimal(10,2) DEFAULT NULL,
  `txnType` varchar(200) DEFAULT NULL,
  `txnNumber` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(120) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `orderNumber`, `userId`, `addressId`, `totalAmount`, `txnType`, `txnNumber`, `orderStatus`, `orderDate`) VALUES
(2, 949442910, 1, 2, 23849.00, 'e-Wallet', 'DHJG785678', 'Packed', '2024-01-30 07:57:56'),
(3, 394232787, 1, 1, 50109.00, 'Internet Banking', '5435345', 'Delivered', '2024-01-30 16:57:11'),
(4, 954986689, 4, 3, 1790.00, 'Internet Banking', 'YHFF45456456', 'Cancelled', '2024-03-05 07:44:05'),
(5, 616492938, 4, 3, 4229.00, 'e-Wallet', 'PAYTM743653', 'Cancelled', '2024-03-05 08:42:31'),
(6, 146060168, 7, 4, 10999.00, 'e-Wallet', 'TGH728364', 'Dispatched', '2024-03-06 12:50:46');

-- --------------------------------------------------------

--
-- Table structure for table `ordersdetails`
--

CREATE TABLE `ordersdetails` (
  `id` int(11) NOT NULL,
  `orderNumber` bigint(12) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ordersdetails`
--

INSERT INTO `ordersdetails` (`id`, `orderNumber`, `userId`, `productId`, `quantity`, `orderDate`, `orderStatus`) VALUES
(1, 949442910, 1, 14, 1, '2024-01-30 07:57:56', NULL),
(2, 949442910, 1, 16, 2, '2024-01-30 07:57:56', NULL),
(3, 949442910, 1, 19, 1, '2024-01-30 07:57:56', NULL),
(4, 394232787, 1, 14, 2, '2024-01-30 16:57:11', NULL),
(5, 394232787, 1, 20, 1, '2024-01-30 16:57:11', NULL),
(6, 954986689, 4, 25, 1, '2024-03-05 07:44:05', NULL),
(7, 616492938, 4, 22, 1, '2024-03-05 08:42:31', NULL),
(8, 616492938, 4, 20, 1, '2024-03-05 08:42:31', NULL),
(10, 146060168, 7, 12, 1, '2024-03-06 12:50:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `actionBy` int(3) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `canceledBy` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `actionBy`, `postingDate`, `canceledBy`) VALUES
(1, 3, 'Packed', 'Products Has been Packed.', 1, '2024-02-06 05:23:10', NULL),
(2, 3, 'Dispatched', 'Products Dispatched.', 1, '2024-02-06 05:28:29', NULL),
(3, 3, 'In Transit', 'InTransit\r\n', 1, '2024-02-06 05:40:22', NULL),
(4, 3, 'Out For Delivery', 'Delivery man out for delivery.', 1, '2024-02-06 05:40:50', NULL),
(5, 3, 'Delivered', 'The order has been successfully delivered', 1, '2024-02-06 05:41:40', NULL),
(6, 2, 'Packed', 'Items Packed. Ready for Dispatched.', 1, '2024-02-06 05:52:46', NULL),
(7, 4, 'Packed', 'Product is Packed. Ready for dispatch.', 1, '2024-03-05 07:46:11', NULL),
(8, 4, 'Dispatched', 'Order is Disparched.', 1, '2024-03-05 07:47:32', NULL),
(9, 4, 'Cancelled', 'I want to cancel my order', NULL, '2024-03-05 08:29:49', 'User'),
(11, 5, 'Cancelled', 'The order is canceled. Products Out of Stock', 1, '2024-03-05 08:45:54', ' Admin'),
(12, 6, 'Packed', 'Order is Packed Waiting for dispatch.', 1, '2024-03-06 12:52:00', NULL),
(13, 6, 'Dispatched', 'Order is dispacthed.', 1, '2024-03-06 12:52:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` decimal(10,2) DEFAULT NULL,
  `productPriceBeforeDiscount` decimal(10,2) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` decimal(10,2) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `addedBy` int(11) DEFAULT NULL,
  `lastUpdatedBy` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`, `addedBy`, `lastUpdatedBy`) VALUES
(1, 4, 3, 'Micromax 81cm (32) HD Ready LED TV  (32T6175MHD, 2 x HDMI, 2 x USB)', 'Micromax test', 139900.00, 0.00, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 18px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">General</div><ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Sales Package</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">1 TV Unit, Remote Controller, Battery (For Remote Controller), Quick Installation Guide and User Manual: All in One, Wall Mount Support</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Model Name</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">32T6175MHD</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Display Size</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">81 cm (32)</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Screen Type</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">LED</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">HD Technology &amp; Resolutiontest</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">HD Ready, 1366 x 768</li></ul></li></ul>', 'cc661de12faf4a3b20a811c738dec6e6.jpg', 'fab56d7abeace039dc095046e21b3af8.jpg', 'micromax main image.jpg', 1200.00, 'In Stock', '2024-01-18 06:03:28', '2024-06-07 01:21:25', 1, 1),
(2, 4, 4, 'Apple iPhone 6 (Silver, 16 GB)', 'Apple INC', 36990.00, 39999.00, '16 GB ROM\r\n11.94 cm (4.7 inch) Retina HD Display\r\n12MP Rear Camera | 5MP Front Camera\r\nA9 Chip with 64-bit Architecture and M9 Motion Co-processor', '0279fcde79af83758676b8c23c2f3e61jpeg', '60faa390cfa0b8e00d6ccf6a61f956f4jpeg', '99ea3b71f143a7df51e0b38fa28e20b4jpeg', 0.00, 'In Stock', '2024-01-18 06:03:28', '2024-06-07 01:21:34', 1, 1),
(3, 4, 4, 'Redmi Note 4 (Gold, 32 GB)  (With 3 GB RAM)', 'Redmi', 10999.00, 11199.00, '3 GB RAM | 32 GB ROM | Expandable Upto 128 GB\r\n13.97 cm (5.5 inch) Full HD Display\r\n13MP Rear Camera | 5MP Front Camera\r\n4100 mAh Li-Polymer Battery\r\nQualcomm Snapdragon 625 64-bit Octa Core 2GHz Processor', 'df328c6456b2613e09d1907d13c61e9bjpeg', '2bcbd968595cff5e67a41c2bf6909f14jpeg', '6af54ef160b06d0254f0b9ada0a89648jpeg', 0.00, 'In Stock', '2024-01-18 06:03:28', '2024-06-07 01:21:34', 1, 1),
(4, 4, 4, 'Lenovo K6 Power (Silver, 32 GB) ', 'Lenovo', 9999.00, 0.00, '4 GB RAM | 32 GB ROM | Expandable Upto 256 GB\r\n15.21 cm (5.99 inch) HD+ Display\r\n16MP + 2MP | 8MP Front Camera\r\n3760 mAh Battery', '2b3227340f77869b8cfdc3de8f9f4a88.jpg', 'ecb3c8181c59fa158cb2eeb8aa8c817e.jpg', 'lenovo-k6-power-k33a42-3.jpeg', 45.00, 'In Stock', '2024-01-18 06:03:28', '2024-06-07 01:21:34', 1, 1),
(5, 4, 4, 'Lenovo Vibe K5 Note (Gold, 32 GB)  ', 'Lenovo', 11999.00, 12999.00, '3 GB RAM | 32 GB ROM | Expandable Upto 128 GB\r\n13.97 cm (5.5 inch) Full HD Display\r\n13MP Rear Camera | 8MP Front Camera\r\n3500 mAh Li-Ion Polymer Battery\r\nMediatek Helio P10 64-bit Octa Core 1.8GHz Processor', 'eafcc2c2d016548c4ed6b284abba5466jpeg', '83736ea781b5c072733f1488e0db0060jpeg', '884904feaeb27cede8ec34a57b210043jpeg', 0.00, 'In Stock', '2024-01-18 06:03:28', '2024-06-07 01:21:34', 1, 1),
(6, 4, 4, 'Micromax Canvas Mega 4G', 'Micromax', 6999.00, 7199.00, '3 GB RAM | 16 GB ROM | Expandable Upto 32 GB\r\n13.97 cm (5.5 inch) HD Display\r\n13MP Rear Camera | 5MP Front Camera\r\n2500 mAh Battery\r\nMT6735 Processor', '34abf79f2f0edf560a910da82ba99c3fjpeg', 'fefe2058ae6ba18ff5f86ac6187c9a9bjpeg', 'c88cfbe1837395e753b08665a9e5e5ecjpeg', 35.00, 'In Stock', '2024-01-18 06:03:28', '2024-06-07 01:21:34', 1, 1),
(7, 4, 4, 'SAMSUNG Galaxy On5', 'SAMSUNG', 7490.00, 7999.00, '1.5 GB RAM | 8 GB ROM | Expandable Upto 128 GB\r\n12.7 cm (5 inch) HD Display\r\n8MP Rear Camera | 5MP Front Camera\r\n2600 mAh Li-Ion Battery\r\nExynos 3475 Quad Core 1.3GHz Processor', '32e9830eefa1c269bbb9a3234b9e5c7fjpeg', 'ee2ce923b7cd502fad72ceee7741f158jpeg', '04600344e7e729c7c1b26a27497b3634jpeg', 20.00, 'In Stock', '2024-01-18 06:03:28', '2024-06-07 01:21:34', 1, 1),
(8, 4, 4, 'OPPO A57', 'OPPO', 14990.00, 15999.00, '3 GB RAM | 32 GB ROM | Expandable Upto 256 GB\r\n13.21 cm (5.2 inch) HD Display\r\n13MP Rear Camera | 16MP Front Camera\r\n2900 mAh Battery\r\nQualcomm Snapdragon 435 Octa Core 1.4GHz Processor', 'd4bb34d928ebe040f15f5a09485e1f7fjpeg', '58a739c3fdd9fb12934266be34d532e6jpeg', '7a9edb9edb6a8bc07076acd4930397cejpeg', 0.00, 'In Stock', '2024-01-18 06:03:28', '2024-06-07 01:21:34', 1, 1),
(9, 4, 5, 'Affix Back Cover for Mi Redmi Note 4', 'Techguru', 259.00, 0.00, '<ul><li>Suitable For: Mobile<br></li><li>Material: Polyurethane<br></li><li>Theme: No Theme<br></li><li>Type: Back Cover<br></li><li>Waterproof<br></li></ul>', '7e345e9d13ce94464bacc12b07f59a14jpeg', 'e642e68e69c4fbd0d18d2ff362fb6a6djpeg', '9355557990f8d6997a0f7265f518d0aajpeg', 10.00, 'In Stock', '2024-01-18 06:03:28', '2024-06-07 01:21:34', 1, 1),
(11, 4, 6, 'Acer ES 15 Pentium Quad Core', 'Acer', 19990.00, 21999.00, 'Processor: intel pentium quad-core processor n4200 (2 mb L2 cache, 1.50 ghz, up to 2.6 ghz with intel burst technology, ddr3l 1600 mhz, 6 w)\r\nOperating system: this is a linux based laptop. requires separate purchase and installation of operating system software (like windows), not included in the box. Refer to acer website for drivers\r\nDisplay: 15.6\" hd 1366 x 768 resolution, high-brightness acer cine crystal tm led backlit tft lcd\r\nMemory and storage: 4gb ddr3 ram upgradeable upto 8gb ram with intel hd 620 integrated graphics storage: 1tb hdd 5400 rpm\r\nDesign and battery: laptop weight 2.4kg 24.6mm | lithium 6 cell battery upto 6.5 hours\r\nWarranty: this laptop comes with 1 year domestic onsite and (itw) international traveler warranty from acer covering manufacturing defects and not coverning physical damage\r\nLinux | in the box: laptop with included battery, charger, user guide and manuals\r\nPorts and cd drive: 2 usb2.0 | 1 USB 3.0 | 1 hdmi | 4-in-1 card reader (sd,sdhC,sdxc,mmc) | combo audio and microphone jack | with ethernet (rj-45) port ian port | with dvdrw 8x-drive', '6e0ef9575326db6a182ab34f87dadaec.jpg', '66c0d69dd9f8050b6cd9d9aa34765e89.jpg', '55019dcd8b5655409b62109b62749775.jpg', 0.00, 'In Stock', '2024-01-18 06:03:28', '2024-06-07 01:21:34', 1, 1),
(12, 4, 6, 'Micromax Canvas Laptab II (WIFI) Atom 4th Gen', 'Micromax', 10999.00, 0.00, 'General\r\nSales Package\r\n1 unit each of Tablet, Cahrger, USB Cable, User Guide, Warranty Card, Screen Guard\r\nModel Number\r\nLT777W\r\nPart Number\r\n89-04132-42849-2\r\nModel Name\r\nLT777W\r\nSeries\r\nCanvas Laptab II (WIFI)\r\nColor\r\nBlack\r\nType\r\n2 in 1 Laptop\r\nSuitable For\r\nEveryday Use\r\nBattery Backup\r\n8 hours\r\nBattery Cell\r\n9000 MAh Battery', 'ee7dedd98625f06e5b7338d98abfa07fjpeg', '2667c09e840e57d04eb441fceabb0c03jpeg', 'c57b42a2998a378a9e627dc35613e462jpeg', 0.00, 'In Stock', '2024-01-18 06:03:28', '2024-06-07 01:21:34', 1, 1),
(13, 4, 6, 'HP Core i5 5th Gen', 'HP', 41990.00, 42999.00, 'Processor: Intel Core i5-7440HQ (2.8 GHz base clock, up to 3.4 GHz max boost clock, 6 MB L3 cache, 4 cores)\r\nDisplay: 15.6-inch FHD (1920 x 1080), Slim, anti-glare, 300 nits\r\nMemory & Storage: 16 GB DDR4 SDRAM (2 x 8 GB) | 240 GB PCIe NVMe M.2 SSD\r\nGraphics : Integrated Intel HD Graphics 630\r\nPre-Installed: MS Office 2016 and Windows 10 pro', '8378c2c096fbc807cccd54b16e093d0d.jpg', 'fff8d95ba1b19847668486d6f8d04538.jpg', 'b7266e309c2d53dd3908fcff666ba638.jpg', 0.00, 'Out of Stock', '2024-01-18 06:03:28', '2024-06-07 01:21:34', 1, 1),
(14, 4, 6, 'Lenovo Ideapad 110 APU Quad Core A6 6th Gen', 'Lenovo', 22990.00, 24999.00, 'Free upgrade to Windows 11 when available* Disclaimer-*The Windows 11 upgrade will be delivered late 2021 into 2022. Specific timing varies by device. Certain features require specific hardware.\r\nProcessor: 11th Gen Intel Tiger Lake Core i5-1135G7 | Speed: 2.4 GHz (Base) - 4.2 GHz (Max) | 4 Cores | 8MB Cache\r\nOS: Pre-Loaded Windows 10 Home with Lifetime Validity\r\nPre-Installed: MS Office Home and Student 2019\r\nMemory and Storage: 16GB RAM DDR4-3200 | 512 GB SSD\r\nGraphics: Integrated Intel Iris Xe Graphics\r\nDisplay: 14\" 2.2K Display (2240x1400) | Brightness: 300 nits | Anti-Glare | IPS Technology | 100% sRGB\r\nDesign: 1.59 cm Thin and 1.38 kg Light | Aluminium Material Top | Backlit Keyboard\r\nBattery Life: 56.5Wh | Upto 8 Hours | Rapid Charge (Up to 80% in 1 Hour)\r\nCamera (Built in): HD 720p (1.0MP) IR enabled Camera | Fixed Focus | Integrated Dual Array Microphone', '8f35abc6d345c30454ddce5a5f10736e.jpg', 'a093c171bdd68ac4a5dd28fead103aa2.jpg', 'd5fc3ab0393930859635a827a558c8f6.jpg', 0.00, 'In Stock', '2024-01-18 06:03:28', '2024-06-07 01:21:34', 1, 2),
(15, 3, 8, 'The Wimpy Kid Do -It- Yourself Book', 'ABC', 205.00, 250.00, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">The Wimpy Kid Do -It- Yourself Book</span><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">&nbsp;&nbsp;(English, Paperback, Jeff Kinney)</span><br><div><ul><li>Language: English<br></li><li>Binding: Paperback<br></li><li>Publisher: Penguin Books Ltd<br></li><li>ISBN: 9780141339665, 0141339667<br></li><li>Edition: 1<br></li></ul></div>', 'b52418634c8a5538f9cff77f2ce111cbjpeg', 'cda0c29e55d96691f8e2dbc6b4325c72jpeg', 'a3c12367513e2d4d1a443bab1972ec25jpeg', 50.00, 'In Stock', '2024-01-18 06:03:28', '2024-06-07 01:21:34', 1, 1),
(16, 3, 8, 'Thea Stilton and the Tropical Treasure ', 'XYZ', 240.00, 299.00, 'Publisher  :  Scholastic; Latest edition (1 December 2015)\r\nLanguage  :  English\r\nPaperback  :  176 pages\r\nISBN-10  :  9351032086\r\nISBN-13 :  978-9351032083\r\nReading age : 8 - 12 years\r\nItem Weight : 650 g\r\nDimensions :  20.3 x 25.4 x 4.7 cm', 'a4b7b614c7d8fa82f72c697d564a1b4c.jpg', '21c4682c8f68721da024af206d2104a1.jpg', 'f3d55538574ea1e67309c4e32f44d58a.jpg', 30.00, 'In Stock', '2024-01-18 06:03:28', '2024-06-07 01:21:34', 1, 1),
(17, 5, 9, 'Induscraft Solid Wood King Bed With Storage', 'Induscraft', 32566.00, 35100.00, 'Product Dimensions: Length (82 in / 208 cm), Width (75 in / 190 cm), Height ( 35 in / 90 cm)\r\nMaterial: High grade Eurpoean standard E2 engineered wood - Particle board with pre-laminate, Finish: Matte Wood Grain, Color: Dark Wenge\r\nBed Size: King, Recommended Mattress Size: 72x78 inches, Box Storage\r\nCare Instructions: Wipe it clean with a dry cloth. Do not use water. Wipe any spills immediately\r\nAssembly Required: The product requires carpenter assembly and will be provided by the seller', '6382f5c231b2791b55721abe458c5c44.jpg', 'f9c7bc022c6eb91fc10d1e2f24c7ba14.jpg', '80e0a10726722049c1912b53fa146d1e.jpg', 0.00, 'In Stock', '2024-01-18 06:03:28', '2024-06-07 01:21:34', 1, 1),
(18, 5, 10, 'Nilkamal Ursa Metal Queen Bed', 'Nilkamal', 6523.00, 7199.00, 'Good quality metal structure for strong & more steadiness easy to clean maintenance free with long lasting powder coating paint\r\nWell designed Indian furniture brand to occupy exact space of your modern bedroom & enrich your bedroom lifestyle\r\nProduct Dimension: Length : (81 CM) Width : (50.5 CM) Height : (36 CM) ; Recommended Mattress Size:78 X 30 Inches\r\n3 years warrantee make you enjoy all your desires to use our products peacefully & comfortably\r\nEasy to attached and detached products first time free assembling\r\n3 Years Warranty, Manufacturing Defects Only\r\nInstallation Will be Provided By Seller Only', 'b34e6df10d47dd78f64041f7429bafbf.jpg', 'ce86bedea4d77aab6dbe7b7d05d071db.jpg', '29097235e9d77261cd21fbd53e45bb4c.jpg', 0.00, 'In Stock', '2024-01-18 06:03:28', '2024-06-07 01:21:34', 1, 1),
(19, 6, 12, 'Asian Casuals  (White, White)', 'Asian', 379.00, 499.00, '<ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><li class=\"_2-riNZ\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\">Colour: White, White</li><li class=\"_2-riNZ\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; list-style: none; position: relative;\">Outer Material: Denim</li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\"><br></div></li></ul>', 'cba78e01e90c4a3359fc5415b2c47a49.jpg', '5f46cc183d9b101218307e9f51b3404d.jpg', '64255c337c37f2570960fd5b7a3111a4.jpg', 45.00, 'In Stock', '2024-01-18 06:03:28', '2024-06-07 01:21:34', 1, 2),
(20, 6, 12, 'Adidas MESSI 16.3 TF Football turf Shoes (Blue)', 'Adidas', 4129.00, 5001.00, 'Color\r\nBlue\r\nOuter material\r\nSynthetic Leather\r\nModel name\r\nMESSI 16.3 TF\r\nIdeal for\r\nMen\r\nOccasion\r\nSports\r\nSecondary color\r\nSilver\r\nClosure\r\nLace-Ups\r\nWeight\r\n200 g (per single Shoe) - Weight of the product may vary depending on size.', 'cc661de12faf4a3b20a811c738dec6e6.jpg', 'baa34a39e35461e2e3986555b11e262e.jpg', '4d329eba2178c06e6bc6311a30eb6ed6.jpg', 0.00, 'In Stock', '2024-01-18 06:03:28', '2024-06-07 01:21:34', 1, 1),
(22, 3, 8, 'Free Comic Book Day 2018: Avengers/Captain America', 'Cover Art', 100.00, 120.00, 'Free Comic Book Day 2018 is your perfect chance to dive into the Marvel Universe! With a story from Jason Aaron and art by Sara Pichelli, the Marvel FCBD title debuting this May features stories that set the stage for an epic new direction for the Avengers in the Marvel Universe. Plus, a Captain America story from Ta-Nehisi Coates and Leinil Francis Yu leading into their upcoming Captain America series!', '61uoAZqd3NL.jpg', '61uoAZqd3NL.jpg', '61uoAZqd3NL.jpg', 0.00, 'In Stock', '2024-01-18 06:03:28', '2024-06-07 01:21:34', 1, NULL),
(25, 4, 13, 'Havells Co zio Quartz Room Heater - 800 Watt (White, Blue)', 'Havells', 1790.00, 2390.00, 'About this item\r\nCozio comes with 2 Quartz heating tubes providing more warmth\r\nFront grill for safety\r\nSafety tip over switch\r\nTwo heat setting - 400 Watt & 800 Watt\r\nHaving carry handle for easy portability\r\nIncluded Components: 1 N Main Unit & 1 N Instruction Manual', 'b0024f15985d0b863d57e425edc6a6ab.jpg', 'ad3151dcf77c457058ca4c0ed98a3afc.jpg', '73437ea47cce0a3ad71e52a21e16a042.jpg', 0.00, 'In Stock', '2024-01-18 06:03:28', '2024-06-07 01:21:34', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategoryName` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `createdBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategoryName`, `creationDate`, `updationDate`, `createdBy`) VALUES
(2, 4, 'Led Television', '2024-01-26 16:24:52', '2024-06-07 01:21:41', 1),
(3, 4, 'Television', '2024-01-26 16:24:52', '2024-06-07 01:21:50', 1),
(4, 4, 'Mobiles', '2024-01-26 16:24:52', '2024-06-07 01:21:50', 1),
(5, 4, 'Mobile Accessories', '2024-01-26 16:24:52', '2024-06-07 01:21:50', 1),
(6, 4, 'Laptops', '2024-01-26 16:24:52', '2024-06-07 01:21:50', 1),
(7, 4, 'Computers', '2024-01-26 16:24:52', '2024-06-07 01:21:50', 1),
(8, 3, 'Comics', '2024-01-26 16:24:52', '2024-06-07 01:21:50', 1),
(9, 5, 'Beds', '2024-01-26 16:24:52', '2024-06-07 01:21:50', 1),
(10, 5, 'Sofas', '2024-01-26 16:24:52', '2024-06-07 01:21:50', 1),
(11, 5, 'Dining Tables', '2024-01-26 16:24:52', '2024-06-07 01:21:50', 1),
(12, 6, 'Men Footwears', '2024-01-26 16:24:52', '2024-06-07 01:21:50', 1),
(13, 4, 'Room Heaters', '2024-01-26 16:24:52', '2024-06-07 01:21:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contactNumber` bigint(12) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `username`, `password`, `contactNumber`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', 45231025890, '2024-01-24 16:21:18', '2024-06-07 01:18:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `regDate`, `updationDate`) VALUES
(1, 'Anuj Kumar Singh', 'anuj.lpu1@gmail.com', 1259874230, 'f925916e2754e5e03f75dd58a5733251', '2024-02-04 19:30:50', '2024-06-07 01:21:59'),
(2, 'Amit ', 'amit@gmail.com', 8285703355, '5c428d8875d2948607f3e3fe134d71b4', '2024-01-15 17:21:22', '2024-06-07 01:22:14'),
(3, 'hg', 'hgfhgf@gmass.com', 1121312312, '827ccb0eea8a706c4c34a16891f84e7b', '2024-04-29 09:30:32', '2024-06-07 01:22:26'),
(4, 'John Doe', 'john@gmail.com', 1234567890, '5c428d8875d2948607f3e3fe134d71b4', '2024-01-29 07:42:12', '2024-06-07 01:22:23'),
(7, 'Amit kumar Singh', 'amitk@gmail.com', 1425879212, 'f925916e2754e5e03f75dd58a5733251', '2024-03-06 12:48:33', '2024-06-07 01:22:19');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(3, 1, 14, '2024-01-29 10:11:38'),
(4, 1, 13, '2024-01-29 10:28:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userrrid` (`userId`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uiid` (`userID`),
  ADD KEY `piddd` (`productId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uidddd` (`userId`),
  ADD KEY `addressid` (`addressId`),
  ADD KEY `orderNumber` (`orderNumber`);

--
-- Indexes for table `ordersdetails`
--
ALTER TABLE `ordersdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderidd` (`orderNumber`),
  ADD KEY `useridd` (`userId`),
  ADD KEY `productiddd` (`productId`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderidddddd` (`orderId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catidddd` (`category`),
  ADD KEY `subCategory` (`subCategory`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catid` (`categoryid`);

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usseridddd` (`userId`),
  ADD KEY `ppiidd` (`productId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ordersdetails`
--
ALTER TABLE `ordersdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
