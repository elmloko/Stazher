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
CREATE DATABASE IF NOT EXISTS `stazher` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `stazher`;

-- Volcando estructura para tabla stazher.absences
CREATE TABLE IF NOT EXISTS `absences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reason` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `employee_id` int NOT NULL,
  `date_absences` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla stazher.absences: ~4 rows (aproximadamente)
INSERT IGNORE INTO `absences` (`id`, `reason`, `employee_id`, `date_absences`) VALUES
	(7, 'XXX', 27, '2023-08-02'),
	(8, 'xxxxxxxxx', 32, '1997-12-01'),
	(9, '3232323', 29, '2023-08-02'),
	(10, 'wqqwqwqwq', 29, '2023-08-02');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.admin: ~0 rows (aproximadamente)
INSERT IGNORE INTO `admin` (`id`, `username`, `password`, `firstname`, `lastname`, `photo`, `created_on`) VALUES
	(1, 'admin', '$2y$10$UrGSvHTWm8.ZK4BzPmo8iuqsK6XF5RfHay6ooC5D50y/nShon5wqe', 'Area', 'Sistemas', 'images-k9zsGpqit-transformed__1_-removebg-preview (1).png', '2019-12-18');

-- Volcando estructura para tabla stazher.area
CREATE TABLE IF NOT EXISTS `area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_area` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla stazher.area: ~5 rows (aproximadamente)
INSERT IGNORE INTO `area` (`id`, `name_area`) VALUES
	(1, 'Sistemas'),
	(2, 'Contabilidad'),
	(3, 'Legal'),
	(4, 'Auditoria'),
	(5, 'RRHH');

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
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.attendance: ~1 rows (aproximadamente)
INSERT IGNORE INTO `attendance` (`id`, `employee_id`, `date`, `time_in`, `status`, `time_out`, `status2`, `num_hr`) VALUES
	(123, 27, '2023-06-30', '07:00:00', 1, '10:45:00', 1, 2.25),
	(126, 27, '2023-07-10', '08:30:00', 1, '13:30:00', 2, 3.5),
	(127, 32, '2023-07-13', '08:15:00', 1, '18:45:00', 2, 9),
	(128, 32, '2023-08-07', '18:47:41', 0, NULL, 1, NULL),
	(129, 27, '2023-08-07', '18:48:24', 0, NULL, 2, NULL),
	(130, 32, '2023-08-08', '10:30:00', 0, '22:30:00', 2, 7);

-- Volcando estructura para tabla stazher.career
CREATE TABLE IF NOT EXISTS `career` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_career` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla stazher.career: ~5 rows (aproximadamente)
INSERT IGNORE INTO `career` (`id`, `name_career`) VALUES
	(1, 'Ingenierira en Sistemas'),
	(2, 'Ingeniería en Telecomunicaciones'),
	(3, 'Ingeniería Industrial'),
	(4, 'Ingeniería Electrónica'),
	(7, 'Contabilidad');

-- Volcando estructura para tabla stazher.cashadvance
CREATE TABLE IF NOT EXISTS `cashadvance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_advance` date NOT NULL,
  `employee_id` varchar(15) NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.cashadvance: ~0 rows (aproximadamente)
INSERT IGNORE INTO `cashadvance` (`id`, `date_advance`, `employee_id`, `amount`) VALUES
	(1, '2020-01-07', '25', 50000);

-- Volcando estructura para tabla stazher.deductions
CREATE TABLE IF NOT EXISTS `deductions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.deductions: ~0 rows (aproximadamente)
INSERT IGNORE INTO `deductions` (`id`, `description`, `amount`) VALUES
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.employees: ~4 rows (aproximadamente)
INSERT IGNORE INTO `employees` (`id`, `employee_id`, `firstname`, `lastname`, `identity_card`, `address`, `email`, `birthdate`, `contact_info`, `gender`, `position_id`, `schedule_id`, `institution_id`, `modality_id`, `career_id`, `area_id`, `photo`, `created_on`) VALUES
	(27, 'IBQ138462097', 'gicela ', 'mendez', 477474575, '1212121', 'marco@mail.com', '1998-12-30', '21212', 'Male', 8, 5, 3, 3, 2, 2, '', '2023-06-30'),
	(29, 'KYS706231854', 'Christian Yoel', 'Espinoza Rojas', 121212, 'Miraflores', 'ale@gmail.com', '2023-07-11', '21212', 'Male', 7, 5, 1, 2, 4, 1, '', '2023-07-02'),
	(31, 'LD121213213', 'Leonardo ', 'Doria Medina', 121213213, 'Llojeta', 'leo@gmail.com', '2023-02-21', '2131231231', 'Male', 7, 5, 2, 2, 2, 3, '', '2023-07-02'),
	(32, 'ME10909669', 'Marco Antonio', 'Espinoza Rojas', 10909669, 'Chasquipampa', 'marco@gmail.com', '1997-12-01', '75847560', 'Male', 7, 2, 1, 2, 1, 1, '', '2023-07-26');

-- Volcando estructura para tabla stazher.institution
CREATE TABLE IF NOT EXISTS `institution` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_institution` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla stazher.institution: ~4 rows (aproximadamente)
INSERT IGNORE INTO `institution` (`id`, `name_institution`) VALUES
	(1, 'Universidad Privada Franz Tamayo'),
	(2, 'Universidad Privada del Valle'),
	(3, 'Universidad Mayor de San Andrés '),
	(5, 'Universidad Pública de El Alto');

-- Volcando estructura para tabla stazher.licence
CREATE TABLE IF NOT EXISTS `licence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_licence` date NOT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla stazher.licence: ~3 rows (aproximadamente)
INSERT IGNORE INTO `licence` (`id`, `reason`, `date_licence`, `employee_id`) VALUES
	(6, 'gato', '2023-08-01', 32),
	(9, 'e132213', '2023-08-04', 32);

-- Volcando estructura para tabla stazher.modality
CREATE TABLE IF NOT EXISTS `modality` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_modality` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla stazher.modality: ~3 rows (aproximadamente)
INSERT IGNORE INTO `modality` (`id`, `type_modality`) VALUES
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.overtime: ~0 rows (aproximadamente)

-- Volcando estructura para tabla stazher.position
CREATE TABLE IF NOT EXISTS `position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.position: ~2 rows (aproximadamente)
INSERT IGNORE INTO `position` (`id`, `description`) VALUES
	(7, 'Direccion Administrativa Finaciera'),
	(8, 'Operaciones');

-- Volcando estructura para tabla stazher.schedules
CREATE TABLE IF NOT EXISTS `schedules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time_in` time NOT NULL,
  `time_out` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stazher.schedules: ~3 rows (aproximadamente)
INSERT IGNORE INTO `schedules` (`id`, `time_in`, `time_out`) VALUES
	(2, '08:30:00', '18:30:00'),
	(5, '08:30:00', '13:00:00'),
	(6, '14:30:00', '18:30:00');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
