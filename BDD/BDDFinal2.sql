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








  INSERT INTO `USER` (`IDUSER`, `NOM`, `EMAIL`, `PRENOM`, `TEL`, `NOMBRETRAJETREALISES`, `AVATAR`, `PSEUDO`, `INFORMATION`, `ISADMIN`, `UNITE`, `FONCTION`, `SITE`, `PROMOTION`, `TYPEPROMOTION`) VALUES
  (184, 'OPSW', '', 'Reprise données', 0, 0, '', '', '', 0, '', 'agent', '', 0, ''),
  (189, 'ANCIAUX', 'stephane.anciaux@mines-douai.f', 'Stéphane', 0, 0, '', '', '', 0, 'Agence Comptable', 'agent', '', 0, ''),
  (190, 'COGEZ', 'daniel.cogez@mines-douai.fr', 'Daniel', 0, 0, '', '', '', 0, 'Agence Comptable', 'agent', '', 0, ''),
  (191, 'DEFRANCE', 'annie.defrance@mines-douai.fr', 'Annie', 0, 0, '', '', '', 0, 'Agence Comptable', 'agent', '', 0, ''),
  (195, 'CORDONNIER', 'jean-loup.cordonnier@mines-dou', 'Jean-Loup', 0, 0, '', '', '', 0, 'DEF - Pôle Campus Nu', 'agent', '', 0, ''),
  (196, 'FORT', 'cecile.fort@mines-douai.fr', 'Cécile', 0, 0, '', '', '', 0, 'DEF - Pôle Campus Nu', 'agent', '', 0, ''),
  (198, 'PORTILLO', 'carole.portillo@mines-douai.fr', 'Carole', 0, 0, '', '', '', 0, 'DEF - Pôle Campus Nu', 'agent', '', 0, ''),
  (199, 'SION', 'frederic.sion@mines-douai.fr', 'Frédéric', 0, 0, '', '', '', 0, 'DEF - Pôle Campus Nu', 'agent', '', 0, ''),
  (200, 'VERMEULEN', 'mathieu.vermeulen@mines-douai.', 'Mathieu', 0, 0, '', '', '', 0, 'DEF - Pôle Campus Nu', 'agent', '', 0, ''),
  (201, 'CHEVALLIER', 'raymond.chevallier@mines-douai', 'Raymond', 0, 0, '', '', '', 0, 'DEF - Direction', 'agent', '', 0, ''),
  (202, 'HILLEWAERE', 'jean-pierre.hillewaere@mines-d', 'Jean-Pierre', 0, 0, '', '', '', 0, 'DEF - Direction', 'agent', '', 0, ''),
  (203, 'LECOMTE', 'michel.lecomte@mines-douai.fr', 'Michel', 0, 0, '', '', '', 0, 'Département Physique', 'agent', '', 0, ''),
  (204, 'VANSUYPEENE', 'chantal.vansuypeene@mines-doua', 'Chantal', 0, 0, '', '', '', 0, 'DEF - Direction', 'agent', '', 0, ''),
  (206, 'CONTRERAS', 'jose.contreras@mines-douai.fr', 'José', 0, 0, '', '', '', 0, 'DEF - Pôle Formation', 'agent', '', 0, ''),
  (207, 'CUIENGNET', 'georges.cuiengnet@mines-douai.', 'Georges', 0, 0, '', '', '', 0, 'DEF - Direction', 'agent', '', 0, ''),
  (208, 'DELACROIX', 'frederic.delacroix@mines-douai', 'Frédéric', 0, 0, '', '', '', 0, 'Département Physique', 'agent', '', 0, ''),
  (209, 'DIRIS', 'jerome.diris@mines-douai.fr', 'Jérôme', 0, 0, '', '', '', 0, 'DEF - Pôle Formation', 'agent', '', 0, ''),
  (211, 'FOVAUX', 'christelle.fovaux@mines-douai.', 'Christelle', 0, 0, '', '', '', 0, 'DEF - Pôle Processus', 'agent', '', 0, ''),
  (212, 'GAILLARD', 'annie.gaillard@mines-douai.fr', 'Annie', 0, 0, '', '', '', 0, 'DEF - Pôle Formation', 'agent', '', 0, ''),
  (213, 'HARDOUIN', 'maxime.hardouin@mines-douai.fr', 'Maxime', 0, 0, '', '', '', 0, 'DEF - Pôle Processus', 'agent', '', 0, ''),
  (215, 'TAILLE', 'sandrine.taille@mines-douai.fr', 'Sandrine', 0, 0, '', '', '', 0, 'Département Sciences', 'agent', '', 0, ''),
  (216, 'VERVOORT', 'patrice.vervoort@mines-douai.f', 'Patrice', 0, 0, '', '', '', 0, 'DEF - Chargés de Mis', 'agent', '', 0, ''),
  (218, 'COLAS', 'martine.colas@mines-douai.fr', 'Martine', 0, 0, '', '', '', 0, 'DEF - Pôle Formation', 'agent', '', 0, ''),
  (219, 'DEQUEKER', 'emmanuel.dequeker@mines-douai.', 'Emmanuel', 0, 0, '', '', '', 0, 'DRIPA - Direction de', 'agent', '', 0, ''),
  (222, 'HALEJCIO', 'nadine.halejcio@mines-douai.fr', 'Nadine', 0, 0, '', '', '', 0, 'DEF - Direction', 'agent', '', 0, ''),
  (223, 'HURTEVENT', 'annie.hurtevent@mines-douai.fr', 'Annie', 0, 0, '', '', '', 0, 'DRIPA - Direction de', 'agent', '', 0, ''),
  (224, 'KOMINIARZ', 'karine.kominiarz@mines-douai.f', 'Karine', 0, 0, '', '', '', 0, 'DRIPA - Direction de', 'agent', '', 0, ''),
  (225, 'LEROY', 'cecile.leroy@mines-douai.fr', 'Cécile', 0, 0, '', '', '', 0, 'DEF - Pôle Processus', 'agent', '', 0, ''),
  (226, 'SLIMANI', 'nadia.slimani@mines-douai.fr', 'Nadia', 0, 0, '', '', '', 0, 'DRIPA - Direction de', 'agent', '', 0, ''),
  (228, 'PAGNIEZ', 'bruno.pagniez@mines-douai.fr', 'Bruno', 0, 0, '', '', '', 0, 'DEF - Pôle Campus Nu', 'agent', '', 0, ''),
  (229, 'SENECHAL', 'martine.senechal@mines-douai.f', 'Martine', 0, 0, '', '', '', 0, 'DEF - Pôle Campus Nu', 'agent', '', 0, ''),
  (231, 'CAENEN', 'jean-luc.caenen@mines-douai.fr', 'Jean-Luc', 0, 0, '', '', '', 0, 'DEF - Pôle Professio', 'agent', '', 0, ''),
  (233, 'DYBIAK', 'richard.dybiak@mines-douai.fr', 'Richard', 0, 0, '', '', '', 0, 'DEF - Pôle Professio', 'agent', '', 0, ''),
  (234, 'GRAVEZ', 'philippe.gravez@mines-douai.fr', 'Philippe', 0, 0, '', '', '', 0, 'DRI - Direction de l', 'agent', '', 0, ''),
  (235, 'MORTELETTE', 'christian.mortelette@mines-dou', 'Christian', 0, 0, '', '', '', 0, 'SG - Direction des M', 'agent', '', 0, ''),
  (236, 'SENELAER', 'jean-paul.senelaer@mines-douai', 'Jean-Paul', 0, 0, '', '', '', 0, 'DEF - Pôle Processus', 'agent', '', 0, ''),
  (237, 'SUFFERT', 'michel.suffert@mines-douai.fr', 'Michel', 0, 0, '', '', '', 0, 'DRI - Direction de l', 'agent', '', 0, ''),
  (240, 'ALLEMAN', 'laurent.alleman@mines-douai.fr', 'Laurent', 0, 0, '', '', '', 0, 'Département Sciences', 'agent', '', 0, ''),
  (246, 'CODDEVILLE', 'patrice.coddeville@mines-douai', 'Patrice', 0, 0, '', '', '', 0, 'Département Sciences', 'agent', '', 0, ''),
  (250, 'DUSANTER', 'sebastien.dusanter@mines-douai', 'Sébastien', 0, 0, '', '', '', 0, 'Département Sciences', 'agent', '', 0, ''),
  (251, 'FREJEK', 'veronique.frejek@mines-douai.f', 'Véronique', 0, 0, '', '', '', 0, 'Département Sciences', 'agent', '', 0, ''),
  (258, 'LOCOGE', 'nadine.locoge@mines-douai.fr', 'Nadine', 0, 0, '', '', '', 0, 'Département Sciences', 'agent', '', 0, ''),
  (260, 'MATHE', 'francois.mathe@mines-douai.fr', 'François', 0, 0, '', '', '', 0, 'Département Sciences', 'agent', '', 0, ''),
  (265, 'PERDRIX', 'esperanza.perdrix@mines-douai.', 'Espéranza', 0, 0, '', '', '', 0, 'Département Sciences', 'agent', '', 0, ''),
  (267, 'REDON', 'nathalie.redon@mines-douai.fr', 'Nathalie', 0, 0, '', '', '', 0, 'Département Sciences', 'agent', '', 0, ''),
  (268, 'RIFFAULT', 'veronique.riffault@mines-douai', 'Véronique', 0, 0, '', '', '', 0, 'Département Sciences', 'agent', '', 0, ''),
  (271, 'SAUVAGE', 'stephane.sauvage@mines-douai.f', 'Stéphane', 0, 0, '', '', '', 0, 'Département Sciences', 'agent', '', 0, ''),
  (274, 'THEVENET', 'frederic.thevenet@mines-douai.', 'Frédéric', 0, 0, '', '', '', 0, 'Département Sciences', 'agent', '', 0, ''),
  (277, 'TOMAS', 'alexandre.tomas@mines-douai.fr', 'Alexandre', 0, 0, '', '', '', 0, 'Département Sciences', 'agent', '', 0, ''),
  (279, 'VERRIELE-DUNCIANU', 'marie.verriele@mines-douai.fr', 'Marie', 0, 0, '', '', '', 0, 'Département Sciences', 'agent', '', 0, ''),
  (280, 'WALEROWICZ-NICODEME', 'magali.walerowicz@mines-douai.', 'Magali', 0, 0, '', '', '', 0, 'DEF - Pôle Campus Nu', 'agent', '', 0, ''),
  (281, 'WOJKIEWICZ', 'jean-luc.wojkiewicz@mines-doua', 'Jean-Luc', 0, 0, '', '', '', 0, 'Département Sciences', 'agent', '', 0, ''),
  (282, 'WROBLEWSKI', 'andre.wroblewski@mines-douai.f', 'André', 0, 0, '', '', '', 0, 'Département Sciences', 'agent', '', 0, ''),
  (284, 'BAUDOIN', 'bernard.baudoin@mines-douai.fr', 'Bernard', 0, 0, '', '', '', 0, 'DRI - A.P.U.I.', 'agent', '', 0, ''),
  (285, 'BOUGEARD', 'daniel.bougeard@mines-douai.fr', 'Daniel', 0, 0, '', '', '', 0, 'Département Energéti', 'agent', '', 0, ''),
  (293, 'HARION', 'jean-luc.harion@mines-douai.fr', 'Jean-Luc', 0, 0, '', '', '', 0, 'DIR - Direction Géné', 'agent', '', 0, ''),
  (296, 'LEVEQUE', 'nadine.leveque@mines-douai.fr', 'Nadine', 0, 0, '', '', '', 0, 'Département Energéti', 'agent', '', 0, ''),
  (300, 'RUSSEIL', 'serge.russeil@mines-douai.fr', 'Serge', 0, 0, '', '', '', 0, 'Département Energéti', 'agent', '', 0, ''),
  (302, 'VERMEULEN', 'jean-philippe.vermeulen@mines-', 'Jean-Philippe', 0, 0, '', '', '', 0, 'Département Energéti', 'agent', '', 0, ''),
  (305, 'ABRIAK', 'nor-edine.abriak@mines-douai.f', 'Nor Edine', 0, 0, '', '', '', 0, 'Département Génie Ci', 'agent', '', 0, ''),
  (307, 'ALARY', 'claire.alary@mines-douai.fr', 'Claire', 0, 0, '', '', '', 0, 'Département Génie Ci', 'agent', '', 0, ''),
  (310, 'BECQUART', 'frederic.becquart@mines-douai.', 'Frédéric', 0, 0, '', '', '', 0, 'Département Génie Ci', 'agent', '', 0, ''),
  (311, 'BENZERZOUR', 'mahfoud.benzerzour@mines-douai', 'Mahfoud', 0, 0, '', '', '', 0, 'Département Génie Ci', 'agent', '', 0, ''),
  (314, 'BULTEEL', 'david.bulteel@mines-douai.fr', 'David', 0, 0, '', '', '', 0, 'Département Génie Ci', 'agent', '', 0, ''),
  (316, 'CAPPELAERE', 'christophe.cappelaere@mines-do', 'Christophe', 0, 0, '', '', '', 0, 'DRI - Direction de l', 'agent', '', 0, ''),
  (318, 'DAMIDOT', 'denis.damidot@mines-douai.fr', 'Denis', 0, 0, '', '', '', 0, 'DRED - Direction des', 'agent', '', 0, ''),
  (319, 'DELCHAMBRE', 'carole.delchambre@mines-douai.', 'Carole', 0, 0, '', '', '', 0, 'Département Génie Ci', 'agent', '', 0, ''),
  (330, 'LORS', 'christine.lors@mines-douai.fr', 'Christine', 0, 0, '', '', '', 0, 'Département Génie Ci', 'agent', '', 0, ''),
  (333, 'MAMINDY-PAJANY', 'yannick.mamindy@mines-douai.fr', 'Yannick', 0, 0, '', '', '', 0, 'Département Génie Ci', 'agent', '', 0, ''),
  (334, 'PIZETTE', 'patrick.pizette@mines-douai.fr', 'Patrick', 0, 0, '', '', '', 0, 'Département Génie Ci', 'agent', '', 0, ''),
  (336, 'REMOND', 'sebastien.remond@mines-douai.f', 'Sébastien', 0, 0, '', '', '', 0, 'Département Génie Ci', 'agent', '', 0, ''),
  (337, 'THIERY', 'vincent.thiery@mines-douai.fr', 'Vincent', 0, 0, '', '', '', 0, 'Département Génie Ci', 'agent', '', 0, ''),
  (342, 'ZENTAR', 'rachid.zentar@mines-douai.fr', 'Rachid', 0, 0, '', '', '', 0, 'Département Génie Ci', 'agent', '', 0, ''),
  (346, 'BOONAERT', 'jacques.boonaert@mines-douai.f', 'Jacques', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (347, 'BOURAQADI', 'noury.bouraqadi@mines-douai.fr', 'Noury', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (352, 'CORTE', 'francois.corte@mines-douai.fr', 'François', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (353, 'DAVID', 'bertrand.david@mines-douai.fr', 'Bertrand', 0, 0, '', '', '', 0, 'DISI - Direction de ', 'agent', '', 0, ''),
  (354, 'DELEPLANQUE', 'henri.deleplanque@mines-douai.', 'Henri', 0, 0, '', '', '', 0, 'DISI - Direction de ', 'agent', '', 0, ''),
  (357, 'DONIEC', 'arnaud.doniec@mines-douai.fr', 'Arnaud', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (358, 'DUVIELLA', 'eric.duviella@mines-douai.fr', 'Eric', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (359, 'FABRESSE', 'luc.fabresse@mines-douai.fr', 'Luc', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (360, 'FLEURY', 'anthony.fleury@mines-douai.fr', 'Anthony', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (362, 'GILLE', 'david.gille@mines-douai.fr', 'David', 0, 0, '', '', '', 0, 'DISI - Direction de ', 'agent', '', 0, ''),
  (363, 'GUINARD', 'alban.guinard@mines-douai.fr', 'Alban', 0, 0, '', '', '', 0, 'DISI - Direction de ', 'agent', '', 0, ''),
  (364, 'HASBROUCQ', 'philippe.hasbroucq@mines-douai', 'Philippe', 0, 0, '', '', '', 0, 'DISI - Direction de ', 'agent', '', 0, ''),
  (365, 'HOUSSAYE', 'gabriel.houssaye@mines-douai.f', 'Gabriel', 0, 0, '', '', '', 0, 'DRI - Direction de l', 'agent', '', 0, ''),
  (366, 'HUMEAU', 'jeremie.humeau@mines-douai.fr', 'Jérémie', 0, 0, '', '', '', 0, 'DISI - Direction de ', 'agent', '', 0, ''),
  (367, 'JUGE-HUBERT', 'didier.juge-hubert@mines-douai', 'Didier', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (368, 'KLOPCIC', 'frederic.klopcic@mines-douai.f', 'Frédéric', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (369, 'LABARRE', 'cecile.labarre@mines-douai.fr', 'Cécile', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (371, 'LECOCQ', 'vincent.lecocq@mines-douai.fr', 'Vincent', 0, 0, '', '', '', 0, 'DISI - Direction de ', 'agent', '', 0, ''),
  (372, 'LECOEUCHE', 'stephane.lecoeuche@mines-douai', 'Stéphane', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (374, 'LEROY', 'marie-pierre.leroy@mines-douai', 'Marie-Pierre', 0, 0, '', '', '', 0, 'DISI - Direction de ', 'agent', '', 0, ''),
  (379, 'MORGAN', 'muriel.morgan@mines-douai.fr', 'Muriel', 0, 0, '', '', '', 0, 'DISI - Direction de ', 'agent', '', 0, ''),
  (382, 'PEUVREL', 'fabienne.peuvrel@mines-douai.f', 'Fabienne', 0, 0, '', '', '', 0, 'DISI - Direction de ', 'agent', '', 0, ''),
  (384, 'PINOT', 'remy.pinot@mines-douai.fr', 'Rémy', 0, 0, '', '', '', 0, 'DISI - Direction de ', 'agent', '', 0, ''),
  (386, 'RAINGUEZ', 'sandrine.rainguez@mines-douai.', 'Sandrine', 0, 0, '', '', '', 0, 'DISI - Direction de ', 'agent', '', 0, ''),
  (387, 'RAJAOARISOA', 'lala.rajaoarisoa@mines-douai.f', 'Lala', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (388, 'RYCKBOSCH', 'didier.ryckbosch@mines-douai.f', 'Didier', 0, 0, '', '', '', 0, 'DISI - Direction de ', 'agent', '', 0, ''),
  (391, 'SAYED MOUCHAWEH', 'moamar.sayed-mouchaweh@mines-d', 'Moamar', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (394, 'TEMPET', 'franck.tempet@mines-douai.fr', 'Franck', 0, 0, '', '', '', 0, 'DISI - Direction de ', 'agent', '', 0, ''),
  (395, 'THERY', 'bruno.thery@mines-douai.fr', 'Bruno', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (399, 'ZIZEK', 'jean-philippe.zizek@mines-doua', 'Jean-Philippe', 0, 0, '', '', '', 0, 'DISI - Direction de ', 'agent', '', 0, ''),
  (403, 'BOURSE', 'gerard.bourse@mines-douai.fr', 'Gérard', 0, 0, '', '', '', 0, 'Département Technolo', 'agent', '', 0, ''),
  (405, 'CHAKI', 'salim.chaki@mines-douai.fr', 'Salim', 0, 0, '', '', '', 0, 'Département Technolo', 'agent', '', 0, ''),
  (406, 'CHARLET', 'laurent.charlet@mines-douai.fr', 'Laurent', 0, 0, '', '', '', 0, 'Département Technolo', 'agent', '', 0, ''),
  (409, 'CORNEIL', 'danielle.corneil@mines-douai.f', 'Danielle', 0, 0, '', '', '', 0, 'Département Technolo', 'agent', '', 0, ''),
  (410, 'COSSON', 'benoit.cosson@mines-douai.fr', 'Benoît', 0, 0, '', '', '', 0, 'Département Technolo', 'agent', '', 0, ''),
  (413, 'DEMOUVEAU', 'herve.demouveau@mines-douai.fr', 'Hervé', 0, 0, '', '', '', 0, 'Département Technolo', 'agent', '', 0, ''),
  (417, 'DOUCHAIN', 'catherine.douchain@mines-douai', 'Catherine', 0, 0, '', '', '', 0, 'DEF - Pôle Formation', 'agent', '', 0, ''),
  (423, 'HARIRI', 'said.hariri@mines-douai.fr', 'Saïd', 0, 0, '', '', '', 0, 'Département Technolo', 'agent', '', 0, ''),
  (426, 'HULOT', 'patrice.hulot@mines-douai.fr', 'Patrice', 0, 0, '', '', '', 0, 'Département Technolo', 'agent', '', 0, ''),
  (429, 'KRAWCZAK', 'patricia.krawczak@mines-douai.', 'Patricia', 0, 0, '', '', '', 0, 'Département Technolo', 'agent', '', 0, ''),
  (431, 'LAFRANCHE', 'eric.lafranche@mines-douai.fr', 'Eric', 0, 0, '', '', '', 0, 'Département Technolo', 'agent', '', 0, ''),
  (447, 'PRASHANTHA', 'kalappa.prashantha@mines-douai', 'Kalappa', 0, 0, '', '', '', 0, 'Département Technolo', 'agent', '', 0, ''),
  (454, 'SOULESTIN', 'jeremie.soulestin@mines-douai.', 'Jérémie', 0, 0, '', '', '', 0, 'Département Technolo', 'agent', '', 0, ''),
  (456, 'VASIUKOV', 'dmytro.vasiukov@mines-douai.fr', 'Dmytro', 0, 0, '', '', '', 0, 'Département Technolo', 'agent', '', 0, ''),
  (458, 'Accueil Bourseul', 'accueil_bourseul@mines-douai.f', 'Générique', 0, 0, '', '', '', 0, 'SG - Secrétariat Gén', 'agent', '', 0, ''),
  (460, 'BAUDRY', 'laurent.baudry@mines-douai.fr', 'Laurent', 0, 0, '', '', '', 0, 'DRIPA - Direction de', 'agent', '', 0, ''),
  (461, 'BONPAIN', 'marc.bonpain@mines-douai.fr', 'Marc', 0, 0, '', '', '', 0, 'DRED - Direction des', 'agent', '', 0, ''),
  (462, 'DRODE', 'martine.drode@mines-douai.fr', 'Martine', 0, 0, '', '', '', 0, 'DRED - Direction des', 'agent', '', 0, ''),
  (463, 'GISZCZEWSKI', 'stephane.giszczewski@mines-dou', 'Stéphane', 0, 0, '', '', '', 0, 'DIRCOM - Direction d', 'agent', '', 0, ''),
  (465, 'BOULNOIS', 'daniel.boulnois@mines-douai.fr', 'Daniel', 0, 0, '', '', '', 0, 'DIR - Direction Géné', 'agent', '', 0, ''),
  (468, 'BACHELET', 'valerie.bachelet@mines-douai.f', 'Valérie', 0, 0, '', '', '', 0, 'DRED - Direction des', 'agent', '', 0, ''),
  (469, 'DE AMORIN', 'isabelle.de.amorin@mines-douai', 'Isabelle', 0, 0, '', '', '', 0, 'DRI - A.P.U.I.', 'agent', '', 0, ''),
  (470, 'FERLIN', 'isabelle.ferlin@mines-douai.fr', 'Isabelle', 0, 0, '', '', '', 0, 'DRI - A.P.U.I.', 'agent', '', 0, ''),
  (472, 'MOUSSET', 'luc.mousset@mines-douai.fr', 'Luc', 0, 0, '', '', '', 0, 'DRI - A.P.U.I.', 'agent', '', 0, ''),
  (474, 'TIBERGHIEN', 'patrick.tiberghien@mines-douai', 'Patrick', 0, 0, '', '', '', 0, 'DRI - A.P.U.I.', 'agent', '', 0, ''),
  (477, 'FONTAINE', 'laurence.fontaine@mines-douai.', 'Laurence', 0, 0, '', '', '', 0, 'DRI - Direction de l', 'agent', '', 0, ''),
  (485, 'POISSEROUX', 'jean-paul.poisseroux@mines-dou', 'Jean-Paul', 0, 0, '', '', '', 0, 'SG - Direction des A', 'agent', '', 0, ''),
  (491, 'AMARA', 'kader.amara@mines-douai.fr', 'Kader', 0, 0, '', '', '', 0, 'SG - Secrétariat Gén', 'agent', '', 0, ''),
  (493, 'DHAENE', 'christine.dhaene@mines-douai.f', 'Christine', 0, 0, '', '', '', 0, 'DIR - Délégation à l', 'agent', '', 0, ''),
  (495, 'KHOUCHAF', 'lahcen.khouchaf@mines-douai.fr', 'Lahcen', 0, 0, '', '', '', 0, 'SG - Secrétariat Gén', 'agent', '', 0, ''),
  (497, 'LEONARDIS', 'myriam.leonardis@mines-douai.f', 'Myriam', 0, 0, '', '', '', 0, 'DEF - Pôle Professio', 'agent', '', 0, ''),
  (501, 'SPRIMONT', 'brigitte.sprimont@mines-douai.', 'Brigitte', 0, 0, '', '', '', 0, 'DIR - Direction Géné', 'agent', '', 0, ''),
  (503, 'CARION', 'arnaud.carion@mines-douai.fr', 'Arnaud', 0, 0, '', '', '', 0, 'SG - Direction des M', 'agent', '', 0, ''),
  (505, 'HAIRE', 'mylene.haire@mines-douai.fr', 'Mylène', 0, 0, '', '', '', 0, 'SG - Direction des M', 'agent', '', 0, ''),
  (506, 'MILO', 'eric.milo@mines-douai.fr', 'Eric', 0, 0, '', '', '', 0, 'SG - Direction des M', 'agent', '', 0, ''),
  (508, 'BERNARD', 'nathalie.bernard@mines-douai.f', 'Nathalie', 0, 0, '', '', '', 0, 'SG - Secrétariat Gén', 'agent', '', 0, ''),
  (514, 'GUILBERT', 'francoise.guilbert@mines-douai', 'Françoise', 0, 0, '', '', '', 0, 'SG - Direction des R', 'agent', '', 0, ''),
  (515, 'GWISZCZ', 'isabelle.gwiszcz@mines-douai.f', 'Isabelle', 0, 0, '', '', '', 0, 'SG - Direction des R', 'agent', '', 0, ''),
  (516, 'MARD', 'christophe.mard@mines-douai.fr', 'Christophe', 0, 0, '', '', '', 0, 'SG - Direction des R', 'agent', '', 0, ''),
  (517, 'SCHULZ', 'david.schulz@mines-douai.fr', 'David', 0, 0, '', '', '', 0, 'DIRCOM - Direction d', 'agent', '', 0, ''),
  (518, 'THURIOT', 'stephane.thuriot@mines-douai.f', 'Stéphane', 0, 0, '', '', '', 0, 'SG - Direction des R', 'agent', '', 0, ''),
  (519, 'VALENTI', 'christian.valenti@mines-douai.', 'Christian', 0, 0, '', '', '', 0, 'SG - Direction des R', 'agent', '', 0, ''),
  (526, 'HADOUX', 'sylvain.hadoux@mines-douai.fr', 'Sylvain', 0, 0, '', '', '', 0, 'SG - Direction des M', 'agent', '', 0, ''),
  (550, 'THIROUX', 'alain.thiroux@mines-douai.fr', 'Alain', 0, 0, '', '', '', 0, 'SG - Direction des M', 'agent', '', 0, ''),
  (625, 'MBIANDJEU TCHAMI', 'danny.mbiandjeu@minesdedouai.f', 'Danny Philip', 0, 0, '', '', '', 0, '', 'etudiant', '', 2017, 'FI'),
  (2780, 'LEBLANC', 'etienne.leblanc@mines-douai.fr', 'Etienne', 0, 0, '', '', '', 0, 'DEF - Pôle Formation', 'agent', '', 0, ''),
  (2781, 'LACRAMPE', 'marie-france.lacrampe@mines-do', 'Marie-France', 0, 0, '', '', '', 0, 'Département Technolo', 'agent', '', 0, ''),
  (2794, 'PETIT', 'christine.petit@mines-douai.fr', 'Christine', 0, 0, '', '', '', 0, 'DISI - Direction de ', 'agent', '', 0, ''),
  (2796, 'ROGER', 'frederic.roger@mines-douai.fr', 'Frédéric', 0, 0, '', '', '', 0, 'Département Technolo', 'agent', '', 0, ''),
  (2801, 'PARK', 'chung-hae.park@mines-douai.fr', 'Chung Hae', 0, 0, '', '', '', 0, 'Département Technolo', 'agent', '', 0, ''),
  (2937, 'LEFTERIU', 'sanda.lefteriu@mines-douai.fr', 'Sanda', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (3014, 'MALET', 'bruno.malet@mines-douai.fr', 'Bruno', 0, 0, '', '', '', 0, 'Département Sciences', 'agent', '', 0, ''),
  (3015, 'LOUIS', 'ghislain.louis@mines-douai.fr', 'Ghislain', 0, 0, '', '', '', 0, 'Département Génie Ci', 'agent', '', 0, ''),
  (3016, 'HERBIN', 'benoit.herbin@mines-douai.fr', 'Benoît', 0, 0, '', '', '', 0, 'Département Sciences', 'agent', '', 0, ''),
  (3017, 'DEPELCHIN', 'laurence.depelchin@mines-douai', 'Laurence', 0, 0, '', '', '', 0, 'Département Sciences', 'agent', '', 0, ''),
  (3018, 'FRONVAL', 'isabelle.fronval@mines-douai.f', 'Isabelle', 0, 0, '', '', '', 0, 'Département Sciences', 'agent', '', 0, ''),
  (3019, 'CRUNAIRE', 'sabine.crunaire@mines-douai.fr', 'Sabine', 0, 0, '', '', '', 0, 'Département Sciences', 'agent', '', 0, ''),
  (3045, 'FAHAM', 'safae.faham@minesdedouai.fr', 'Safae', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3113, 'FANTINO', 'bastien.fantino@minesdedouai.f', 'Bastien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3174, 'EL BOUKILI', 'zineb.el.boukili@minesdedouai.', 'Zineb', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3190, 'THERY', 'jean-gabriel.thery@minesdedoua', 'Jean-Gabriel', 0, 0, '', '', '', 0, '', 'etudiant', '', 2017, 'FI'),
  (3218, 'HOSSIE', 'miguel.hossie@minesdedouai.fr', 'Miguel', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3228, 'THIERION', 'antoine.thierion@minesdedouai.', 'Antoine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2017, 'FI'),
  (3234, 'DUROUCHOUX', 'timothee.durouchoux@minesdedou', 'Timothee', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3261, 'DE LESTANG DE RINGÈRE', 'louis-jean.de.lestang@minesded', 'Louis-Jean', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3275, 'GUARINO', 'elio.guarino@minesdedouai.fr', 'Elio', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3348, 'POULAIN', 'thibaut.poulain@minesdedouai.f', 'Thibaut', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3350, 'DE ZELICOURT', 'jean.de.zelicourt@mines-douai.', 'Jean', 0, 0, '', '', '', 0, 'DIR - Direction Géné', 'agent', '', 0, ''),
  (3519, 'FP stages', 'martine.senechal@mines-douai.f', 'MS', 0, 0, '', '', '', 0, 'DEF - SFTLV Formatio', 'agent', '', 0, ''),
  (3526, 'REDOR', 'julie.redor@mines-douai.fr', 'Julie', 0, 0, '', '', '', 0, 'DRIPA - Direction de', 'agent', '', 0, ''),
  (3532, 'LEFEBVRE', 'eloise.lefebvre@mines-douai.fr', 'Eloïse', 0, 0, '', '', '', 0, 'DRI - Direction de l', 'agent', '', 0, ''),
  (3535, 'LOZENGUEZ', 'guillaume.lozenguez@mines-doua', 'Guillaume', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (3678, 'CARPENTIER-LOSTEC', 'marie.carpentier@mines-douai.f', 'Marie', 0, 0, '', '', '', 0, 'DIRCOM - Direction d', 'agent', '', 0, ''),
  (3693, 'LAGARDERE', 'mylene.lagardere@mines-douai.f', 'Mylène', 0, 0, '', '', '', 0, 'Département Technolo', 'agent', '', 0, ''),
  (3706, 'GUILLOTEAU', 'alexis.guilloteau@mines-douai.', 'Alexis', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (3718, 'DEWALLY', '', 'Betty', 0, 0, '', '', '', 0, '', 'agent', '', 0, ''),
  (3780, 'BOUVE', 'thais.bouve@mines-douai.fr', 'Thaïs', 0, 0, '', '', '', 0, 'SG - Secrétariat Gén', 'agent', '', 0, ''),
  (3789, 'JOLY', 'mathieu.joly@minesdedouai.fr', 'Mathieu', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3811, 'PIERRE', 'lucas.pierre@minesdedouai.fr', 'Lucas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3821, 'FILARETO', 'anthony.filareto@minesdedouai.', 'Anthony', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'AMENA'),
  (3828, 'LAINE', 'matthew.laine@minesdedouai.fr', 'Matthew', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3830, 'OLLIVIER', 'lucas.ollivier@minesdedouai.fr', 'Lucas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3852, 'DUFIS', 'leane.dufis@minesdedouai.fr', 'Léane', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3864, 'BIHANE', 'yamina.bihane@minesdedouai.fr', 'Yamina', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3873, 'FEUDJEU NTSOH', 'alex-rodrigue.feudjeu.ntsoh@mi', 'Alex Rodrigue', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3894, 'BOUTTEVILLE', 'pierre.boutteville@minesdedoua', 'Pierre', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3895, 'LEGEARD', 'kevin.legeard@minesdedouai.fr', 'Kevin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3896, 'ASCOUËT', 'pauline.ascouet@minesdedouai.f', 'Pauline', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3897, 'RIVIERRE', 'thibault.rivierre@minesdedouai', 'Thibault', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3922, 'QIAN', 'qian.kai@minesdedouai.fr', 'Kai', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (3942, 'BEN DAAMER', 'dalal.ben.daamer@minesdedouai.', 'Dalal', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3943, 'JBARA', 'zakaria.jbara@minesdedouai.fr', 'Zakaria', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3944, 'JÉGOUX', 'lucien.jegoux@minesdedouai.fr', 'Lucien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3945, 'VENINI', 'clement.venini@minesdedouai.fr', 'Clément', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3946, 'FOURNET', 'eliot.fournet@minesdedouai.fr', 'Eliot', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3948, 'CHAPRON', 'tanguy.chapron@minesdedouai.fr', 'Tanguy', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3952, 'CODACCIONI', 'alexandre.codaccioni@minesdedo', 'Alexandre', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3953, 'BONJOUR', 'mael.bonjour@minesdedouai.fr', 'Maël', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3954, 'HAGÈGE', 'laura.hagege@minesdedouai.fr', 'Laura', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3955, 'VAUBOURG', 'ines.vaubourg@minesdedouai.fr', 'Inès', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3956, 'VANNIER BROCHEN', 'martin.vannier-brochen@minesde', 'Martin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3957, 'DAVID', 'clement.david@minesdedouai.fr', 'Clément', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3958, 'PAWLAK', 'richard.pawlak@minesdedouai.fr', 'Richard', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3960, 'HANOUNE', 'yassir.hanoune@minesdedouai.fr', 'Yassir', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3961, 'DELORY', 'valentine.delory@minesdedouai.', 'Valentine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3962, 'CANTALUPPI', 'thibaut.cantaluppi@minesdedoua', 'Thibaut', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3963, 'JOLY', 'benoit.joly@minesdedouai.fr', 'Benoit', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3964, 'BOULANGÉE', 'julie.boulangee@minesdedouai.f', 'Julie', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3965, 'NIMESKERN', 'sebastien.nimeskern@minesdedou', 'Sébastien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3966, 'SORON', 'geoffrey.soron@minesdedouai.fr', 'Geoffrey', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3967, 'BROVELLI', 'marjorie.brovelli@minesdedouai', 'Marjorie', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3968, 'BOUTHILLON', 'eve.bouthillon@minesdedouai.fr', 'Eve', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3969, 'TEYSSENDIER DE LA SERVE', 'mathilde.teyssendier@minesdedo', 'Mathilde', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3970, 'MUGNIER', 'theo.mugnier@minesdedouai.fr', 'Théo', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3971, 'LEBRET', 'vincent.lebret@minesdedouai.fr', 'Vincent', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3972, 'RABETOKOTANY', 'andoniaina.rabetokotany@minesd', 'Andoniaina', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3973, 'MAJKA', 'magali.majka@minesdedouai.fr', 'Magali', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3974, 'CHEVASSU', 'zoe.chevassu@minesdedouai.fr', 'Zoé', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3975, 'PELLET-SCHIFFRINE', 'paul.pellet-schiffrine@minesde', 'Paul', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3976, 'BAUMANN', 'vincent.baumann@minesdedouai.f', 'Vincent', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3978, 'VAILLANT', 'victor.vaillant@minesdedouai.f', 'Victor', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3979, 'RAVIER', 'amelie.ravier@minesdedouai.fr', 'Amélie', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3980, 'PAVAILLER', 'sarah.pavailler@minesdedouai.f', 'Sarah', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3981, 'MARMORET', 'axel.marmoret@minesdedouai.fr', 'Axel', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3984, 'PRUVOST', 'adrien.pruvost@minesdedouai.fr', 'Adrien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3987, 'BURES', 'mael.bures@minesdedouai.fr', 'Maël', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3988, 'GILBERT', 'anne-lise.gilbert@minesdedouai', 'Anne-lise', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3990, 'GRULET', 'jordan.grulet@minesdedouai.fr', 'Jordan', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3991, 'LEVEAU', 'maxime.leveau@minesdedouai.fr', 'Maxime', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3992, 'ABOUJAAFAR', 'ayoub.aboujaafar@minesdedouai.', 'Ayoub', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3993, 'ZOUAR', 'yassine.zouar@minesdedouai.fr', 'Yassine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3997, 'ALLIX', 'barthelemy.allix@minesdedouai.', 'Barthélemy', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3998, 'GARCIA', 'marie.garcia@minesdedouai.fr', 'Marie', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (3999, 'DE COSTER', 'yann.de.coster@minesdedouai.fr', 'Yann', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4001, 'DESAGE', 'etienne.desage@minesdedouai.fr', 'Etienne', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4002, 'SOAVE', 'clement.soave@minesdedouai.fr', 'Clément', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4004, 'FAUGIER', 'loreline.faugier@minesdedouai.', 'Loreline', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4005, 'LANNÉHOA', 'guilhem.lannehoa@minesdedouai.', 'Guilhem', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4006, 'JOUS', 'helene.jous@minesdedouai.fr', 'Hélène', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4007, 'MONIN', 'alice.monin@minesdedouai.fr', 'Alice', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4010, 'RAKOTOALIVONY', 'alexandre.rakotoalivony@minesd', 'Alexandre', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4011, 'SCHLACHTER', 'antoine.schlachter@minesdedoua', 'Antoine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4012, 'GAIRE', 'adrien.gaire@minesdedouai.fr', 'Adrien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4013, 'FERAMUS', 'mio.feramus@minesdedouai.fr', 'Mio', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4014, 'MICHEL', 'guillaume.michel@minesdedouai.', 'Guillaume', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4016, 'CHABRIER', 'robin.chabrier@minesdedouai.fr', 'Robin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4018, 'PAPILLON', 'sarah.papillon@minesdedouai.fr', 'Sarah', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4019, 'DU PUY DE GOYNE', 'thibault.du.puy.de.goyne@mines', 'Thibault', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4020, 'BOUGHATTAS', 'maelle.boughattas@minesdedouai', 'Maëlle', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4021, 'FOURNIER', 'oceane.fournier@minesdedouai.f', 'Océane', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4022, 'GEORGES', 'morgan.georges@minesdedouai.fr', 'Morgan', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4023, 'LAILLÉ', 'adrien.laille@minesdedouai.fr', 'Adrien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4025, 'PUCEL - - BASTIÉ', 'simon.pucel-bastie@minesdedoua', 'Simon', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4026, 'VERRÉ', 'ronan.verre@minesdedouai.fr', 'Ronan', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4027, 'KABBADJ', 'ali.kabbadj@minesdedouai.fr', 'Ali', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4028, 'BAYLE', 'paul.bayle@minesdedouai.fr', 'Paul', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4030, 'SIEFER-GAILLARDIN', 'thibaut.siefer-gaillardin@mine', 'Thibaut', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4031, 'BESSON', 'julien.besson@minesdedouai.fr', 'Julien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4032, 'RAMOS', 'jimmy.ramos@minesdedouai.fr', 'Jimmy', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4033, 'FALH-RANSON', 'justine.falh-ranson@minesdedou', 'Justine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4034, 'LE GOFF', 'francois.le.goff@minesdedouai.', 'François', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4036, 'GRANDGEORGE', 'valentin.grandgeorge@minesdedo', 'Valentin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4037, 'VALENTIS', 'marie-anna.valentis@minesdedou', 'Marie-Anna', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4040, 'BAUDET', 'pauline.baudet@minesdedouai.fr', 'Pauline', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4041, 'PILLON', 'cyrielle.pillon@minesdedouai.f', 'Cyrielle', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4042, 'LURAND', 'martin.lurand@minesdedouai.fr', 'Martin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4043, 'LA SALMONIE', 'thomas.la.salmonie@minesdedoua', 'Thomas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4044, 'BROQUET', 'marie.broquet@minesdedouai.fr', 'Marie', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4045, 'CHIROL', 'laurence.chirol@minesdedouai.f', 'Laurence', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4046, 'HUREAU', 'camille.hureau@minesdedouai.fr', 'Camille', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4048, 'COLBUS', 'killian.colbus@minesdedouai.fr', 'Killian', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4050, 'KOENIG', 'lucas.koenig@minesdedouai.fr', 'Lucas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4052, 'DELAHAYE', 'mathias.delahaye@minesdedouai.', 'Mathias', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4053, 'COURIER DE MÉRÉ', 'paul.courier.de.mere@minesdedo', 'Paul', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4054, 'MONFORT', 'laura.monfort@minesdedouai.fr', 'Laura', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4055, 'WU', 'daniel.wu@minesdedouai.fr', 'Daniel', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4056, 'VRINAT', 'maxime.vrinat@minesdedouai.fr', 'Maxime', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4057, 'SALYERES', 'nathan.salyeres@minesdedouai.f', 'Nathan', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4058, 'VUILLARD', 'jules.vuillard@minesdedouai.fr', 'Jules', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4060, 'PERTUET', 'arthur.pertuet@minesdedouai.fr', 'Arthur', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4061, 'OURY', 'thibault.oury@minesdedouai.fr', 'Thibault', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4062, 'BOULMANE', 'yassine.boulmane@minesdedouai.', 'Yassine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4063, 'ENGLISH', 'louise.english@minesdedouai.fr', 'Louise', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4064, 'VAZNY', 'pierre.vazny@minesdedouai.fr', 'Pierre', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4066, 'MORENO', 'thomas.moreno@minesdedouai.fr', 'Thomas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4067, 'JOLY', 'gustave.joly@minesdedouai.fr', 'Gustave', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4068, 'MULLER', 'jean.muller@minesdedouai.fr', 'Jean', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4069, 'GRILLOT', 'clement.grillot@minesdedouai.f', 'Clément', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4070, 'DECROIX', 'baptiste.decroix@minesdedouai.', 'Baptiste', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4071, 'TABOGA', 'vincent.taboga@minesdedouai.fr', 'Vincent', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4072, 'OBRY', 'marie.obry@minesdedouai.fr', 'Marie', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4073, 'DELAUNEY', 'nicolas.delauney@minesdedouai.', 'Nicolas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4074, 'GARCHERY', 'martial.garchery@minesdedouai.', 'Martial', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4075, 'PRIEUR', 'audrey.prieur@minesdedouai.fr', 'Audrey', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4076, 'BELIARD', 'fiona.beliard@minesdedouai.fr', 'Fiona', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4077, 'MADELINE', 'paul.madeline@minesdedouai.fr', 'Paul', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'AMENA'),
  (4080, 'MEBARKI', 'hugo.mebarki@minesdedouai.fr', 'Hugo', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4081, 'AKMANSOY', 'olivier.akmansoy@minesdedouai.', 'Olivier', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4083, 'GAUTIER', 'thomas.gautier@minesdedouai.fr', 'Thomas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4084, 'LACROIX', 'claire.lacroix@minesdedouai.fr', 'Claire', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4085, 'LALLIER', 'yohann.lallier@minesdedouai.fr', 'Yohann', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4086, 'GENDREAU', 'romain.gendreau@minesdedouai.f', 'Romain', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4087, 'SION', 'nolwenn.sion@minesdedouai.fr', 'Nolwenn', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4088, 'COLEY', 'mathieu.coley@minesdedouai.fr', 'Mathieu', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4089, 'HANDJANI', 'adrien.handjani@minesdedouai.f', 'Adrien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4090, 'PHILIPPE', 'amaury.philippe@minesdedouai.f', 'Amaury', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4092, 'WARZÉE', 'remi.warzee@minesdedouai.fr', 'Rémi', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4094, 'BILLARD', 'capucine.billard@minesdedouai.', 'Capucine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4095, 'DELAIGLE', 'pierre-antoine.delaigle@minesd', 'Pierre-Antoine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4096, 'CHALAYER', 'etienne.chalayer@minesdedouai.', 'Etienne', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4097, 'REPTIN', 'michael.reptin@minesdedouai.fr', 'Michaël', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4098, 'VARIN', 'gaetan.varin@minesdedouai.fr', 'Gaétan', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4099, 'PACHECO', 'thibault.pacheco@minesdedouai.', 'Thibault', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4102, 'EBER', 'jacques.eber@minesdedouai.fr', 'Jacques', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4103, 'HAJJAM', 'ismail.hajjam@minesdedouai.fr', 'Ismaïl', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4104, 'GADENNE', 'julien.gadenne@minesdedouai.fr', 'Julien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4105, 'ROPÉRO', 'maximilien.ropero@minesdedouai', 'Maximilien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4106, 'GMATI', 'neila.gmati@minesdedouai.fr', 'Neïla', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4108, 'STUDLER', 'leo.studler@minesdedouai.fr', 'Léo', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4109, 'ROUMIER', 'alexandre.roumier@minesdedouai', 'Alexandre', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4111, 'BARATEAU', 'jules.barateau@minesdedouai.fr', 'Jules', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4115, 'LUZEAUX', 'yvain.luzeaux@minesdedouai.fr', 'Yvain', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4116, 'BOUREL', 'louis.bourel@minesdedouai.fr', 'Louis', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4117, 'JOLY', 'caroline.joly@minesdedouai.fr', 'Caroline', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4118, 'BRIENT', 'maina.brient@minesdedouai.fr', 'Maïna', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4119, 'ROSENTHAL', 'daphne.rosenthal@minesdedouai.', 'Daphné', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4120, 'AÏSSI', 'chakib.aissi@minesdedouai.fr', 'Chakib', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4121, 'BOUAYAD', 'ghizlane.bouayad@minesdedouai.', 'Ghizlane', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4122, 'POPIEUL', 'laura.popieul@minesdedouai.fr', 'Laura', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4123, 'BRÉMAUD', 'maina.bremaud@minesdedouai.fr', 'Maïna', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4124, 'MENY', 'julien.meny@minesdedouai.fr', 'Julien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4125, 'LE POTIER', 'baptiste.le.potier@minesdedoua', 'Baptiste', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4126, 'SABOULARD', 'thomas.saboulard@minesdedouai.', 'Thomas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4128, 'LEKO', 'pierre.leko@minesdedouai.fr', 'Pierre', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'AMENA'),
  (4129, 'PIERRAT', 'guillaume.pierrat@minesdedouai', 'Guillaume', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4130, 'BOUDET', 'julien.boudet@minesdedouai.fr', 'Julien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4131, 'HUOT-MARCHAND', 'celia.huot-marchand@minesdedou', 'Célia', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4132, 'GAUTHIER', 'cyril.gauthier@minesdedouai.fr', 'Cyril', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4133, 'N\'DOYE', 'laetitia.ndoye@minesdedouai.fr', 'Laetitia', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4134, 'DE METS', 'alain.de.mets@mines-douai.fr', 'Alain', 0, 0, '', '', '', 0, 'DRI - Direction de l', 'agent', '', 0, ''),
  (4136, 'LEMELIN', 'emmanuel.lemelin@mines-douai.f', 'Emmanuel', 0, 0, '', '', '', 0, 'DRI - Direction de l', 'agent', '', 0, ''),
  (4137, 'JEANNOTTE', 'arthur.jeannotte@minesdedouai.', 'Arthur', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4166, 'VANGAEVEREN', 'betty.vangaeveren@mines-douai.', 'Betty', 0, 0, '', '', '', 0, 'SG - Secrétariat Gén', 'agent', '', 0, ''),
  (4169, 'GOURAIN', 'louis.gourain@minesdedouai.fr', 'Louis', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4170, 'TCHENG', 'julien.tcheng@minesdedouai.fr', 'Julien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4171, 'CHARRIOU', 'mahe.charriou@minesdedouai.fr', 'Mahé', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4172, 'DUBREUIL', 'gaspard.dubreuil@minesdedouai.', 'Gaspard', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4174, 'VERHAMME', 'julien.verhamme@minesdedouai.f', 'Julien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4175, 'MONEGIER DU SORBIER', 'benoit.monegier.du.sorbier@min', 'Benoît', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4176, 'PRIGENT', 'corentin.prigent@minesdedouai.', 'Corentin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4178, 'MARKOWICZ', 'rebecca.markowicz@minesdedouai', 'Rebecca', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4179, 'COCHERIE', 'jean-eudes.cocherie@minesdedou', 'Jean-Eudes', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4183, 'AUBERT', 'damien.aubert@minesdedouai.fr', 'Damien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4184, 'HAUTECLOQUE-RAYSZ', 'jean-baptiste.hautecloque@mine', 'Jean-Baptiste', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4185, 'DOMAIN', 'alexandre.domain@minesdedouai.', 'Alexandre', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4186, 'EL AHMAR', 'ahlam.el.ahmar@minesdedouai.fr', 'Ahlam', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4217, 'BRUNEAU', 'daphne.bruneau@minesdedouai.fr', 'Daphné', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4368, 'DORDAIN', 'florine.andrzejewski@mines-dou', 'Florine', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (4369, 'DESQUESNES', 'guillaume.desquesnes@mines-dou', 'Guillaume', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (4412, 'GUIGON', 'gaelle.guigon@mines-douai.fr', 'Gaëlle', 0, 0, '', '', '', 0, 'DEF - Pôle Campus Nu', 'agent', '', 0, ''),
  (4457, 'SEGOVIA', 'pablo.segovia@mines-douai.fr', 'Pablo', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (4469, 'DICHTL', 'johann.dichtl@mines-douai.fr', 'Johann', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (4608, 'HUANG', 'ziqi.huang@minesdedouai.fr', 'Ziqi', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4609, 'ZHANG', 'zheyu.zhang@minesdedouai.fr', 'Zheyu', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4610, 'XU', 'wei.xu@minesdedouai.fr', 'Wei', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4611, 'WANG', 'lepeng.wang@minesdedouai.fr', 'Lepeng', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4612, 'PAN', 'yu.pan@minesdedouai.fr', 'Yu', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4613, 'LIN', 'chen.lin@minesdedouai.fr', 'Chen', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4614, 'YIN', 'yifan.yin@minesdedouai.fr', 'Yifan', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4615, 'ZHU', 'tianyi.zhu@minesdedouai.fr', 'Tianyi', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4627, 'FC DRIRE', 'senechal', 'Service', 0, 0, '', '', '', 0, 'DEF - SFTLV Formatio', 'agent', '', 0, ''),
  (4628, 'FP Stages', 'bruno.pagniez@mines-douai.fr;m', 'BP', 0, 0, '', '', '', 0, 'DEF - SFTLV Formatio', 'agent', '', 0, ''),
  (4629, 'FP Stages', 'nadine.halejcio@mines-douai.fr', 'JPH', 0, 0, '', '', '', 0, 'DEF - SFTLV Formatio', 'agent', '', 0, ''),
  (4631, 'DECARNIN', 'adeline.decarnin@mines-douai.f', 'Adeline', 0, 0, '', '', '', 0, 'Agence Comptable', 'agent', '', 0, ''),
  (4652, 'ANDRZEJEWSKI', 'sandra.andrzejewski@mines-doua', 'Sandra', 0, 0, '', '', '', 0, 'SG - Direction des R', 'agent', '', 0, ''),
  (4653, 'AADADOUCH', 'el-mehdi.aadadouch@minesdedoua', 'El Mehdi', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FCD'),
  (4654, 'ALAOUI TAHIRI', 'rachid.alaoui.tahiri@minesdedo', 'Rachid', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FCD'),
  (4655, 'AIT ALI YDIR', 'said.ait.ali.ydir@minesdedouai', 'Saïd', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FCD'),
  (4656, 'AIT EL CADI', 'rachid.ait.el.cadi@minesdedoua', 'Rachid', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FCD'),
  (4657, 'BELKHADRA', 'elhassan.belkhadra@minesdedoua', 'El hassan', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'AMENA'),
  (4658, 'BOUKHLOUF', 'latifa.boukhlouf@minesdedouai.', 'Latifa', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FCD'),
  (4659, 'CHARPENTIER', 'cyril.charpentier@minesdedouai', 'Cyril', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FCD'),
  (4660, 'LAKRITI', 'achraf.lakriti@minesdedouai.fr', 'Achraf', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FCD'),
  (4661, 'MAIROUCHE', 'mustapha.mairouche@minesdedoua', 'Mustapha', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FCD'),
  (4662, 'MIAKAKORILA', 'hermann.miakakorila@minesdedou', 'Hermann Declairc', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FCD'),
  (4663, 'MAHRAZ', 'issmail.mahraz@minesdedouai.fr', 'Issmail', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FCD'),
  (4664, 'MICHEL', 'jean-francois.michel@minesdedo', 'Jean-François', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FCD'),
  (4665, 'MOUBAMOU KEBENO', 'paul.moubamou.kebeno@minesdedo', 'Paul', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FCD'),
  (4666, 'NSIRI', 'nadia.nsiri@minesdedouai.fr', 'Nadia', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FCD'),
  (4667, 'OUHADDOU', 'abdelaziz.ouhaddou@minesdedoua', 'Abdelaziz', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FCD'),
  (4668, 'OUSMANOU', 'laouane.ousmanou@minesdedouai.', 'Laouane', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FCD'),
  (4669, 'RHOUFAR', 'dounia.rhoufar@minesdedouai.fr', 'Dounia', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FCD'),
  (4670, 'YOUSFI', 'dehbani.yousfi@minesdedouai.fr', 'Dehbani', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FCD'),
  (4671, 'BELDJEBEL', 'djafar.beldjebel@etu.imt-lille', 'Djafar', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'MS PPIB'),
  (4684, 'DoeFi', 'etienne.leblanc@mines-douai.fr', 'John', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4691, 'CHEHAB', 'salim.chehab@minesdedouai.fr', 'Salim', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4692, 'KELLY', 'sada-moussa.kelly@minesdedouai', 'Sada Moussa', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4693, 'ID BABOU', 'youssef.id.babou@minesdedouai.', 'Youssef', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4694, 'NIEUWJAER', 'charles.nieuwjaer@minesdedouai', 'Charles', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4695, 'MANTEL', 'robin.mantel@minesdedouai.fr', 'Robin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4696, 'LECLERCQ', 'hugo.leclercq@minesdedouai.fr', 'Hugo', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4702, 'KERMORGANT', 'simon.kermorgant@minesdedouai.', 'Simon', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4703, 'MARIEN', 'robin.marien@minesdedouai.fr', 'Robin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4704, 'POYUZAN', 'jeremie.poyuzan@minesdedouai.f', 'Jérémie', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4705, 'OUINE', 'etienne.ouine@minesdedouai.fr', 'Etienne', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4706, 'MENARD', 'guillaume.menard@minesdedouai.', 'Guillaume', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4707, 'TCHASSEM NOUKIMI', 'elysee.tchassem.noukimi@minesd', 'Elysée', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FCD'),
  (4708, 'DAHMANI', 'elyes.dahmani@minesdedouai.fr', 'Elyes', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (4709, 'CHBAB', 'ismail.chbab@minesdedouai.fr', 'Ismail', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4710, 'EL JAOUHARI', 'achraf.el.jaouhari@minesdedoua', 'Achraf', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4712, 'BOUASSA', 'abdeladime.bouassa@minesdedoua', 'Abdeladime', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4720, 'ARAUJO TOLEDO', 'natalia.araujo.toledo@minesded', 'Natalia', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4722, 'MORAES', 'ana-isabel.moraes@minesdedouai', 'Ana Isabel', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4728, 'ARANTES', 'nickolas.arantes@minesdedouai.', 'Nickolas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4729, 'NGUYEN', 'ngoc-hung-viet.nguyen@minesded', 'Ngoc Hung Viet', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4730, 'DINH', 'the-anh.dinh@minesdedouai.fr', 'The Anh', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI');
  INSERT INTO `USER` (`IDUSER`, `NOM`, `EMAIL`, `PRENOM`, `TEL`, `NOMBRETRAJETREALISES`, `AVATAR`, `PSEUDO`, `INFORMATION`, `ISADMIN`, `UNITE`, `FONCTION`, `SITE`, `PROMOTION`, `TYPEPROMOTION`) VALUES
  (4732, 'DANG', 'dinh-kien.dang@minesdedouai.fr', 'Dinh Kien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4733, 'TO', 'viet-thiem.to@minesdedouai.fr', 'Viet Thiem', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4734, 'HENRY', 'jeffrey.henry@minesdedouai.fr', 'Jeffrey', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4735, 'COLBÈRE', 'patricia.colbere@minesdedouai.', 'Patricia', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4736, 'DEVIGNE', 'thibaut.devigne@minesdedouai.f', 'Thibaut', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4737, 'MARRIS-BINET', 'alexia.marris-binet@minesdedou', 'Alexia', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4738, 'AGRAPART', 'antoine.agrapart@minesdedouai.', 'Antoine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4739, 'MAREC', 'christian.marec@minesdedouai.f', 'Christian', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4740, 'GOLARD', 'louise.golard@minesdedouai.fr', 'Louise', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4741, 'AMICEL', 'emmanuel.amicel@minesdedouai.f', 'Emmanuel', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4742, 'BOSCH', 'elina.bosch@minesdedouai.fr', 'Elina', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4743, 'SCHMITT', 'aurelien.schmitt@minesdedouai.', 'Aurélien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4744, 'CANCADE', 'christian.cancade@minesdedouai', 'Christian', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4745, 'FREAU', 'william.freau@minesdedouai.fr', 'William', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4746, 'VALTENAIRE RUBIN', 'jimmy.valtenaire.rubin@minesde', 'Jimmy', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4747, 'FOROT', 'charles.forot@minesdedouai.fr', 'Charles', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4748, 'DORARD', 'nathalie.dorard@minesdedouai.f', 'Nathalie', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4749, 'VIANDIER', 'vincent.viandier@minesdedouai.', 'Vincent', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4751, 'POUENY NGONGANG', 'yann-borel.poueny.ngongang@min', 'Yann Borel', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4752, 'DE CANSON', 'thibault.de.canson@minesdedoua', 'Thibault', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4753, 'HAMOUCHI', 'yacine.hamouchi@minesdedouai.f', 'Yacine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4754, 'DURAND--FLON', 'melissa.durand-flon@minesdedou', 'Mélissa', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4756, 'VARLET', 'augustine.varlet@minesdedouai.', 'Augustine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4758, 'DAOUD', 'faiz.daoud@minesdedouai.fr', 'Faïz', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4759, 'PERRETTE', 'cecile.perrette@minesdedouai.f', 'Cécile', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4760, 'LAMMENS', 'heloise.lammens@minesdedouai.f', 'Héloïse', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4761, 'BIGOT', 'paul-antoine.bigot@minesdedoua', 'Paul-Antoine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4762, 'YANG', 'cecile.yang@minesdedouai.fr', 'Cécile', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4765, 'BAZE', 'eden.baze@minesdedouai.fr', 'Eden', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4766, 'LE MENTEC', 'solene.le.mentec@minesdedouai.', 'Solène', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4767, 'BOULY', 'charlie.bouly@minesdedouai.fr', 'Charlie', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4768, 'EID', 'jean-raphael.eid@minesdedouai.', 'Jean-Raphaël', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4769, 'SIMONNET', 'tibere.simonnet@minesdedouai.f', 'Tibère', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4770, 'DUROT', 'amandine.durot@minesdedouai.fr', 'Amandine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4771, 'COUDÉ', 'pierre-charles.coude@minesdedo', 'Pierre-Charles', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4774, 'PARIS', 'donatienne.paris@minesdedouai.', 'Donatienne', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4775, 'BEL', 'hadrien.bel@minesdedouai.fr', 'Hadrien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4776, 'KERFANT', 'faustine.kerfant@minesdedouai.', 'Faustine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4777, 'BECHARA', 'gilles.bechara@minesdedouai.fr', 'Gilles', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4778, 'CAMARD', 'paul.camard@minesdedouai.fr', 'Paul', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4779, 'VÉRON', 'matthieu.veron@minesdedouai.fr', 'Matthieu', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4780, 'SAINT-LEGER', 'vincent.saint-leger@minesdedou', 'Vincent', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4782, 'PINTO', 'agathe.pinto@minesdedouai.fr', 'Agathe', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4785, 'BARAU', 'myriam.barau@minesdedouai.fr', 'Myriam', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4786, 'MATRY', 'nathan.matry@minesdedouai.fr', 'Nathan', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4787, 'MOUNHI', 'khaoula.mounhi@minesdedouai.fr', 'Khaoula', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4789, 'GAUTIER', 'gaelle.gautier@minesdedouai.fr', 'Gaëlle', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4790, 'KRONBY', 'guillaume.kronby@minesdedouai.', 'Guillaume', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4791, 'EWALD', 'solenn.ewald@minesdedouai.fr', 'Solenn', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4792, 'RICART', 'guillaume.ricart@minesdedouai.', 'Guillaume', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4793, 'CHRÉTIEN', 'mathieu.chretien@minesdedouai.', 'Mathieu', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4794, 'BAALAOUI', 'louay.baalaoui@minesdedouai.fr', 'Louay', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4795, 'MONACHON', 'raphael.monachon@minesdedouai.', 'Raphael', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4796, 'DE MICELI', 'jean-yves.de.miceli@minesdedou', 'Jean-Yves', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4797, 'LESCOUBLET', 'theo.lescoublet@minesdedouai.f', 'Théo', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4798, 'QUENTEL', 'elwin.quentel@minesdedouai.fr', 'Elwin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4799, 'AVELINE', 'gaston.aveline@minesdedouai.fr', 'Gaston', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4801, 'FAHLI', 'mehdi.fahli@minesdedouai.fr', 'Mehdi', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4802, 'SERGENT', 'laurie.sergent@minesdedouai.fr', 'Laurie', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4803, 'BERNARD', 'baptiste.bernard@minesdedouai.', 'Baptiste', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4804, 'SHAO', 'qiaosheng.shao@minesdedouai.fr', 'Qiaosheng', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4806, 'GAWISH', 'sarah.gawish@minesdedouai.fr', 'Sarah', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4807, 'MARTIN', 'simon.martin@minesdedouai.fr', 'Simon', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4808, 'COTARD', 'theo.cotard@minesdedouai.fr', 'Théo', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4809, 'LEYBROS', 'clement.leybros@minesdedouai.f', 'Clément', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4810, 'MAGNIER', 'lucas.magnier@minesdedouai.fr', 'Lucas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4811, 'COSTA DE BEAUREGARD', 'leon.costa.de.beauregard@mines', 'Léon', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4812, 'SCHEIDER', 'clement.scheider@minesdedouai.', 'Clément', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4813, 'DESCAMPEAUX', 'fabien.descampeaux@minesdedoua', 'Fabien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4814, 'DELOIGNE', 'nicolas.deloigne@minesdedouai.', 'Nicolas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4815, 'REDOUTÉ', 'agathe.redoute@minesdedouai.fr', 'Agathe', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4816, 'CHAPALAIN', 'victor.chapalain@minesdedouai.', 'Victor', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4818, 'CLAUSSEN', 'jules.claussen@minesdedouai.fr', 'Jules', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4820, 'MINAULT', 'marie.minault@minesdedouai.fr', 'Marie', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4821, 'BAYACK', 'alexis.bayack@minesdedouai.fr', 'Alexis', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4822, 'JURADO HINCAPIE', 'enrique.jurado.hincapie@minesd', 'Enrique', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4823, 'CUCHET', 'alexis.cuchet@minesdedouai.fr', 'Alexis', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4825, 'DEUBEL', 'felicie.deubel@minesdedouai.fr', 'Félicie', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4827, 'KIZOU', 'anas.kizou@minesdedouai.fr', 'Anas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4829, 'MÉNARD', 'justine.menard@minesdedouai.fr', 'Justine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4830, 'DOYÈRE', 'quentin.doyere@minesdedouai.fr', 'Quentin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4831, 'VO', 'alida.vo@minesdedouai.fr', 'Alida', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4833, 'HABETS', 'damien.habets@minesdedouai.fr', 'Damien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4836, 'WERKEYN', 'mathieu.werkeyn@minesdedouai.f', 'Mathieu', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4837, 'LE RUZ', 'gael.le.ruz@minesdedouai.fr', 'Gaël', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4838, 'SUN', 'lucie.sun@minesdedouai.fr', 'Lucie', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4839, 'CAMMINADA', 'mathieu.camminada@minesdedouai', 'Mathieu', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4840, 'LACOUR', 'quentin.lacour@minesdedouai.fr', 'Quentin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4841, 'CEPPETELLI', 'pierre-marie.ceppetelli@minesd', 'Pierre-Marie', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4843, 'EL FASSI', 'rania.el.fassi@minesdedouai.fr', 'Rania', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4844, 'GLET--LABEYRIE', 'joffrey.glet--labeyrie@minesde', 'Joffrey', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4845, 'BODENÈS', 'antoine.bodenes@minesdedouai.f', 'Antoine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4846, 'CAMUS', 'alexia.camus@minesdedouai.fr', 'Alexia', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4847, 'LE GUÉVEL', 'brieuc.le.guevel@minesdedouai.', 'Brieuc', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4849, 'LE FRANCOIS', 'ivann.le.francois@minesdedouai', 'Ivann', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4850, 'GUILLOTTE', 'martin.guillotte@minesdedouai.', 'Martin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4851, 'DARRÉ', 'louis.darre@minesdedouai.fr', 'Louis', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4855, 'MERAT', 'guilhem.merat@minesdedouai.fr', 'Guilhem', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4856, 'DELHOUME', 'theo.delhoume@minesdedouai.fr', 'Théo', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4857, 'OUSACI', 'nell.ousaci@minesdedouai.fr', 'Nell', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4858, 'COIGNET', 'anthony.coignet@minesdedouai.f', 'Anthony', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4859, 'SAMSON', 'adele.samson@minesdedouai.fr', 'Adèle', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4860, 'FANGEAUX', 'anna.fangeaux@minesdedouai.fr', 'Anna', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4863, 'LAVOYE', 'antony.lavoye@minesdedouai.fr', 'Antony', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4864, 'HADJA NADJIMOUDINE', 'fahzil.hadja.nadjimoudine@mine', 'Fahzil', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4867, 'FLEURANCE', 'remi.fleurance@minesdedouai.fr', 'Rémi', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4868, 'MAYEUR', 'crystal.mayeur@minesdedouai.fr', 'Crystal', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4869, 'LE MOUELLIC', 'pierre.le.mouellic@minesdedoua', 'Pierre', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4870, 'SAO', 'zacharia.sao@minesdedouai.fr', 'Zacharia', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4872, 'BENQUET', 'pierre.benquet@minesdedouai.fr', 'Pierre', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4873, 'KERCKHOVE', 'alice.kerckhove@minesdedouai.f', 'Alice', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4874, 'ADJELE', 'esther-toluwa.adjele@minesdedo', 'Esther T\'Oluwa', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4875, 'MONNIER', 'bastien.monnier@minesdedouai.f', 'Bastien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4876, 'DAUBREGE', 'mathieu.daubrege@minesdedouai.', 'Mathieu', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4877, 'BEHAGUE', 'florian.behague@minesdedouai.f', 'Florian', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4878, 'LUU', 'my-kim.luu@minesdedouai.fr', 'My Kim', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4879, 'LELEU', 'gabriel.leleu@minesdedouai.fr', 'Gabriel', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4880, 'BERTHELOT', 'timote.berthelot@minesdedouai.', 'Timoté', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4881, 'GOURRIN', 'vianney.gourrin@minesdedouai.f', 'Vianney', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4882, 'LARABI', 'yanisse.larabi@minesdedouai.fr', 'Yanisse', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4883, 'DRU', 'guillaume.dru@minesdedouai.fr', 'Guillaume', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4884, 'GALUS', 'pierre.galus@minesdedouai.fr', 'Pierre', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4885, 'CAILLIEZ', 'leo.cailliez@minesdedouai.fr', 'Léo', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4886, 'DUVERGER', 'nicolas.duverger@minesdedouai.', 'Nicolas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4887, 'GALOPIN', 'louise.galopin@minesdedouai.fr', 'Louise', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4888, 'TAKOUGANG', 'kelian.takougang@minesdedouai.', 'Kélian', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4889, 'ALABRE', 'guillaume.alabre@minesdedouai.', 'Guillaume', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4890, 'TAÏEB', 'thibaud.taieb@minesdedouai.fr', 'Thibaud', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4891, 'CLAIRAY', 'loic.clairay@minesdedouai.fr', 'Loïc', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4892, 'LEVERRIER', 'clemence.leverrier@minesdedoua', 'Clémence', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4893, 'LASSAUZET', 'pierre.lassauzet@minesdedouai.', 'Pierre', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4894, 'KACIMI', 'asmaa.kacimi@minesdedouai.fr', 'Asmaa', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4895, 'CAPY', 'julien.capy@minesdedouai.fr', 'Julien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4897, 'WAHHAM', 'samy.wahham@minesdedouai.fr', 'Samy', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4898, 'DU GARREAU', 'yrieix.du.garreau@minesdedouai', 'Yrieix', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4899, 'KEITA', 'cherifatou.keita@minesdedouai.', 'Cherifatou', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4900, 'JOSEPH', 'frederic.joseph@minesdedouai.f', 'Frédéric', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4901, 'PILIOUA', 'yonic.pilioua@minesdedouai.fr', 'Yonic', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4902, 'COMBAZ-DEVILLE', 'jade.combaz-deville@minesdedou', 'Jade', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4903, 'GIONO', 'antoine.giono@minesdedouai.fr', 'Antoine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4904, 'BAENA', 'paul.baena@minesdedouai.fr', 'Paul', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4905, 'GILLES', 'hugo.gilles@minesdedouai.fr', 'Hugo', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4906, 'GOURNAY', 'beatrice.gournay@minesdedouai.', 'Béatrice', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4907, 'PIGEON', 'elisa.pigeon@minesdedouai.fr', 'Elisa', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4909, 'BAINÉE', 'theo.bainee@minesdedouai.fr', 'Théo', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4910, 'JOLLY', 'hugo.jolly@minesdedouai.fr', 'Hugo', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4911, 'SERVILLAT', 'maxime.servillat@minesdedouai.', 'Maxime', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4912, 'HAUDIQUER', 'clement.haudiquer@minesdedouai', 'Clément', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4913, 'CHAN-SECK-MINE', 'laurent.chan-seck-mine@minesde', 'Laurent', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4914, 'SCHNEIDER', 'quentin.schneider@minesdedouai', 'Quentin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4915, 'SALVAGGIO', 'pierre.salvaggio@minesdedouai.', 'Pierre', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4916, 'VASYLENKO', 'mariya.vasylenko@minesdedouai.', 'Mariya', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4918, 'NEU', 'marie.neu@minesdedouai.fr', 'Marie', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4920, 'KUHN', 'edouard.kuhn@minesdedouai.fr', 'Edouard', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4921, 'LOURENÇO', 'kevin.lourenco@minesdedouai.fr', 'Kévin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4922, 'BRODIN', 'aurore.brodin@minesdedouai.fr', 'Aurore', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4923, 'GRANDJOUAN', 'baptiste.grandjouan@minesdedou', 'Baptiste', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4925, 'BEERNAERT', 'quentin.beernaert@minesdedouai', 'Quentin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4926, 'LEHMANN', 'maxime.lehmann@minesdedouai.fr', 'Maxime', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4927, 'LE BRAS', 'cedric.le.bras@minesdedouai.fr', 'Cédric', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4930, 'MARIE', 'adrien.marie@minesdedouai.fr', 'Adrien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4931, 'ROSAIN-GUEU', 'simon.rosain-gueu@minesdedouai', 'Simon', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4932, 'LE GALL', 'amaury.le.gall@minesdedouai.fr', 'Amaury', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4933, 'LEMONNIER', 'carole.lemonnier@minesdedouai.', 'Carole', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4934, 'ROUX', 'sebastien.roux@minesdedouai.fr', 'Sébastien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4935, 'SALHI', 'myriam.salhi@minesdedouai.fr', 'Myriam', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4936, 'PACQUETEAU', 'sebastien.pacqueteau@minesdedo', 'Sébastien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4937, 'ABDELHAFIZ', 'sam.abdelhafiz@minesdedouai.fr', 'Sam', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4938, 'BRAS', 'clemence.bras@minesdedouai.fr', 'Clémence', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4939, 'PILARD', 'robin.pilard@minesdedouai.fr', 'Robin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4940, 'EL HAMDANI', 'ilyess.el.hamdani@minesdedouai', 'Ilyess', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4941, 'DEFRANCE', 'sylvette.defrance@minesdedouai', 'Sylvette', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4942, 'OLIVIER', 'charles.olivier@minesdedouai.f', 'Charles', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4943, 'DEVAUX', 'judith.devaux@minesdedouai.fr', 'Judith', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4944, 'HAVET', 'simon.havet@minesdedouai.fr', 'Simon', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4945, 'PENET', 'francois.penet@minesdedouai.fr', 'François', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4946, 'SIMON', 'oscar.simon@minesdedouai.fr', 'Oscar', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4947, 'TROTIN', 'alicia.trotin@minesdedouai.fr', 'Alicia', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4951, 'PIETRZYK', 'bruno.pietrzyk@mines-douai.fr', 'Bruno', 0, 0, '', '', '', 0, 'DISI - Direction de ', 'agent', '', 0, ''),
  (4956, 'NDIGUIMBAYE', 'henri.ndiguimbaye@minesdedouai', 'Henri', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (4962, 'CHEN', 'yiwen.chen@minesdedouai.fr', 'Yiwen', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4963, 'GUO', 'jin.guo@minesdedouai.fr', 'Jin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4964, 'HUANG', 'jingguo.huang@minesdedouai.fr', 'Jingguo', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4965, 'RODRIGUEZ PANTOJA', 'bryan.rodriguez@minesdedouai.f', 'Bryan David', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4966, 'YE', 'feng.ye@minesdedouai.fr', 'Feng', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'FI'),
  (4967, 'MOBTIL', 'mohammed.mobtil@mines-douai.fr', 'Mohammed', 0, 0, '', '', '', 0, 'Département Energéti', 'agent', '', 0, ''),
  (4968, 'MOTCHON', 'djidula.motchon@mines-douai.fr', 'Koffi Mawusse Djidula', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (4969, 'GHORRA', 'antoine.ghorra@mines-douai.fr', 'Antoine', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (4988, 'AGUILLON', 'anthony.aguillon@mines-douai.f', 'Anthony', 0, 0, '', '', '', 0, 'DIRCOM - Direction d', 'agent', '', 0, ''),
  (5043, 'RAGOT', 'jennifer.ragot@mines-douai.fr', 'Jennifer', 0, 0, '', '', '', 0, 'DEF - Direction', 'agent', '', 0, ''),
  (5271, 'MACQUET', 'christelle.macquet@mines-douai', 'Christelle', 0, 0, '', '', '', 0, 'Agence Comptable', 'agent', '', 0, ''),
  (5304, 'LI', 'zhuo.li@minesdedouai.fr', 'Zhuo', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (5305, 'ZHANG', 'wenyu.zhang@minesdedouai.fr', 'Wenyu', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (5306, 'SUN', 'siming.sun@minesdedouai.fr', 'Siming', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (5307, 'HUANG', 'xueying.huang@minesdedouai.fr', 'Xueying', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (5308, 'QI', 'peng.qi@minesdedouai.fr', 'Peng', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (5309, 'ZHANG', 'fan.zhang@minesdedouai.fr', 'Fan', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (5310, 'SHAN', 'xiaorong.shan@minesdedouai.fr', 'Xiaorong', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (5311, 'ZHAO', 'chu.zhao@minesdedouai.fr', 'Chu', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (5312, 'TU', 'hailang.tu@minesdedouai.fr', 'Hailang', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (5313, 'HUANG', 'zhilin.huang@minesdedouai.fr', 'Zhilin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (5984, 'SAPIN', 'veronique.sapin@telecom-lille.', 'Véronique', 0, 0, '', '', '', 0, 'Agence Comptable', 'agent', '', 0, ''),
  (6021, 'LEROY', 'sabine.leroy@telecom-lille.fr', 'Sabine', 0, 0, '', '', '', 0, 'Département Informat', 'agent', '', 0, ''),
  (6049, 'BETRY', 'luc.betry@telecom-lille.fr', 'Luc', 0, 0, '', '', '', 0, 'DISI - Direction de ', 'agent', '', 0, ''),
  (6054, 'VRIELYNCK', 'donatien.vrielynck@telecom-lil', 'Donatien', 0, 0, '', '', '', 0, 'DISI - Direction de ', 'agent', '', 0, ''),
  (6061, 'DELATTRE', 'valerie.delattre@telecom-lille', 'Valérie', 0, 0, '', '', '', 0, 'DEF - Pôle Formation', 'agent', '', 0, ''),
  (6068, 'MISERY', 'veronique.misery@telecom-lille', 'Véronique', 0, 0, '', '', '', 0, 'DEF - Direction', 'agent', '', 0, ''),
  (6070, 'OOGHE', 'virginie.ooghe@telecom-lille.f', 'Virginie', 0, 0, '', '', '', 0, 'DEF - Pôle Professio', 'agent', '', 0, ''),
  (6071, 'RONDEAU', 'caroline.rondeau@telecom-lille', 'Caroline', 0, 0, '', '', '', 0, 'DEF - Pôle Professio', 'agent', '', 0, ''),
  (6072, 'SAUNIER BASTIEN', 'virginie.bastien@telecom-lille', 'Virginie', 0, 0, '', '', '', 0, 'DEF - Pôle Formation', 'agent', '', 0, ''),
  (6073, 'SENECHAL', 'marielle.senechal@telecom-lill', 'Marielle', 0, 0, '', '', '', 0, 'DEF - Pôle Formation', 'agent', '', 0, ''),
  (6087, 'BOURGOT', 'justine.bourgot@telecom-lille.', 'Justine', 0, 0, '', '', '', 0, 'DEF - Direction', 'agent', '', 0, ''),
  (6093, 'DELEBASSEE', 'celine.delebassee@telecom-lill', 'Céline', 0, 0, '', '', '', 0, 'SG - Secrétariat Gén', 'agent', '', 0, ''),
  (6094, 'FIORE', 'sabine.fiore@telecom-lille.fr', 'Sabine', 0, 0, '', '', '', 0, 'SG - Secrétariat Gén', 'agent', '', 0, ''),
  (6250, 'GHARBI', 'elyes.gharbi@etu.imt-lille-dou', 'Elyes', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'MS PPIB'),
  (6252, 'EL BERCHOUI', 'hamza.el.berchoui@etu.imt-lill', 'Hamza', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'MS PPIB'),
  (6253, 'FATREZ', 'catherine.fatrez@imt-lille-dou', 'Catherine', 0, 0, '', '', '', 0, 'DEF - Pôle Formation', 'agent', '', 0, ''),
  (6255, 'LENTON', 'wendy.lenton@etu.imt-lille-dou', 'Wendy', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'SA'),
  (6256, 'BEN EL MESSADI', 'roua.ben.el.messadi@etu.imt-li', 'Roua', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'SA'),
  (6257, 'BEN REJEB', 'safa.ben.rejeb@etu.imt-lille-d', 'Safa', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'SA'),
  (6258, 'BEN AICHA', 'sarah.ben.aicha@etu.imt-lille-', 'Sarah', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'SA'),
  (6259, 'NEJI', 'wael.neji@etu.imt-lille-douai.', 'Wael', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'SA'),
  (6260, 'BEN AOUN', 'yassine.ben.aoun@etu.imt-lille', 'Yassine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'SA'),
  (6261, 'RHOUMA', 'rabii.rhouma@etu.imt-lille-dou', 'Rabii', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'SA'),
  (6262, 'AGARWAL', 'ayush.agarwal@etu.imt-lille-do', 'Ayush', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'SA'),
  (6263, 'JAIN', 'jain.sakshi@etu.imt-lille-doua', 'Sakshi', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'SA'),
  (6264, 'KHAN', 'mohammad-ali.khan@etu.imt-lill', 'Mohammad Ali', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'SA'),
  (6265, 'GUPTA', 'gupta.urvashi@etu.imt-lille-do', 'Urvashi', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'SA'),
  (6266, 'GUPTA', 'gupta.ashray@etu.imt-lille-dou', 'Ashray', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'SA'),
  (6267, 'MORENO', 'mariana.moreno@etu.imt-lille-d', 'Mariana', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'SA'),
  (6268, 'ABOUTAIB', 'omar.aboutaib@etu.imt-lille-do', 'Omar', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'SA'),
  (6269, 'XU', 'jin.xu@etu.imt-lille-douai.fr', 'Jin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (6270, 'XIE', 'wangda.xie@etu.imt-lille-douai', 'Wangda', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (6273, 'PHAM', 'dinh-lam-anh.pham@etu.imt-lill', 'Dinh Lam Anh', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (6274, 'VU', 'anh-tuan.vu@etu.imt-lille-doua', 'Anh Tuan', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (6275, 'TRAN', 'duc-hung.tran@etu.imt-lille-do', 'Duc Hung', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (6276, 'SANCHEZ', 'oriana.sanchez@etu.imt-lille-d', 'Oriana', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (6277, 'CORTES', 'juan-rafael.cortes@etu.imt-lil', 'Juan Rafael', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (6278, 'ALVAREZ', 'carlos.alvarez@etu.imt-lille-d', 'Carlos', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (6279, 'AZZI', 'anas.azzi@etu.imt-lille-douai.', 'Anas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (6280, 'BOUHSISSIN', 'wafa.bouhsissin@etu.imt-lille-', 'Wafa', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (6281, 'CHENTOUF', 'faiz.chentouf@etu.imt-lille-do', 'Faiz', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (6282, 'DADI', 'othmane.dadi@etu.imt-lille-dou', 'Othmane', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (6283, 'ER-RAFIK', 'mohammed.er-rafik@etu.imt-lill', 'Mohammed', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (6284, 'FRIKH', 'reda.frikh@etu.imt-lille-douai', 'Reda', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (6285, 'GOUDADI', 'badr.goudadi@etu.imt-lille-dou', 'Badr', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (6286, 'OUADRHIRI', 'ayoub.ouadrhiri@etu.imt-lille-', 'Ayoub', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (6288, 'SONOMOU', 'tokpa-martin.sonomou@etu.imt-l', 'Tokpa Martin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (6295, 'AKTAOU L\'AMRANI', 'ahmed.aktaou.lamrani@etu.imt-l', 'Ahmed', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FCD'),
  (6296, 'AMADAR', 'abdelali.amadar@etu.imt-lille-', 'Abdelâli', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FCD'),
  (6297, 'ATBIR', 'yassine.atbir@etu.imt-lille-do', 'Yassine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FCD'),
  (6298, 'BADI', 'mohammed.badi@etu.imt-lille-do', 'Mohammed', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FCD'),
  (6299, 'BEKARI', 'naima.bekari@etu.imt-lille-dou', 'Naïma', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FCD'),
  (6300, 'BEN QAIDA', 'ismail.ben.qaida@etu.imt-lille', 'Ismail', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FCD'),
  (6301, 'CHAGOUTI', 'oualina.chagouti@etu.imt-lille', 'Oualina', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FCD'),
  (6303, 'ELHMOUS', 'hassan.elhmous@etu.imt-lille-d', 'Hassan', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FCD'),
  (6304, 'FRÉMY', 'arnaud.fremy@etu.imt-lille-dou', 'Arnaud', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FCD'),
  (6305, 'HABBOU', 'abdelkabir.habbou@etu.imt-lill', 'Abdelkabir', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FCD'),
  (6306, 'LAMTI', 'jawad.lamti@etu.imt-lille-doua', 'Jawad', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FCD'),
  (6307, 'OUZAOUITE', 'lhoussaine.ouzaouite@etu.imt-l', 'Lhoussaine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FCD'),
  (6308, 'TREBUTIEN', 'arnaud.trebutien@etu.imt-lille', 'Arnaud', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FCD'),
  (6310, 'EL MOUEDEN', 'hamza.el.moueden@etu.imt-lille', 'Hamza', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'MS PPIB'),
  (6334, 'DELESALLE', 'julien.delesalle@etu.imt-lille', 'Julien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6335, 'LECURU', 'thomas.lecuru@etu.imt-lille-do', 'Thomas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6338, 'LAGREE', 'richard.lagree@etu.imt-lille-d', 'Richard', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6339, 'VAITANAKI', 'lauren.vaitanaki@etu.imt-lille', 'Lauren', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6340, 'SEYE', 'el-hadji-cheikh.seye@etu.imt-l', 'El Hadj Cheikh', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6341, 'SUMIEN', 'laurent.sumien@etu.imt-lille-d', 'Laurent', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6343, 'LOJOU', 'antoine.lojou@etu.imt-lille-do', 'Antoine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6345, 'PERNOT', 'thierry.pernot@etu.imt-lille-d', 'Thierry', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6346, 'SORET', 'manuel.soret@etu.imt-lille-dou', 'Manuel', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6347, 'THÉROULDE', 'constantin.theroulde@etu.imt-l', 'Constantin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6351, 'ZERDANE', 'hocine.zerdane@etu.imt-lille-d', 'Hocine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'MS PPIB'),
  (6411, 'SOUZA LOURO', 'breno.souza.louro@etu.imt-lill', 'Breno', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (6413, 'CHESSA', 'marine.chessa@etu.imt-lille-do', 'Marine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'SA'),
  (6415, 'GOFFLOT', 'sylvie.gofflot@imt-lille-douai', 'Sylvie', 0, 0, '', '', '', 0, 'DRED - Direction des', 'agent', '', 0, ''),
  (6416, 'NATIQ', 'samah.natiq@etu.imt-lille-doua', 'Samah', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6417, 'BRANLY', 'louis.branly@etu.imt-lille-dou', 'Louis', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6419, 'BEKOMBO-PRISO-MANGA', 'sissa.bekombo.priso.manga@etu.', 'Sissa', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6420, 'GALLOIS', 'maxime.gallois@etu.imt-lille-d', 'Maxime', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6421, 'GANNÉ', 'oscar.ganne@etu.imt-lille-doua', 'Oscar', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6422, 'LEPRINCE', 'marc-antoine.leprince@etu.imt-', 'Marc-Antoine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6423, 'GOULET', 'floriane.goulet@etu.imt-lille-', 'Floriane', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6424, 'AUZOU', 'ryan.auzou@etu.imt-lille-douai', 'Ryan', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6426, 'ANDRÉ', 'melanie.andre@etu.imt-lille-do', 'Mélanie', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6427, 'DURIBREU', 'benjamin.duribreu@etu.imt-lill', 'Benjamin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6428, 'LABOUS', 'corentin.labous@etu.imt-lille-', 'Corentin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6429, 'KALINOWSKI', 'clement.kalinowski@etu.imt-lil', 'Clément', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6430, 'BEN TAIEB', 'khalil.ben.taieb@etu.imt-lille', 'Khalil', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6431, 'CNOCKAERT', 'cyrielle.cnockaert@etu.imt-lil', 'Cyrielle', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6432, 'FILIPECKI', 'emma.filipecki@etu.imt-lille-d', 'Emma', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6434, 'LAURENT - - GUCKER', 'mathis.laurent--gucker@etu.imt', 'Mathis', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6435, 'CAPDEVILLE', 'lucien.capdeville@etu.imt-lill', 'Lucien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6436, 'DIEBOLT', 'paul.diebolt@etu.imt-lille-dou', 'Paul', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6437, 'BINDA', 'giulia.binda@etu.imt-lille-dou', 'Giulia', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6438, 'SÉJOURNÉ', 'kilian.sejourne@etu.imt-lille-', 'Kilian', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6440, 'DIOP', 'khady.diop@etu.imt-lille-douai', 'Khady', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6441, 'RIBADEAU-DUMAS', 'clemence.ribadeau-dumas@etu.im', 'Clémence', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6442, 'DE GABRIELLI', 'pierre.de.gabrielli@etu.imt-li', 'Pierre', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6444, 'CHARON', 'anaelle.charon@etu.imt-lille-d', 'Anaëlle', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6446, 'NGUYEN', 'arnaud.nguyen@etu.imt-lille-do', 'Arnaud', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6447, 'SPICHT', 'marie.spicht@etu.imt-lille-dou', 'Marie', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6448, 'FORTUNÉ', 'etienne.fortune@etu.imt-lille-', 'Etienne', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6449, 'SAJOT', 'edgar.sajot@etu.imt-lille-doua', 'Edgar', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6450, 'CONAN', 'pierre.conan@etu.imt-lille-dou', 'Pierre', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6451, 'RISETTI', 'thesee.risetti@etu.imt-lille-d', 'Thésée', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6453, 'COQUEREL', 'quentin.coquerel@etu.imt-lille', 'Quentin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6454, 'MILAZZO', 'gabriel.milazzo@etu.imt-lille-', 'Gabriel', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6455, 'HENNACHI', 'karima.hennachi@etu.imt-lille-', 'Karima', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6456, 'MARY', 'erwan.mary@etu.imt-lille-douai', 'Erwan', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6459, 'FONTAINE', 'allan.fontaine@etu.imt-lille-d', 'Allan', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6460, 'VERDIER', 'vincent.verdier@etu.imt-lille-', 'Vincent', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6462, 'BEN TAZIRI', 'ines.ben.taziri@etu.imt-lille-', 'Inès', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6463, 'ZUGETTA', 'clement.zugetta@etu.imt-lille-', 'Clément', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6464, 'MANCEL', 'francois-xavier.mancel@etu.imt', 'François-Xavier', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6465, 'GARNIER', 'arnaud.garnier@etu.imt-lille-d', 'Arnaud', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6468, 'DODON', 'thibaud.dodon@etu.imt-lille-do', 'Thibaud', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6469, 'OLERON', 'florian.oleron@etu.imt-lille-d', 'Florian', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6470, 'LOHIER - - FANCHINI', 'nicolas.lohier--fanchini@etu.i', 'Nicolas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6472, 'CLAERHOUT', 'quentin.claerhout@etu.imt-lill', 'Quentin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6473, 'LEYSSENS', 'clement.leyssens@etu.imt-lille', 'Clément', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6474, 'NIZET', 'thomas.nizet@etu.imt-lille-dou', 'Thomas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6475, 'MORGAINT', 'clement.morgaint@etu.imt-lille', 'Clément', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6476, 'CHARVET', 'clement.charvet@etu.imt-lille-', 'Clément', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6478, 'BEDRANI', 'nassim.bedrani@etu.imt-lille-d', 'Nassim', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6481, 'COUSY', 'kendal.cousy@etu.imt-lille-dou', 'Kendal', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6482, 'MOLINAS', 'romain.molinas@etu.imt-lille-d', 'Romain', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6483, 'MONTOUROY', 'lucas.montouroy@etu.imt-lille-', 'Lucas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6484, 'BELLAND', 'amandine.belland@etu.imt-lille', 'Amandine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6485, 'CHAUDRET', 'olivier.chaudret@etu.imt-lille', 'Olivier', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6486, 'LEFEBVRE', 'marion.lefebvre@etu.imt-lille-', 'Marion', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6487, 'LEBON', 'valentine.lebon@etu.imt-lille-', 'Valentine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6488, 'FOURREAU', 'axel.fourreau@etu.imt-lille-do', 'Axel', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6489, 'THOMAS', 'edouard.thomas@etu.imt-lille-d', 'Edouard', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6490, 'LAMBERT', 'victor.lambert@etu.imt-lille-d', 'Victor', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6494, 'THORIGNÉ', 'clement.thorigne@etu.imt-lille', 'Clément', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6496, 'FAUVERNIER', 'guillaume.fauvernier@etu.imt-l', 'Guillaume', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6498, 'MAGNEN', 'oscar.magnen@etu.imt-lille-dou', 'Oscar', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6499, 'GUYOT', 'thomas.guyot@etu.imt-lille-dou', 'Thomas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6501, 'OUBENIIHYA', 'leila.oubeniihya@etu.imt-lille', 'Leila', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6503, 'BELOTTI', 'vincent.belotti@etu.imt-lille-', 'Vincent', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6504, 'PATTE', 'cecile.patte@etu.imt-lille-dou', 'Cécile', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6505, 'GALLET', 'benjamin.gallet@etu.imt-lille-', 'Benjamin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6506, 'GAUCEL', 'pierre.gaucel@etu.imt-lille-do', 'Pierre', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6507, 'LEPEZ', 'valentin.lepez@etu.imt-lille-d', 'Valentin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6508, 'DANJOUX-DICHAMP', 'guillaume.danjoux-dichamp@etu.', 'Guillaume', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6509, 'PIERRE', 'marianne.pierre@etu.imt-lille-', 'Marianne', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6510, 'LE BARS', 'vincent.le.bars@etu.imt-lille-', 'Vincent', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6511, 'LOISEAU', 'alexandre.loiseau@etu.imt-lill', 'Alexandre', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6512, 'BODINEAU', 'agathe.bodineau@etu.imt-lille-', 'Agathe', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6513, 'MALET', 'maxime.malet@etu.imt-lille-dou', 'Maxime', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6514, 'BETTON', 'paul.betton@etu.imt-lille-doua', 'Paul', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6515, 'GASSE', 'clement.gasse@etu.imt-lille-do', 'Clément', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6516, 'FISTER', 'lise.fister@etu.imt-lille-doua', 'Lise', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6518, 'MASSE', 'elisabeth.masse@etu.imt-lille-', 'Elisabeth', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6519, 'EL ALLAM', 'yassine.elallam@etu.imt-lille-', 'Yassine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6520, 'FUCHS', 'maxime.fuchs@etu.imt-lille-dou', 'Maxime', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6521, 'HALLEREAU', 'estevan.hallereau@etu.imt-lill', 'Estevan', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6522, 'PREVOST', 'simon.prevost@etu.imt-lille-do', 'Simon', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6523, 'BOUVIER', 'ema.bouvier@etu.imt-lille-doua', 'Ema', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6525, 'PAIX', 'victoria.paix@etu.imt-lille-do', 'Victoria', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6526, 'DELCOURT', 'charles.delcourt@etu.imt-lille', 'Charles', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6527, 'VANDENOSTENDE', 'mathieu.vandenostende@etu.imt-', 'Mathieu', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6528, 'CARLIER', 'clement.carlier@etu.imt-lille-', 'Clément', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6529, 'VOGT', 'benjamin.vogt@etu.imt-lille-do', 'Benjamin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6532, 'SPINDLER', 'leon.spindler@etu.imt-lille-do', 'Leon', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6533, 'KERE', 'jonathan.kere@etu.imt-lille-do', 'Jonathan', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6534, 'NORMAND', 'magali.normand@etu.imt-lille-d', 'Magali', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6535, 'POUDEVIGNE', 'pierre.poudevigne@etu.imt-lill', 'Pierre', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6536, 'RENARD', 'antoine.renard@etu.imt-lille-d', 'Antoine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6538, 'CHAPUS--LECOEUR', 'nicolas.chapus--lecoeur@etu.im', 'Nicolas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6539, 'MAKHCHOUN', 'ayoub.makhchoun@etu.imt-lille-', 'Ayoub', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6540, 'DÉCHAPPE', 'antoine.dechappe@etu.imt-lille', 'Antoine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6542, 'EA', 'noel.ea@etu.imt-lille-douai.fr', 'Noêl', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6543, 'SERGENT', 'martin.sergent@etu.imt-lille-d', 'Martin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6544, 'LAMSAOUEB', 'mhamed.lamsaoueb@etu.imt-lille', 'M\'Hamed', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6546, 'RAISON', 'jules.raison@etu.imt-lille-dou', 'Jules', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6547, 'ORTEGA', 'mathilde.ortega@etu.imt-lille-', 'Mathilde', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6548, 'CUCINI', 'julien.cucini@etu.imt-lille-do', 'Julien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6549, 'SÉGARD', 'audrey.segard@etu.imt-lille-do', 'Audrey', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6550, 'AUMONIER', 'arthur.aumonier@etu.imt-lille-', 'Arthur', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6551, 'GAWEL', 'frederic.gawel@etu.imt-lille-d', 'Frédéric', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6552, 'FAGOT', 'alexandre.fagot@etu.imt-lille-', 'Alexandre', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6553, 'SEMPÉ', 'theophile.sempe@etu.imt-lille-', 'Théophile', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6554, 'GIBIER', 'marcel.gibier@etu.imt-lille-do', 'Marcel', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6555, 'SYMCHOWICZ', 'lea.symchowicz@etu.imt-lille-d', 'Léa', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6556, 'HENRY', 'simon.henry@etu.imt-lille-doua', 'Simon', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6557, 'BOUVIER', 'nicolas.bouvier@etu.imt-lille-', 'Nicolas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6558, 'DERICKXSEN', 'thomas.derickxsen@etu.imt-lill', 'Thomas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6559, 'BOSSENEC', 'lea.bossenec@etu.imt-lille-dou', 'Léa', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6560, 'EL FARAH', 'el-mehdi.el.farah@etu.imt-lill', 'El Mehdi', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6561, 'DELMONTHE', 'jonathan.delmonthe@etu.imt-lil', 'Jonathan', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6562, 'THIRÉ', 'anais.thire@etu.imt-lille-doua', 'Anaïs', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6563, 'PAILLOT', 'charlotte.paillot@etu.imt-lill', 'Charlotte', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6564, 'DROMER', 'simon.dromer@etu.imt-lille-dou', 'Simon', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6565, 'NIABALY', 'pathe.niabaly@etu.imt-lille-do', 'Pathé', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6566, 'GALLIERE', 'julie.galliere@etu.imt-lille-d', 'Julie', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6567, 'GODEFERT', 'maxence.godefert@etu.imt-lille', 'Maxence', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6568, 'PETIT', 'lucas.petit@etu.imt-lille-doua', 'Lucas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6569, 'VATTIER', 'arthur.vattier@etu.imt-lille-d', 'Arthur', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6570, 'SAMSON', 'julien.samson@etu.imt-lille-do', 'Julien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6571, 'JATTI', 'yanis.jatti@etu.imt-lille-doua', 'Yanis', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6572, 'DESMETTRE', 'gabriel.desmettre@etu.imt-lill', 'Gabriel', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6573, 'ROCHER', 'gabrielle.rocher@etu.imt-lille', 'Gabrielle', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6574, 'SMATI', 'mehdi.smati@etu.imt-lille-doua', 'Mehdi', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6575, 'TOULORGE', 'arnaud.toulorge@etu.imt-lille-', 'Arnaud', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6576, 'TESSIER', 'jules.tessier@etu.imt-lille-do', 'Jules', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6577, 'FRANÇOIS', 'maxime.francois@etu.imt-lille-', 'Maxime', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6578, 'RAPPASSE', 'clement.rappasse@etu.imt-lille', 'Clément', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6579, 'SERIEN', 'emile.serien@etu.imt-lille-dou', 'Emile', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6580, 'MERLE', 'alexandra.merle@etu.imt-lille-', 'Alexandra', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6581, 'PRÉVOST', 'albane.prevost@etu.imt-lille-d', 'Albane', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6582, 'DOMAS', 'paul.domas@etu.imt-lille-douai', 'Paul', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6583, 'MOHAMED CHEIKH', 'mohamed.mohamed.cheikh@etu.imt', 'Mohamed', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6584, 'WETTEREN', 'alice.wetteren@etu.imt-lille-d', 'Alice', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6585, 'JOLY', 'lisa.joly@etu.imt-lille-douai.', 'Lisa', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6586, 'HUANG', 'laurent.huang@etu.imt-lille-do', 'Laurent', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6588, 'CHHUN', 'emilie.chhun@etu.imt-lille-dou', 'Emilie', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6589, 'MALIDIN DELABRIÈRE', 'thomas.malidin.delabriere@etu.', 'Thomas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6591, 'COLLADO', 'quentin.collado@etu.imt-lille-', 'Quentin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6593, 'ADAM', 'pierre-jean.adam@etu.imt-lille', 'Pierre-Jean', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6594, 'MOUTON', 'mathilde.mouton@etu.imt-lille-', 'Mathilde', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6595, 'FAGNANT', 'pierre.fagnant@etu.imt-lille-d', 'Pierre', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6596, 'JOUSSEAUME', 'thibaut.jousseaume@etu.imt-lil', 'Thibaut', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6597, 'MANGEART', 'martin.mangeart@etu.imt-lille-', 'Martin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6598, 'CLÉRET', 'justine.cleret@etu.imt-lille-d', 'Justine', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6599, 'LOGERAIS', 'louis.logerais@etu.imt-lille-d', 'Louis', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6601, 'GRASSART', 'gaetan.grassart@etu.imt-lille-', 'Gaëtan', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6602, 'KHALOUI', 'oumaima.khaloui@etu.imt-lille-', 'Oumaima', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6603, 'BENSEDDIQ', 'oussama.benseddiq@etu.imt-lill', 'Oussama', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6605, 'DANJOU', 'sullivan.danjou@etu.imt-lille-', 'Sullivan', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6606, 'MARTIN', 'valentin.martin@etu.imt-lille-', 'Valentin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6607, 'FRAUD', 'basile.fraud@etu.imt-lille-dou', 'Basile', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6608, 'MARTIN', 'david.martin@etu.imt-lille-dou', 'David', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI');
  INSERT INTO `USER` (`IDUSER`, `NOM`, `EMAIL`, `PRENOM`, `TEL`, `NOMBRETRAJETREALISES`, `AVATAR`, `PSEUDO`, `INFORMATION`, `ISADMIN`, `UNITE`, `FONCTION`, `SITE`, `PROMOTION`, `TYPEPROMOTION`) VALUES
  (6609, 'LANÇON', 'olivier.lancon@etu.imt-lille-d', 'Olivier', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6610, 'MORET', 'alix.moret@etu.imt-lille-douai', 'Alix', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6611, 'AHMED', 'shady.ahmed@etu.imt-lille-doua', 'Shady', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6612, 'CAZES', 'corentin.cazes@etu.imt-lille-d', 'Corentin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6613, 'DE GOYON', 'mathieu.de.goyon@etu.imt-lille', 'Mathieu', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6614, 'DELBROUQUE', 'vianney.delbrouque@etu.imt-lil', 'Vianney', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6615, 'ARASSUS', 'aurelien.arassus@etu.imt-lille', 'Aurélien', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6616, 'SAWERIS', 'samuel.saweris@etu.imt-lille-d', 'Samuel', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6617, 'BOUTAULT', 'maxime.boutault@etu.imt-lille-', 'Maxime', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6618, 'PACHOLSKI', 'mathilde.pacholski@etu.imt-lil', 'Mathilde', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6619, 'RAVOI', 'rudy.ravoi@etu.imt-lille-douai', 'Rudy', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6620, 'THOMAS', 'alexia.thomas@etu.imt-lille-do', 'Alexia', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6622, 'AÏRED', 'thomas.aired@etu.imt-lille-dou', 'Thomas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6623, 'ROUGET', 'florian.rouget@etu.imt-lille-d', 'Florian', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6625, 'TRUONG', 'the-vinh.truong@etu.imt-lille-', 'The Vinh', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6626, 'BIZET', 'thomas.bizet@etu.imt-lille-dou', 'Thomas', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6657, 'HOURIEZ', 'tom.houriez@etu.imt-lille-doua', 'Tom', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6667, 'DIDIER', 'victor.didier@etu.imt-lille-do', 'Victor', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6672, 'SADI HADDAD', 'tarik.sadi.haddad@etu.imt-lill', 'Tarik', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'MS PPIB'),
  (6675, 'SIMO TABUDJI FUPA', 'kevin.simo.tabudji.fupa@etu.im', 'Kévin', 0, 0, '', '', '', 0, '', 'etudiant', '', 2019, 'FI'),
  (6694, 'ASSAAD', 'ahmad.assaad@etu.imt-lille-dou', 'Ahmad', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6695, 'GANTOIS', 'etienne.gantois@etu.imt-lille-', 'Etienne', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6696, 'CLECH', 'melodie.clech@etu.imt-lille-do', 'Melodie', 0, 0, '', '', '', 0, '', 'etudiant', '', 2020, 'FI'),
  (6744, 'ANNAHARI', 'mohamed.annahari@etu.imt-lille', 'Mohamed', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'MS PPIB'),
  (6745, 'DRISSI', 'abderrahim.drissi@etu.imt-lill', 'Abderrahim', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'MS PPIB'),
  (6749, 'DECARNIN', 'adeline.decarnin@imt-lille-dou', 'Adeline', 0, 0, '', '', '', 0, 'Agence Comptable', 'agent', '', 0, ''),
  (6762, 'BENMIMOUNE', 'mehdi.benmimoune@etu.imt-lille', 'Mehdi', 0, 0, '', '', '', 0, '', 'etudiant', '', 2018, 'MS PPIB'),
  (6884, 'DECESARE', 'charlotte.decesare@imt-lille-d', 'Charlotte', 0, 0, '', '', '', 0, 'DEF - Pôle Formation', 'agent', '', 0, ''),
  (6914, 'LAZARE', 'caroline.lazare@telecom-lille.', 'Caroline', 0, 0, '', '', '', 0, 'DEF - Pôle Formation', 'agent', '', 0, ''),
  (6958, 'GAUTIER', 'remi.gautier@mines-douai.fr', 'Rémi', 0, 0, '', '', '', 0, 'Département Energéti', 'agent', '', 0, '');



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
