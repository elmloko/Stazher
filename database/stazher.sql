-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.38-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             12.5.0.6677
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
CREATE DATABASE IF NOT EXISTS `stazher` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `stazher`;

-- Volcando estructura para tabla stazher.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.admin: ~0 rows (aproximadamente)
INSERT INTO `admin` (`id`, `username`, `password`, `firstname`, `lastname`, `photo`, `created_on`) VALUES
	(1, 'admin', '$2y$10$YlZaheXiCr1BSaxbRw7LuOs4bQJAm9snLeodQ0YwdT5.wUITWOdtW', 'Area', 'Sistemas', 'images-k9zsGpqit-transformed__1_-removebg-preview (1).png', '2019-12-18');

-- Volcando estructura para tabla stazher.area
CREATE TABLE IF NOT EXISTS `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_area` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla stazher.area: ~6 rows (aproximadamente)
INSERT INTO `area` (`id`, `name_area`) VALUES
	(1, 'Sistemas'),
	(2, 'Contabilidad'),
	(3, 'Legal'),
	(5, 'RRHH'),
	(6, 'DAF'),
	(7, 'Comercial');

-- Volcando estructura para tabla stazher.attendance
CREATE TABLE IF NOT EXISTS `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time_in` time NOT NULL,
  `status` int(11) NOT NULL,
  `time_out` time NOT NULL,
  `num_hr` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.attendance: ~27 rows (aproximadamente)
INSERT INTO `attendance` (`id`, `employee_id`, `date`, `time_in`, `status`, `time_out`, `num_hr`) VALUES
	(1, 35, '2023-07-25', '15:08:14', 1, '18:23:11', 3.2333333333333),
	(2, 36, '2023-07-25', '15:15:16', 1, '18:31:07', 3.25),
	(3, 37, '2023-07-25', '15:23:31', 0, '00:00:00', 0),
	(4, 33, '2023-07-25', '15:24:02', 0, '18:26:56', 2.0333333333333),
	(5, 38, '2023-07-25', '15:28:28', 0, '18:44:00', 2.25),
	(6, 39, '2023-07-25', '15:33:50', 0, '18:44:16', 3.1666666666667),
	(7, 40, '2023-07-25', '15:37:42', 0, '18:43:07', 3.0833333333333),
	(8, 41, '2023-07-25', '15:43:05', 0, '18:43:27', 3),
	(9, 43, '2023-07-25', '15:54:19', 0, '18:07:24', 2.2166666666667),
	(10, 44, '2023-07-25', '15:58:18', 0, '16:45:42', 0.2),
	(11, 45, '2023-07-25', '16:01:29', 0, '16:45:31', 0.25),
	(12, 46, '2023-07-25', '16:15:21', 0, '00:00:00', 0),
	(13, 42, '2023-07-25', '18:32:29', 0, '18:33:06', 0.033333333333333),
	(14, 34, '2023-07-26', '12:15:01', 0, '00:00:00', 0),
	(15, 32, '2023-07-26', '12:15:10', 0, '00:00:00', 0),
	(16, 37, '2023-07-26', '12:59:16', 0, '18:29:34', 3.5),
	(17, 39, '2023-07-26', '12:59:26', 1, '00:00:00', 0),
	(18, 38, '2023-07-26', '12:59:33', 0, '18:30:01', 3.5),
	(19, 40, '2023-07-26', '13:48:40', 0, '18:50:40', 4.0333333333333),
	(20, 36, '2023-07-26', '13:54:34', 1, '18:34:33', 3.0666666666667),
	(21, 43, '2023-07-26', '14:04:01', 1, '17:39:50', 3.15),
	(22, 42, '2023-07-26', '14:20:38', 1, '18:32:41', 3.0333333333333),
	(23, 36, '2023-07-27', '15:27:38', 1, '00:00:00', 0),
	(24, 33, '2023-07-27', '15:38:48', 0, '00:00:00', 0),
	(25, 34, '2023-07-27', '16:12:17', 0, '00:00:00', 5.0166666666667),
	(26, 45, '2023-07-27', '16:41:06', 0, '16:41:19', 0.98333333333333),
	(27, 44, '2023-07-27', '16:41:33', 0, '16:41:42', 0.98333333333333);

-- Volcando estructura para tabla stazher.career
CREATE TABLE IF NOT EXISTS `career` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_career` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla stazher.career: ~7 rows (aproximadamente)
INSERT INTO `career` (`id`, `name_career`) VALUES
	(1, 'Ingenieria en Sistemas'),
	(2, 'Ingeniería en Telecomunicaciones'),
	(3, 'Ingeniería Industrial'),
	(4, 'Ingeniería Electrónica'),
	(7, 'Contabilidad'),
	(9, 'Comercio Internacional y AdministraciÃ³n Aduanera'),
	(10, 'Secretariado Ejecutivo');

-- Volcando estructura para tabla stazher.cashadvance
CREATE TABLE IF NOT EXISTS `cashadvance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_advance` date NOT NULL,
  `employee_id` varchar(15) NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.cashadvance: ~0 rows (aproximadamente)
INSERT INTO `cashadvance` (`id`, `date_advance`, `employee_id`, `amount`) VALUES
	(1, '2020-01-07', '25', 50000);

-- Volcando estructura para tabla stazher.deductions
CREATE TABLE IF NOT EXISTS `deductions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.deductions: ~0 rows (aproximadamente)
INSERT INTO `deductions` (`id`, `description`, `amount`) VALUES
	(5, 'Pago de EPS 4%', 2500);

-- Volcando estructura para tabla stazher.employees
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(15) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `identity_card` int(11) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `birthdate` date NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `position_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `institution_id` int(11) NOT NULL,
  `modality_id` int(11) NOT NULL,
  `career_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.employees: ~14 rows (aproximadamente)
INSERT INTO `employees` (`id`, `employee_id`, `firstname`, `lastname`, `identity_card`, `address`, `email`, `birthdate`, `contact_info`, `gender`, `position_id`, `schedule_id`, `institution_id`, `modality_id`, `career_id`, `area_id`, `photo`, `created_on`) VALUES
	(32, 'MQ9907566', 'Maria Alexandra', 'Quintanilla Guarachi', 9907566, 'AV. ARCE', 'mariaalejandraquintanilla6@gmail.com', '2001-04-15', '60471009', 'Female', 7, 1, 1, 2, 1, 2, '', '2023-07-24'),
	(33, 'ME10909669', 'Marco Antonio ', 'Espinoza Rojas', 10909669, 'Chasquipampa', 'marco-_-antonio@live.com', '1997-12-01', '75847560', 'Male', 7, 1, 1, 2, 1, 2, '', '2023-07-24'),
	(34, 'LD6727073', 'Leonardo Glen', 'Doria Medina Ochoa', 6727073, 'Av mario mercado ', 'joseaguilar987654321@gmail.com', '2001-03-29', '78877682', 'Male', 7, 1, 1, 2, 1, 2, '', '2023-07-24'),
	(35, 'JR10915793', 'Jorge Steven', 'Ramirez Cornejo', 10915793, '', 'steven200239@icloud.com', '2002-09-12', '63126778', 'Male', 7, 6, 7, 2, 9, 6, '', '2023-07-25'),
	(36, 'MG8591005', 'Michelle Melissa', 'Galvan Rojas ', 8591005, 'El Alto Villa Alemania calle 3 Antonio de Mendoza  ', 'galvnmichelle@gmail.com', '2003-06-16', '79521623', 'Female', 7, 6, 6, 2, 9, 6, '', '2023-07-25'),
	(37, 'CA10064138', 'Carla Wendy', 'Acarapi Apaza', 10064138, 'Av. Civica, Zona Santa Rosa, NÂ°59', 'cardyaa11@gmail.com', '2000-12-26', '62440944', 'Female', 7, 7, 7, 2, 9, 6, '', '2023-07-25'),
	(38, 'MQ9898132', 'Marisol Laura', 'Quispe Choque', 9898132, 'Pasankeri - Av. Marcelo Quiroga Santa Cruz #1913', 'laurabyul204@gmail.com', '1997-01-05', '68092658', 'Female', 7, 7, 7, 1, 9, 6, '', '2023-07-25'),
	(39, 'DQ9898120', 'Dayana Rosa', 'Quispe Choque', 9898120, 'ZONA PASANKERI AV. MARCELO QUIROGA SANTA CRUZ', 'Dayanarosaquispechoque@gmail.com', '1999-07-30', '68049239', 'Female', 7, 6, 7, 2, 9, 6, '', '2023-07-25'),
	(40, 'KE9991737', 'Konor', 'Escobar Alanoca', 9991737, 'Avenida 6 Calle Ayacucho NÂº2000', 'konorescobaralanoca@gmail.com', '2003-01-13', '77705937', 'Male', 7, 2, 6, 1, 7, 6, '', '2023-07-25'),
	(41, 'MT11066713', 'Mariluz ', 'Ticona Mamani', 11066713, 'Z. Chijini Alto Calle 18 Esquina 2 N||9405', 'ticonamariluz15@gmail.com', '2003-05-01', '73290582', 'Female', 7, 2, 6, 1, 7, 6, '', '2023-07-25'),
	(42, 'YT9066508', 'Yurguen Boris ', 'Terrazas Canaviri', 9066508, 'El Alto', 'boristerrazas016@gmail.com', '1999-05-15', '63156100', 'Male', 7, 6, 6, 2, 9, 6, '', '2023-07-25'),
	(43, 'JZ8461440', 'Jade Alejandra ', 'Zambrana Choque', 8461440, 'av. iv centenario num. 911', 'zambrana.choque.jade.2021@incoslapaz.org', '2003-04-08', '72069097', 'Female', 7, 6, 7, 1, 9, 6, '', '2023-07-25'),
	(44, 'LG8277686', 'Luisa Maria ', 'Gutierrez Arroyo ', 8277686, 'calle 4 alto San Antonio ', 'luisagmary@gmail.com', '1998-12-16', '79135122', 'Female', 7, 3, 8, 1, 10, 6, '', '2023-07-25'),
	(45, 'AP9124942', 'Annaly', 'Pairumani FernÃ¡ndez', 9124942, 'avenida buenos aires', 'annalypairumani@gmail.com', '1999-03-06', '74062928', 'Female', 7, 3, 8, 1, 10, 6, '', '2023-07-25'),
	(46, 'JT12988723', 'Judith', 'Ticona Illanes', 12988723, 'C/Saoruro #1800 Z/ Bautista Saavedra', 'yulisatais@gmail.com', '2001-09-07', '71280670', 'Female', 7, 3, 6, 1, 10, 6, '', '2023-07-25');

-- Volcando estructura para tabla stazher.institution
CREATE TABLE IF NOT EXISTS `institution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_institution` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla stazher.institution: ~6 rows (aproximadamente)
INSERT INTO `institution` (`id`, `name_institution`) VALUES
	(1, 'Universidad Privada Franz Tamayo'),
	(2, 'Universidad Privada del Valle'),
	(3, 'Universidad Mayor de San Andrés '),
	(5, 'Universidad Pública de El Alto'),
	(6, 'INCOS "El Alto"'),
	(7, 'INCOS "La Paz"'),
	(8, 'Instituto TÃ©cnico Comercial');

-- Volcando estructura para tabla stazher.licence
CREATE TABLE IF NOT EXISTS `licence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` text NOT NULL,
  `date_licence` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla stazher.licence: ~3 rows (aproximadamente)
INSERT INTO `licence` (`id`, `reason`, `date_licence`, `employee_id`) VALUES
	(1, 'Gripe', '2023-07-04', 29),
	(2, 'Hambre', '2023-07-21', 27),
	(3, 'dsdsdsdsdsdsd', '2023-07-20', 26);

-- Volcando estructura para tabla stazher.modality
CREATE TABLE IF NOT EXISTS `modality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_modality` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla stazher.modality: ~3 rows (aproximadamente)
INSERT INTO `modality` (`id`, `type_modality`) VALUES
	(1, 'Pasantia'),
	(2, 'Practica Profesional '),
	(3, 'Trabajo Dirigido');

-- Volcando estructura para tabla stazher.overtime
CREATE TABLE IF NOT EXISTS `overtime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(15) NOT NULL,
  `hours` double NOT NULL,
  `rate` double NOT NULL,
  `date_overtime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.overtime: ~0 rows (aproximadamente)

-- Volcando estructura para tabla stazher.position
CREATE TABLE IF NOT EXISTS `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.position: ~2 rows (aproximadamente)
INSERT INTO `position` (`id`, `description`) VALUES
	(7, 'Direccion Administrativa Finaciera'),
	(8, 'Operaciones');

-- Volcando estructura para tabla stazher.schedules
CREATE TABLE IF NOT EXISTS `schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time_in` time NOT NULL,
  `time_out` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.schedules: ~3 rows (aproximadamente)
INSERT INTO `schedules` (`id`, `time_in`, `time_out`) VALUES
	(2, '08:30:00', '18:30:00'),
	(5, '08:30:00', '13:00:00'),
	(6, '14:30:00', '18:30:00');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
