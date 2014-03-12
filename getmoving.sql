-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Gazda: 127.0.0.1
-- Timp de generare: 12 Mar 2014 la 07:48
-- Versiune server: 5.6.14
-- Versiune PHP: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Bază de date: `getmoving`
--

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user1` int(11) NOT NULL,
  `id_user2` int(11) NOT NULL,
  `comment` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Salvarea datelor din tabel `comments`
--

INSERT INTO `comments` (`id`, `id_user1`, `id_user2`, `comment`) VALUES
(1, 9, 5, 'Nice website! Congrats!'),
(2, 6, 5, 'Nice Photo');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `dislikes`
--

CREATE TABLE IF NOT EXISTS `dislikes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `dislike` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Salvarea datelor din tabel `dislikes`
--

INSERT INTO `dislikes` (`id`, `id_user`, `dislike`) VALUES
(1, 5, 'Football'),
(2, 5, 'Rain');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `like` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Salvarea datelor din tabel `likes`
--

INSERT INTO `likes` (`id`, `id_user`, `like`) VALUES
(1, 5, 'zumba'),
(2, 5, 'Kangoo Jumps'),
(3, 5, 'Seaside');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` text NOT NULL,
  `secondname` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `gender` text NOT NULL,
  `bmonth` int(11) NOT NULL,
  `bday` int(11) NOT NULL,
  `byear` int(11) NOT NULL,
  `type` text NOT NULL,
  `id_u` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Salvarea datelor din tabel `user`
--

INSERT INTO `user` (`id`, `firstname`, `secondname`, `username`, `password`, `gender`, `bmonth`, `bday`, `byear`, `type`, `id_u`) VALUES
(3, 'default', 'default', 'default', 'default', 'default', 0, 0, 0, 'default', 1),
(5, 'Andra', 'Lungu', 'andra.lungu', 'cd73502828457d15655bbd7a63fbbc8', 'female', 9, 28, 1990, 'regular', 99),
(6, 'lala', 'ala', 'lala', '2e3817293fc275dbee74bd71ce6eb056', 'male', 9, 18, 1990, 'regular', 99),
(7, 'default', 'default', 'default', 'default', 'default', 0, 0, 0, 'default', 2),
(8, 'Rapahel', 'Suire', 'raph.suire', '2e3817293fc275dbee74bd71ce6eb056', 'male', 11, 17, 1990, 'regular', 99),
(9, 'Mihai', 'Toader', 'mihait', '2e3817293fc275dbee74bd71ce6eb056', 'male', 1, 22, 1990, 'regular', 99);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
