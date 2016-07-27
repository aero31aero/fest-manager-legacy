-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2016 at 12:09 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pearl_16`
--

-- --------------------------------------------------------

--
-- Table structure for table `accomodation`
--

CREATE TABLE IF NOT EXISTS `accomodation` (
  `Pearl_Id` varchar(6) NOT NULL,
  `StartDate` varchar(15) NOT NULL,
  `EndDate` varchar(15) NOT NULL,
  `NoofDays` int(11) NOT NULL,
  `Bhavan` varchar(10) NOT NULL,
  `Cost` int(11) NOT NULL,
  `Refund` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `controlz_credentials`
--

CREATE TABLE IF NOT EXISTS `controlz_credentials` (
  `controlz_id` int(11) NOT NULL,
  `controlz_pass` varchar(20) NOT NULL,
  `member_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `controlz_credentials`
--

INSERT INTO `controlz_credentials` (`controlz_id`, `controlz_pass`, `member_name`) VALUES
(1, 'Monil', 'Monil Shah'),
(2, 'Ganesh', 'Ganesh'),
(3, 'Harshit', 'Harshit Agarwal'),
(4, 'Ayush Beria', 'Ayush');

-- --------------------------------------------------------

--
-- Table structure for table `dosh_credentials`
--

CREATE TABLE IF NOT EXISTS `dosh_credentials` (
  `team_id` int(11) NOT NULL,
  `team_captain` varchar(30) NOT NULL,
  `team_pass` varchar(30) NOT NULL,
  `reg_collect` int(11) NOT NULL,
  `accom_collect` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dosh_credentials`
--

INSERT INTO `dosh_credentials` (`team_id`, `team_captain`, `team_pass`, `reg_collect`, `accom_collect`) VALUES
(1, 'Monil Shah', 'Monil', 250, 0),
(2, 'Rajat Jain', 'Rajat', 250, 0),
(3, 'Harshit Agarwal', 'Harshit', 0, 0),
(4, 'Ayush Beria', 'Ayush', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `event_credentials`
--

CREATE TABLE IF NOT EXISTS `event_credentials` (
  `organiser_id` int(11) NOT NULL,
  `Bits_ID` varchar(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `uploader_name` varchar(30) NOT NULL,
  `club_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_credentials`
--

INSERT INTO `event_credentials` (`organiser_id`, `Bits_ID`, `password`, `uploader_name`, `club_name`) VALUES
(1, 'F2014388H', 'Monil', 'Monil Shah', 'Dance'),
(2, 'F2014004H', 'Harshit', 'Harshit Agarwal', 'Drama'),
(3, 'F2014049H', 'Ayush', 'Ayush Beria', 'Music');

-- --------------------------------------------------------

--
-- Table structure for table `event_details`
--

CREATE TABLE IF NOT EXISTS `event_details` (
  `id` int(10) NOT NULL,
  `Event_id` int(10) NOT NULL,
  `Event_date` varchar(20) NOT NULL,
  `Event_venue` varchar(30) NOT NULL,
  `Roundname` varchar(100) NOT NULL,
  `updated_at` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_details`
--

INSERT INTO `event_details` (`id`, `Event_id`, `Event_date`, `Event_venue`, `Roundname`, `updated_at`) VALUES
(1, 2, '1456551000', 'G 105', 'Round 3', '1456551000'),
(2, 3, '1456555800', 'G 107', 'Round 1', '1456554600');

-- --------------------------------------------------------

--
-- Table structure for table `event_participants`
--

CREATE TABLE IF NOT EXISTS `event_participants` (
  `event_id` int(15) NOT NULL,
  `pearl_id` varchar(15) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `updated_at` varchar(15) NOT NULL,
  `round_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_details`
--

CREATE TABLE IF NOT EXISTS `group_details` (
  `group_id` int(7) NOT NULL,
  `group_name` varchar(10) NOT NULL,
  `event_id` int(10) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `updated_at` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE IF NOT EXISTS `group_members` (
  `group_id` int(7) NOT NULL,
  `pearl_id` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pearl_events`
--

CREATE TABLE IF NOT EXISTS `pearl_events` (
  `event_id` int(15) NOT NULL,
  `event_name` varchar(50) NOT NULL,
  `paid` int(1) NOT NULL,
  `organiser_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pearl_events`
--

INSERT INTO `pearl_events` (`event_id`, `event_name`, `paid`, `organiser_id`) VALUES
(1, 'Terpsichore', 1, 1),
(2, 'Abhiyukta', 1, 3),
(3, 'Nukkad Natak', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `reg_16`
--

CREATE TABLE IF NOT EXISTS `reg_16` (
  `Sno` int(11) NOT NULL,
  `P_Id` text NOT NULL,
  `name` text NOT NULL,
  `college` text NOT NULL,
  `city` text NOT NULL,
  `phone` text NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_16`
--

INSERT INTO `reg_16` (`Sno`, `P_Id`, `name`, `college`, `city`, `phone`, `email`) VALUES
(1, 'PLTP001', 'Monil Shah', 'Bits Hyderabad', 'Surat', '9553305670', 'shahmonil1996@gmail.com'),
(2, 'PLTP002', 'Rajat Jain', 'BITS Hyderabad', 'Indore', '9553326810', 'rajatjain@gmail.com'),
(3, 'PLTP003', 'Ayush Beria', 'BITS Hyderabad', 'Surat', '9553324287', 'aagreat11@gmail.com'),
(4, 'PLTP004', 'Bharat Garg', 'BITS Hyderabad', 'Haryana', '7661806994', 'bharat1@gamil.com'),
(5, 'PLTP005', 'Harshit Agarwal', 'BITS Hyderabad', 'Balasur', '9912249068', 'harsu.ag@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE IF NOT EXISTS `rooms` (
  `floor_id` varchar(4) NOT NULL,
  `seats_left` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`floor_id`, `seats_left`) VALUES
('G1', 50),
('G2', 50),
('G3', 50),
('K1', 50),
('K2', 50),
('K3', 50),
('M1', 50),
('M2', 50),
('M3', 50),
('MM1', 50),
('MM2', 50),
('MM3', 50),
('MM4', 50),
('S1', 50),
('S2', 50),
('S3', 50),
('V1', 50),
('V2', 50),
('V3', 50);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `pearl_id` varchar(15) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `college` varchar(50) NOT NULL,
  `phone` bigint(15) NOT NULL,
  `reg` int(1) NOT NULL,
  `accom` int(1) NOT NULL,
  `id_reg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`pearl_id`, `name`, `email`, `college`, `phone`, `reg`, `accom`, `id_reg`) VALUES
('PL001', 'Monil Shah', 'shahmonil1996@gmail.com', 'Bits Hyderabad', 9553305670, 0, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accomodation`
--
ALTER TABLE `accomodation`
  ADD PRIMARY KEY (`Pearl_Id`);

--
-- Indexes for table `controlz_credentials`
--
ALTER TABLE `controlz_credentials`
  ADD PRIMARY KEY (`controlz_id`);

--
-- Indexes for table `dosh_credentials`
--
ALTER TABLE `dosh_credentials`
  ADD PRIMARY KEY (`team_id`);

--
-- Indexes for table `event_credentials`
--
ALTER TABLE `event_credentials`
  ADD PRIMARY KEY (`organiser_id`);

--
-- Indexes for table `event_details`
--
ALTER TABLE `event_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_details_ibfk_1` (`Event_id`);

--
-- Indexes for table `event_participants`
--
ALTER TABLE `event_participants`
  ADD PRIMARY KEY (`pearl_id`,`event_id`),
  ADD KEY `event_participants_ibfk_1` (`event_id`),
  ADD KEY `event_participants_ibfk_2` (`uploaded_by`);

--
-- Indexes for table `group_details`
--
ALTER TABLE `group_details`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `group_details_ibfk_1` (`event_id`),
  ADD KEY `group_details_ibfk_2` (`uploaded_by`);

--
-- Indexes for table `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`group_id`,`pearl_id`),
  ADD KEY `group_members_ibfk_1` (`pearl_id`);

--
-- Indexes for table `pearl_events`
--
ALTER TABLE `pearl_events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `organiser_id` (`organiser_id`);

--
-- Indexes for table `reg_16`
--
ALTER TABLE `reg_16`
  ADD PRIMARY KEY (`Sno`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`floor_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`pearl_id`),
  ADD KEY `users_ibfk_1` (`id_reg`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event_details`
--
ALTER TABLE `event_details`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `accomodation`
--
ALTER TABLE `accomodation`
  ADD CONSTRAINT `accomodation_ibfk_1` FOREIGN KEY (`Pearl_Id`) REFERENCES `users` (`pearl_id`);

--
-- Constraints for table `event_details`
--
ALTER TABLE `event_details`
  ADD CONSTRAINT `event_details_ibfk_1` FOREIGN KEY (`Event_id`) REFERENCES `pearl_events` (`event_id`);

--
-- Constraints for table `event_participants`
--
ALTER TABLE `event_participants`
  ADD CONSTRAINT `event_participants_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `pearl_events` (`event_id`),
  ADD CONSTRAINT `event_participants_ibfk_2` FOREIGN KEY (`uploaded_by`) REFERENCES `event_credentials` (`organiser_id`),
  ADD CONSTRAINT `event_participants_ibfk_3` FOREIGN KEY (`pearl_id`) REFERENCES `users` (`pearl_id`);

--
-- Constraints for table `group_details`
--
ALTER TABLE `group_details`
  ADD CONSTRAINT `group_details_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `pearl_events` (`event_id`),
  ADD CONSTRAINT `group_details_ibfk_2` FOREIGN KEY (`uploaded_by`) REFERENCES `event_credentials` (`organiser_id`);

--
-- Constraints for table `group_members`
--
ALTER TABLE `group_members`
  ADD CONSTRAINT `group_members_ibfk_1` FOREIGN KEY (`pearl_id`) REFERENCES `users` (`pearl_id`),
  ADD CONSTRAINT `group_members_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group_details` (`group_id`);

--
-- Constraints for table `pearl_events`
--
ALTER TABLE `pearl_events`
  ADD CONSTRAINT `pearl_events_ibfk_1` FOREIGN KEY (`organiser_id`) REFERENCES `event_credentials` (`organiser_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_reg`) REFERENCES `dosh_credentials` (`team_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
