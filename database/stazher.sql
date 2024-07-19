-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para stazher
CREATE DATABASE IF NOT EXISTS `stazher` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `stazher2`;

-- Volcando estructura para tabla stazher.absences
CREATE TABLE IF NOT EXISTS `absences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reason` varchar(50) NOT NULL,
  `employee_id` int NOT NULL,
  `date_absences` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla stazher.absences: ~0 rows (aproximadamente)

-- Volcando estructura para tabla stazher.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.admin: ~2 rows (aproximadamente)
INSERT INTO `admin` (`id`, `username`, `password`, `firstname`, `lastname`, `photo`, `created_on`) VALUES
	(1, 'admin', '$2y$10$9BkwkUHj7FFlL6cyPO6.Uey.tFW4W8Wozb16E1tH0Ti3ZSVY9pmka', 'Area', 'Sistemas', 'images-k9zsGpqit-transformed__1_-removebg-preview (1).png', '2019-12-18'),
	(2, 'pasantes', '1234', 'Area ', 'Pasantes', 'images-k9zsGpqit-transformed__1_-removebg-preview (1).png', '2024-05-20');

-- Volcando estructura para tabla stazher.area
CREATE TABLE IF NOT EXISTS `area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_area` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla stazher.area: ~5 rows (aproximadamente)
INSERT INTO `area` (`id`, `name_area`) VALUES
	(1, 'DAF'),
	(2, 'DO'),
	(3, 'DC'),
	(4, 'DG'),
	(5, 'DE');

-- Volcando estructura para tabla stazher.attendance
CREATE TABLE IF NOT EXISTS `attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `date` date NOT NULL,
  `time_in` time NOT NULL,
  `status` int NOT NULL,
  `time_out` time DEFAULT NULL,
  `status2` int NOT NULL,
  `num_hr` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.attendance: ~10 rows (aproximadamente)
INSERT INTO `attendance` (`id`, `employee_id`, `date`, `time_in`, `status`, `time_out`, `status2`, `num_hr`) VALUES
	(1, 35, '2024-04-04', '08:25:00', 1, '19:36:00', 2, 9),
	(2, 35, '2024-06-05', '08:11:00', 1, '19:56:00', 2, 9),
	(3, 36, '2024-06-05', '07:58:00', 1, '18:58:00', 2, 9),
	(5, 47, '2024-06-05', '08:04:00', 1, '20:04:00', 2, 9),
	(6, 36, '2024-06-02', '08:15:00', 1, '19:15:00', 2, 9),
	(7, 36, '2024-05-22', '08:15:00', 1, '19:15:00', 2, 9),
	(10, 57, '2024-07-15', '11:30:29', 0, '15:13:43', 2, 3.7166666666667),
	(12, 35, '2024-07-01', '05:15:00', 1, '17:15:00', 1, 7.75),
	(13, 57, '2023-05-30', '05:15:00', 1, '17:15:00', 1, 7.75),
	(14, 57, '2023-05-29', '05:15:00', 1, '17:15:00', 1, 7.75);

-- Volcando estructura para tabla stazher.career
CREATE TABLE IF NOT EXISTS `career` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_career` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla stazher.career: ~6 rows (aproximadamente)
INSERT INTO `career` (`id`, `name_career`) VALUES
	(1, 'Sistemas Informaticos'),
	(2, 'Comercio Internacional y Administracion Aduanera'),
	(3, 'Contaduria General '),
	(4, 'Admintracion de Empresas'),
	(5, 'Ingenieria en Sistemas '),
	(6, 'Secretariado Ejecutivo');

-- Volcando estructura para tabla stazher.cashadvance
CREATE TABLE IF NOT EXISTS `cashadvance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_advance` date NOT NULL,
  `employee_id` varchar(15) NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.cashadvance: ~1 rows (aproximadamente)
INSERT INTO `cashadvance` (`id`, `date_advance`, `employee_id`, `amount`) VALUES
	(1, '2020-01-07', '25', 50000);

-- Volcando estructura para tabla stazher.deductions
CREATE TABLE IF NOT EXISTS `deductions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.deductions: ~1 rows (aproximadamente)
INSERT INTO `deductions` (`id`, `description`, `amount`) VALUES
	(5, 'Pago de EPS 4%', 2500);

-- Volcando estructura para tabla stazher.employees
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(15) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `identity_card` int NOT NULL,
  `address` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `birthdate` date NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `position_id` int NOT NULL,
  `schedule_id` int NOT NULL,
  `institution_id` int NOT NULL,
  `modality_id` int NOT NULL,
  `career_id` int NOT NULL,
  `area_id` int NOT NULL,
  `photo` varchar(200) NOT NULL,
  `created_on` date NOT NULL,
  `add_hr` time DEFAULT '00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.employees: ~109 rows (aproximadamente)
INSERT INTO `employees` (`id`, `employee_id`, `firstname`, `lastname`, `identity_card`, `address`, `email`, `birthdate`, `contact_info`, `gender`, `position_id`, `schedule_id`, `institution_id`, `modality_id`, `career_id`, `area_id`, `photo`, `created_on`, `add_hr`) VALUES
	(35, 'JC13607593', 'Jhaquelin Gabriela ', 'Condori Gallegos', 13607593, 'C/ Antonio Gallardo Z/ Gran Poder', 'gabriela1.gallegos2@gmail.com', '2000-12-13', '72079737', 'Female', 8, 2, 11, 1, 2, 1, '', '2024-05-20', '230:23:00'),
	(36, 'GG12422922', 'Gisela', 'Gonzales Choque', 12422922, 'B Dolores F 144, El Alto ', 'giselagonzales12422@gmail.com', '2003-10-01', '68193738', 'Female', 7, 2, 10, 1, 3, 2, '', '2024-05-20', '01:00:00'),
	(37, 'NC9879810', 'Natassja ', 'Cala Villegas ', 9879810, 'Av. VÃ¡squez Z. Pura Pura C. BatallÃ³n Loa # 234-A ', 'natu15_48@hotmail.com', '1993-05-01', '75817134', 'Female', 8, 2, 11, 1, 1, 2, '', '2024-05-20', NULL),
	(38, 'JC13815162', 'Jhasmin ', 'Catacora Ticona', 13815162, 'El Alto, Z/Mariscal Sucre C/Carpinter, 4555', 'jazmincatacora2003@gmail.com', '2003-08-16', '64078607', 'Female', 7, 2, 11, 1, 1, 2, '', '2024-05-21', NULL),
	(39, 'RH7095218', 'Raquel  Deysi ', 'Huayhua Quispe ', 7095218, 'C/ 5 de Agosto # 1470 Z/ Alto Lima ', 'raquelhuayhua72@gmail.com', '1998-06-05', '62505921', 'Female', 8, 2, 11, 1, 3, 2, '', '2024-05-21', NULL),
	(40, 'LP9876136', 'Luz Esther ', 'Pacohuanca Calle', 9876136, 'Z/ Villa el Carmen C/ 7 #423 ', '', '2004-02-15', '65633996', 'Female', 8, 2, 11, 1, 1, 2, '', '2024-05-21', NULL),
	(41, 'AA6178741', 'Amy  AtalÃ­a ', 'Arismendi PeÃ±a ', 6178741, 'Z/ Bajo Tacagua C/ Abelardo Ugarte  # 1649', 'amyarismendi.p@gmail.com', '2000-12-21', '73229631', 'Female', 8, 2, 11, 1, 2, 2, '', '2024-05-21', NULL),
	(42, 'JL11073327', 'Jonatan Ariel ', 'Luque Alanoca ', 11073327, 'Z/ Chamoco Chico  C/ Gregorio Colque #1523', 'jonatanluque12@gmail.com', '2003-09-02', '69881463', 'Male', 8, 2, 11, 1, 2, 2, '', '2024-05-21', NULL),
	(43, 'AQ14228469', 'Abel Abraham', 'Quisbert Quispe ', 14228469, 'Z/ La Portada C/ Nemecio Iturri #122', 'abelquisbert88@gmail.com', '1998-12-03', '76268803', 'Male', 8, 2, 11, 1, 2, 2, '', '2024-05-21', NULL),
	(44, 'JL10087149', 'Johana  Melani ', 'Limachi Vargas ', 10087149, 'Z/ Villa Dolores C/ Sempertegui #150', 'johanalimachivargas1021@gmail.com', '2001-02-10', '65122123', 'Female', 8, 2, 11, 1, 2, 2, '', '2024-05-21', NULL),
	(45, 'DG10066200', 'Daniel Oliver', 'Gomez Loayza', 10066200, 'Z/ Villa Nuevo PotosÃ­ C/ Comandante Carretero #1374', 'danielgk533@gmail.com', '2004-04-24', '63247443', 'Male', 7, 2, 11, 1, 3, 2, '', '2024-05-21', NULL),
	(46, 'DA9870607', 'Delicia ', 'Ali Mamani', 9870607, 'Z/ Villa Ingenio C/ Chiriguano # 9365 ', 'alidelicia24@gmail.com', '1993-04-24', '77760548', 'Female', 8, 2, 11, 1, 3, 2, '', '2024-05-21', NULL),
	(47, 'EC13552520', 'Esther Said ', 'Cutipa Pomacahua', 13552520, 'Z/ San Martin C/ Sorata #338', 'esthercutipapomacahua@gmail.com', '2002-12-21', '69778416', 'Female', 7, 2, 11, 1, 3, 2, '', '2024-05-21', '01:00:00'),
	(48, 'JL13759903', 'Jherco Isaac ', 'Laruta Quispe', 13759903, 'Z/ La Portada C/ Justo German Varela #2589', 'jhercomatlaruta@gmail.com', '2001-08-30', '76540084', 'Male', 8, 2, 11, 1, 2, 2, '', '2024-05-21', NULL),
	(49, 'RQ9931017', 'Rosaura Clemen ', 'Quiroga Flores ', 9931017, 'Z/ Alpacoma C/ I # 54', 'quirogaflores06@gmail.com', '2004-01-06', '63178770', 'Female', 9, 2, 11, 1, 2, 2, '', '2024-05-21', NULL),
	(50, 'BR4871440', 'Billy Brandon ', 'Ramos Machicado', 4871440, 'Z/ Valle Hermoso C/ 6 de Agosto # 80', 'brandon.billy.br7@gmail.com', '1993-12-11', '60649210', 'Male', 8, 2, 11, 1, 2, 2, '', '2024-05-21', NULL),
	(51, 'DC9875415', 'Dayana Luz ', 'Condori Condori', 9875415, 'Z/ Llojeta C/ San Martin #17', 'condori.9875415@gmail.com', '2003-01-14', '77507113', 'Female', 8, 2, 11, 1, 2, 2, '', '2024-05-21', NULL),
	(52, 'EC11068915', 'Elizabeth ', 'Cori Ramirez', 11068915, 'Z/ Villa Tejada Alpacoma C/ 2 ', 'coriramirezelizaberh@gmail.com', '2003-05-09', '69844946', 'Female', 7, 2, 11, 1, 1, 2, '', '2024-05-21', NULL),
	(53, 'AC10068184', 'Adriana Belen ', 'Chura Huanca ', 10068184, 'Z/ Willcacota C/ Las Violetas #35', 'dria.8elenn@gmail.com', '2004-09-11', '78833155', 'Female', 8, 2, 11, 1, 2, 2, '', '2024-05-21', NULL),
	(54, 'MC9984327', 'Maria Fernanda ', 'Capquique Flores ', 9984327, 'Z/ Ballivian C/ Achachicala # 1091', 'mafecflores@gmail.com', '2004-03-10', '68154779', 'Female', 8, 2, 11, 1, 2, 2, '', '2024-05-21', NULL),
	(55, 'WN13788064', 'Wilma ', 'Nina Quispe ', 13788064, 'Z/Pedro de Murillo C/ Pedro RodrÃ­guez #1184', 'wilmaninaquispe4@gmail.com', '2002-01-25', '60507484', 'Female', 8, 2, 11, 1, 2, 2, '', '2024-05-21', NULL),
	(56, 'LQ6092976', 'Lizbeth Noelia', 'Quispe Choque', 6092976, 'Z/ Villa Nueva PotosÃ­ C/ Adolfo Gozalves # 1120', 'noeliamsr27@gmail.com', '1999-09-01', '77574889', 'Female', 8, 2, 11, 1, 2, 2, '', '2024-05-21', NULL),
	(57, 'ME10909669', 'Marco Antonio ', 'Espinoza Rojas', 10909669, 'Chasquipampa #60', 'marco-_-antonio@live.com', '1997-12-01', '75847560', 'Male', 7, 2, 1, 1, 1, 1, '', '2024-05-22', '230:23:00'),
	(58, 'JQ10953882', 'Jose Fernando ', 'Quispe Luna ', 10953882, 'Z/ Alto Obrajes  C/ 2 #250', 'qfernando792@gmail.com', '2004-01-25', '71961125', 'Male', 8, 2, 11, 1, 2, 2, '', '2024-05-22', '00:00:00'),
	(59, 'CS13374596', 'Carla Cleyra', 'Sirpa Ucharico ', 13374596, 'Z/ Alto Lima Av/ Chacaltaya #130', 'cleyra.sirpa@gmail.com', '2002-02-23', '60600295', 'Female', 8, 2, 11, 1, 2, 2, '', '2024-05-22', '00:00:00'),
	(60, 'EC14227096', 'Eymi Melissa ', 'Caballero Peralta', 14227096, 'Z/ Villa Armonia C/ 27 de Mayo #220', 'caballeroperaltaeymimelissa@gmail.com', '2003-09-05', '74900331', 'Female', 8, 2, 11, 1, 2, 2, '', '2024-05-22', '00:00:00'),
	(61, 'RG9172043', 'Rodrigo Mario ', 'Ga¡lvez Ugarte ', 9172043, 'Z/ Pampahasi  Av/ Camargo # 77', 'galvez.six9@gimail.com', '2001-11-30', '78833869', 'Male', 8, 2, 11, 1, 2, 2, '', '2024-05-22', '00:00:00'),
	(62, 'LM9169206', 'Luz Carla ', 'Mendez Molina', 9169206, 'Z/ Villa Adela C/ Plan 560 # 30', 'mendezluz885@gmail.com', '2002-03-27', '69911141', 'Female', 7, 2, 11, 1, 1, 2, '', '2024-05-22', '00:00:00'),
	(63, 'HM14039720', 'Helen Betriz', 'Mamani Quispe', 14039720, 'Z/ Alto Chijini C/ 3 # 100', 'helenheidimq@gmail.com', '2003-01-16', '68016337', 'Female', 9, 2, 11, 1, 2, 2, '', '2024-05-23', '00:00:00'),
	(64, 'DM9911741', 'Diego Benjamin ', 'Machicado Lima', 9911741, 'Z/ central C/ Yanacocha #780', 'Diegobenji5@gmail.com', '2003-04-24', '60545405', 'Male', 8, 2, 11, 1, 2, 2, '', '2024-05-23', '00:00:00'),
	(65, 'JF10083707', 'Jessica Aracelly', 'Fernandez Flores ', 10083707, 'Z/ Santa BÃ¡rbara c/ Obispo CÃ¡rdenas #1733', 'aracelifernandez1123@gmail.com', '2004-05-06', '62506838', 'Female', 9, 2, 11, 1, 2, 2, '', '2024-05-23', '00:00:00'),
	(66, 'AS12894061', 'Alison ', 'Sola Mamani ', 12894061, 'Z/ Chayapampa Av/ constituciÃ³n #1215', 'handealison@gmail.com', '2004-06-20', '69813288', 'Female', 7, 2, 11, 1, 2, 2, '', '2024-05-23', '00:00:00'),
	(67, 'AV13761759', 'Abner Diego', 'Villalobos Villalobos', 13761759, 'Z/ Bajo Llojeta C/ Chuquisaca # 1389', 'villalobos.abner7@gmail.com', '2003-12-16', '71510973', 'Male', 8, 2, 11, 1, 2, 2, '', '2024-05-23', '00:00:00'),
	(68, 'AG10084118', 'Angela Lessly', 'Gutierrez Castro ', 10084118, 'Z/ Alto Chijini C/4 # 2529', 'angela.gutierrez9703@gmail.com', '2003-07-09', '65685460', 'Female', 8, 2, 11, 1, 2, 2, '', '2024-05-24', '00:00:00'),
	(69, 'AM13313943', 'Arnol ', 'Mamani Mamani', 13313943, 'Z/ Villa ExaltaciÃ³n C/ La Patria # 10', 'arnol.asdf@gmail.com', '2001-05-02', '69767066', 'Male', 7, 2, 11, 1, 1, 2, '', '2024-05-24', '00:00:00'),
	(70, 'MC9923516', 'Marvin David ', 'Cordova Calani ', 9923516, 'Z/ Alto Tejar C/ Segunda Bascones # 1646', 'cordova.calani.marvin.2021@incoslapaz.org', '2003-01-01', '64032702', 'Male', 7, 2, 11, 1, 1, 2, '', '2024-05-24', '00:00:00'),
	(71, 'DS10927312', 'Diego ', 'Salazar Martinez ', 10927312, 'Z/ Alto Llojeta C/ Santa Cruz #20', 'diegosalazar27sm@gmail.com', '2003-12-27', '73244606', 'Male', 8, 2, 11, 1, 2, 2, '', '2024-05-24', '00:00:00'),
	(72, 'JL13761963', 'Jhasmin Valeria ', 'Loayza Cachi ', 13761963, 'Z/ Bolognia C/ Alcorwesa # 138', 'jhas3677@gmail.com', '2002-10-23', '78850334', 'Female', 9, 2, 11, 1, 2, 2, '', '2024-05-24', '00:00:00'),
	(73, 'CQ13969930', 'Camila Mariana ', 'Quispe Copana', 13969930, 'Z/ Alto Obrajes C/ 1 # 773', 'q.camila.c@gmail.com', '2003-12-19', '73239383', 'Female', 8, 2, 11, 1, 2, 2, '', '2024-05-24', '00:00:00'),
	(74, 'ML13492671', 'Miguel Angel ', 'Laura Mamani ', 13492671, 'Z/ Obrajes Av/ Mecapaca # 150', 'laura.13492671@gmail.com', '1999-11-17', '70150720', 'Male', 7, 2, 11, 1, 3, 2, '', '2024-05-24', '00:00:00'),
	(75, 'NP6829179', 'Noelia Ricelly', 'Perez Lopez', 6829179, 'Z/ Villa Victoria C/ Quintanilla Suazo', 'noe.ricel.perez.lo1103@gmail.com', '2003-11-11', '78784018', 'Female', 8, 2, 11, 1, 2, 2, '', '2024-05-24', '00:00:00'),
	(76, 'IA11088976', 'Irma Rosario ', 'Acero Quispe ', 11088976, 'Bloque Norte 432 UrbanizaciÃ³n Chijini', 'acerorosario57@gmailcom', '2002-10-05', '69942850', 'Female', 8, 2, 11, 1, 3, 2, '', '2024-05-28', '00:00:00'),
	(77, 'IQ12671149', 'Isahry Rubi', 'Quinteros Patana ', 12671149, 'Z/ Bajo San Antonio Av/ 31 de Octubre # 46', 'quinteros.patana.isahry.2022@inco.lapaz.org', '2004-05-29', '63107064', 'Female', 8, 2, 11, 1, 3, 2, '', '2024-05-28', '00:00:00'),
	(78, 'MP9907836', 'Marcelo Iganacio ', 'Pacoricona Paco', 9907836, 'Z/ Calllampaya C/ Policarpi #1330', 'Ignaciopacoroconapaco@gmail.com', '2004-04-05', '77511674', 'Male', 8, 2, 11, 1, 2, 2, '', '2024-05-28', '00:00:00'),
	(79, 'MA9866454', 'Mijael Max', 'Ayala Callizaya', 9866454, 'Z/ Alto Tejar C/ Ruperto Jurado  #1718', 'ferayala2907@gmail.com', '1998-10-14', '78789624', 'Male', 9, 2, 11, 1, 2, 3, '', '2024-05-28', '00:00:00'),
	(80, 'AG12959697', 'Abigail ', 'Guarachi Quispe', 12959697, 'Z/ Final Chasqui Pampa C/ 4 #1093', 'abiguarachi@gmail.com', '2004-02-20', '62331225', 'Female', 8, 2, 11, 1, 3, 2, '', '2024-05-28', '00:00:00'),
	(81, 'KC13796947', 'Kevin Cristian ', 'Callisaya Yujra', 13796947, 'Z/ Final Los Andes C/ Pascoe # 1845', 'kevinyujragca@gmail.com', '2001-12-08', '69825935', 'Male', 9, 2, 11, 1, 1, 2, '', '2024-05-28', '00:00:00'),
	(82, 'RP10081478', 'Ribaldo ', 'Paco Samo', 10081478, 'Z/ Alto Lima Av/ Arequipa #200', 'Ribaldopacosamo@gmail.com', '2000-09-20', '65568084', 'Male', 8, 2, 11, 1, 2, 2, '', '2024-05-28', '00:00:00'),
	(83, 'LA13758003', 'Luis Angel ', 'Aymuro Cayo', 13758003, 'Z/ Villa Copacabana C/ 8 # 300', 'aymuroangel8@gmail.com', '2003-02-17', '63141049', 'Male', 8, 2, 11, 1, 2, 2, '', '2024-05-28', '00:00:00'),
	(84, 'RB7354699', 'Rossio Kalid', 'Bacarreza Marza', 7354699, 'Z/ San Pedro C/ BoquerÃ³n y Riobamba #1138', 'rossiorkbm@gmail.com', '2004-02-25', '70542814', 'Female', 9, 2, 11, 1, 2, 2, '', '2024-05-28', '00:00:00'),
	(85, 'TS11080680', 'Tania', 'Sejas Mamani', 11080680, 'Z/ Chasquipampa C/ 54 #3 28', 'Sejastania057@gmail.com', '1997-09-16', '69897543', 'Female', 8, 2, 11, 1, 2, 2, '', '2024-05-28', '00:00:00'),
	(86, 'RM11109318', 'Rafael Alejandro ', 'Mamani Chavez', 11109318, 'Z/ El Tejar Av/ Entre Rios # 1413', 'rafaeldcmrmc@gmail.com', '1999-11-03', '73249881', 'Male', 8, 2, 11, 1, 3, 2, '', '2024-05-28', '00:00:00'),
	(87, 'CM10062342', 'Cinthia ', 'Machaca Fernadez ', 10062342, 'Z/ Ciudad SatÃ©lite Av/ Portugal #1132', 'mcinthiafernandez@gmail.com', '2001-10-06', '74846154', 'Female', 8, 2, 11, 1, 2, 2, '', '2024-05-28', '00:00:00'),
	(88, 'AR9903473', 'Adrian Felipe ', 'Rengel Laime', 9903473, 'Z/ Achachicala C/ 8 #677', 'adrianrengellaime@gmail.com', '1998-06-06', '77708922', 'Male', 9, 2, 11, 1, 2, 2, '', '2024-05-28', '00:00:00'),
	(89, 'CH9910270', 'Carolina Daiana ', 'Huraquino Seron', 9910270, 'Z/ Panticirca C/ 14 #101', 'huraqumos@gmail.com', '1998-03-10', '73275865', 'Female', 8, 2, 11, 1, 2, 2, '', '2024-05-28', '00:00:00'),
	(90, 'IQ13406469', 'Isabel ', 'Quispe Duran', 13406469, 'Z/ SeÃ±or de ExaltaciÃ³n C/ Larecaja #1646', 'isaquispeduran@gmail.com', '1999-11-28', '67139783', 'Female', 10, 2, 10, 1, 2, 2, '', '2024-05-28', '00:00:00'),
	(91, 'SA9995968', 'Steves ', 'Aduviri Alvarez', 9995968, 'Z/ Illimani Av/ Gaspar Berrios # 2025 ', 'stevesaduvuri@gmail.com', '2003-09-22', '74077704', 'Male', 8, 2, 10, 1, 3, 2, '', '2024-05-28', '00:00:00'),
	(92, 'JJ10065181', 'Jhisel Carmen ', 'Jimenez Mamani', 10065181, 'Z/ Villa Dolores C/ C#148', 'jimenezjhisel@gmail.com', '2004-01-19', '63178134', 'Female', 8, 2, 10, 1, 3, 2, '', '2024-05-31', '00:00:00'),
	(93, 'JC10021729', 'Jose Luis ', 'Cussi Marca', 10021729, 'Z/ El Rosario Av/ Virgen de Copacabana # 5530', 'markjose339@gmail.com', '2004-04-16', '68179195', 'Male', 7, 2, 10, 1, 1, 2, '', '2024-05-31', '00:00:00'),
	(94, 'YC9092344', 'Yessica Yoselin ', 'Condori Mamani ', 9092344, 'Z/ Villa Dolores C/ A #160', 'condorimamaniyessicayoselin@gmail.com', '1994-12-29', '69726281', 'Female', 8, 2, 10, 1, 2, 2, '', '2024-05-31', '00:00:00'),
	(95, 'PC11060438', 'Paola Adriana', 'Condori Corane', 11060438, 'Z/ BalliviÃ¡n C/ Nery', 'condorip429@gmail.com', '2002-10-03', '74905461', 'Female', 8, 2, 10, 1, 2, 2, '', '2024-05-31', '00:00:00'),
	(96, 'GT13150497', 'Gladys Noemi ', 'Tancara Alanoca', 13150497, 'Z/ San Luis II C/ Alfredo Sanjinez # 2074', 'galytancara@gmail.com', '2000-01-24', '65141120', 'Female', 8, 2, 10, 1, 4, 2, '', '2024-05-31', '00:00:00'),
	(97, 'NM13732965', 'Nelson ', 'Mamani Huanca', 13732965, 'Z/ Romero Pampa C/ Paico # 2034', 'nelsonmhx@gmail.com', '2001-10-28', '76540851', 'Male', 10, 2, 10, 1, 3, 2, '', '2024-05-31', '00:00:00'),
	(98, 'JJ4947223', 'Javier Erasmo ', 'Jimenez Mamani ', 4947223, 'Z/ San Martin  C/ Juan Capriles # 2433', '321jimenezjavier@gmail.com', '1996-11-25', '79535545', 'Male', 8, 2, 10, 1, 3, 2, '', '2024-05-31', '00:00:00'),
	(99, 'VM8282735', 'Victor Hugo', 'Mamani Gutierrez', 8282735, 'Z/ San JosÃ©  C/ Miguel Grau # 2144 ', 'victorhugomamanigutierrez123@gmail.com', '1996-09-19', '60603337', 'Male', 8, 2, 10, 1, 1, 2, '', '2024-05-31', '00:00:00'),
	(100, 'LA13694457', 'Limberth ', 'Apaza Laura', 13694457, 'Z/ 12 de Octubre  Av/ 6 de Marzo # 505', 'apazalimberth925@gmail.com', '2002-01-15', '63819262', 'Male', 8, 2, 10, 1, 2, 2, '', '2024-05-31', '00:00:00'),
	(101, 'NL9877182', 'Nadia Alejandra ', 'Luna Lima', 9877182, 'Z/ Pampahasi Av/ CircunvalaciÃ³n # 29', 'lunalimanadiaalejenadra@gmail.com', '2003-06-15', '65106980', 'Female', 8, 2, 10, 1, 2, 2, '', '2024-05-31', '00:00:00'),
	(102, 'JF8386154', 'Jenny ', 'Fernandez Ortiz ', 8386154, 'Z/ Max Fernandez C/ 3 #1164', 'jeni12sh@gmail.com', '1996-01-27', '67305103', 'Female', 7, 2, 10, 1, 4, 2, '', '2024-05-31', '00:00:00'),
	(103, 'DM11542808', 'Deymar Adrian', 'Mollo Flores ', 11542808, 'Z/ Pacajes  C/ 6 # 504', 'mollofloresdeymar@gmail.com', '1997-03-26', '68077108', 'Male', 8, 2, 10, 1, 2, 2, '', '2024-05-31', '00:00:00'),
	(104, 'KR9915225', 'Kevin Jhoel ', 'Ramos Condori', 9915225, 'Z/ 10 de Febrero C/ Alamos #4114', 'jhoelramos5@gmail.com', '1999-09-17', '65688210', 'Male', 8, 2, 10, 1, 3, 2, '', '2024-05-31', '00:00:00'),
	(105, 'JM12637691', 'Juan Daniel ', 'Mamani Ali', 12637691, 'Z/ Central C/ Iturralde # 95', 'jd523217@gmail.com', '2002-11-09', '60626248', 'Male', 10, 2, 10, 1, 3, 2, '', '2024-05-31', '00:00:00'),
	(106, 'NA6666890', 'Nicol Alejandra', 'Apaza Merma', 6666890, 'Z/ Ballivian C/ Rene Vargas ', '36226.nicole@gmail.com', '2000-05-03', '77221290', 'Female', 8, 2, 10, 1, 2, 2, '', '2024-05-31', '00:00:00'),
	(107, 'LP10082266', 'Luis Angel ', 'Poma Perez', 10082266, 'Z/ Bella Vista C/ Alonzo de Mendoza #76', 'luisangelpomaperez0461997@gmail.com', '1997-06-04', '70571199', 'Male', 8, 2, 10, 1, 2, 2, '', '2024-05-31', '00:00:00'),
	(108, 'YV13959964', 'Yesica ', 'Villegas Cupana ', 13959964, 'Z/ German Buch C/ Radio Viloco #230 ', 'yesiville725@gmail.com', '2003-12-09', '72572470', 'Female', 8, 2, 10, 1, 2, 2, '', '2024-05-31', '00:00:00'),
	(109, 'SG9114049', 'Shirley Mishel', 'Gomez Morales', 9114049, 'Z/  Villa Adela C/ Andrea Arias # 1574', 'moralesshirley11@gmail.com', '2003-12-27', '78890130', 'Female', 8, 2, 10, 1, 2, 2, '', '2024-05-31', '00:00:00'),
	(110, 'AQ9255040', 'Adolfo ', 'Quispe Quisbert', 9255040, 'Z/ Cosmos 79 C/ Romero Uma #1064', 'adolofoQ603@gmail.com', '2001-08-12', '76593323', 'Male', 8, 2, 10, 1, 2, 2, '', '2024-05-31', '00:00:00'),
	(111, 'AF9250377', 'Andrea Belen ', 'Fernandez Loza', 9250377, 'Z/ Huayna PotosÃ­ C/ Azteca # 214', 'belfernandez.al@gmail.com', '1994-07-25', '63296371', 'Female', 8, 2, 10, 1, 2, 2, '', '2024-05-31', '00:00:00'),
	(112, 'CC11064394', 'Celida ', 'Condori Lucana', 11064394, 'Z/ Villa Tunari C/ 17 # 800', 'celicondorilucana@gmail.com', '1995-11-10', '60541010', 'Female', 8, 2, 10, 1, 3, 2, '', '2024-05-31', '00:00:00'),
	(113, 'ME4797272', 'Milenka Haydee', 'Espada Zalles', 4797272, 'Z/ San Luis Tasa C/ 10 # 5 ', 'milenkahaydeeespanazallez@gmail.com', '1977-10-17', '79527647', 'Female', 7, 2, 10, 1, 3, 2, '', '2024-05-31', '00:00:00'),
	(114, 'GQ9928818', 'Gloria ', 'Quispe Mamani ', 9928818, 'Z/ San Luis II Av/ Litoral # 5214 ', 'gloriaquispemamani1@gmail.com', '2004-04-02', '65111248', 'Female', 8, 2, 10, 1, 3, 2, '', '2024-05-31', '00:00:00'),
	(115, 'AY13055848', 'Ademar ', 'Yujra Condori', 13055848, 'Z/ Alto Chijini  C/ Alfonso Ugarte # 1333 ', 'ades.123.yujra@gmail.com', '2001-10-30', '69926800', 'Male', 8, 2, 16, 1, 1, 2, '', '2024-05-31', '00:00:00'),
	(116, 'CM9919368', 'Carlos Andres ', 'Mendoza Poma', 9919368, 'Z/ Inca Llojeta C/ 1 # 550 ', 'carand.550@gmail.com', '1996-07-16', '68125363', 'Male', 7, 2, 16, 1, 1, 2, '', '2024-05-31', '00:00:00'),
	(117, 'JV9928499', 'Jose Antonio ', 'Vera Alcan ', 9928499, 'Z/ Illimani C/ Gaspar # 2014', 'jalcon432@gmail.com', '2004-01-19', '65105905', 'Male', 8, 2, 17, 1, 3, 2, '', '2024-05-31', '00:00:00'),
	(118, 'EQ9996456', 'Eynar Renan ', 'Quispe Crispin', 9996456, 'Z/ Villa FÃ¡tima C/ Chulumani #100', 'eynar345@gmail.com', '2000-04-14', '67140261', 'Male', 7, 2, 1, 1, 5, 2, '', '2024-05-31', '00:00:00'),
	(119, 'AS9956489', 'Ariel Alvaro ', ' Sanchez Patino ', 9956489, 'Z/ Villa dolores C/ Badani 12 ', 'sanchez.9956489@gmail.com', '2003-02-17', '62342342', 'Male', 7, 2, 11, 1, 3, 1, '', '2024-06-06', '00:00:00'),
	(120, 'AY10924617', 'Alison Pilar', 'Yujra Sanjines', 10924617, 'Z/ Villa Nueva PotosÃ­ C/ Vanguardia #1060', 'alisonpilar6@gmail.com', '2004-09-16', '67310098', 'Female', 8, 2, 11, 1, 2, 2, '', '2024-06-11', '00:00:00'),
	(121, 'AA8443076', 'Adriana Sidney ', 'Aranibar Flores', 8443076, 'Z/ Tejada Triangular  Av/ 4-B # 103', 'Adrianasidneyfloresaranibar@gmail.com', '2000-02-04', '65648754', 'Female', 8, 2, 11, 1, 2, 2, '', '2024-06-14', '00:00:00'),
	(122, 'NQ7393684', 'Nesli Yhadira ', 'Quispe Panama', 7393684, 'Z/ Said C/Pasaje Viacha #313', 'yhadirapanama@gmail.com', '2004-07-25', '63242869', 'Female', 8, 2, 11, 1, 2, 2, '', '2024-06-14', '00:00:00'),
	(123, 'CL9162002', 'Christian Luis ', 'Limachi Sinani', 9162002, 'Z/ Bajo Llojeta C/ 19 # 5020 ', 'christianlimachi072@gmail.com', '2000-09-19', '61158813', 'Male', 8, 2, 11, 1, 2, 2, '', '2024-06-14', '00:00:00'),
	(124, 'CR12929315', 'Cesar Luis', 'Rojas Rodriguez', 12929315, 'Z/  Alto Santiago de Munaypata  C/ 16 de julio #286', 'crojasrodriguez847@gmail.com', '2002-05-16', '67056762', 'Male', 8, 2, 11, 1, 2, 2, '', '2024-06-14', '00:00:00'),
	(125, 'JR8438600', 'Jessica Jhoseline', 'Ramos Flores', 8438600, 'Z/ Hernando Siles C/ 9 # 2230', 'Jessicajhoseliner005@gmail.com', '1999-11-16', '79614710', 'Female', 8, 2, 11, 1, 2, 2, '', '2024-06-14', '00:00:00'),
	(126, 'KL10922828', 'Karla Gigliola ', 'Lima Chuquimia', 10922828, 'Z/ 14 de Septiembre C/ Chorolque # 1154', 'limak3497@gmail.com', '2000-10-16', '77744053', 'Female', 8, 2, 11, 1, 2, 2, '', '2024-06-14', '00:00:00'),
	(127, 'RC8446650', 'Ruben Juan', 'Chambi Huayllani ', 8446650, 'Z/ Villa Esperanza Av/ Sucre #405', 'busterblader54@gmail.com', '1994-06-24', '60693362', 'Male', 8, 2, 11, 1, 2, 2, '', '2024-06-14', '00:00:00'),
	(128, 'MI12480321', 'Marcos Fernando', 'Ibanez Villegas', 12480321, 'Z/ Bella Vista C/ 5 # 248', 'ibanezmarco24@gamil.com', '2000-12-06', '65158612', 'Male', 9, 2, 11, 1, 2, 2, '', '2024-06-14', '00:00:00'),
	(129, 'HC13248083', 'Hiver Mael', 'Calderon Cabrera', 13248083, 'Z/ Bajo Tacagua C/ Tacagua # 1500', 'danteccpro10@gmail.com', '1999-01-18', '65615921', 'Male', 8, 2, 11, 1, 2, 2, '', '2024-06-14', '00:00:00'),
	(130, 'MV9194573', 'Miguel Alejandro', 'Villalobos Yampasi', 9194573, 'Z/ Villa San Antonio C/ 18 de Mayo # 33', 'aleyampasimiguel@gmail.com', '2001-03-17', '73708103', 'Male', 9, 2, 18, 1, 1, 3, '', '2024-06-14', '00:00:00'),
	(131, 'RC10922718', 'Rosa Andrea ', 'Cosme Huanca', 10922718, 'Z/ Ciudadela Av/ San Lorenzo # 4009', 'cosmeandrea@gmail.com', '1998-10-12', '77589345', 'Female', 8, 2, 16, 1, 6, 2, '', '2024-06-14', '00:00:00'),
	(132, 'JQ8449394', 'Juan Jose ', 'Quispe Calle ', 8449394, 'Z/ San Isidro C/ Bicentenario # 1', 'juanfaded@gmail.com', '1997-03-09', '73078411', 'Male', 7, 1, 16, 1, 1, 2, '', '2024-06-17', '00:00:00'),
	(133, 'IA6858743', 'Irmar Daniel', 'Aruquipa Mendez', 6858743, 'Z/ Los Andes C/ ApÃ³stol Santiago #1183', 'daielango.20@gmail.com', '1987-12-02', '67074424', 'Male', 7, 1, 16, 1, 1, 2, '', '2024-06-17', '00:00:00'),
	(134, 'JF7060799', 'Jenifer Alejandra ', 'Flores Mamani ', 7060799, 'Z/ Charapaqui 1 Av/ Jaime Mendoza #1514', 'jeniferflores690@gmail.com', '2003-01-04', '62518863', 'Female', 8, 2, 10, 1, 2, 2, '', '2024-06-17', '00:00:00'),
	(135, 'DC7059845', 'Daniela', 'Casa Catari', 7059845, 'Z/ TarapacÃ¡ c/ Tito Yupanqui # 9350', 'casacataridaniela@gmail.com', '1999-09-20', '69741229', 'Female', 8, 2, 10, 1, 2, 2, '', '2024-06-17', '00:00:00'),
	(136, 'SS7073322', 'Silvia ', 'Soliz Valero ', 7073322, 'Z/ Cosmos C/ Challa Centro  #2145', 'solizsilvia97@gmail.com', '2002-03-08', '69866354', 'Female', 8, 2, 10, 1, 2, 2, '', '2024-06-17', '00:00:00'),
	(137, 'KV14620347', 'Keila Rubi ', 'Valdez Aragan ', 14620347, 'Z/ San Miguel E Av/ Walter Guevara #1110', 'keilaargan489@gmail.com', '2004-01-01', '67114282', 'Female', 8, 2, 10, 1, 4, 2, '', '2024-06-17', '00:00:00'),
	(138, 'AL10072238', 'Anahi ', 'Luque Mamani ', 10072238, 'Z/ 6de Marzo C/ Esmeralda #90', 'anahiluquemamani@gmail.com', '2001-06-18', '71289493', 'Female', 8, 2, 10, 1, 2, 2, '', '2024-06-17', '00:00:00'),
	(139, 'MP6935618', 'Marco Antonio ', 'Paredes Ingali ', 6935618, 'Z/ UrkupiÃ±a 2 Viacha C/ 30 # 2269', 'antonyparedes2k@gmail.com', '2002-06-06', '76207524', 'Male', 8, 2, 10, 1, 2, 2, '', '2024-06-17', '00:00:00'),
	(140, 'MG12701949', 'Miguel Angel ', 'Guarachi Apaza', 12701949, 'Z/ 7 de Septiembre C/ 7 de Octubre #1084', 'mayckangel14@gmail.com', '1999-10-14', '73559538', 'Male', 8, 2, 10, 1, 2, 2, '', '2024-06-17', '00:00:00'),
	(141, 'JM13084562', 'Jhon Eddy', 'Mamani Aruni', 13084562, 'Z/ Villa Mercedes Av/ El Alto #2681', 'mamaniarunijhonedddy@gmail.com', '2003-10-02', '63107216', 'Male', 8, 2, 10, 1, 2, 2, '', '2024-06-17', '00:00:00'),
	(142, 'EQ9932252', 'Esther Gabriela', 'Quispe Layme', 9932252, 'Z/ 1 de Marzo C/ El Palmar # 6215', 'qesther752@gmail.com', '2003-06-29', '68122279', 'Female', 8, 2, 10, 1, 3, 2, '', '2024-06-17', '00:00:00'),
	(143, 'MA9129451', 'Marisol Noelia ', 'Alaro Vino ', 9129451, 'Z/ San Luis Pasa C/ HÃ©roes del Pacifico #1834', 'marisolnoeliaalarovino@gmail.coom', '2004-01-26', '73717025', 'Female', 8, 2, 10, 1, 2, 2, '', '2024-06-17', '00:00:00');

-- Volcando estructura para tabla stazher.institution
CREATE TABLE IF NOT EXISTS `institution` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_institution` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla stazher.institution: ~11 rows (aproximadamente)
INSERT INTO `institution` (`id`, `name_institution`) VALUES
	(1, 'Universidad Privada Franz Tamayo'),
	(2, 'Universidad Privada del Valle'),
	(10, 'Instituto Tecnico Comercial INCOS - EL Alto'),
	(11, 'Instituto Tecnico Comercial Superior de la Nacion TTE. Armando de Palacios "INCOS - La Paz"'),
	(12, 'Instituto Tecnologico Boliviano Suizo'),
	(13, 'Universidad Publica de El Alto'),
	(14, 'Universidad Mayor de San Andres'),
	(15, 'Universidad Privada Boliviana'),
	(16, 'Instituto Tecnico Comercial La Paz'),
	(17, 'Instituto Tecnico Financiero BOLIVIANO HOLANDES'),
	(18, 'Universidad Mayor de San Andres (UMSA)');

-- Volcando estructura para tabla stazher.licence
CREATE TABLE IF NOT EXISTS `licence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reason` text NOT NULL,
  `date_licence` date NOT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla stazher.licence: ~0 rows (aproximadamente)

-- Volcando estructura para tabla stazher.modality
CREATE TABLE IF NOT EXISTS `modality` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_modality` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla stazher.modality: ~3 rows (aproximadamente)
INSERT INTO `modality` (`id`, `type_modality`) VALUES
	(1, 'Pasantia'),
	(2, 'Practica Profesional '),
	(3, 'Trabajo Dirigido');

-- Volcando estructura para tabla stazher.overtime
CREATE TABLE IF NOT EXISTS `overtime` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(15) NOT NULL,
  `hours` double NOT NULL,
  `rate` double NOT NULL,
  `date_overtime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.overtime: ~0 rows (aproximadamente)

-- Volcando estructura para tabla stazher.position
CREATE TABLE IF NOT EXISTS `position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.position: ~5 rows (aproximadamente)
INSERT INTO `position` (`id`, `description`) VALUES
	(7, 'Direccion Administrativa Finaciera'),
	(8, 'Direccion de Operaciones'),
	(9, 'Direccion Comercial'),
	(10, 'Direccion Ejecutiva'),
	(11, 'Direccion General');

-- Volcando estructura para tabla stazher.schedules
CREATE TABLE IF NOT EXISTS `schedules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time_in` time NOT NULL,
  `time_out` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.schedules: ~1 rows (aproximadamente)
INSERT INTO `schedules` (`id`, `time_in`, `time_out`) VALUES
	(2, '08:30:00', '18:30:00');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
