-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 16, 2022 at 03:51 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `er`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

DROP TABLE IF EXISTS `admin_login`;
CREATE TABLE IF NOT EXISTS `admin_login` (
  `username` varchar(10) NOT NULL DEFAULT '',
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`username`, `password`) VALUES
('admin1', 'Admin@1234');

-- --------------------------------------------------------

--
-- Table structure for table `demo`
--

DROP TABLE IF EXISTS `demo`;
CREATE TABLE IF NOT EXISTS `demo` (
  `updated` varchar(20) DEFAULT NULL,
  `declared` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `demo`
--

INSERT INTO `demo` (`updated`, `declared`) VALUES
('on', 'on'),
('on', NULL),
('on', NULL),
('Regular Sem 1', NULL),
(NULL, 'Regular Sem 1'),
('Regular Sem 1', 'Regular Sem 1'),
(NULL, 'Regular Sem 1');

-- --------------------------------------------------------

--
-- Table structure for table `overall_result`
--

DROP TABLE IF EXISTS `overall_result`;
CREATE TABLE IF NOT EXISTS `overall_result` (
  `semester` varchar(20) NOT NULL,
  `comp_code` varchar(10) NOT NULL,
  `comp_pass` varchar(20) NOT NULL,
  `comp_fail` varchar(20) NOT NULL,
  `it_code` varchar(10) NOT NULL,
  `it_pass` varchar(20) NOT NULL,
  `it_fail` varchar(20) NOT NULL,
  `elec_code` varchar(20) NOT NULL,
  `elec_pass` varchar(20) NOT NULL,
  `elec_fail` varchar(20) NOT NULL,
  `ec_code` varchar(10) NOT NULL,
  `ec_pass` varchar(20) NOT NULL,
  `ec_fail` varchar(20) NOT NULL,
  `civil_code` varchar(10) NOT NULL,
  `civil_pass` varchar(20) NOT NULL,
  `civil_fail` varchar(20) NOT NULL,
  `mech_code` varchar(10) NOT NULL,
  `mech_pass` varchar(20) NOT NULL,
  `mech_fail` varchar(20) NOT NULL,
  `aero_code` varchar(10) NOT NULL,
  `aero_pass` varchar(20) NOT NULL,
  `aero_fail` varchar(20) NOT NULL,
  PRIMARY KEY (`semester`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `overall_result`
--

INSERT INTO `overall_result` (`semester`, `comp_code`, `comp_pass`, `comp_fail`, `it_code`, `it_pass`, `it_fail`, `elec_code`, `elec_pass`, `elec_fail`, `ec_code`, `ec_pass`, `ec_fail`, `civil_code`, `civil_pass`, `civil_fail`, `mech_code`, `mech_pass`, `mech_fail`, `aero_code`, `aero_pass`, `aero_fail`) VALUES
('Sem 7', '07', '90', '10', '21', '80', '20', '05', '85', '15', '06', '70', '30', '02', '60', '40', '15', '80', '20', '20', '76', '24');

-- --------------------------------------------------------

--
-- Table structure for table `reg`
--

DROP TABLE IF EXISTS `reg`;
CREATE TABLE IF NOT EXISTS `reg` (
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `confirmemail` varchar(30) NOT NULL,
  `altemail` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `conpassword` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `phone` bigint(10) NOT NULL,
  `enrollment` varchar(12) NOT NULL,
  `course` varchar(10) NOT NULL,
  `college` varchar(30) NOT NULL,
  `sem` varchar(20) NOT NULL,
  `department` varchar(30) NOT NULL,
  `exam` varchar(10) NOT NULL,
  `captchacode` varchar(6) NOT NULL,
  PRIMARY KEY (`enrollment`),
  UNIQUE KEY `captchacode` (`captchacode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg`
--

INSERT INTO `reg` (`firstname`, `lastname`, `email`, `confirmemail`, `altemail`, `password`, `conpassword`, `gender`, `phone`, `enrollment`, `course`, `college`, `sem`, `department`, `exam`, `captchacode`) VALUES
('Shipra', 'Shah', 'shahshipra90@gmail.com', 'shahshipra90@gmail.com', 'shahshipra027@gmail.com', 'Shipra@180413107018', 'Shipra@180413107018', 'Female', 9638062066, '180413107018', 'BE', 'SVIT, VASAD', 'Sem 7', 'Computer Enggineering', '2020-05', 'u440');

-- --------------------------------------------------------

--
-- Table structure for table `result_aero`
--

DROP TABLE IF EXISTS `result_aero`;
CREATE TABLE IF NOT EXISTS `result_aero` (
  `department` varchar(30) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `enrollment` varchar(12) NOT NULL,
  `practical1` varchar(20) NOT NULL,
  `practical2` varchar(20) NOT NULL,
  `practical3` varchar(20) NOT NULL,
  `practical4` varchar(20) NOT NULL,
  `practical5` varchar(20) NOT NULL,
  `practical6` varchar(20) NOT NULL,
  `practical7` varchar(20) NOT NULL,
  `theory1` varchar(20) NOT NULL,
  `theory2` varchar(20) NOT NULL,
  `theory3` varchar(20) NOT NULL,
  `theory4` varchar(20) NOT NULL,
  `theory5` varchar(20) NOT NULL,
  `theory6` varchar(20) NOT NULL,
  `theory7` varchar(20) NOT NULL,
  `st1` varchar(10) NOT NULL,
  `st2` varchar(10) NOT NULL,
  `st3` varchar(10) NOT NULL,
  `st4` varchar(10) NOT NULL,
  `st5` varchar(10) NOT NULL,
  `st6` varchar(10) NOT NULL,
  `st7` varchar(10) NOT NULL,
  `percentage` varchar(10) NOT NULL,
  `total` varchar(10) NOT NULL,
  PRIMARY KEY (`enrollment`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `result_ce`
--

DROP TABLE IF EXISTS `result_ce`;
CREATE TABLE IF NOT EXISTS `result_ce` (
  `department` varchar(30) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `enrollment` varchar(12) NOT NULL,
  `practical1` varchar(20) NOT NULL,
  `practical2` varchar(20) NOT NULL,
  `practical3` varchar(20) NOT NULL,
  `practical4` varchar(20) NOT NULL,
  `practical5` varchar(20) NOT NULL,
  `practical6` varchar(20) NOT NULL,
  `practical7` varchar(20) NOT NULL,
  `theory1` varchar(20) NOT NULL,
  `theory2` varchar(20) NOT NULL,
  `theory3` varchar(20) NOT NULL,
  `theory4` varchar(20) NOT NULL,
  `theory5` varchar(20) NOT NULL,
  `theory6` varchar(20) NOT NULL,
  `theory7` varchar(20) NOT NULL,
  `st1` int(10) NOT NULL,
  `st2` varchar(10) NOT NULL,
  `st3` varchar(10) NOT NULL,
  `st4` varchar(10) NOT NULL,
  `st5` varchar(10) NOT NULL,
  `st6` varchar(10) NOT NULL,
  `st7` varchar(10) NOT NULL,
  `total` varchar(20) NOT NULL,
  `percentage` varchar(20) NOT NULL,
  PRIMARY KEY (`enrollment`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result_ce`
--

INSERT INTO `result_ce` (`department`, `semester`, `enrollment`, `practical1`, `practical2`, `practical3`, `practical4`, `practical5`, `practical6`, `practical7`, `theory1`, `theory2`, `theory3`, `theory4`, `theory5`, `theory6`, `theory7`, `st1`, `st2`, `st3`, `st4`, `st5`, `st6`, `st7`, `total`, `percentage`) VALUES
('Computer Enggineering', 'sem 6', '180413107001', '20', '20', '20', '20', '20', '20', '0', '40', '30', '40', '40', '40', '40', '0', 60, '50', '60', '60', '60', '60', '0', '97.22222222222223', '350'),
('Computer Enggineering', 'sem 6', '180413107014', '20', '20', '20', '20', '20', '20', '0', '40', '40', '40', '40', '20', '40', '0', 60, '60', '60', '60', '40', '60', '0', '340', '94.44444444444444'),
('Computer Enggineering', 'Sem 8', '180413107002', '15', '20', '0', '0', '0', '0', '0', '15', '40', '0', '0', '0', '0', '0', 30, '30', '0', '0', '0', '0', '0', '60', '50');

-- --------------------------------------------------------

--
-- Table structure for table `result_civil`
--

DROP TABLE IF EXISTS `result_civil`;
CREATE TABLE IF NOT EXISTS `result_civil` (
  `department` varchar(30) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `enrollment` varchar(12) NOT NULL,
  `practical1` varchar(20) NOT NULL,
  `practical2` varchar(20) NOT NULL,
  `practical3` varchar(20) NOT NULL,
  `practical4` varchar(20) NOT NULL,
  `practical5` varchar(20) NOT NULL,
  `practical6` varchar(20) NOT NULL,
  `practical7` varchar(20) NOT NULL,
  `theory1` varchar(20) NOT NULL,
  `theory2` varchar(20) NOT NULL,
  `theory3` varchar(20) NOT NULL,
  `theory4` varchar(20) NOT NULL,
  `theory5` varchar(20) NOT NULL,
  `theory6` varchar(20) NOT NULL,
  `theory7` varchar(20) NOT NULL,
  `st1` varchar(10) NOT NULL,
  `st2` varchar(10) NOT NULL,
  `st3` varchar(10) NOT NULL,
  `st4` varchar(10) NOT NULL,
  `st5` varchar(10) NOT NULL,
  `st6` varchar(10) NOT NULL,
  `st7` varchar(10) NOT NULL,
  `percentage` varchar(10) NOT NULL,
  `total` varchar(10) NOT NULL,
  PRIMARY KEY (`enrollment`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `result_ec`
--

DROP TABLE IF EXISTS `result_ec`;
CREATE TABLE IF NOT EXISTS `result_ec` (
  `department` varchar(30) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `enrollment` varchar(12) NOT NULL,
  `practical1` varchar(20) NOT NULL,
  `practical2` varchar(20) NOT NULL,
  `pratical3` varchar(20) NOT NULL,
  `practical4` varchar(20) NOT NULL,
  `practical5` varchar(20) NOT NULL,
  `practical6` varchar(20) NOT NULL,
  `practical7` varchar(20) NOT NULL,
  `theory1` varchar(20) NOT NULL,
  `theory2` varchar(20) NOT NULL,
  `theory3` varchar(20) NOT NULL,
  `theory4` varchar(20) NOT NULL,
  `theory5` varchar(20) NOT NULL,
  `theory6` varchar(20) NOT NULL,
  `theory7` varchar(20) NOT NULL,
  `st1` varchar(10) NOT NULL,
  `st2` varchar(10) NOT NULL,
  `st3` varchar(10) NOT NULL,
  `st4` varchar(10) NOT NULL,
  `st5` varchar(10) NOT NULL,
  `st6` varchar(10) NOT NULL,
  `st7` varchar(10) NOT NULL,
  `percentage` varchar(10) NOT NULL,
  `total` varchar(10) NOT NULL,
  PRIMARY KEY (`enrollment`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `result_electrical`
--

DROP TABLE IF EXISTS `result_electrical`;
CREATE TABLE IF NOT EXISTS `result_electrical` (
  `department` varchar(30) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `enrollment` varchar(12) NOT NULL,
  `practical1` varchar(20) NOT NULL,
  `practical2` varchar(20) NOT NULL,
  `practical3` varchar(20) NOT NULL,
  `practical4` varchar(20) NOT NULL,
  `practical5` varchar(20) NOT NULL,
  `practical6` varchar(20) NOT NULL,
  `practical7` varchar(20) NOT NULL,
  `theory1` varchar(20) NOT NULL,
  `theory2` varchar(20) NOT NULL,
  `theory3` varchar(20) NOT NULL,
  `theory4` varchar(20) NOT NULL,
  `theory5` varchar(20) NOT NULL,
  `theory6` varchar(20) NOT NULL,
  `theory7` varchar(20) NOT NULL,
  `st1` varchar(10) NOT NULL,
  `st2` varchar(10) NOT NULL,
  `st3` varchar(10) NOT NULL,
  `st4` varchar(10) NOT NULL,
  `st5` varchar(10) NOT NULL,
  `st6` varchar(10) NOT NULL,
  `st7` varchar(10) NOT NULL,
  `percentage` varchar(10) NOT NULL,
  `total` varchar(10) NOT NULL,
  PRIMARY KEY (`enrollment`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `result_it`
--

DROP TABLE IF EXISTS `result_it`;
CREATE TABLE IF NOT EXISTS `result_it` (
  `department` varchar(30) NOT NULL,
  `semester` varchar(30) NOT NULL,
  `enrollment` varchar(12) NOT NULL,
  `practical1` varchar(20) NOT NULL,
  `practical2` varchar(20) NOT NULL,
  `practical3` varchar(20) NOT NULL,
  `practical4` varchar(20) NOT NULL,
  `practical5` varchar(20) NOT NULL,
  `practical6` varchar(20) NOT NULL,
  `practical7` varchar(20) NOT NULL,
  `theory1` varchar(20) NOT NULL,
  `theory2` varchar(20) NOT NULL,
  `theory3` varchar(20) NOT NULL,
  `theory4` varchar(20) NOT NULL,
  `theory5` varchar(20) NOT NULL,
  `theory6` varchar(20) NOT NULL,
  `theory7` varchar(20) NOT NULL,
  `st1` varchar(10) NOT NULL,
  `st2` varchar(10) NOT NULL,
  `st3` varchar(10) NOT NULL,
  `st4` varchar(10) NOT NULL,
  `st5` varchar(10) NOT NULL,
  `st6` varchar(10) NOT NULL,
  `st7` varchar(10) NOT NULL,
  `percentage` varchar(10) NOT NULL,
  `total` varchar(10) NOT NULL,
  PRIMARY KEY (`enrollment`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `result_mech`
--

DROP TABLE IF EXISTS `result_mech`;
CREATE TABLE IF NOT EXISTS `result_mech` (
  `department` varchar(30) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `enrollment` varchar(12) NOT NULL,
  `practical1` varchar(20) NOT NULL,
  `practical2` varchar(20) NOT NULL,
  `practical3` varchar(20) NOT NULL,
  `practical4` varchar(20) NOT NULL,
  `practical5` varchar(20) NOT NULL,
  `practical6` varchar(20) NOT NULL,
  `practical7` varchar(20) NOT NULL,
  `theory1` varchar(20) NOT NULL,
  `theory2` varchar(20) NOT NULL,
  `theory3` varchar(20) NOT NULL,
  `theory4` varchar(20) NOT NULL,
  `theory5` varchar(20) NOT NULL,
  `theory6` varchar(20) NOT NULL,
  `theory7` varchar(20) NOT NULL,
  `st1` varchar(10) NOT NULL,
  `st2` varchar(10) NOT NULL,
  `st3` varchar(10) NOT NULL,
  `st4` varchar(10) NOT NULL,
  `st5` varchar(10) NOT NULL,
  `st6` varchar(10) NOT NULL,
  `st7` varchar(10) NOT NULL,
  `percentage` varchar(10) NOT NULL,
  `total` varchar(10) NOT NULL,
  PRIMARY KEY (`enrollment`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `res_dec_upd`
--

DROP TABLE IF EXISTS `res_dec_upd`;
CREATE TABLE IF NOT EXISTS `res_dec_upd` (
  `result_declare` varchar(40) DEFAULT 'Not Declared',
  `result_update` varchar(40) DEFAULT 'Not Updated'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `res_dec_upd`
--

INSERT INTO `res_dec_upd` (`result_declare`, `result_update`) VALUES
('Regular Sem 1', 'Remedial Sem 1'),
('on', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `department` varchar(50) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `subject1` varchar(40) NOT NULL,
  `subject2` varchar(40) NOT NULL,
  `subject3` varchar(40) NOT NULL,
  `subject4` varchar(40) NOT NULL,
  `subject5` varchar(40) NOT NULL,
  `subject6` varchar(40) NOT NULL,
  `subject7` varchar(40) NOT NULL,
  `code1` varchar(10) NOT NULL,
  `code2` varchar(10) NOT NULL,
  `code3` varchar(10) NOT NULL,
  `code4` varchar(10) NOT NULL,
  `code5` varchar(10) NOT NULL,
  `code6` varchar(10) NOT NULL,
  `code7` varchar(10) NOT NULL,
  `practical1` varchar(20) NOT NULL,
  `practical2` varchar(20) NOT NULL,
  `practical3` varchar(20) NOT NULL,
  `practical4` varchar(20) NOT NULL,
  `practical5` varchar(20) NOT NULL,
  `practical6` varchar(20) NOT NULL,
  `practical7` varchar(20) NOT NULL,
  `theory1` varchar(20) NOT NULL,
  `theory2` varchar(20) NOT NULL,
  `theory3` varchar(20) NOT NULL,
  `theory4` varchar(20) NOT NULL,
  `theory5` varchar(20) NOT NULL,
  `theory6` varchar(20) NOT NULL,
  `theory7` varchar(20) NOT NULL,
  `subtotal` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`department`, `semester`, `subject1`, `subject2`, `subject3`, `subject4`, `subject5`, `subject6`, `subject7`, `code1`, `code2`, `code3`, `code4`, `code5`, `code6`, `code7`, `practical1`, `practical2`, `practical3`, `practical4`, `practical5`, `practical6`, `practical7`, `theory1`, `theory2`, `theory3`, `theory4`, `theory5`, `theory6`, `theory7`, `subtotal`) VALUES
('Computer Enggineering', 'Sem 7', 'DMBI', 'CD', 'INS', 'MCWC', 'Project-I', '-', '-', '2170715', '2170701', '2170719', '2170710', '2170001', '-', '-', '20', '20', '20', '20', '70', '-', '-', '50', '50', '50', '50', '30', '-', '-', 0),
('Computer Enggineering', 'sem 6', 'A-Java', 'WT', 'TOC', '.Net', 'SE', 'DE-2B', '-', '20160101', '20160102', '20160103', '20160104', '20160105', '20160001', '-', '20', '20', '20', '20', '20', '20', '-', '40', '40', '40', '40', '40', '40', '-', 360),
('Computer Enggineering', 'Sem 8', 'Artificial Intelligence', 'Python', '-', '-', '-', '-', '-', '208071', '208072', '-', '-', '-', '-', '-', '20', '20', '-', '-', '-', '-', '-', '40', '40', '-', '-', '-', '-', '-', 120),
('Computer Enggineering', 'Sem 1', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', 0),
('E & C Enggineering', 'Sem 1', 'Maths', 'Physics', 'Chemistry', '-', '-', '-', '-', '2015', '2153', '21056', '-', '-', '-', '-', '20', '20', '20', '-', '-', '-', '-', '30', '40', '50', '-', '-', '-', '-', 180),
('E & C Enggineering', 'Sem 1', 'Maths', 'Physics', 'Chemistry', '-', '-', '-', '-', '2015', '2153', '21056', '-', '-', '-', '-', '20', '20', '20', '-', '-', '-', '-', '30', '40', '50', '-', '-', '-', '-', 180),
('Mechnical Enggineering', 'Sem 2', 'english', 'maths', '-', '-', '-', '-', '-', '2536', '2156', '-', '-', '-', '-', '-', '20', '20', '-', '-', '-', '-', '-', '40', '60', '-', '-', '-', '-', '-', 140);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
