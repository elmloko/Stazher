-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.28-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.4.0.6659
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

-- Volcando datos para la tabla stazher.admin: ~0 rows (aproximadamente)
INSERT INTO `admin` (`id`, `username`, `password`, `firstname`, `lastname`, `photo`, `created_on`) VALUES
	(1, 'admin', '$2y$10$UrGSvHTWm8.ZK4BzPmo8iuqsK6XF5RfHay6ooC5D50y/nShon5wqe', 'Mauricio', 'Sevilla', 'logo1.jpg', '2019-12-18');

-- Volcando estructura para tabla stazher.attendance
CREATE TABLE IF NOT EXISTS `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time_in` time NOT NULL,
  `status` int(1) NOT NULL,
  `time_out` time NOT NULL,
  `num_hr` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla stazher.attendance: ~2 rows (aproximadamente)
INSERT INTO `attendance` (`id`, `employee_id`, `date`, `time_in`, `status`, `time_out`, `num_hr`) VALUES
	(119, 24, '2020-01-07', '10:11:26', 0, '00:00:00', 0),
	(120, 25, '2020-01-07', '10:17:04', 0, '00:00:00', 0),
	(121, 24, '2023-06-29', '19:35:02', 0, '00:00:00', 0);

-- Volcando estructura para tabla stazher.cashadvance
CREATE TABLE IF NOT EXISTS `cashadvance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_advance` date NOT NULL,
  `employee_id` varchar(15) NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla stazher.cashadvance: ~0 rows (aproximadamente)
INSERT INTO `cashadvance` (`id`, `date_advance`, `employee_id`, `amount`) VALUES
	(1, '2020-01-07', '25', 50000);

-- Volcando estructura para tabla stazher.deductions
CREATE TABLE IF NOT EXISTS `deductions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla stazher.deductions: ~0 rows (aproximadamente)
INSERT INTO `deductions` (`id`, `description`, `amount`) VALUES
	(5, 'Pago de EPS 4%', 2500);

-- Volcando estructura para tabla stazher.employees
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(15) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `birthdate` date NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `position_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla stazher.employees: ~2 rows (aproximadamente)
INSERT INTO `employees` (`id`, `employee_id`, `firstname`, `lastname`, `address`, `birthdate`, `contact_info`, `gender`, `position_id`, `schedule_id`, `photo`, `created_on`) VALUES
	(24, 'MAW817094635', 'Abelardo', 'Mejia', 'Calle 54 N 12-23', '1989-07-12', '', 'Female', 2, 2, '', '2020-01-07'),
	(25, 'PJO724930615', 'Roberto', 'Velasquez', 'Av 15 12-72', '1989-06-13', '75757575', 'Male', 1, 2, '', '2020-01-07');

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
  `rate` double unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla stazher.position: ~4 rows (aproximadamente)
INSERT INTO `position` (`id`, `description`, `rate`) VALUES
	(1, 'Programador', 0000000000000000100000),
	(2, 'Escritor', 0000000000000000000000),
	(3, 'Marketing ', 0000000000000000042000),
	(4, 'DiseÃ±ador GrÃ¡fico', 0000000000000000000000),
	(5, 'asasa', 0000000000000000000000);

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
