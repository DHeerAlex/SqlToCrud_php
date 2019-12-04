-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 29 avr. 2019 à 16:25
-- Version du serveur :  10.1.37-MariaDB
-- Version de PHP :  7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  cda1
--
CREATE DATABASE IF NOT EXISTS cda1 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE cda1;

-- --------------------------------------------------------

--
-- Structure de la table acteur
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE acteur (
  idUser int(11) NOT NULL,
  nomAct varchar(150) NOT NULL,
  prenomAct varchar(150) NOT NULL,
  surnom varchar(150) DEFAULT NULL,
  biographie text,
  idPays smallint(5) NOT NULL,
  idType int(11) NOT NULL,
  photoProfil varchar(150) NOT NULL DEFAULT 'dft_act.png',
  photoBack varchar(150) NOT NULL DEFAULT 'dft_act.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table activite
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE activite (
  idActivite int(255) NOT NULL,
  idUser int(11) DEFAULT NULL,
  idTypeA int(11) NOT NULL,
  nom varchar(255) DEFAULT NULL,
  mail varchar(255) DEFAULT NULL,
  date datetime NOT NULL,
  important int(4) NOT NULL DEFAULT '1',
  affiche int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table activite
--

INSERT INTO activite (idActivite, idUser, idTypeA, nom, mail, `date`, important, affiche) VALUES
(1, 2, 1, NULL, NULL, '2019-04-28 00:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table admin
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE `admin` (
  idUser int(11) NOT NULL,
  nomA varchar(150) NOT NULL,
  prenomA varchar(150) NOT NULL,
  photoProfil varchar(255) NOT NULL DEFAULT 'dft_adm.png',
  photoBack varchar(255) NOT NULL DEFAULT 'dft_adm.png'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table admin
--

INSERT INTO admin (idUser, nomA, prenomA, photoProfil, photoBack) VALUES
(1, 'Admin', 'Admin', 'dft_adm.png', 'dft_adm.png');

-- --------------------------------------------------------

--
-- Structure de la table article
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE article (
  idArticle int(255) NOT NULL,
  idUser int(11) NOT NULL,
  typeArticle varchar(11) NOT NULL DEFAULT 'article',
  titre varchar(255) NOT NULL,
  description text,
  lien varchar(255) DEFAULT NULL,
  page varchar(255) DEFAULT NULL COMMENT 'html,php,pdf',
  image varchar(255) NOT NULL DEFAULT 'default.jpg',
  date datetime NOT NULL,
  nbVues int(4) NOT NULL DEFAULT '0',
  nbComments int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table article
--

INSERT INTO article (idArticle, idUser, typeArticle, titre, description, lien, `page`, image, `date`, nbVues, nbComments) VALUES
(1, 1, 'communautés', 'Les chantres du réseau', 'Bienvenue dans la communauté internationale des chantres.', NULL, NULL, 'default.jpg', '2019-04-13 20:45:47', 0, 0),
(2, 1, 'communautés', 'Les musiciens du réseau', 'Bienvenue dans la communauté internationale des musiciens.', NULL, NULL, 'default.jpg', '2019-04-13 20:45:47', 0, 0),
(3, 1, 'communautés', 'Les danseurs liturgiques du réseau', 'Bienvenue dans la communauté internationale des danseurs liturgiques.', NULL, NULL, 'default.jpg', '2019-04-13 20:45:47', 0, 0),
(4, 1, 'communautés', 'Les coach vocaux du réseau', 'Bienvenue dans la communauté internationale des coach vocaux.', NULL, NULL, 'default.jpg', '2019-04-13 20:45:47', 0, 0),
(5, 1, 'communautés', 'Les prédicateurs du réseau', 'Bienvenue dans la communauté internationale des prédicateurs.', NULL, NULL, 'default.jpg', '2019-04-13 20:45:47', 0, 0),
(6, 1, 'communautés', 'Les chorales du réseau', 'Bienvenue dans la communauté internationale des chorales.', NULL, NULL, 'default.jpg', '2019-04-13 20:45:47', 0, 0),
(7, 1, 'communautés', 'Les groupes de louanges du réseau', 'Bienvenue dans la communauté internationale des groupes de louanges.', NULL, NULL, 'default.jpg', '2019-04-13 20:45:47', 0, 0),
(8, 1, 'communautés', 'Les écoles de louanges du réseau', 'Bienvenue dans la communauté internationale des écoles de louanges.', NULL, NULL, 'default.jpg', '2019-04-13 20:45:47', 0, 0),
(9, 1, 'communautés', 'Les écoles de musique du réseau', 'Bienvenue dans la communauté internationale des écoles de musique.', NULL, NULL, 'default.jpg', '2019-04-13 20:45:47', 0, 0),
(10, 1, 'communautés', 'Les groupe de danses liturgiques du réseau', 'Bienvenue dans la communauté internationale des groupe de danses liturgiques.', NULL, NULL, 'default.jpg', '2019-04-13 20:45:47', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table comments
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE comments (
  idComment int(11) NOT NULL,
  idArticle int(11) NOT NULL,
  idUser int(11) DEFAULT NULL,
  nom varchar(255) DEFAULT NULL,
  mail varchar(255) DEFAULT NULL,
  comment varchar(255) NOT NULL,
  date datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table contacts
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE contacts (
  idMess_con int(11) NOT NULL,
  nom varchar(255) NOT NULL,
  mail varchar(255) NOT NULL,
  objet varchar(255) NOT NULL,
  message text NOT NULL,
  date datetime NOT NULL,
  etat int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table contact_user
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE contact_user (
  idUser int(11) NOT NULL,
  mail varchar(255) NOT NULL,
  tel varchar(255) NOT NULL,
  n_adr varchar(255) DEFAULT NULL,
  rue_adr varchar(255) DEFAULT NULL,
  ville_adr varchar(255) DEFAULT NULL,
  twitter varchar(255) DEFAULT NULL,
  facebook varchar(255) DEFAULT NULL,
  linkedIn varchar(255) DEFAULT NULL,
  instagram varchar(255) DEFAULT NULL,
  reddit varchar(255) DEFAULT NULL,
  youtube varchar(255) DEFAULT NULL,
  twitch varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table contact_user
--

INSERT INTO contact_user (idUser, mail, tel, n_adr, rue_adr, ville_adr, twitter, facebook, linkedIn, instagram, reddit, youtube, twitch) VALUES
(1, 'defautAdmin@defautAdmin.da', '0770154438', '171', 'rue Saint-Leu', 'Amiens', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table friends
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE friends (
  idA int(11) NOT NULL COMMENT 'session',
  idB int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table gestion
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE gestion (
  id int(11) NOT NULL,
  description varchar(150) NOT NULL,
  dispo tinyint(1) NOT NULL DEFAULT '1',
  fonctionnel tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table gestion
--

INSERT INTO gestion (id, description, dispo, fonctionnel) VALUES
(1, 'shop', 0, 0),
(2, 'web tv', 0, 0),
(3, 'langue', 1, 1),
(4, 'Rech', 0, 0),
(5, 'Annuaire part', 1, 1),
(6, 'Annuaire orga', 1, 1),
(7, 'Gestion compte', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table infos
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE infos (
  adresse varchar(255) NOT NULL,
  ville varchar(255) NOT NULL,
  cp varchar(255) NOT NULL,
  idPays smallint(5) NOT NULL,
  map_loc text NOT NULL,
  tel varchar(255) NOT NULL,
  mail varchar(255) NOT NULL,
  fax varchar(255) DEFAULT NULL,
  twitter varchar(255) DEFAULT NULL,
  facebook varchar(255) DEFAULT NULL,
  linkedIn varchar(255) DEFAULT NULL,
  instagram varchar(255) DEFAULT NULL,
  reddit varchar(255) DEFAULT NULL,
  youtube varchar(255) DEFAULT NULL,
  twitch varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table infos
--

INSERT INTO infos (adresse, ville, cp, idPays, map_loc, tel, mail, fax, twitter, facebook, linkedIn, instagram, reddit, youtube, twitch) VALUES
('171 rue Saint-Leu', 'Amiens', '80000', 75, '', '0770154438', 'infos_cda@ganaxad.fr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table messages
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE messages (
  idMessage int(255) NOT NULL,
  idA int(11) NOT NULL,
  idB int(11) NOT NULL,
  message varchar(255) NOT NULL,
  date datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table notation
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE notation (
  idA int(11) NOT NULL COMMENT 'session',
  idB int(11) NOT NULL,
  note int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table organisation
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE organisation (
  idUser int(11) NOT NULL,
  nomOrga varchar(150) NOT NULL,
  sigle varchar(150) DEFAULT NULL,
  description text,
  nomModo varchar(150) NOT NULL,
  prenomModo varchar(150) NOT NULL,
  idPays smallint(5) NOT NULL,
  idType int(11) NOT NULL,
  photoProfil varchar(150) NOT NULL DEFAULT 'dft_org.jpg',
  photoBack varchar(150) NOT NULL DEFAULT 'dft_org.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table organisation
--

INSERT INTO organisation (idUser, nomOrga, sigle, description, nomModo, prenomModo, idPays, idType, photoProfil, photoBack) VALUES
(2, 'Orga', '', '', '', '', 1, 6, 'dft_org.jpg', 'dft_org.jpg');

-- --------------------------------------------------------

--
-- Structure de la table pays
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE pays (
  id smallint(5) NOT NULL,
  code int(3) NOT NULL,
  alpha2 varchar(2) NOT NULL,
  alpha3 varchar(3) NOT NULL,
  nom_en varchar(45) NOT NULL,
  nom_fr varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table pays
--

INSERT INTO pays (id, `code`, alpha2, alpha3, nom_en, nom_fr) VALUES
(1, 4, 'AF', 'AFG', 'Afghanistan', 'Afghanistan'),
(2, 8, 'AL', 'ALB', 'Albania', 'Albanie'),
(3, 10, 'AQ', 'ATA', 'Antarctica', 'Antarctique'),
(4, 12, 'DZ', 'DZA', 'Algeria', 'Algérie'),
(5, 16, 'AS', 'ASM', 'American Samoa', 'Samoa Américaines'),
(6, 20, 'AD', 'AND', 'Andorra', 'Andorre'),
(7, 24, 'AO', 'AGO', 'Angola', 'Angola'),
(8, 28, 'AG', 'ATG', 'Antigua and Barbuda', 'Antigua-et-Barbuda'),
(9, 31, 'AZ', 'AZE', 'Azerbaijan', 'Azerbaïdjan'),
(10, 32, 'AR', 'ARG', 'Argentina', 'Argentine'),
(11, 36, 'AU', 'AUS', 'Australia', 'Australie'),
(12, 40, 'AT', 'AUT', 'Austria', 'Autriche'),
(13, 44, 'BS', 'BHS', 'Bahamas', 'Bahamas'),
(14, 48, 'BH', 'BHR', 'Bahrain', 'Bahreïn'),
(15, 50, 'BD', 'BGD', 'Bangladesh', 'Bangladesh'),
(16, 51, 'AM', 'ARM', 'Armenia', 'Arménie'),
(17, 52, 'BB', 'BRB', 'Barbados', 'Barbade'),
(18, 56, 'BE', 'BEL', 'Belgium', 'Belgique'),
(19, 60, 'BM', 'BMU', 'Bermuda', 'Bermudes'),
(20, 64, 'BT', 'BTN', 'Bhutan', 'Bhoutan'),
(21, 68, 'BO', 'BOL', 'Bolivia', 'Bolivie'),
(22, 70, 'BA', 'BIH', 'Bosnia and Herzegovina', 'Bosnie-Herzégovine'),
(23, 72, 'BW', 'BWA', 'Botswana', 'Botswana'),
(24, 74, 'BV', 'BVT', 'Bouvet Island', 'Île Bouvet'),
(25, 76, 'BR', 'BRA', 'Brazil', 'Brésil'),
(26, 84, 'BZ', 'BLZ', 'Belize', 'Belize'),
(27, 86, 'IO', 'IOT', 'British Indian Ocean Territory', 'Territoire Britannique de l\'Océan Indien'),
(28, 90, 'SB', 'SLB', 'Solomon Islands', 'Îles Salomon'),
(29, 92, 'VG', 'VGB', 'British Virgin Islands', 'Îles Vierges Britanniques'),
(30, 96, 'BN', 'BRN', 'Brunei Darussalam', 'Brunéi Darussalam'),
(31, 100, 'BG', 'BGR', 'Bulgaria', 'Bulgarie'),
(32, 104, 'MM', 'MMR', 'Myanmar', 'Myanmar'),
(33, 108, 'BI', 'BDI', 'Burundi', 'Burundi'),
(34, 112, 'BY', 'BLR', 'Belarus', 'Bélarus'),
(35, 116, 'KH', 'KHM', 'Cambodia', 'Cambodge'),
(36, 120, 'CM', 'CMR', 'Cameroon', 'Cameroun'),
(37, 124, 'CA', 'CAN', 'Canada', 'Canada'),
(38, 132, 'CV', 'CPV', 'Cape Verde', 'Cap-vert'),
(39, 136, 'KY', 'CYM', 'Cayman Islands', 'Îles Caïmanes'),
(40, 140, 'CF', 'CAF', 'Central African', 'République Centrafricaine'),
(41, 144, 'LK', 'LKA', 'Sri Lanka', 'Sri Lanka'),
(42, 148, 'TD', 'TCD', 'Chad', 'Tchad'),
(43, 152, 'CL', 'CHL', 'Chile', 'Chili'),
(44, 156, 'CN', 'CHN', 'China', 'Chine'),
(45, 158, 'TW', 'TWN', 'Taiwan', 'Taïwan'),
(46, 162, 'CX', 'CXR', 'Christmas Island', 'Île Christmas'),
(47, 166, 'CC', 'CCK', 'Cocos (Keeling) Islands', 'Îles Cocos (Keeling)'),
(48, 170, 'CO', 'COL', 'Colombia', 'Colombie'),
(49, 174, 'KM', 'COM', 'Comoros', 'Comores'),
(50, 175, 'YT', 'MYT', 'Mayotte', 'Mayotte'),
(51, 178, 'CG', 'COG', 'Republic of the Congo', 'République du Congo'),
(52, 180, 'CD', 'COD', 'The Democratic Republic Of The Congo', 'République Démocratique du Congo'),
(53, 184, 'CK', 'COK', 'Cook Islands', 'Îles Cook'),
(54, 188, 'CR', 'CRI', 'Costa Rica', 'Costa Rica'),
(55, 191, 'HR', 'HRV', 'Croatia', 'Croatie'),
(56, 192, 'CU', 'CUB', 'Cuba', 'Cuba'),
(57, 196, 'CY', 'CYP', 'Cyprus', 'Chypre'),
(58, 203, 'CZ', 'CZE', 'Czech Republic', 'République Tchèque'),
(59, 204, 'BJ', 'BEN', 'Benin', 'Bénin'),
(60, 208, 'DK', 'DNK', 'Denmark', 'Danemark'),
(61, 212, 'DM', 'DMA', 'Dominica', 'Dominique'),
(62, 214, 'DO', 'DOM', 'Dominican Republic', 'République Dominicaine'),
(63, 218, 'EC', 'ECU', 'Ecuador', 'Équateur'),
(64, 222, 'SV', 'SLV', 'El Salvador', 'El Salvador'),
(65, 226, 'GQ', 'GNQ', 'Equatorial Guinea', 'Guinée Équatoriale'),
(66, 231, 'ET', 'ETH', 'Ethiopia', 'Éthiopie'),
(67, 232, 'ER', 'ERI', 'Eritrea', 'Érythrée'),
(68, 233, 'EE', 'EST', 'Estonia', 'Estonie'),
(69, 234, 'FO', 'FRO', 'Faroe Islands', 'Îles Féroé'),
(70, 238, 'FK', 'FLK', 'Falkland Islands', 'Îles (malvinas) Falkland'),
(71, 239, 'GS', 'SGS', 'South Georgia and the South Sandwich Islands', 'Géorgie du Sud et les Îles Sandwich du Sud'),
(72, 242, 'FJ', 'FJI', 'Fiji', 'Fidji'),
(73, 246, 'FI', 'FIN', 'Finland', 'Finlande'),
(74, 248, 'AX', 'ALA', 'Åland Islands', 'Îles Åland'),
(75, 250, 'FR', 'FRA', 'France', 'France'),
(76, 254, 'GF', 'GUF', 'French Guiana', 'Guyane Française'),
(77, 258, 'PF', 'PYF', 'French Polynesia', 'Polynésie Française'),
(78, 260, 'TF', 'ATF', 'French Southern Territories', 'Terres Australes Françaises'),
(79, 262, 'DJ', 'DJI', 'Djibouti', 'Djibouti'),
(80, 266, 'GA', 'GAB', 'Gabon', 'Gabon'),
(81, 268, 'GE', 'GEO', 'Georgia', 'Géorgie'),
(82, 270, 'GM', 'GMB', 'Gambia', 'Gambie'),
(83, 275, 'PS', 'PSE', 'Occupied Palestinian Territory', 'Territoire Palestinien Occupé'),
(84, 276, 'DE', 'DEU', 'Germany', 'Allemagne'),
(85, 288, 'GH', 'GHA', 'Ghana', 'Ghana'),
(86, 292, 'GI', 'GIB', 'Gibraltar', 'Gibraltar'),
(87, 296, 'KI', 'KIR', 'Kiribati', 'Kiribati'),
(88, 300, 'GR', 'GRC', 'Greece', 'Grèce'),
(89, 304, 'GL', 'GRL', 'Greenland', 'Groenland'),
(90, 308, 'GD', 'GRD', 'Grenada', 'Grenade'),
(91, 312, 'GP', 'GLP', 'Guadeloupe', 'Guadeloupe'),
(92, 316, 'GU', 'GUM', 'Guam', 'Guam'),
(93, 320, 'GT', 'GTM', 'Guatemala', 'Guatemala'),
(94, 324, 'GN', 'GIN', 'Guinea', 'Guinée'),
(95, 328, 'GY', 'GUY', 'Guyana', 'Guyana'),
(96, 332, 'HT', 'HTI', 'Haiti', 'Haïti'),
(97, 334, 'HM', 'HMD', 'Heard Island and McDonald Islands', 'Îles Heard et Mcdonald'),
(98, 336, 'VA', 'VAT', 'Vatican City State', 'Saint-Siège (état de la Cité du Vatican)'),
(99, 340, 'HN', 'HND', 'Honduras', 'Honduras'),
(100, 344, 'HK', 'HKG', 'Hong Kong', 'Hong-Kong'),
(101, 348, 'HU', 'HUN', 'Hungary', 'Hongrie'),
(102, 352, 'IS', 'ISL', 'Iceland', 'Islande'),
(103, 356, 'IN', 'IND', 'India', 'Inde'),
(104, 360, 'ID', 'IDN', 'Indonesia', 'Indonésie'),
(105, 364, 'IR', 'IRN', 'Islamic Republic of Iran', 'République Islamique d\'Iran'),
(106, 368, 'IQ', 'IRQ', 'Iraq', 'Iraq'),
(107, 372, 'IE', 'IRL', 'Ireland', 'Irlande'),
(108, 376, 'IL', 'ISR', 'Israel', 'Israël'),
(109, 380, 'IT', 'ITA', 'Italy', 'Italie'),
(110, 384, 'CI', 'CIV', 'Côte d\'Ivoire', 'Côte d\'Ivoire'),
(111, 388, 'JM', 'JAM', 'Jamaica', 'Jamaïque'),
(112, 392, 'JP', 'JPN', 'Japan', 'Japon'),
(113, 398, 'KZ', 'KAZ', 'Kazakhstan', 'Kazakhstan'),
(114, 400, 'JO', 'JOR', 'Jordan', 'Jordanie'),
(115, 404, 'KE', 'KEN', 'Kenya', 'Kenya'),
(116, 408, 'KP', 'PRK', 'Democratic People\'s Republic of Korea', 'République Populaire Démocratique de Corée'),
(117, 410, 'KR', 'KOR', 'Republic of Korea', 'République de Corée'),
(118, 414, 'KW', 'KWT', 'Kuwait', 'Koweït'),
(119, 417, 'KG', 'KGZ', 'Kyrgyzstan', 'Kirghizistan'),
(120, 418, 'LA', 'LAO', 'Lao People\'s Democratic Republic', 'République Démocratique Populaire Lao'),
(121, 422, 'LB', 'LBN', 'Lebanon', 'Liban'),
(122, 426, 'LS', 'LSO', 'Lesotho', 'Lesotho'),
(123, 428, 'LV', 'LVA', 'Latvia', 'Lettonie'),
(124, 430, 'LR', 'LBR', 'Liberia', 'Libéria'),
(125, 434, 'LY', 'LBY', 'Libyan Arab Jamahiriya', 'Jamahiriya Arabe Libyenne'),
(126, 438, 'LI', 'LIE', 'Liechtenstein', 'Liechtenstein'),
(127, 440, 'LT', 'LTU', 'Lithuania', 'Lituanie'),
(128, 442, 'LU', 'LUX', 'Luxembourg', 'Luxembourg'),
(129, 446, 'MO', 'MAC', 'Macao', 'Macao'),
(130, 450, 'MG', 'MDG', 'Madagascar', 'Madagascar'),
(131, 454, 'MW', 'MWI', 'Malawi', 'Malawi'),
(132, 458, 'MY', 'MYS', 'Malaysia', 'Malaisie'),
(133, 462, 'MV', 'MDV', 'Maldives', 'Maldives'),
(134, 466, 'ML', 'MLI', 'Mali', 'Mali'),
(135, 470, 'MT', 'MLT', 'Malta', 'Malte'),
(136, 474, 'MQ', 'MTQ', 'Martinique', 'Martinique'),
(137, 478, 'MR', 'MRT', 'Mauritania', 'Mauritanie'),
(138, 480, 'MU', 'MUS', 'Mauritius', 'Maurice'),
(139, 484, 'MX', 'MEX', 'Mexico', 'Mexique'),
(140, 492, 'MC', 'MCO', 'Monaco', 'Monaco'),
(141, 496, 'MN', 'MNG', 'Mongolia', 'Mongolie'),
(142, 498, 'MD', 'MDA', 'Republic of Moldova', 'République de Moldova'),
(143, 500, 'MS', 'MSR', 'Montserrat', 'Montserrat'),
(144, 504, 'MA', 'MAR', 'Morocco', 'Maroc'),
(145, 508, 'MZ', 'MOZ', 'Mozambique', 'Mozambique'),
(146, 512, 'OM', 'OMN', 'Oman', 'Oman'),
(147, 516, 'NA', 'NAM', 'Namibia', 'Namibie'),
(148, 520, 'NR', 'NRU', 'Nauru', 'Nauru'),
(149, 524, 'NP', 'NPL', 'Nepal', 'Népal'),
(150, 528, 'NL', 'NLD', 'Netherlands', 'Pays-Bas'),
(151, 530, 'AN', 'ANT', 'Netherlands Antilles', 'Antilles Néerlandaises'),
(152, 533, 'AW', 'ABW', 'Aruba', 'Aruba'),
(153, 540, 'NC', 'NCL', 'New Caledonia', 'Nouvelle-Calédonie'),
(154, 548, 'VU', 'VUT', 'Vanuatu', 'Vanuatu'),
(155, 554, 'NZ', 'NZL', 'New Zealand', 'Nouvelle-Zélande'),
(156, 558, 'NI', 'NIC', 'Nicaragua', 'Nicaragua'),
(157, 562, 'NE', 'NER', 'Niger', 'Niger'),
(158, 566, 'NG', 'NGA', 'Nigeria', 'Nigéria'),
(159, 570, 'NU', 'NIU', 'Niue', 'Niué'),
(160, 574, 'NF', 'NFK', 'Norfolk Island', 'Île Norfolk'),
(161, 578, 'NO', 'NOR', 'Norway', 'Norvège'),
(162, 580, 'MP', 'MNP', 'Northern Mariana Islands', 'Îles Mariannes du Nord'),
(163, 581, 'UM', 'UMI', 'United States Minor Outlying Islands', 'Îles Mineures Éloignées des États-Unis'),
(164, 583, 'FM', 'FSM', 'Federated States of Micronesia', 'États Fédérés de Micronésie'),
(165, 584, 'MH', 'MHL', 'Marshall Islands', 'Îles Marshall'),
(166, 585, 'PW', 'PLW', 'Palau', 'Palaos'),
(167, 586, 'PK', 'PAK', 'Pakistan', 'Pakistan'),
(168, 591, 'PA', 'PAN', 'Panama', 'Panama'),
(169, 598, 'PG', 'PNG', 'Papua New Guinea', 'Papouasie-Nouvelle-Guinée'),
(170, 600, 'PY', 'PRY', 'Paraguay', 'Paraguay'),
(171, 604, 'PE', 'PER', 'Peru', 'Pérou'),
(172, 608, 'PH', 'PHL', 'Philippines', 'Philippines'),
(173, 612, 'PN', 'PCN', 'Pitcairn', 'Pitcairn'),
(174, 616, 'PL', 'POL', 'Poland', 'Pologne'),
(175, 620, 'PT', 'PRT', 'Portugal', 'Portugal'),
(176, 624, 'GW', 'GNB', 'Guinea-Bissau', 'Guinée-Bissau'),
(177, 626, 'TL', 'TLS', 'Timor-Leste', 'Timor-Leste'),
(178, 630, 'PR', 'PRI', 'Puerto Rico', 'Porto Rico'),
(179, 634, 'QA', 'QAT', 'Qatar', 'Qatar'),
(180, 638, 'RE', 'REU', 'Réunion', 'Réunion'),
(181, 642, 'RO', 'ROU', 'Romania', 'Roumanie'),
(182, 643, 'RU', 'RUS', 'Russian Federation', 'Fédération de Russie'),
(183, 646, 'RW', 'RWA', 'Rwanda', 'Rwanda'),
(184, 654, 'SH', 'SHN', 'Saint Helena', 'Sainte-Hélène'),
(185, 659, 'KN', 'KNA', 'Saint Kitts and Nevis', 'Saint-Kitts-et-Nevis'),
(186, 660, 'AI', 'AIA', 'Anguilla', 'Anguilla'),
(187, 662, 'LC', 'LCA', 'Saint Lucia', 'Sainte-Lucie'),
(188, 666, 'PM', 'SPM', 'Saint-Pierre and Miquelon', 'Saint-Pierre-et-Miquelon'),
(189, 670, 'VC', 'VCT', 'Saint Vincent and the Grenadines', 'Saint-Vincent-et-les Grenadines'),
(190, 674, 'SM', 'SMR', 'San Marino', 'Saint-Marin'),
(191, 678, 'ST', 'STP', 'Sao Tome and Principe', 'Sao Tomé-et-Principe'),
(192, 682, 'SA', 'SAU', 'Saudi Arabia', 'Arabie Saoudite'),
(193, 686, 'SN', 'SEN', 'Senegal', 'Sénégal'),
(194, 690, 'SC', 'SYC', 'Seychelles', 'Seychelles'),
(195, 694, 'SL', 'SLE', 'Sierra Leone', 'Sierra Leone'),
(196, 702, 'SG', 'SGP', 'Singapore', 'Singapour'),
(197, 703, 'SK', 'SVK', 'Slovakia', 'Slovaquie'),
(198, 704, 'VN', 'VNM', 'Vietnam', 'Viet Nam'),
(199, 705, 'SI', 'SVN', 'Slovenia', 'Slovénie'),
(200, 706, 'SO', 'SOM', 'Somalia', 'Somalie'),
(201, 710, 'ZA', 'ZAF', 'South Africa', 'Afrique du Sud'),
(202, 716, 'ZW', 'ZWE', 'Zimbabwe', 'Zimbabwe'),
(203, 724, 'ES', 'ESP', 'Spain', 'Espagne'),
(204, 732, 'EH', 'ESH', 'Western Sahara', 'Sahara Occidental'),
(205, 736, 'SD', 'SDN', 'Sudan', 'Soudan'),
(206, 740, 'SR', 'SUR', 'Suriname', 'Suriname'),
(207, 744, 'SJ', 'SJM', 'Svalbard and Jan Mayen', 'Svalbard et Île Jan Mayen'),
(208, 748, 'SZ', 'SWZ', 'Swaziland', 'Swaziland'),
(209, 752, 'SE', 'SWE', 'Sweden', 'Suède'),
(210, 756, 'CH', 'CHE', 'Switzerland', 'Suisse'),
(211, 760, 'SY', 'SYR', 'Syrian Arab Republic', 'République Arabe Syrienne'),
(212, 762, 'TJ', 'TJK', 'Tajikistan', 'Tadjikistan'),
(213, 764, 'TH', 'THA', 'Thailand', 'Thaïlande'),
(214, 768, 'TG', 'TGO', 'Togo', 'Togo'),
(215, 772, 'TK', 'TKL', 'Tokelau', 'Tokelau'),
(216, 776, 'TO', 'TON', 'Tonga', 'Tonga'),
(217, 780, 'TT', 'TTO', 'Trinidad and Tobago', 'Trinité-et-Tobago'),
(218, 784, 'AE', 'ARE', 'United Arab Emirates', 'Émirats Arabes Unis'),
(219, 788, 'TN', 'TUN', 'Tunisia', 'Tunisie'),
(220, 792, 'TR', 'TUR', 'Turkey', 'Turquie'),
(221, 795, 'TM', 'TKM', 'Turkmenistan', 'Turkménistan'),
(222, 796, 'TC', 'TCA', 'Turks and Caicos Islands', 'Îles Turks et Caïques'),
(223, 798, 'TV', 'TUV', 'Tuvalu', 'Tuvalu'),
(224, 800, 'UG', 'UGA', 'Uganda', 'Ouganda'),
(225, 804, 'UA', 'UKR', 'Ukraine', 'Ukraine'),
(226, 807, 'MK', 'MKD', 'The Former Yugoslav Republic of Macedonia', 'L\'ex-République Yougoslave de Macédoine'),
(227, 818, 'EG', 'EGY', 'Egypt', 'Égypte'),
(228, 826, 'GB', 'GBR', 'United Kingdom', 'Royaume-Uni'),
(229, 833, 'IM', 'IMN', 'Isle of Man', 'Île de Man'),
(230, 834, 'TZ', 'TZA', 'United Republic Of Tanzania', 'République-Unie de Tanzanie'),
(231, 840, 'US', 'USA', 'United States', 'États-Unis'),
(232, 850, 'VI', 'VIR', 'U.S. Virgin Islands', 'Îles Vierges des États-Unis'),
(233, 854, 'BF', 'BFA', 'Burkina Faso', 'Burkina Faso'),
(234, 858, 'UY', 'URY', 'Uruguay', 'Uruguay'),
(235, 860, 'UZ', 'UZB', 'Uzbekistan', 'Ouzbékistan'),
(236, 862, 'VE', 'VEN', 'Venezuela', 'Venezuela'),
(237, 876, 'WF', 'WLF', 'Wallis and Futuna', 'Wallis et Futuna'),
(238, 882, 'WS', 'WSM', 'Samoa', 'Samoa'),
(239, 887, 'YE', 'YEM', 'Yemen', 'Yémen'),
(240, 891, 'CS', 'SCG', 'Serbia and Montenegro', 'Serbie-et-Monténégro'),
(241, 894, 'ZM', 'ZMB', 'Zambia', 'Zambie');

-- --------------------------------------------------------

--
-- Structure de la table `position`
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE position (
  idPosition int(11) NOT NULL,
  lib_pos varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `position`
--

INSERT INTO `position` (idPosition, lib_pos) VALUES
(1, 'bigone_1'),
(2, 'bigone_2'),
(3, 'bigone_3'),
(4, 'bigslide_1'),
(5, 'bigslide_2'),
(6, 'bigslide_3'),
(7, 'faq');

-- --------------------------------------------------------

--
-- Structure de la table pos_art
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE pos_art (
  idArticle int(255) NOT NULL,
  idPosition int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table tag
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE tag (
  idTag int(11) NOT NULL,
  libelle varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table tag
--

INSERT INTO tag (idTag, libelle) VALUES
(1, 'Nouveauté'),
(2, 'CoeurAfricain'),
(3, 'FaimDeBonheur'),
(4, 'Foire aux Questions');

-- --------------------------------------------------------

--
-- Structure de la table tag_art
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE tag_art (
  idArticle int(255) NOT NULL,
  idTag int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table ticket
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE ticket (
  idTicket int(255) NOT NULL,
  idUser int(11) NOT NULL,
  objet varchar(255) NOT NULL,
  détails text NOT NULL,
  date datetime NOT NULL,
  etat varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table typeactivite
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE typeactivite (
  idTypeA int(11) NOT NULL,
  lib_act_fr varchar(255) NOT NULL,
  lib_act_en varchar(255) NOT NULL,
  affich_imp int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table typeactivite
--

INSERT INTO typeactivite (idTypeA, lib_act_fr, lib_act_en, affich_imp) VALUES
(1, 'vient de s\'inscrire', 'just registered', 1),
(2, 'vient de modifier sa photo de profil', 'just edited his profile picture', 0),
(3, 'vient de modifier sa photo de couverture', 'just edited his cover picture', 0),
(4, 'vient de publier un article', 'just published an article', 1),
(5, 'vient de modifier son profil', 'just edited his profile', 0),
(6, 'vient de commenter un article', 'just commented an article', 0),
(7, 'vient de se connecter', 'has just connected', 0),
(8, 'vient de se déconnecter', 'has just disconnected', 0),
(9, 'vient de donner une note à quelqu\'un', 'just gave a note to someone', 0),
(10, 'vient d\'envoyer un message à quelqu\'un', 'just sent a message to someone', 1),
(11, 'vient de demander une amitié avec quelqu\'un', 'just asked someone for a friendship', 1);

-- --------------------------------------------------------

--
-- Structure de la table typeuser
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE typeuser (
  idTypeUser int(11) NOT NULL,
  lib_fr varchar(255) NOT NULL,
  lib_en varchar(255) NOT NULL,
  lib_fr_plr varchar(255) NOT NULL,
  lib_en_plr varchar(255) NOT NULL,
  image varchar(255) NOT NULL DEFAULT 'default.jpg',
  groupe int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table typeuser
--

INSERT INTO typeuser (idTypeUser, lib_fr, lib_en, lib_fr_plr, lib_en_plr, image, groupe) VALUES
(1, 'chantre', 'cantor', 'chantres', 'cantors', 'chantres.jpg', 0),
(2, 'musicien', 'musician', 'musiciens', 'musicians', 'musiciens.jpg', 0),
(3, 'danseur liturgique', 'liturgical dancer', 'danseurs liturgiques', 'liturgical dancers', 'danseurs_liturgiques.jpg', 0),
(4, 'coach vocal', 'vocal coach', 'coach vocaux', 'vocal coaches', 'coach_vocal.jpg', 0),
(5, 'prédicateur', 'preacher', 'prédicateurs', 'preachers', 'default.jpg', 0),
(6, 'chorale', 'choir', 'chorales', 'choirs', 'chorales.jpg', 1),
(7, 'groupe de louanges', 'group of praises', 'groupes de louanges', 'groups of praises', 'default.jpg', 1),
(8, 'école de louanges', 'praise school', 'écoles de louanges', 'praise schools', 'default.jpg', 1),
(9, 'école de musique', 'music school', 'écoles de musique', 'music schools', 'default.jpg', 1),
(10, 'groupe de danses liturgiques', 'group of liturgical dances', 'groupes de danses liturgiques', 'groups of liturgical dances', 'default.jpg', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE `user` (
  idUser int(11) NOT NULL,
  login varchar(150) NOT NULL,
  mail varchar(255) NOT NULL,
  pass varchar(255) NOT NULL,
  dateInsc datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  admin int(1) NOT NULL DEFAULT '0',
  actif int(1) NOT NULL DEFAULT '1',
  online int(1) NOT NULL DEFAULT '0',
  affichage int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (idUser, login, mail, pass, dateInsc, admin, actif, online, affichage) VALUES
(1, 'defaultAdmin', 'alex.alex@alex.fr', 'defaultAdmin', '2019-04-13 20:45:47', 1, 1, 0, 1),
(2, 'Orga', '', 'Orga', '2019-04-28 00:00:00', 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table vues
--
-- Création :  sam. 13 avr. 2019 à 18:38
--

CREATE TABLE vues (
  idVue int(255) NOT NULL,
  idArticle int(11) NOT NULL,
  idUser int(11) DEFAULT NULL,
  adresseIp varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table acteur
--
ALTER TABLE acteur
  ADD UNIQUE KEY idUser (idUser),
  ADD KEY idPays (idPays),
  ADD KEY idType (idType);

--
-- Index pour la table activite
--
ALTER TABLE activite
  ADD PRIMARY KEY (idActivite),
  ADD KEY idUser (idUser),
  ADD KEY idTypeA (idTypeA);

--
-- Index pour la table admin
--
ALTER TABLE admin
  ADD UNIQUE KEY idUser (idUser);

--
-- Index pour la table article
--
ALTER TABLE article
  ADD PRIMARY KEY (idArticle),
  ADD KEY idUser (idUser);

--
-- Index pour la table comments
--
ALTER TABLE comments
  ADD PRIMARY KEY (idComment),
  ADD KEY idArticle (idArticle),
  ADD KEY idUser (idUser);

--
-- Index pour la table contacts
--
ALTER TABLE contacts
  ADD PRIMARY KEY (idMess_con);

--
-- Index pour la table contact_user
--
ALTER TABLE contact_user
  ADD UNIQUE KEY idUser (idUser);

--
-- Index pour la table friends
--
ALTER TABLE friends
  ADD KEY idA (idA),
  ADD KEY idB (idB);

--
-- Index pour la table gestion
--
ALTER TABLE gestion
  ADD PRIMARY KEY (id);

--
-- Index pour la table infos
--
ALTER TABLE infos
  ADD KEY idPays (idPays);

--
-- Index pour la table messages
--
ALTER TABLE messages
  ADD PRIMARY KEY (idMessage),
  ADD KEY idA (idA),
  ADD KEY idB (idB);

--
-- Index pour la table notation
--
ALTER TABLE notation
  ADD KEY idA (idA),
  ADD KEY idB (idB);

--
-- Index pour la table organisation
--
ALTER TABLE organisation
  ADD UNIQUE KEY idUser (idUser),
  ADD KEY idPays (idPays),
  ADD KEY idType (idType);

--
-- Index pour la table pays
--
ALTER TABLE pays
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY code (code),
  ADD UNIQUE KEY alpha2 (alpha2),
  ADD UNIQUE KEY alpha3 (alpha3);

--
-- Index pour la table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (idPosition);

--
-- Index pour la table pos_art
--
ALTER TABLE pos_art
  ADD KEY idArticle (idArticle),
  ADD KEY idPosition (idPosition);

--
-- Index pour la table tag
--
ALTER TABLE tag
  ADD PRIMARY KEY (idTag);

--
-- Index pour la table tag_art
--
ALTER TABLE tag_art
  ADD KEY idArticle (idArticle),
  ADD KEY idTag (idTag);

--
-- Index pour la table ticket
--
ALTER TABLE ticket
  ADD PRIMARY KEY (idTicket),
  ADD KEY idUser (idUser);

--
-- Index pour la table typeactivite
--
ALTER TABLE typeactivite
  ADD PRIMARY KEY (idTypeA);

--
-- Index pour la table typeuser
--
ALTER TABLE typeuser
  ADD PRIMARY KEY (idTypeUser);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (idUser);

--
-- Index pour la table vues
--
ALTER TABLE vues
  ADD PRIMARY KEY (idVue),
  ADD KEY idArticle (idArticle),
  ADD KEY idUser (idUser);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table acteur
--
ALTER TABLE acteur
  MODIFY idUser int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table activite
--
ALTER TABLE activite
  MODIFY idActivite int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table article
--
ALTER TABLE article
  MODIFY idArticle int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table comments
--
ALTER TABLE comments
  MODIFY idComment int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table contacts
--
ALTER TABLE contacts
  MODIFY idMess_con int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table gestion
--
ALTER TABLE gestion
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table messages
--
ALTER TABLE messages
  MODIFY idMessage int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table organisation
--
ALTER TABLE organisation
  MODIFY idUser int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table pays
--
ALTER TABLE pays
  MODIFY id smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT pour la table `position`
--
ALTER TABLE `position`
  MODIFY idPosition int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table tag
--
ALTER TABLE tag
  MODIFY idTag int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table ticket
--
ALTER TABLE ticket
  MODIFY idTicket int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table typeactivite
--
ALTER TABLE typeactivite
  MODIFY idTypeA int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table typeuser
--
ALTER TABLE typeuser
  MODIFY idTypeUser int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY idUser int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table vues
--
ALTER TABLE vues
  MODIFY idVue int(255) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table acteur
--
ALTER TABLE acteur
  ADD CONSTRAINT acteur_ibfk_1 FOREIGN KEY (idPays) REFERENCES pays (id),
  ADD CONSTRAINT acteur_ibfk_2 FOREIGN KEY (idType) REFERENCES typeuser (idTypeUser);

--
-- Contraintes pour la table activite
--
ALTER TABLE activite
  ADD CONSTRAINT activite_ibfk_1 FOREIGN KEY (idUser) REFERENCES `user` (idUser),
  ADD CONSTRAINT activite_ibfk_2 FOREIGN KEY (idTypeA) REFERENCES typeactivite (idTypeA);

--
-- Contraintes pour la table article
--
ALTER TABLE article
  ADD CONSTRAINT article_ibfk_1 FOREIGN KEY (idUser) REFERENCES `user` (idUser);

--
-- Contraintes pour la table comments
--
ALTER TABLE comments
  ADD CONSTRAINT comments_ibfk_1 FOREIGN KEY (idArticle) REFERENCES article (idArticle),
  ADD CONSTRAINT comments_ibfk_2 FOREIGN KEY (idUser) REFERENCES `user` (idUser);

--
-- Contraintes pour la table friends
--
ALTER TABLE friends
  ADD CONSTRAINT friends_ibfk_1 FOREIGN KEY (idA) REFERENCES `user` (idUser),
  ADD CONSTRAINT friends_ibfk_2 FOREIGN KEY (idB) REFERENCES `user` (idUser);

--
-- Contraintes pour la table infos
--
ALTER TABLE infos
  ADD CONSTRAINT infos_ibfk_1 FOREIGN KEY (idPays) REFERENCES pays (id);

--
-- Contraintes pour la table messages
--
ALTER TABLE messages
  ADD CONSTRAINT messages_ibfk_1 FOREIGN KEY (idA) REFERENCES `user` (idUser),
  ADD CONSTRAINT messages_ibfk_2 FOREIGN KEY (idB) REFERENCES `user` (idUser);

--
-- Contraintes pour la table notation
--
ALTER TABLE notation
  ADD CONSTRAINT notation_ibfk_1 FOREIGN KEY (idA) REFERENCES `user` (idUser),
  ADD CONSTRAINT notation_ibfk_2 FOREIGN KEY (idB) REFERENCES `user` (idUser);

--
-- Contraintes pour la table organisation
--
ALTER TABLE organisation
  ADD CONSTRAINT organisation_ibfk_1 FOREIGN KEY (idPays) REFERENCES pays (id),
  ADD CONSTRAINT organisation_ibfk_2 FOREIGN KEY (idType) REFERENCES typeuser (idTypeUser);

--
-- Contraintes pour la table pos_art
--
ALTER TABLE pos_art
  ADD CONSTRAINT pos_art_ibfk_1 FOREIGN KEY (idArticle) REFERENCES article (idArticle),
  ADD CONSTRAINT pos_art_ibfk_2 FOREIGN KEY (idPosition) REFERENCES position (idPosition);

--
-- Contraintes pour la table tag_art
--
ALTER TABLE tag_art
  ADD CONSTRAINT tag_art_ibfk_1 FOREIGN KEY (idArticle) REFERENCES article (idArticle),
  ADD CONSTRAINT tag_art_ibfk_2 FOREIGN KEY (idTag) REFERENCES tag (idTag);

--
-- Contraintes pour la table ticket
--
ALTER TABLE ticket
  ADD CONSTRAINT ticket_ibfk_1 FOREIGN KEY (idUser) REFERENCES `user` (idUser);

--
-- Contraintes pour la table vues
--
ALTER TABLE vues
  ADD CONSTRAINT vues_ibfk_1 FOREIGN KEY (idArticle) REFERENCES article (idArticle),
  ADD CONSTRAINT vues_ibfk_2 FOREIGN KEY (idUser) REFERENCES `user` (idUser);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
