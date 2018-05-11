--
-- Structure de la table `APPARTENIR`
--

CREATE TABLE `APPARTENIR` (
  `IDUSER` int(11) NOT NULL,
  `IDGROUPE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `GROUPE`
--

CREATE TABLE `GROUPE` (
  `IDGROUPE` int(11) NOT NULL AUTO_INCREMENT,
  `IDUSER` int(11) NOT NULL,
  `NOM` varchar(20) DEFAULT NULL,
  `PRIVE` tinyint(1) DEFAULT '0',
  PRIMARY KEY (IDGROUPE)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Structure de la table `NOTIFIER`
--

CREATE TABLE `NOTIFIER` (
  `IDUSER` int(11) NOT NULL,
  `IDTRAJET` int(11) NOT NULL,
  `IDGROUPE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `NOTIFIERG`
--

CREATE TABLE `NOTIFIERG` (
  `IDTRAJET` int(11) NOT NULL,
  `IDGROUPE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `PASSERPAR`
--

CREATE TABLE `PASSERPAR` (
  `IDTRAJET` int(11) NOT NULL,
  `IDETAPE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `PC`
--

CREATE TABLE `PC` (
  `ADRESSEIP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Structure de la table `POSSEDER`
--

CREATE TABLE `POSSEDER` (
  `ADRESSEIP` int(11) NOT NULL,
  `IDUSER` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `RESERVER`
--

CREATE TABLE `RESERVER` (
  `IDUSER` int(11) NOT NULL,
  `IDTRAJET` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `TRAJET`
--

CREATE TABLE `TRAJET` (
  `IDTRAJET` int(11) NOT NULL AUTO_INCREMENT,
  `IDUSER` int(11) NOT NULL,
  `NOM` varchar(20) DEFAULT NULL,
  `HORAIREDEPART` datetime NOT NULL,
  `LIEUDEPART` varchar(20) NOT NULL,
  `LIEUARRIVEE` varchar(20) NOT NULL,
  `NBXPLACE` smallint(6) NOT NULL,
  `CREATEUR` int(11) NOT NULL,
  `ACTIF` tinyint(1) NOT NULL,
  `INFORMATION` text,
  `IDVOITURE` int(11) NOT NULL,
  PRIMARY KEY (IDTRAJET)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Structure de la table `USER`
--

CREATE TABLE `USER` (
  `IDUSER` int(11) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(100) NOT NULL,
  `EMAIL` varchar(30) NOT NULL,
  `MOT_DE_PASSE` varchar(50) NOT NULL,
  `PRENOM` varchar(100) NOT NULL,
  `TEL` int(11),
  `NOMBRETRAJETREALISES` int(11) DEFAULT '0',
  `AVATAR` longblob,
  `PSEUDO` varchar(20) DEFAULT NULL,
  `INFORMATION` text,
  `ISADMIN` tinyint(1) DEFAULT '1',
  `UNITE` varchar(20) DEFAULT NULL,
  `FONCTION` varchar(20) DEFAULT NULL,
  `SITE` varchar(30) DEFAULT NULL,
  `PROMOTION` int(11) DEFAULT NULL,
  `TYPEPROMOTION` varchar(20),
  PRIMARY KEY (IDUSER)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Structure de la table `ETAPE`
--

CREATE TABLE `ETAPE` (
  `IDETAPE` int(11) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(20) DEFAULT NULL,
  `CODEPOSTAL` int(10) NOT NULL,
  PRIMARY KEY (IDETAPE)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `ETAPE`
--


--
-- Structure de la table `VOITURE`
--

CREATE TABLE `VOITURE` (
  `IDVOITURE` int(11) NOT NULL AUTO_INCREMENT,
  `IDUSER` int(11) NOT NULL,
  `IDPROPRIETAIRE` int(11) DEFAULT NULL,
  `MARQUE` varchar(10) DEFAULT NULL,
  `MODELE` varchar(10) DEFAULT NULL,
  `NBXPLACE` smallint(6) DEFAULT NULL,
  `COULEUR` varchar(10) DEFAULT NULL,
  PRIMARY KEY (IDVOITURE)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Index pour les tables exportées
--

--
-- Index pour la table `APPARTENIR`
--
ALTER TABLE `APPARTENIR`
  ADD PRIMARY KEY (`IDUSER`,`IDGROUPE`),
  ADD KEY `FK_APPARTENIR2` (`IDGROUPE`);

--
-- Index pour la table `GROUPE`
--
ALTER TABLE `GROUPE`
  ADD KEY `FK_CREERSUPPRIMER` (`IDUSER`);

--
-- Index pour la table `NOTIFIER`
--
ALTER TABLE `NOTIFIER`
  ADD PRIMARY KEY (`IDUSER`,`IDTRAJET`,`IDGROUPE`),
  ADD KEY `FK_NOTIFIER2` (`IDTRAJET`),
  ADD KEY `FK_NOTIFIER3` (`IDGROUPE`);

--
-- Index pour la table `NOTIFIERG`
--
ALTER TABLE `NOTIFIERG`
  ADD PRIMARY KEY (`IDTRAJET`,`IDGROUPE`),
  ADD KEY `FK_NOTIFIERG2` (`IDGROUPE`);

--
-- Index pour la table `PASSERPAR`
--
ALTER TABLE `PASSERPAR`
  ADD PRIMARY KEY (`IDTRAJET`,`IDETAPE`),
  ADD KEY `FK_PASSERPAR2` (`IDETAPE`);

--
-- Index pour la table `PC`
--
ALTER TABLE `PC`
  ADD PRIMARY KEY (`ADRESSEIP`);

--
-- Index pour la table `POSSEDER`
--
ALTER TABLE `POSSEDER`
  ADD PRIMARY KEY (`ADRESSEIP`,`IDUSER`),
  ADD KEY `FK_POSSEDER2` (`IDUSER`);

--
-- Index pour la table `RESERVER`
--
ALTER TABLE `RESERVER`
  ADD PRIMARY KEY (`IDUSER`,`IDTRAJET`),
  ADD KEY `FK_RESERVER2` (`IDTRAJET`);

--
-- Index pour la table `TRAJET`
--
ALTER TABLE `TRAJET`
  ADD UNIQUE KEY `IDVOITURE` (`IDVOITURE`),
  ADD KEY `FK_CREERMODIFIERSUPPRIMER` (`IDUSER`),
  ADD KEY `IDVOITURE_2` (`IDVOITURE`);

--
-- Index pour la table `VOITURE`
--
ALTER TABLE `VOITURE`
  ADD KEY `FK_AVOIR` (`IDUSER`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `APPARTENIR`
--
ALTER TABLE `APPARTENIR`
  ADD CONSTRAINT `FK_APPARTENIR` FOREIGN KEY (`IDUSER`) REFERENCES `USER` (`IDUSER`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_APPARTENIR2` FOREIGN KEY (`IDGROUPE`) REFERENCES `GROUPE` (`IDGROUPE`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `GROUPE`
--
ALTER TABLE `GROUPE`
  ADD CONSTRAINT `FK_CREERSUPPRIMER` FOREIGN KEY (`IDUSER`) REFERENCES `USER` (`IDUSER`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `NOTIFIER`
--
ALTER TABLE `NOTIFIER`
  ADD CONSTRAINT `FK_NOTIFIER` FOREIGN KEY (`IDUSER`) REFERENCES `USER` (`IDUSER`),
  ADD CONSTRAINT `FK_NOTIFIER2` FOREIGN KEY (`IDTRAJET`) REFERENCES `TRAJET` (`IDTRAJET`),
  ADD CONSTRAINT `FK_NOTIFIER3` FOREIGN KEY (`IDGROUPE`) REFERENCES `GROUPE` (`IDGROUPE`);

--
-- Contraintes pour la table `NOTIFIERG`
--
ALTER TABLE `NOTIFIERG`
  ADD CONSTRAINT `FK_NOTIFIERG` FOREIGN KEY (`IDTRAJET`) REFERENCES `TRAJET` (`IDTRAJET`),
  ADD CONSTRAINT `FK_NOTIFIERG2` FOREIGN KEY (`IDGROUPE`) REFERENCES `GROUPE` (`IDGROUPE`);

--
-- Contraintes pour la table `PASSERPAR`
--
ALTER TABLE `PASSERPAR`
  ADD CONSTRAINT `FK_PASSERPAR` FOREIGN KEY (`IDTRAJET`) REFERENCES `TRAJET` (`IDTRAJET`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PASSERPAR2` FOREIGN KEY (`IDETAPE`) REFERENCES `ETAPE` (`IDETAPE`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `POSSEDER`
--
ALTER TABLE `POSSEDER`
  ADD CONSTRAINT `FK_POSSEDER` FOREIGN KEY (`ADRESSEIP`) REFERENCES `PC` (`ADRESSEIP`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_POSSEDER2` FOREIGN KEY (`IDUSER`) REFERENCES `USER` (`IDUSER`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `RESERVER`
--
ALTER TABLE `RESERVER`
  ADD CONSTRAINT `FK_RESERVER` FOREIGN KEY (`IDUSER`) REFERENCES `USER` (`IDUSER`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RESERVER2` FOREIGN KEY (`IDTRAJET`) REFERENCES `TRAJET` (`IDTRAJET`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `TRAJET`
--
ALTER TABLE `TRAJET`
  ADD CONSTRAINT `FK_CREERMODIFIERSUPPRIMER` FOREIGN KEY (`IDUSER`) REFERENCES `USER` (`IDUSER`),
  ADD CONSTRAINT `TRAJET_ibfk_1` FOREIGN KEY (`IDVOITURE`) REFERENCES `VOITURE` (`IDVOITURE`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Contraintes pour la table `VOITURE`
--
ALTER TABLE `VOITURE`
  ADD CONSTRAINT `FK_AVOIR` FOREIGN KEY (`IDUSER`) REFERENCES `USER` (`IDUSER`);
