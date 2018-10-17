-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2018 at 03:30 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Table structure for table `klassen`
--

CREATE TABLE `klassen` (
  `klas_id` int(11) NOT NULL,
  `opleiding_opleiding_id` int(10) UNSIGNED NOT NULL,
  `klas_naam` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `klassen`
--

INSERT INTO `klassen` (`klas_id`, `opleiding_opleiding_id`, `klas_naam`) VALUES
(6, 0, '1A');

-- --------------------------------------------------------

--
-- Table structure for table `leerlingen`
--

CREATE TABLE `leerlingen` (
  `leerling_id` int(11) NOT NULL,
  `klassen_klas_id` int(11) NOT NULL,
  `voornaam` varchar(45) NOT NULL,
  `achternaam` varchar(45) NOT NULL,
  `adres` varchar(45) NOT NULL,
  `postcode` varchar(45) NOT NULL,
  `woonplaats` varchar(45) NOT NULL,
  `geboorte_datum` date NOT NULL,
  `telefoon_nummer` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leraren`
--

CREATE TABLE `leraren` (
  `leraar_id` int(11) NOT NULL,
  `voornaam` varchar(45) NOT NULL,
  `achternaam` varchar(45) NOT NULL,
  `adres` varchar(45) NOT NULL,
  `postcode` varchar(45) NOT NULL,
  `woonplaats` varchar(45) NOT NULL,
  `geboorte_datum` date NOT NULL,
  `telefoonnummer` int(10) NOT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lessen`
--

CREATE TABLE `lessen` (
  `les_id` int(11) NOT NULL,
  `klassen_klas_id` int(11) NOT NULL,
  `klassen_opleiding_opleiding_id` int(10) UNSIGNED NOT NULL,
  `leraren_leraar_id` int(11) NOT NULL,
  `lokalen_lokaal_id` int(11) NOT NULL,
  `vakken_vak_id` int(11) NOT NULL,
  `vak_uur` varchar(45) DEFAULT NULL,
  `vak_datum` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lokalen`
--

CREATE TABLE `lokalen` (
  `lokaal_id` int(11) NOT NULL,
  `lokaal_verdieping` int(11) NOT NULL,
  `lokaal_naam` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opleidingen`
--

CREATE TABLE `opleidingen` (
  `opleiding_id` int(10) UNSIGNED NOT NULL,
  `opleiding_naam` varchar(45) NOT NULL,
  `opleiding_duur` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vakken`
--

CREATE TABLE `vakken` (
  `vak_id` int(11) NOT NULL,
  `vak_naam` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vakken_has_leraren`
--

CREATE TABLE `vakken_has_leraren` (
  `vakken_vak_id` int(11) NOT NULL,
  `leraren_leraar_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vakken_has_opleiding`
--

CREATE TABLE `vakken_has_opleiding` (
  `vakken_vak_id` int(11) NOT NULL,
  `opleiding_opleiding_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `klassen`
--
ALTER TABLE `klassen`
  ADD PRIMARY KEY (`klas_id`,`opleiding_opleiding_id`),
  ADD UNIQUE KEY `klas_id_UNIQUE` (`klas_id`),
  ADD KEY `fk_klassen_opleiding1_idx` (`opleiding_opleiding_id`);

--
-- Indexes for table `leerlingen`
--
ALTER TABLE `leerlingen`
  ADD PRIMARY KEY (`leerling_id`,`klassen_klas_id`),
  ADD UNIQUE KEY `leerling_id_UNIQUE` (`leerling_id`),
  ADD KEY `fk_leerlingen_klassen_idx` (`klassen_klas_id`);

--
-- Indexes for table `leraren`
--
ALTER TABLE `leraren`
  ADD PRIMARY KEY (`leraar_id`),
  ADD UNIQUE KEY `leraar_id_UNIQUE` (`leraar_id`);

--
-- Indexes for table `lessen`
--
ALTER TABLE `lessen`
  ADD PRIMARY KEY (`les_id`,`klassen_klas_id`,`klassen_opleiding_opleiding_id`,`leraren_leraar_id`,`lokalen_lokaal_id`,`vakken_vak_id`),
  ADD UNIQUE KEY `les_id_UNIQUE` (`les_id`),
  ADD KEY `fk_lessen_klassen1_idx` (`klassen_klas_id`,`klassen_opleiding_opleiding_id`),
  ADD KEY `fk_lessen_leraren1_idx` (`leraren_leraar_id`),
  ADD KEY `fk_lessen_lokalen1_idx` (`lokalen_lokaal_id`),
  ADD KEY `fk_lessen_vakken1_idx` (`vakken_vak_id`);

--
-- Indexes for table `lokalen`
--
ALTER TABLE `lokalen`
  ADD PRIMARY KEY (`lokaal_id`),
  ADD UNIQUE KEY `lokaal_id_UNIQUE` (`lokaal_id`);

--
-- Indexes for table `opleidingen`
--
ALTER TABLE `opleidingen`
  ADD PRIMARY KEY (`opleiding_id`);

--
-- Indexes for table `vakken`
--
ALTER TABLE `vakken`
  ADD PRIMARY KEY (`vak_id`),
  ADD UNIQUE KEY `vak_id_UNIQUE` (`vak_id`);

--
-- Indexes for table `vakken_has_leraren`
--
ALTER TABLE `vakken_has_leraren`
  ADD PRIMARY KEY (`vakken_vak_id`,`leraren_leraar_id`),
  ADD KEY `fk_vakken_has_leraren_leraren1_idx` (`leraren_leraar_id`),
  ADD KEY `fk_vakken_has_leraren_vakken1_idx` (`vakken_vak_id`);

--
-- Indexes for table `vakken_has_opleiding`
--
ALTER TABLE `vakken_has_opleiding`
  ADD PRIMARY KEY (`vakken_vak_id`,`opleiding_opleiding_id`),
  ADD KEY `fk_vakken_has_opleiding_opleiding1_idx` (`opleiding_opleiding_id`),
  ADD KEY `fk_vakken_has_opleiding_vakken1_idx` (`vakken_vak_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `klassen`
--
ALTER TABLE `klassen`
  MODIFY `klas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `leerlingen`
--
ALTER TABLE `leerlingen`
  MODIFY `leerling_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leraren`
--
ALTER TABLE `leraren`
  MODIFY `leraar_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lessen`
--
ALTER TABLE `lessen`
  MODIFY `les_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lokalen`
--
ALTER TABLE `lokalen`
  MODIFY `lokaal_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `opleidingen`
--
ALTER TABLE `opleidingen`
  MODIFY `opleiding_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vakken`
--
ALTER TABLE `vakken`
  MODIFY `vak_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `klassen`
--
ALTER TABLE `klassen`
  ADD CONSTRAINT `fk_klassen_opleiding1` FOREIGN KEY (`opleiding_opleiding_id`) REFERENCES `opleidingen` (`opleiding_id`);

--
-- Constraints for table `leerlingen`
--
ALTER TABLE `leerlingen`
  ADD CONSTRAINT `fk_leerlingen_klassen` FOREIGN KEY (`klassen_klas_id`) REFERENCES `klassen` (`klas_id`);

--
-- Constraints for table `lessen`
--
ALTER TABLE `lessen`
  ADD CONSTRAINT `fk_lessen_klassen1` FOREIGN KEY (`klassen_klas_id`,`klassen_opleiding_opleiding_id`) REFERENCES `klassen` (`klas_id`, `opleiding_opleiding_id`),
  ADD CONSTRAINT `fk_lessen_leraren1` FOREIGN KEY (`leraren_leraar_id`) REFERENCES `leraren` (`leraar_id`),
  ADD CONSTRAINT `fk_lessen_lokalen1` FOREIGN KEY (`lokalen_lokaal_id`) REFERENCES `lokalen` (`lokaal_id`),
  ADD CONSTRAINT `fk_lessen_vakken1` FOREIGN KEY (`vakken_vak_id`) REFERENCES `vakken` (`vak_id`);

--
-- Constraints for table `vakken_has_leraren`
--
ALTER TABLE `vakken_has_leraren`
  ADD CONSTRAINT `fk_vakken_has_leraren_leraren1` FOREIGN KEY (`leraren_leraar_id`) REFERENCES `leraren` (`leraar_id`),
  ADD CONSTRAINT `fk_vakken_has_leraren_vakken1` FOREIGN KEY (`vakken_vak_id`) REFERENCES `vakken` (`vak_id`);

--
-- Constraints for table `vakken_has_opleiding`
--
ALTER TABLE `vakken_has_opleiding`
  ADD CONSTRAINT `fk_vakken_has_opleiding_opleiding1` FOREIGN KEY (`opleiding_opleiding_id`) REFERENCES `opleidingen` (`opleiding_id`),
  ADD CONSTRAINT `fk_vakken_has_opleiding_vakken1` FOREIGN KEY (`vakken_vak_id`) REFERENCES `vakken` (`vak_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
