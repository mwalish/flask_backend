-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 25, 2026 at 09:32 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `farasisokogarden`
--

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `product_cost` int(11) NOT NULL,
  `product_photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`product_id`, `product_name`, `product_description`, `product_cost`, `product_photo`) VALUES
(11, 'Prestige Interior Atelier', 'Upholstery: Use premium fabrics like silk, velvet, or leather. Consider a mix of textures, such as combining smooth leather with tactile linen', 45000, 'images (10).jpeg'),
(12, ' Interior Atelier', 'Modern: Clean lines, minimalism, and a focus on function while maintaining sophistication.', 50000, 'images (12).jpeg'),
(13, 'Prestige Interior ', 'Upholstery: Use premium fabrics like silk, velvet, or leather. Consider a mix of textures, such as combining smooth leather with tactile linen', 56000, 'images (13).jpeg'),
(14, 'The Refined Room', 'Art Deco: Glamorous shapes, intricate patterns, and a mix of bold colors and materials', 96000, 'images (14).jpeg'),
(15, 'The Refined Room', 'Contemporary: A blend of modern and traditional with innovative forms and materials', 55000, 'images (15).jpeg'),
(16, 'Opulent Home', 'Art Deco: Glamorous shapes, intricate patterns, and a mix of bold colors and materials.', 75000, 'images (17).jpeg'),
(17, 'Legacy Design', 'Finishing: Look for hand-applied finishes that enhance the wood grain and provide protection', 65000, 'images (18).jpeg'),
(18, 'Heirloom Interior', 'Eco-friendly Materials: Look for furniture made from sustainably sourced materials or recycled products.', 85000, 'images (19).jpeg'),
(19, 'Goldleaf ', 'Durability: Invest in quality pieces that will stand the test of time, reducing the need for replacements', 95000, 'images (25).jpeg'),
(20, 'Venerable Home Design', 'High-End Brands: Consider brands known for their luxury furniture, such as Restoration Hardware, Minotti, or Knoll', 55000, 'images (26).jpeg'),
(21, 'Parallel Haus', 'Coordinating Décor: Use accessories like luxurious rugs, art pieces, and decorative lighting to enhance the overall aesthetic', 105000, 'images (26).jpeg'),
(22, 'Parallel Haus', 'Coordinating Décor: Use accessories like luxurious rugs, art pieces, and decorative lighting to enhance the overall aesthetic', 115000, 'in3.jpeg'),
(23, 'Sleek Living Interior', 'Wood: Look for high-quality hardwoods such as mahogany, walnut, cherry, and oak. Exotic woods can add uniqueness.', 115000, 'images (16).jpeg'),
(24, 'Layered Light', 'Wood: Look for high-quality hardwoods such as mahogany, walnut, cherry, and oak. Exotic woods can add uniqueness.', 125000, 'images (21).jpeg'),
(25, 'Milanese Manor', 'Wood: Look for high-quality hardwoods such as mahogany, walnut, cherry, and oak. Exotic woods can add uniqueness.', 125000, 'in 2.jpeg'),
(26, 'Milanese Manor', 'Joinery: High-end furniture often features dovetail joints or mortise-and-tenon construction for ', 45000, 'in 4.jpeg'),
(27, 'Milanese Manor', 'Joinery: High-end furniture often features dovetail joints or mortise-and-tenon construction for ', 75000, 'in 5.jpeg'),
(28, 'Classic Line Interiors', 'Joinery: High-end furniture often features dovetail joints or mortise-and-tenon construction for ', 95000, 'in 6.jpeg'),
(29, 'Gilded Home Interiors', 'Joinery: High-end furniture ofte dovetail joints or mortise-and-tenon construction for ', 95000, 'in 6.jpeg'),
(30, 'Fine Living InteriorsFine Living Interiors', 'Vintage Revival: Incorporating vintage or retro-inspired pieces alongside modern designs', 95000, 'in 6.jpeg'),
(31, 'Luxe Legacy Home Decor', 'Vintage Revival: Incorporating vintage or retro-inspired pieces alongside modern designs', 67000, 'in 7.jpeg'),
(32, 'Barocco', 'Vintage Revival: Incorporating vintage or retro-inspired pieces alongside modern designs', 60000, 'in 8.jpeg'),
(33, 'rocco', 'Vintage Revival: Incorporating vintage or retro-inspired pieces alongside modern designs', 67000, 'in 10.jpeg'),
(34, 'Cocco', 'Vintage Revival: Incorporating vintage or retro-inspired pieces alongside modern designs', 88000, 'in 11.jpeg'),
(35, 'lurther intrior', 'Wood: Look for high-quality hardwoods such as mahogany, walnut, cherry, and oak. Exotic woods can add uniqueness', 88000, 'in 12.jpeg'),
(36, 'Butaca intrior', 'Wood: Look for high-quality hardwoods such as mahogany, walnut, cherry, and oak. Exotic woods can add uniqueness', 88000, 'in 13.jpeg'),
(37, 'Mesita de noche interior', 'Wood: Look for high-quality hardwoods such as mahogany, walnut, cherry, and oak. Exotic woods can add uniqueness', 98000, 'in 13.jpeg'),
(38, 'Mesita noche interior', 'Wood: Look for high-quality hardwoods such as mahogany, walnut, cherry, and oak. Exotic woods can add uniqueness', 68000, 'in 21.jpeg'),
(39, 'Mesita noche interior', 'Wood: Look for high-quality hardwoods such as mahogany, walnut, cherry, and oak. Exotic woods can add uniqueness', 78000, 'in 18.jpeg'),
(40, 'Mesita noche interior', 'Upholstery: Use premium fabrics like silk, velvet, or leather. Consider a mix of textures, such as combining smooth leather with tactile linen', 68000, 'in 18.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `phone`) VALUES
(31, 'shin', '487632', 'shii@gmail.com', '25487890890809'),
(33, 'purity', '8689769', 'purity@gmail.com', '25487890890809');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;