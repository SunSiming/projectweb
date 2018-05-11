-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 11, 2018 at 07:00 AM
-- Server version: 5.7.11
-- PHP Version: 5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elisa_pigeon`
--

-- --------------------------------------------------------

--
-- Table structure for table `appartenir`
--

CREATE TABLE `appartenir` (
  `IDUSER` int(11) NOT NULL,
  `IDGROUPE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `etape`
--

CREATE TABLE `etape` (
  `IDETAPE` int(11) NOT NULL,
  `NOM` varchar(20) DEFAULT NULL,
  `CODEPOSTAL` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Table structure for table `groupe`
--

CREATE TABLE `groupe` (
  `IDGROUPE` int(11) NOT NULL,
  `IDUSER` int(11) NOT NULL,
  `NOM` varchar(20) DEFAULT NULL,
  `PRIVE` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `IDNOTIFICATION` int(11) NOT NULL,
  `NOTIFICATION` text NOT NULL,
  `IDTRAJET` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifier`
--

CREATE TABLE `notifier` (
  `IDNOTIFICATION` int(11) NOT NULL,
  `IDUSER` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;





-- --------------------------------------------------------

--
-- Table structure for table `passerpar`
--

CREATE TABLE `passerpar` (
  `IDTRAJET` int(11) NOT NULL,
  `IDETAPE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `pc`
--

CREATE TABLE `pc` (
  `ADRESSEIP` int(11) NOT NULL,
  `ESTBLOQUE` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `posseder`
--

CREATE TABLE `posseder` (
  `ADRESSEIP` int(11) NOT NULL,
  `IDUSER` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reserver`
--

CREATE TABLE `reserver` (
  `IDUSER` int(11) NOT NULL,
  `IDTRAJET` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Table structure for table `trajet`
--

CREATE TABLE `trajet` (
  `IDTRAJET` int(11) NOT NULL,
  `IDUSER` int(11) NOT NULL,
  `NOM` varchar(20) DEFAULT NULL,
  `HORAIREDEPART` datetime NOT NULL,
  `HORAIREARRIVEE` datetime NOT NULL,
  `LIEUDEPART` varchar(20) NOT NULL,
  `LIEUARRIVEE` varchar(20) NOT NULL,
  `DISTANCE` int(11) DEFAULT NULL,
  `NBXPLACE` smallint(6) NOT NULL,
  `CREATEUR` int(11) NOT NULL,
  `ACTIF` tinyint(1) NOT NULL,
  `INFORMATION` text,
  `IDVOITURE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `IDUSER` int(11) NOT NULL,
  `NOM` varchar(100) NOT NULL,
  `EMAIL` varchar(30) NOT NULL,
  `MOT_DE_PASSE` varchar(50) NOT NULL,
  `PRENOM` varchar(100) NOT NULL,
  `TEL` text,
  `NOMBRETRAJETREALISES` int(11) DEFAULT '0',
  `AVATAR` longblob,
  `PSEUDO` varchar(20) DEFAULT NULL,
  `INFORMATION` text,
  `ISADMIN` tinyint(1) DEFAULT '0',
  `ISBLOQUED` tinyint(1) DEFAULT '0',
  `UNITE` varchar(20) DEFAULT NULL,
  `FONCTION` varchar(20) DEFAULT NULL,
  `SITE` varchar(30) DEFAULT NULL,
  `PROMOTION` int(11) DEFAULT NULL,
  `TYPEPROMOTION` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Table structure for table `voiture`
--

CREATE TABLE `voiture` (
  `IDVOITURE` int(11) NOT NULL,
  `IDUSER` int(11) NOT NULL,
  `IDPROPRIETAIRE` int(11) DEFAULT NULL,
  `MARQUE` varchar(20) DEFAULT NULL,
  `MODELE` varchar(20) DEFAULT NULL,
  `NBXPLACE` smallint(6) DEFAULT NULL,
  `COULEUR` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Indexes for dumped tables
--

--
-- Indexes for table `appartenir`
--
ALTER TABLE `appartenir`
  ADD PRIMARY KEY (`IDUSER`,`IDGROUPE`),
  ADD KEY `FK_APPARTENIR2` (`IDGROUPE`);

--
-- Indexes for table `etape`
--
ALTER TABLE `etape`
  ADD PRIMARY KEY (`IDETAPE`);

--
-- Indexes for table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`IDGROUPE`),
  ADD KEY `FK_CREERSUPPRIMER` (`IDUSER`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`IDNOTIFICATION`),
  ADD KEY `IDTRAJET` (`IDTRAJET`);

--
-- Indexes for table `notifier`
--
ALTER TABLE `notifier`
  ADD PRIMARY KEY (`IDNOTIFICATION`,`IDUSER`),
  ADD KEY `IDUSER` (`IDUSER`);



--
-- Indexes for table `passerpar`
--
ALTER TABLE `passerpar`
  ADD PRIMARY KEY (`IDTRAJET`,`IDETAPE`),
  ADD KEY `FK_PASSERPAR2` (`IDETAPE`);

--
-- Indexes for table `pc`
--
ALTER TABLE `pc`
  ADD PRIMARY KEY (`ADRESSEIP`);

--
-- Indexes for table `posseder`
--
ALTER TABLE `posseder`
  ADD PRIMARY KEY (`ADRESSEIP`,`IDUSER`),
  ADD KEY `FK_POSSEDER2` (`IDUSER`);

--
-- Indexes for table `reserver`
--
ALTER TABLE `reserver`
  ADD PRIMARY KEY (`IDUSER`,`IDTRAJET`),
  ADD KEY `FK_RESERVER2` (`IDTRAJET`);

--
-- Indexes for table `trajet`
--
ALTER TABLE `trajet`
  ADD PRIMARY KEY (`IDTRAJET`),
  ADD KEY `FK_CREERMODIFIERSUPPRIMER` (`IDUSER`),
  ADD KEY `IDVOITURE` (`IDVOITURE`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`IDUSER`);

--
-- Indexes for table `voiture`
--
ALTER TABLE `voiture`
  ADD PRIMARY KEY (`IDVOITURE`),
  ADD KEY `FK_AVOIR` (`IDUSER`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `etape`
--
ALTER TABLE `etape`
  MODIFY `IDETAPE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `IDGROUPE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `IDNOTIFICATION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `trajet`
--
ALTER TABLE `trajet`
  MODIFY `IDTRAJET` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `IDUSER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT for table `voiture`
--
ALTER TABLE `voiture`
  MODIFY `IDVOITURE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `appartenir`
--
ALTER TABLE `appartenir`
  ADD CONSTRAINT `FK_APPARTENIR` FOREIGN KEY (`IDUSER`) REFERENCES `user` (`IDUSER`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_APPARTENIR2` FOREIGN KEY (`IDGROUPE`) REFERENCES `groupe` (`IDGROUPE`) ON UPDATE CASCADE;

--
-- Constraints for table `groupe`
--
ALTER TABLE `groupe`
  ADD CONSTRAINT `FK_CREERSUPPRIMER` FOREIGN KEY (`IDUSER`) REFERENCES `user` (`IDUSER`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`IDTRAJET`) REFERENCES `trajet` (`IDTRAJET`);

--
-- Constraints for table `notifier`
--
ALTER TABLE `notifier`
  ADD CONSTRAINT `notifier_ibfk_1` FOREIGN KEY (`IDNOTIFICATION`) REFERENCES `notification` (`IDNOTIFICATION`),
  ADD CONSTRAINT `notifier_ibfk_2` FOREIGN KEY (`IDUSER`) REFERENCES `user` (`IDUSER`);


--
-- Constraints for table `passerpar`
--
ALTER TABLE `passerpar`
  ADD CONSTRAINT `FK_PASSERPAR` FOREIGN KEY (`IDTRAJET`) REFERENCES `trajet` (`IDTRAJET`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PASSERPAR2` FOREIGN KEY (`IDETAPE`) REFERENCES `etape` (`IDETAPE`) ON UPDATE CASCADE;

--
-- Constraints for table `posseder`
--
ALTER TABLE `posseder`
  ADD CONSTRAINT `FK_POSSEDER` FOREIGN KEY (`ADRESSEIP`) REFERENCES `pc` (`ADRESSEIP`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_POSSEDER2` FOREIGN KEY (`IDUSER`) REFERENCES `user` (`IDUSER`) ON UPDATE CASCADE;

--
-- Constraints for table `reserver`
--
ALTER TABLE `reserver`
  ADD CONSTRAINT `FK_RESERVER` FOREIGN KEY (`IDUSER`) REFERENCES `user` (`IDUSER`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reserver_ibfk_1` FOREIGN KEY (`IDTRAJET`) REFERENCES `trajet` (`IDTRAJET`) ON DELETE CASCADE;

--
-- Constraints for table `trajet`
--
ALTER TABLE `trajet`
  ADD CONSTRAINT `FK_CREERMODIFIERSUPPRIMER` FOREIGN KEY (`IDUSER`) REFERENCES `user` (`IDUSER`),
  ADD CONSTRAINT `trajet_ibfk_1` FOREIGN KEY (`IDVOITURE`) REFERENCES `voiture` (`IDVOITURE`);

--
-- Constraints for table `voiture`
--
ALTER TABLE `voiture`
  ADD CONSTRAINT `FK_AVOIR` FOREIGN KEY (`IDUSER`) REFERENCES `user` (`IDUSER`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
