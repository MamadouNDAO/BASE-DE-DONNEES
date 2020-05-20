-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 20 mai 2020 à 02:50
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `clinique`
--

-- --------------------------------------------------------

--
-- Structure de la table `appartenir`
--

CREATE TABLE `appartenir` (
  `idDépartement` varchar(50) NOT NULL,
  `idMédecin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `appartenir`
--

INSERT INTO `appartenir` (`idDépartement`, `idMédecin`) VALUES
('dep01', 'NM1'),
('dep01', 'NM2'),
('dep02', 'NM3'),
('dep02', 'NM3'),
('dep01', 'NM3'),
('dep02', 'NM4');

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `numChambre` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `catégorie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`numChambre`, `type`, `catégorie`) VALUES
('C1', 'typ1', 'cat1'),
('C2', 'typ2', 'cat2'),
('C3', 'typ2', 'cat2'),
('C4', 'typ4', 'cat4');

-- --------------------------------------------------------

--
-- Structure de la table `départelent`
--

CREATE TABLE `départelent` (
  `idDépartement` varchar(50) NOT NULL,
  `nomDept` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `départelent`
--

INSERT INTO `départelent` (`idDépartement`, `nomDept`) VALUES
('dep01', 'D1'),
('dep02', 'D2'),
('dep03', 'D3'),
('dep04', 'D4');

-- --------------------------------------------------------

--
-- Structure de la table `evolution`
--

CREATE TABLE `evolution` (
  `numFeuille` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `idMalade` varchar(50) NOT NULL,
  `Note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `evolution`
--

INSERT INTO `evolution` (`numFeuille`, `date`, `idMalade`, `Note`) VALUES
('f1', '2020-05-10', 'mal1', 'Il évolue lentement'),
('f2', '2020-05-20', '11', 'test tesst'),
('f3', '2013-05-03', 'mal3', 'bien'),
('f4', '2020-03-01', 'mal6', 'positif');

-- --------------------------------------------------------

--
-- Structure de la table `lit`
--

CREATE TABLE `lit` (
  `numLit` int(11) NOT NULL,
  `numChambre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `lit`
--

INSERT INTO `lit` (`numLit`, `numChambre`) VALUES
(1, 'C1'),
(2, 'C1'),
(3, 'C1'),
(4, 'C1'),
(5, 'C1'),
(6, 'C2'),
(21, 'C2'),
(7, 'C3'),
(8, 'C4'),
(100, 'C4');

-- --------------------------------------------------------

--
-- Structure de la table `malade`
--

CREATE TABLE `malade` (
  `idMalade` varchar(50) NOT NULL,
  `nomMalade` varchar(50) NOT NULL,
  `date_naiss` date NOT NULL,
  `sexe` varchar(10) NOT NULL,
  `addresse` text NOT NULL,
  `lieu_naiss` text NOT NULL,
  `numChambre` varchar(50) NOT NULL,
  `numLit` int(11) NOT NULL,
  `idDépartement` varchar(50) NOT NULL,
  `DateInterné` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `malade`
--

INSERT INTO `malade` (`idMalade`, `nomMalade`, `date_naiss`, `sexe`, `addresse`, `lieu_naiss`, `numChambre`, `numLit`, `idDépartement`, `DateInterné`) VALUES
('11', 'ousmane', '2010-05-19', '', 'azerty', 'mopo', 'C3', 7, 'dep03', '2020-05-03'),
('22', 'amet', '2001-05-07', 'masculin', 'pout', 'pout', 'C2', 2, 'dep02', '2020-05-11'),
('mal1', 'Babacar', '2001-05-04', 'masculin', 'Sicap l4', 'Dakar', 'C1', 1, 'dep01', '2020-05-14'),
('mal2', 'astou', '2002-04-10', 'féminin', 'patar', 'thies', 'C2', 2, 'dep02', '2019-12-09'),
('mal3', 'fatou', '2012-04-22', 'féminin', 'popengine', 'tamba', 'C3', 21, 'dep03', '2020-02-02'),
('mal4', 'maty', '2004-01-15', 'féminin', 'odc', 'touba', 'C2', 21, 'dep01', '2020-03-03'),
('mal5', 'tom', '2020-05-07', 'masculin', 'ampaté', 'dakar', 'C4', 7, 'dep04', '2020-03-21'),
('mal6', 'badou', '2012-04-22', 'masculin', 'pa', 'dk', 'C4', 8, 'dep02', '2020-03-08');

-- --------------------------------------------------------

--
-- Structure de la table `médecin`
--

CREATE TABLE `médecin` (
  `idMédecin` varchar(50) NOT NULL,
  `nomMed` varchar(50) NOT NULL,
  `NomSpécialité` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `médecin`
--

INSERT INTO `médecin` (`idMédecin`, `nomMed`, `NomSpécialité`) VALUES
('NM1', 'M1', 'S1'),
('NM2', 'M2', 'S2'),
('NM3', 'M3', 'S3'),
('NM4', 'M4', 'S1');

-- --------------------------------------------------------

--
-- Structure de la table `spécialité`
--

CREATE TABLE `spécialité` (
  `NomSpécialité` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `spécialité`
--

INSERT INTO `spécialité` (`NomSpécialité`) VALUES
('S1'),
('S2'),
('S3'),
('S4');

-- --------------------------------------------------------

--
-- Structure de la table `suivre`
--

CREATE TABLE `suivre` (
  `idMalade` varchar(50) NOT NULL,
  `idMédecin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `suivre`
--

INSERT INTO `suivre` (`idMalade`, `idMédecin`) VALUES
('mal1', 'NM3'),
('mal2', 'NM3'),
('mal3', 'NM1'),
('mal4', 'NM3'),
('mal6', 'NM4'),
('mal5', 'NM1'),
('mal6', 'NM2'),
('mal3', 'NM2');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `appartenir`
--
ALTER TABLE `appartenir`
  ADD KEY `idDépartement` (`idDépartement`),
  ADD KEY `idMédecin` (`idMédecin`);

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`numChambre`);

--
-- Index pour la table `départelent`
--
ALTER TABLE `départelent`
  ADD PRIMARY KEY (`idDépartement`);

--
-- Index pour la table `evolution`
--
ALTER TABLE `evolution`
  ADD PRIMARY KEY (`numFeuille`),
  ADD KEY `idMalade` (`idMalade`);

--
-- Index pour la table `lit`
--
ALTER TABLE `lit`
  ADD PRIMARY KEY (`numLit`),
  ADD KEY `numChambre` (`numChambre`);

--
-- Index pour la table `malade`
--
ALTER TABLE `malade`
  ADD PRIMARY KEY (`idMalade`),
  ADD KEY `idDépartement` (`idDépartement`),
  ADD KEY `numChambre` (`numChambre`),
  ADD KEY `numLit` (`numLit`);

--
-- Index pour la table `médecin`
--
ALTER TABLE `médecin`
  ADD PRIMARY KEY (`idMédecin`),
  ADD KEY `NomSpécialité` (`NomSpécialité`);

--
-- Index pour la table `spécialité`
--
ALTER TABLE `spécialité`
  ADD PRIMARY KEY (`NomSpécialité`);

--
-- Index pour la table `suivre`
--
ALTER TABLE `suivre`
  ADD KEY `idMalade` (`idMalade`),
  ADD KEY `idMédecin` (`idMédecin`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartenir`
--
ALTER TABLE `appartenir`
  ADD CONSTRAINT `appartenir_ibfk_1` FOREIGN KEY (`idDépartement`) REFERENCES `départelent` (`idDépartement`),
  ADD CONSTRAINT `appartenir_ibfk_2` FOREIGN KEY (`idMédecin`) REFERENCES `médecin` (`idMédecin`);

--
-- Contraintes pour la table `evolution`
--
ALTER TABLE `evolution`
  ADD CONSTRAINT `evolution_ibfk_1` FOREIGN KEY (`idMalade`) REFERENCES `malade` (`idMalade`);

--
-- Contraintes pour la table `lit`
--
ALTER TABLE `lit`
  ADD CONSTRAINT `lit_ibfk_1` FOREIGN KEY (`numChambre`) REFERENCES `chambre` (`numChambre`);

--
-- Contraintes pour la table `malade`
--
ALTER TABLE `malade`
  ADD CONSTRAINT `malade_ibfk_1` FOREIGN KEY (`idDépartement`) REFERENCES `départelent` (`idDépartement`),
  ADD CONSTRAINT `malade_ibfk_2` FOREIGN KEY (`numChambre`) REFERENCES `chambre` (`numChambre`),
  ADD CONSTRAINT `malade_ibfk_3` FOREIGN KEY (`numLit`) REFERENCES `lit` (`numLit`);

--
-- Contraintes pour la table `médecin`
--
ALTER TABLE `médecin`
  ADD CONSTRAINT `médecin_ibfk_1` FOREIGN KEY (`NomSpécialité`) REFERENCES `spécialité` (`NomSpécialité`);

--
-- Contraintes pour la table `suivre`
--
ALTER TABLE `suivre`
  ADD CONSTRAINT `suivre_ibfk_1` FOREIGN KEY (`idMalade`) REFERENCES `malade` (`idMalade`),
  ADD CONSTRAINT `suivre_ibfk_2` FOREIGN KEY (`idMédecin`) REFERENCES `médecin` (`idMédecin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
