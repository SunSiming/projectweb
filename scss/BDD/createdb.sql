-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Lun 12 Mars 2018 à 15:10
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `createdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `ROLE_ID` smallint(6) NOT NULL,
  `ROLE_LABEL` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `role`
--

INSERT INTO `role` (`ROLE_ID`, `ROLE_LABEL`) VALUES
(2, 'Admin'),
(3, 'Super-Admin'),
(1, 'User');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `USER_ID` smallint(6) NOT NULL,
  `USER_LOGIN` varchar(25) NOT NULL,
  `USER_EMAIL` varchar(255) NOT NULL,
  `USER_PWD` varchar(10) DEFAULT NULL,
  `USER_ROLE` smallint(6) NOT NULL,
  `USER_NAME` varchar(25) NOT NULL,
  `USER_SURNAME` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`USER_ID`, `USER_LOGIN`, `USER_EMAIL`, `USER_PWD`, `USER_ROLE`, `USER_NAME`, `USER_SURNAME`) VALUES
(1, 'luc', 'luc@luc.com', 'luc', 2, 'Luc', 'Fabresse'),
(2, 'yoda', 'yoda@yoda.com', 'yoda', 3, 'Yoda', 'Yoda'),
(3, 'luke', 'luke@luke.com', 'luke', 1, 'Luke', 'Skywalker'),
(4, 'han', 'han@solo.com', 'han', 1, 'Han', 'Solo');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`ROLE_ID`),
  ADD UNIQUE KEY `ROLE_LABEL` (`ROLE_LABEL`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`USER_ID`),
  ADD KEY `FK_USER_ROLE` (`USER_ROLE`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `ROLE_ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `USER_ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_USER_ROLE` FOREIGN KEY (`USER_ROLE`) REFERENCES `role` (`ROLE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
