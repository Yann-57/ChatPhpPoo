-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : Dim 02 mai 2021 à 19:58
-- Version du serveur :  5.7.30
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `chatSimple`
--

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `date_posted` datetime NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_room` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`id`, `content`, `date_posted`, `id_user`, `id_room`) VALUES
(38, 'Bienvenue &agrave; tous, puisse le sort vous être favorable', '2021-05-02 20:42:17', 1, 1),
(48, 'Bonjour, Bonjour mes petits loups, qui se lance pour ma prochaine Martinade ?', '2021-05-02 21:51:31', 17, 2),
(49, '如果您听懂这句话，我要求的分数是20', '2021-05-02 21:54:11', 16, 3),
(50, 'salut', '2021-05-02 21:54:47', 16, 1),
(51, 'salut\r\n', '2021-05-02 21:55:12', 18, 1),
(52, 'salut', '2021-05-02 21:55:37', 19, 1),
(53, 'salut', '2021-05-02 21:56:59', 20, 1),
(54, 'salut', '2021-05-02 21:57:36', 17, 1);

-- --------------------------------------------------------

--
-- Structure de la table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `room`
--

INSERT INTO `room` (`id`, `name`) VALUES
(1, 'Singapour'),
(2, 'Ethiopie'),
(3, 'Borny');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `avatar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `avatar`) VALUES
(1, 'yann', '$2y$10$a/RbkCVNWt.obCmXivQuT.VGzo6eG77CDdjAvBSxyTTj70.nAV57u', 'yann-berlingeri@hotmail.fr', '/medias/upload/roger.jpeg'),
(15, 'jeanjean', '$2y$10$Bb6FJkROXMWby6QdKSYSPu0oVHlJnZd09MvxLDJzP.XNlRpb1gOlW', 'jeandubois@gmail.com', '/medias/upload/Y.png'),
(16, 'Le boss du game', '$2y$10$llK9vFTPllvYNe1Qc1RUIOrPkDJ0GYMSjek2YbURoLWl8pDa/.owm', 'lbdg@gmail.com', '/medias/upload/iconfinder_batman_hero_avatar_comics_4043232.png'),
(17, 'Marty', '$2y$10$2IGMNQpsf3u70nvriQBpzuVzX2osJA0ghP4Urx3M5TDai4T5gIJmm', 'marty@gmail.com', '/medias/upload/stifler.jpg'),
(18, 'AL', '$2y$10$sBaGGGynfbYuYJG2fzDMReahdyVJkIARvNG8Za/gPanxubqBiEJmW', 'ag@gmail.com', '/medias/upload/flamand.png'),
(19, 'unknown', '$2y$10$ZQWr8lHTJfMSBzD8Y4He9ulu/YE6E8SljAjB50ZARqeHxGs76CVXG', 'unknown@gmail.com', '/medias/upload/pain.jpeg'),
(20, 'robot', '$2y$10$p4txhMXpdsn7Rt4QBixgyOkke95bIKIBKOlC2.ak9j5BOxIzz6BY.', 'ag@gmail.com', '/medias/upload/irobot.jpeg');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_user_FK` (`id_user`),
  ADD KEY `message_room0_FK` (`id_room`);

--
-- Index pour la table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT pour la table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_room0_FK` FOREIGN KEY (`id_room`) REFERENCES `room` (`id`),
  ADD CONSTRAINT `message_user_FK` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
