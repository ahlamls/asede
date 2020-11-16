-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 16, 2020 at 10:36 AM
-- Server version: 10.5.8-MariaDB-1:10.5.8+maria~bionic
-- PHP Version: 7.0.33-37+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asede`
--

-- --------------------------------------------------------

--
-- Table structure for table `mim`
--

CREATE TABLE `mim` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `title` text NOT NULL,
  `content` text NOT NULL,
  `image_url` text NOT NULL,
  `vote` int(11) NOT NULL DEFAULT 0,
  `nsfw` int(11) NOT NULL,
  `hidden` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mim`
--

INSERT INTO `mim` (`id`, `user_id`, `time`, `title`, `content`, `image_url`, `vote`, `nsfw`, `hidden`) VALUES
(1, 1, '2020-11-16 10:33:08', 'FF vs Bensin Impek', 'game baru dari mihotod pengalihan isu . tetap kawal 8-2 . eh free fire', '/mim/ff.jpg', 2, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mim`
--
ALTER TABLE `mim`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mim`
--
ALTER TABLE `mim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `mim`
--
ALTER TABLE `mim`
  ADD CONSTRAINT `mim_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
