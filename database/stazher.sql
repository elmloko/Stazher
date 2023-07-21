-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.27-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.3.0.6589
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
CREATE DATABASE IF NOT EXISTS `stazher` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla stazher.admin: ~1 rows (aproximadamente)
INSERT INTO `admin` (`id`, `username`, `password`, `firstname`, `lastname`, `photo`, `created_on`) VALUES
	(1, 'admin', '$2y$10$UrGSvHTWm8.ZK4BzPmo8iuqsK6XF5RfHay6ooC5D50y/nShon5wqe', 'Area', 'Sistemas', 'images-k9zsGpqit-transformed__1_-removebg-preview (1).png', '2019-12-18');

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
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla stazher.attendance: ~4 rows (aproximadamente)
INSERT INTO `attendance` (`id`, `employee_id`, `date`, `time_in`, `status`, `time_out`, `num_hr`) VALUES
	(122, 26, '2023-06-30', '07:00:00', 1, '18:50:27', 4),
	(123, 27, '2023-06-30', '00:00:00', 1, '12:00:00', 3.5),
	(124, 26, '2023-04-11', '10:45:00', 1, '22:45:00', 4),
	(125, 26, '2023-07-05', '00:00:00', 1, '00:00:00', 7.5);

-- Volcando estructura para tabla stazher.career
CREATE TABLE IF NOT EXISTS `career` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_career` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla stazher.career: ~5 rows (aproximadamente)
INSERT INTO `career` (`id`, `name_career`) VALUES
	(1, 'Ingenierira en Sistemas'),
	(2, 'Ingeniería en Telecomunicaciones'),
	(3, 'Ingeniería Industrial'),
	(4, 'Ingeniería Electrónica'),
	(7, 'Contabilidad');

-- Volcando estructura para tabla stazher.cashadvance
CREATE TABLE IF NOT EXISTS `cashadvance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_advance` date NOT NULL,
  `employee_id` varchar(15) NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla stazher.cashadvance: ~1 rows (aproximadamente)
INSERT INTO `cashadvance` (`id`, `date_advance`, `employee_id`, `amount`) VALUES
	(1, '2020-01-07', '25', 50000);

-- Volcando estructura para tabla stazher.deductions
CREATE TABLE IF NOT EXISTS `deductions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla stazher.deductions: ~1 rows (aproximadamente)
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
  `licence_id` int(11) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla stazher.employees: ~4 rows (aproximadamente)
INSERT INTO `employees` (`id`, `employee_id`, `firstname`, `lastname`, `identity_card`, `address`, `email`, `birthdate`, `contact_info`, `gender`, `position_id`, `schedule_id`, `institution_id`, `modality_id`, `career_id`, `licence_id`, `photo`, `created_on`) VALUES
	(26, 'ULQ014925673', 'Marco Antonio', 'Espinoza Rojas', 10909669, 'Cota Cota', 'marco@gmail.com', '1997-12-01', '75847560', 'Male', 7, 2, 1, 2, 1, 1, '', '2023-06-30'),
	(27, 'IBQ138462097', 'gicela ', 'mendez', 477474575, '1212121', 'marco@mail.com', '1998-12-30', '21212', 'Male', 8, 2, 3, 3, 2, 2, '', '2023-06-30'),
	(29, 'KYS706231854', 'Christian Yoel', 'Espinoza Rojas', 121212, 'Miraflores', 'ale@gmail.com', '2023-07-11', '21212', 'Male', 7, 5, 1, 2, 4, 3, '', '2023-07-02'),
	(31, 'LD121213213', 'Leonardo ', 'Doria Medina', 121213213, 'Llojeta', 'leo@gmail.com', '2023-02-21', '2131231231', 'Male', 7, 5, 2, 2, 2, 4, '', '2023-07-02');

-- Volcando estructura para tabla stazher.institution
CREATE TABLE IF NOT EXISTS `institution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_institution` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla stazher.institution: ~4 rows (aproximadamente)
INSERT INTO `institution` (`id`, `name_institution`) VALUES
	(1, 'Universidad Privada Franz Tamayo'),
	(2, 'Universidad Privada del Valle'),
	(3, 'Universidad Mayor de San Andrés '),
	(5, 'Universidad Pública de El Alto');

-- Volcando estructura para tabla stazher.licence
CREATE TABLE IF NOT EXISTS `licence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` text NOT NULL,
  `date_licence` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla stazher.licence: ~3 rows (aproximadamente)
INSERT INTO `licence` (`id`, `reason`, `date_licence`) VALUES
	(1, 'Gripe', '2023-07-04'),
	(2, 'Hambre', '2023-07-21'),
	(3, 'dsdsdsdsdsdsd', '2023-07-20');

-- Volcando estructura para tabla stazher.modality
CREATE TABLE IF NOT EXISTS `modality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_modality` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla stazher.overtime: ~0 rows (aproximadamente)

-- Volcando estructura para tabla stazher.position
CREATE TABLE IF NOT EXISTS `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
licence