-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 16 Décembre 2015 à 17:38
-- Version du serveur :  5.5.46-0+deb8u1
-- Version de PHP :  5.6.14-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `postfix`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Admins';

--
-- Contenu de la table `admin`
--

INSERT INTO `admin` (`username`, `password`, `created`, `modified`, `active`) VALUES
('messagerie@gr6.labos-nantes.ovh', '$1$63719662$iOv.rNiEVAQ7bj7ByolJu/', '2015-12-15 15:02:43', '2015-12-15 15:02:43', 1),
('lethgir@gr6.labos-nantes.ovh', '$1$5a136df2$V7rHjav3CTUm7AZuKvBJT/', '2015-12-15 15:25:22', '2015-12-15 15:25:22', 1);

-- --------------------------------------------------------

--
-- Structure de la table `alias`
--

CREATE TABLE IF NOT EXISTS `alias` (
  `address` varchar(255) NOT NULL,
  `goto` text NOT NULL,
  `domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Aliases';

--
-- Contenu de la table `alias`
--

INSERT INTO `alias` (`address`, `goto`, `domain`, `created`, `modified`, `active`) VALUES
('test@gr6.labos-nantes.ovh', 'test@gr6.labos-nantes.ovh', 'gr6.labos-nantes.ovh', '2015-12-16 09:32:38', '2015-12-16 09:32:38', 1),
('blop@gr6.labos-nantes.ovh', 'blop@gr6.labos-nantes.ovh', 'gr6.labos-nantes.ovh', '2015-12-16 10:09:54', '2015-12-16 10:09:54', 1);

-- --------------------------------------------------------

--
-- Structure de la table `alias_domain`
--

CREATE TABLE IF NOT EXISTS `alias_domain` (
  `alias_domain` varchar(255) NOT NULL,
  `target_domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Domain Aliases';

-- --------------------------------------------------------

--
-- Structure de la table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
`id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  `value` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='PostfixAdmin settings';

--
-- Contenu de la table `config`
--

INSERT INTO `config` (`id`, `name`, `value`) VALUES
(1, 'version', '740');

-- --------------------------------------------------------

--
-- Structure de la table `domain`
--

CREATE TABLE IF NOT EXISTS `domain` (
  `domain` varchar(255) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `aliases` int(10) NOT NULL DEFAULT '0',
  `mailboxes` int(10) NOT NULL DEFAULT '0',
  `maxquota` bigint(20) NOT NULL DEFAULT '0',
  `quota` bigint(20) NOT NULL DEFAULT '0',
  `transport` varchar(255) NOT NULL,
  `backupmx` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Domains';

--
-- Contenu de la table `domain`
--

INSERT INTO `domain` (`domain`, `description`, `aliases`, `mailboxes`, `maxquota`, `quota`, `transport`, `backupmx`, `created`, `modified`, `active`) VALUES
('ALL', '', 0, 0, 0, 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
('gr6.labos-nantes.ovh', '', 10, 0, 10, 0, 'virtual', 0, '2015-12-15 16:00:34', '2015-12-15 16:00:34', 1);

-- --------------------------------------------------------

--
-- Structure de la table `domain_admins`
--

CREATE TABLE IF NOT EXISTS `domain_admins` (
  `username` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Domain Admins';

--
-- Contenu de la table `domain_admins`
--

INSERT INTO `domain_admins` (`username`, `domain`, `created`, `active`) VALUES
('messagerie@gr6.labos-nantes.ovh', 'ALL', '2015-12-15 15:02:43', 1);

-- --------------------------------------------------------

--
-- Structure de la table `fetchmail`
--

CREATE TABLE IF NOT EXISTS `fetchmail` (
`id` int(11) unsigned NOT NULL,
  `mailbox` varchar(255) NOT NULL,
  `src_server` varchar(255) NOT NULL,
  `src_auth` enum('password','kerberos_v5','kerberos','kerberos_v4','gssapi','cram-md5','otp','ntlm','msn','ssh','any') DEFAULT NULL,
  `src_user` varchar(255) NOT NULL,
  `src_password` varchar(255) NOT NULL,
  `src_folder` varchar(255) NOT NULL,
  `poll_time` int(11) unsigned NOT NULL DEFAULT '10',
  `fetchall` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keep` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `protocol` enum('POP3','IMAP','POP2','ETRN','AUTO') DEFAULT NULL,
  `usessl` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `extra_options` text,
  `returned_text` text,
  `mda` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `username` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Log';

--
-- Contenu de la table `log`
--

INSERT INTO `log` (`timestamp`, `username`, `domain`, `action`, `data`) VALUES
('2015-12-16 09:32:38', 'messagerie@gr6.labos-nantes.ovh (172.16.4.1)', 'gr6.labos-nantes.ovh', 'create_mailbox', 'test@gr6.labos-nantes.ovh'),
('2015-12-16 10:09:54', 'messagerie@gr6.labos-nantes.ovh (172.16.4.1)', 'gr6.labos-nantes.ovh', 'create_mailbox', 'blop@gr6.labos-nantes.ovh');

-- --------------------------------------------------------

--
-- Structure de la table `mailbox`
--

CREATE TABLE IF NOT EXISTS `mailbox` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `maildir` varchar(255) NOT NULL,
  `quota` bigint(20) NOT NULL DEFAULT '0',
  `local_part` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Mailboxes';

--
-- Contenu de la table `mailbox`
--

INSERT INTO `mailbox` (`username`, `password`, `name`, `maildir`, `quota`, `local_part`, `domain`, `created`, `modified`, `active`) VALUES
('test@gr6.labos-nantes.ovh', '$1$ae032c04$RBt33un5uMlah0wL0Yt2b0', 'test', 'test@gr6.labos-nantes.ovh/', 0, 'test', 'gr6.labos-nantes.ovh', '2015-12-16 09:32:38', '2015-12-16 09:32:38', 1),
('blop@gr6.labos-nantes.ovh', '$1$8228360c$iBuRADwa47feSsfnzDvEu0', 'blop blop', 'blop@gr6.labos-nantes.ovh/', 0, 'blop', 'gr6.labos-nantes.ovh', '2015-12-16 10:09:54', '2015-12-16 10:09:54', 1);

-- --------------------------------------------------------

--
-- Structure de la table `quota`
--

CREATE TABLE IF NOT EXISTS `quota` (
  `username` varchar(255) NOT NULL,
  `path` varchar(100) NOT NULL,
  `current` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `quota2`
--

CREATE TABLE IF NOT EXISTS `quota2` (
  `username` varchar(100) NOT NULL,
  `bytes` bigint(20) NOT NULL DEFAULT '0',
  `messages` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vacation`
--

CREATE TABLE IF NOT EXISTS `vacation` (
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 NOT NULL,
  `body` text CHARACTER SET utf8 NOT NULL,
  `cache` text NOT NULL,
  `domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Vacation';

-- --------------------------------------------------------

--
-- Structure de la table `vacation_notification`
--

CREATE TABLE IF NOT EXISTS `vacation_notification` (
  `on_vacation` varchar(255) CHARACTER SET latin1 NOT NULL,
  `notified` varchar(255) CHARACTER SET latin1 NOT NULL,
  `notified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Postfix Admin - Virtual Vacation Notifications';

--
-- Index pour les tables exportées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`username`);

--
-- Index pour la table `alias`
--
ALTER TABLE `alias`
 ADD PRIMARY KEY (`address`), ADD KEY `domain` (`domain`);

--
-- Index pour la table `alias_domain`
--
ALTER TABLE `alias_domain`
 ADD PRIMARY KEY (`alias_domain`), ADD KEY `active` (`active`), ADD KEY `target_domain` (`target_domain`);

--
-- Index pour la table `config`
--
ALTER TABLE `config`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `domain`
--
ALTER TABLE `domain`
 ADD PRIMARY KEY (`domain`);

--
-- Index pour la table `domain_admins`
--
ALTER TABLE `domain_admins`
 ADD KEY `username` (`username`);

--
-- Index pour la table `fetchmail`
--
ALTER TABLE `fetchmail`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `log`
--
ALTER TABLE `log`
 ADD KEY `timestamp` (`timestamp`);

--
-- Index pour la table `mailbox`
--
ALTER TABLE `mailbox`
 ADD PRIMARY KEY (`username`), ADD KEY `domain` (`domain`);

--
-- Index pour la table `quota`
--
ALTER TABLE `quota`
 ADD PRIMARY KEY (`username`,`path`);

--
-- Index pour la table `quota2`
--
ALTER TABLE `quota2`
 ADD PRIMARY KEY (`username`);

--
-- Index pour la table `vacation`
--
ALTER TABLE `vacation`
 ADD PRIMARY KEY (`email`), ADD KEY `email` (`email`);

--
-- Index pour la table `vacation_notification`
--
ALTER TABLE `vacation_notification`
 ADD PRIMARY KEY (`on_vacation`,`notified`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `config`
--
ALTER TABLE `config`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `fetchmail`
--
ALTER TABLE `fetchmail`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `vacation_notification`
--
ALTER TABLE `vacation_notification`
ADD CONSTRAINT `vacation_notification_pkey` FOREIGN KEY (`on_vacation`) REFERENCES `vacation` (`email`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
