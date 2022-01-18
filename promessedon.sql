-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8081
-- Generation Time: Jan 18, 2022 at 01:45 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `promessedon`
--

-- --------------------------------------------------------

--
-- Table structure for table `dons`
--

CREATE TABLE `dons` (
  `id_don` int(11) NOT NULL,
  `montant` int(9) NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dons`
--

INSERT INTO `dons` (`id_don`, `montant`, `id_utilisateur`) VALUES
(1, 1000000, 1),
(2, 1000000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id_utilisateur` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `mail` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id_utilisateur`, `nom`, `prenom`, `adresse`, `mail`) VALUES
(1, 'Gates', 'Bill', 'One Microsoft Way, Redmond, WA, USA', 'bill.gates@microsoft.com'),
(2, 'Bezos', 'Jeff', 'Seattle, WA, États-Unis', 'jeff.bezos@amazon.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dons`
--
ALTER TABLE `dons`
  ADD PRIMARY KEY (`id_don`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Indexes for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id_utilisateur`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dons`
--
ALTER TABLE `dons`
  MODIFY `id_don` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dons`
--
ALTER TABLE `dons`
  ADD CONSTRAINT `dons_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id_utilisateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
