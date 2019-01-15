-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:8889
-- Généré le :  Mar 15 Janvier 2019 à 14:22
-- Version du serveur :  5.6.35
-- Version de PHP :  7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `shopping-list`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `Art_id` int(11) NOT NULL,
  `Art_name` varchar(55) NOT NULL,
  `Art_qte` int(11) NOT NULL,
  `Art_list` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`Art_id`, `Art_name`, `Art_qte`, `Art_list`) VALUES
(1, 'bière', 6, 1),
(2, 'chips', 10, 1),
(3, 'vin', 2, 2),
(4, 'pates', 2, 2),
(5, 'bolo', 1, 2),
(9, 'Clopes ', 2, 1),
(10, 'poulet ', 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `List`
--

CREATE TABLE `List` (
  `List_id` int(11) NOT NULL,
  `List_name` varchar(55) NOT NULL,
  `List_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `List`
--

INSERT INTO `List` (`List_id`, `List_name`, `List_date`) VALUES
(1, 'Apéro chez bouchon', '2018-01-16'),
(2, 'Faire a bouffer à la copine', '2018-01-17');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `usr_id` int(11) NOT NULL,
  `usr_name` varchar(55) NOT NULL,
  `usr_password` varchar(155) NOT NULL,
  `usr_mail` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`usr_id`, `usr_name`, `usr_password`, `usr_mail`) VALUES
(5, 'c4n4r', '$2y$10$.7LXxns6lToV3BtoW7/3ZO9kPYTYYp6H/hQEa29aEKh2XvqVHqAoi', 'delphin.hadrien@gmail.com'),
(6, 'hadrien', '$2y$10$baqHLa3Zebenj9qnkfiq8.Hd/jDUSW/wzfU6GhdUBdN0kla5E51o.', 'delphin.hadrien@gmail.com');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`Art_id`),
  ADD KEY `article` (`Art_list`);

--
-- Index pour la table `List`
--
ALTER TABLE `List`
  ADD PRIMARY KEY (`List_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`usr_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `Art_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `List`
--
ALTER TABLE `List`
  MODIFY `List_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `usr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`Art_list`) REFERENCES `List` (`List_id`) ON DELETE CASCADE ON UPDATE CASCADE;
