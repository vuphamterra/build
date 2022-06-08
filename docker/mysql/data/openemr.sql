-- Adminer 4.8.1 MySQL 5.7.37 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `openemr`;
CREATE DATABASE `openemr` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `openemr`;

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL DEFAULT '0',
  `line1` varchar(255) DEFAULT NULL,
  `line2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(35) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `plus_four` varchar(4) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `foreign_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `foreign_id` (`foreign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `alert_data`;
CREATE TABLE `alert_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` varchar(100) CHARACTER SET latin1 NOT NULL,
  `device_type` varchar(45) CHARACTER SET latin1 NOT NULL,
  `time` datetime NOT NULL,
  `value` float NOT NULL,
  `threshold_id` int(11) NOT NULL,
  `value_of` varchar(45) CHARACTER SET latin1 NOT NULL,
  `min` float NOT NULL,
  `max` float NOT NULL,
  `status` varchar(45) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8;

INSERT INTO `alert_data` (`id`, `pid`, `device_type`, `time`, `value`, `threshold_id`, `value_of`, `min`, `max`, `status`) VALUES
(1,	'patientfe4a6879-f6e9-4f49-8937-44a741f62e03',	'SPO2',	'2022-06-02 10:15:47',	120,	96,	'spo2',	96,	100,	'high'),
(2,	'patient265f6107-ed92-4e51-a153-7c862ee22183',	'SPO2',	'2022-06-03 02:30:13',	120,	99,	'spo2',	96,	100,	'high'),
(3,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'SPO2',	'2022-06-03 11:16:51',	120,	101,	'spo2',	85,	100,	'high'),
(4,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-06 03:13:03',	767,	105,	'weight',	99,	200,	'high'),
(5,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-06 06:54:24',	767,	105,	'weight',	99,	200,	'high'),
(6,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'ECG',	'2022-06-06 08:57:06',	15,	105,	'HR',	60,	100,	'low'),
(7,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'ECG',	'2022-06-06 09:04:20',	1000,	105,	'HR',	60,	100,	'high'),
(8,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:04:16',	34.5925,	105,	'value',	95,	99,	'low'),
(9,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:04:48',	34.53,	105,	'value',	95,	99,	'low'),
(10,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:05:20',	34.53,	105,	'value',	95,	99,	'low'),
(11,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:05:52',	34.53,	105,	'value',	95,	99,	'low'),
(12,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'BP SENSOR',	'2022-06-07 05:07:00',	87,	105,	'bpd',	65,	85,	'high'),
(13,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'BP SENSOR',	'2022-06-07 05:07:01',	87,	105,	'bpd',	65,	85,	'high'),
(14,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'BP SENSOR',	'2022-06-07 05:07:01',	87,	105,	'bpd',	65,	85,	'high'),
(15,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:07:28',	34.4675,	105,	'value',	95,	99,	'low'),
(16,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:08:31',	34.4675,	105,	'value',	95,	99,	'low'),
(17,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:08:48',	34.4675,	105,	'value',	95,	99,	'low'),
(18,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:09:20',	34.4675,	105,	'value',	95,	99,	'low'),
(19,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:10:08',	34.4341,	105,	'value',	95,	99,	'low'),
(20,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:10:24',	34.416,	105,	'value',	95,	99,	'low'),
(21,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:10:39',	34.4082,	105,	'value',	95,	99,	'low'),
(22,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:15:11',	34.3425,	105,	'value',	95,	99,	'low'),
(23,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:15:28',	34.28,	105,	'value',	95,	99,	'low'),
(24,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:15:44',	34.28,	105,	'value',	95,	99,	'low'),
(25,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:15:59',	34.28,	105,	'value',	95,	99,	'low'),
(26,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:28:19',	0.74,	105,	'weight',	99,	200,	'low'),
(27,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:28:20',	3.01,	105,	'weight',	99,	200,	'low'),
(28,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:28:20',	5.4,	105,	'weight',	99,	200,	'low'),
(29,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:28:20',	7.06,	105,	'weight',	99,	200,	'low'),
(30,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:28:20',	7.31,	105,	'weight',	99,	200,	'low'),
(31,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:28:21',	7.45,	105,	'weight',	99,	200,	'low'),
(32,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:28:21',	7.51,	105,	'weight',	99,	200,	'low'),
(33,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:28:21',	7.52,	105,	'weight',	99,	200,	'low'),
(34,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:28:22',	7.53,	105,	'weight',	99,	200,	'low'),
(35,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:28:22',	7.53,	105,	'weight',	99,	200,	'low'),
(36,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:28:22',	7.53,	105,	'weight',	99,	200,	'low'),
(37,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:28:22',	7.54,	105,	'weight',	99,	200,	'low'),
(38,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:28:23',	7.54,	105,	'weight',	99,	200,	'low'),
(39,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:28:23',	7.54,	105,	'weight',	99,	200,	'low'),
(40,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:28:23',	7.54,	105,	'weight',	99,	200,	'low'),
(41,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:28:24',	7.54,	105,	'weight',	99,	200,	'low'),
(42,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:28:24',	7.54,	105,	'weight',	99,	200,	'low'),
(43,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:28:29',	7.54,	105,	'weight',	99,	200,	'low'),
(44,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:29:54',	34.0925,	105,	'value',	95,	99,	'low'),
(45,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:30:40',	34.0925,	105,	'value',	95,	99,	'low'),
(46,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:13',	1.01,	105,	'weight',	99,	200,	'low'),
(47,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:14',	1.12,	105,	'weight',	99,	200,	'low'),
(48,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:14',	1.26,	105,	'weight',	99,	200,	'low'),
(49,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:14',	1.47,	105,	'weight',	99,	200,	'low'),
(50,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:15',	1.63,	105,	'weight',	99,	200,	'low'),
(51,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:15',	1.74,	105,	'weight',	99,	200,	'low'),
(52,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:15',	1.74,	105,	'weight',	99,	200,	'low'),
(53,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:16',	1.74,	105,	'weight',	99,	200,	'low'),
(54,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:16',	1.74,	105,	'weight',	99,	200,	'low'),
(55,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:16',	1.2,	105,	'weight',	99,	200,	'low'),
(56,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:16',	1.09,	105,	'weight',	99,	200,	'low'),
(57,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:17',	1.02,	105,	'weight',	99,	200,	'low'),
(58,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:17',	0.97,	105,	'weight',	99,	200,	'low'),
(59,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:17',	0.89,	105,	'weight',	99,	200,	'low'),
(60,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:18',	0.87,	105,	'weight',	99,	200,	'low'),
(61,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:18',	0.85,	105,	'weight',	99,	200,	'low'),
(62,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:18',	0.82,	105,	'weight',	99,	200,	'low'),
(63,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:18',	0.77,	105,	'weight',	99,	200,	'low'),
(64,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:19',	0.75,	105,	'weight',	99,	200,	'low'),
(65,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:19',	0.75,	105,	'weight',	99,	200,	'low'),
(66,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:19',	0.74,	105,	'weight',	99,	200,	'low'),
(67,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:19',	0.74,	105,	'weight',	99,	200,	'low'),
(68,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:20',	0.73,	105,	'weight',	99,	200,	'low'),
(69,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:20',	0.73,	105,	'weight',	99,	200,	'low'),
(70,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:20',	0.73,	105,	'weight',	99,	200,	'low'),
(71,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:21',	0.74,	105,	'weight',	99,	200,	'low'),
(72,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:21',	0.74,	105,	'weight',	99,	200,	'low'),
(73,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:21',	0.74,	105,	'weight',	99,	200,	'low'),
(74,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:31:21',	0.74,	105,	'weight',	99,	200,	'low'),
(75,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:31:44',	34.0925,	105,	'value',	95,	99,	'low'),
(76,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:31:59',	34.0925,	105,	'value',	95,	99,	'low'),
(77,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:33:03',	34.0925,	105,	'value',	95,	99,	'low'),
(78,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:33:35',	34.0925,	105,	'value',	95,	99,	'low'),
(79,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:34:24',	34.0925,	105,	'value',	95,	99,	'low'),
(80,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:34:41',	34.0925,	105,	'value',	95,	99,	'low'),
(81,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:35:12',	34.03,	105,	'value',	95,	99,	'low'),
(82,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:36:00',	34.03,	105,	'value',	95,	99,	'low'),
(83,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:37:20',	34.03,	105,	'value',	95,	99,	'low'),
(84,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:20',	6.46,	105,	'weight',	99,	200,	'low'),
(85,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:20',	7.52,	105,	'weight',	99,	200,	'low'),
(86,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:21',	7.59,	105,	'weight',	99,	200,	'low'),
(87,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:22',	7.61,	105,	'weight',	99,	200,	'low'),
(88,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:22',	7.69,	105,	'weight',	99,	200,	'low'),
(89,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:23',	7.69,	105,	'weight',	99,	200,	'low'),
(90,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:24',	7.69,	105,	'weight',	99,	200,	'low'),
(91,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:25',	7.66,	105,	'weight',	99,	200,	'low'),
(92,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:25',	7.63,	105,	'weight',	99,	200,	'low'),
(93,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:26',	7.61,	105,	'weight',	99,	200,	'low'),
(94,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:27',	7.61,	105,	'weight',	99,	200,	'low'),
(95,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:27',	7.6,	105,	'weight',	99,	200,	'low'),
(96,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:27',	7.61,	105,	'weight',	99,	200,	'low'),
(97,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:28',	7.6,	105,	'weight',	99,	200,	'low'),
(98,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:28',	7.61,	105,	'weight',	99,	200,	'low'),
(99,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:28',	7.61,	105,	'weight',	99,	200,	'low'),
(100,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:29',	7.66,	105,	'weight',	99,	200,	'low'),
(101,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:29',	7.66,	105,	'weight',	99,	200,	'low'),
(102,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:30',	7.68,	105,	'weight',	99,	200,	'low'),
(103,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:30',	7.68,	105,	'weight',	99,	200,	'low'),
(104,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:30',	7.68,	105,	'weight',	99,	200,	'low'),
(105,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:31',	7.64,	105,	'weight',	99,	200,	'low'),
(106,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:32',	7.64,	105,	'weight',	99,	200,	'low'),
(107,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:32',	7.64,	105,	'weight',	99,	200,	'low'),
(108,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:33',	7.56,	105,	'weight',	99,	200,	'low'),
(109,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:33',	7.56,	105,	'weight',	99,	200,	'low'),
(110,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:34',	7.59,	105,	'weight',	99,	200,	'low'),
(111,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:34',	7.62,	105,	'weight',	99,	200,	'low'),
(112,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:34',	7.62,	105,	'weight',	99,	200,	'low'),
(113,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:35',	7.62,	105,	'weight',	99,	200,	'low'),
(114,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:35',	7.65,	105,	'weight',	99,	200,	'low'),
(115,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:35',	7.66,	105,	'weight',	99,	200,	'low'),
(116,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:36',	7.66,	105,	'weight',	99,	200,	'low'),
(117,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:36',	7.65,	105,	'weight',	99,	200,	'low'),
(118,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:37',	7.65,	105,	'weight',	99,	200,	'low'),
(119,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:37',	7.66,	105,	'weight',	99,	200,	'low'),
(120,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:38',	7.65,	105,	'weight',	99,	200,	'low'),
(121,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:38',	7.65,	105,	'weight',	99,	200,	'low'),
(122,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:38',	7.65,	105,	'weight',	99,	200,	'low'),
(123,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:39',	7.65,	105,	'weight',	99,	200,	'low'),
(124,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 05:38:39',	7.65,	105,	'weight',	99,	200,	'low'),
(125,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:38:56',	34.03,	105,	'value',	95,	99,	'low'),
(126,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:50:08',	33.905,	105,	'value',	95,	99,	'low'),
(127,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:50:23',	33.905,	105,	'value',	95,	99,	'low'),
(128,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:50:39',	33.905,	105,	'value',	95,	99,	'low'),
(129,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:50:55',	33.905,	105,	'value',	95,	99,	'low'),
(130,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:51:02',	33.905,	105,	'value',	95,	99,	'low'),
(131,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:51:28',	33.905,	105,	'value',	95,	99,	'low'),
(132,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:52:15',	33.905,	105,	'value',	95,	99,	'low'),
(133,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:53:20',	33.905,	105,	'value',	95,	99,	'low'),
(134,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:53:51',	33.905,	105,	'value',	95,	99,	'low'),
(135,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:54:23',	33.905,	105,	'value',	95,	99,	'low'),
(136,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:56:00',	33.905,	105,	'value',	95,	99,	'low'),
(137,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:56:31',	33.905,	105,	'value',	95,	99,	'low'),
(138,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:57:04',	33.905,	105,	'value',	95,	99,	'low'),
(139,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:57:20',	33.8425,	105,	'value',	95,	99,	'low'),
(140,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:57:35',	33.8425,	105,	'value',	95,	99,	'low'),
(141,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:58:07',	33.8425,	105,	'value',	95,	99,	'low'),
(142,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 05:59:11',	33.8425,	105,	'value',	95,	99,	'low'),
(143,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 06:56:58',	1000,	100,	'HR',	60,	100,	'high'),
(144,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 07:08:58',	1000,	100,	'HR',	60,	100,	'high'),
(145,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 07:17:45',	1000,	100,	'HR',	60,	100,	'high'),
(146,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:22:09',	6.43,	105,	'weight',	99,	200,	'low'),
(147,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:22:09',	7.52,	105,	'weight',	99,	200,	'low'),
(148,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:22:09',	7.53,	105,	'weight',	99,	200,	'low'),
(149,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:22:09',	7.53,	105,	'weight',	99,	200,	'low'),
(150,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:22:10',	7.53,	105,	'weight',	99,	200,	'low'),
(151,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:22:10',	7.53,	105,	'weight',	99,	200,	'low'),
(152,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:22:11',	7.53,	105,	'weight',	99,	200,	'low'),
(153,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:22:11',	7.53,	105,	'weight',	99,	200,	'low'),
(154,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:22:11',	7.53,	105,	'weight',	99,	200,	'low'),
(155,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:22:11',	7.53,	105,	'weight',	99,	200,	'low'),
(156,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:22:12',	7.53,	105,	'weight',	99,	200,	'low'),
(157,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:23:31',	6.55,	105,	'weight',	99,	200,	'low'),
(158,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:23:32',	7.6,	105,	'weight',	99,	200,	'low'),
(159,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:23:32',	7.61,	105,	'weight',	99,	200,	'low'),
(160,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:23:32',	7.61,	105,	'weight',	99,	200,	'low'),
(161,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:23:32',	7.61,	105,	'weight',	99,	200,	'low'),
(162,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:23:33',	7.6,	105,	'weight',	99,	200,	'low'),
(163,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:23:33',	7.6,	105,	'weight',	99,	200,	'low'),
(164,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:23:33',	7.61,	105,	'weight',	99,	200,	'low'),
(165,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:23:34',	7.61,	105,	'weight',	99,	200,	'low'),
(166,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:23:34',	7.61,	105,	'weight',	99,	200,	'low'),
(167,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:23:34',	7.61,	105,	'weight',	99,	200,	'low'),
(168,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 07:28:22',	1000,	100,	'HR',	60,	100,	'high'),
(169,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 07:30:07',	1000,	100,	'HR',	60,	100,	'high'),
(170,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 07:38:43',	10,	100,	'HR',	60,	100,	'low'),
(171,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 07:38:59',	10,	100,	'HR',	60,	100,	'low'),
(172,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 07:39:26',	10,	100,	'HR',	60,	100,	'low'),
(173,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 07:42:39',	10,	100,	'HR',	60,	100,	'low'),
(174,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:11',	2.43,	105,	'weight',	99,	200,	'low'),
(175,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:11',	1.81,	105,	'weight',	99,	200,	'low'),
(176,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:12',	1.52,	105,	'weight',	99,	200,	'low'),
(177,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:12',	1.5,	105,	'weight',	99,	200,	'low'),
(178,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:12',	1.5,	105,	'weight',	99,	200,	'low'),
(179,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:13',	1.5,	105,	'weight',	99,	200,	'low'),
(180,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:13',	1.62,	105,	'weight',	99,	200,	'low'),
(181,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:13',	1.62,	105,	'weight',	99,	200,	'low'),
(182,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:14',	1.62,	105,	'weight',	99,	200,	'low'),
(183,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:14',	1.42,	105,	'weight',	99,	200,	'low'),
(184,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:15',	1.1,	105,	'weight',	99,	200,	'low'),
(185,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:15',	0.95,	105,	'weight',	99,	200,	'low'),
(186,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:15',	0.87,	105,	'weight',	99,	200,	'low'),
(187,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:16',	0.85,	105,	'weight',	99,	200,	'low'),
(188,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:16',	0.85,	105,	'weight',	99,	200,	'low'),
(189,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:16',	0.85,	105,	'weight',	99,	200,	'low'),
(190,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:18',	0.89,	105,	'weight',	99,	200,	'low'),
(191,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:18',	0.91,	105,	'weight',	99,	200,	'low'),
(192,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:19',	0.89,	105,	'weight',	99,	200,	'low'),
(193,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:19',	0.89,	105,	'weight',	99,	200,	'low'),
(194,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:19',	0.86,	105,	'weight',	99,	200,	'low'),
(195,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:20',	0.82,	105,	'weight',	99,	200,	'low'),
(196,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:20',	0.81,	105,	'weight',	99,	200,	'low'),
(197,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:20',	0.81,	105,	'weight',	99,	200,	'low'),
(198,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:21',	0.81,	105,	'weight',	99,	200,	'low'),
(199,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:21',	0.81,	105,	'weight',	99,	200,	'low'),
(200,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:21',	0.81,	105,	'weight',	99,	200,	'low'),
(201,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:22',	0.83,	105,	'weight',	99,	200,	'low'),
(202,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:22',	0.92,	105,	'weight',	99,	200,	'low'),
(203,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:22',	0.92,	105,	'weight',	99,	200,	'low'),
(204,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:23',	0.92,	105,	'weight',	99,	200,	'low'),
(205,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:23',	0.75,	105,	'weight',	99,	200,	'low'),
(206,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:24',	0.72,	105,	'weight',	99,	200,	'low'),
(207,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:24',	0.72,	105,	'weight',	99,	200,	'low'),
(208,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:24',	0.72,	105,	'weight',	99,	200,	'low'),
(209,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:25',	0.77,	105,	'weight',	99,	200,	'low'),
(210,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:25',	0.77,	105,	'weight',	99,	200,	'low'),
(211,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:25',	0.77,	105,	'weight',	99,	200,	'low'),
(212,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:26',	0.75,	105,	'weight',	99,	200,	'low'),
(213,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:26',	0.75,	105,	'weight',	99,	200,	'low'),
(214,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:26',	0.75,	105,	'weight',	99,	200,	'low'),
(215,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:27',	0.75,	105,	'weight',	99,	200,	'low'),
(216,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:27',	0.75,	105,	'weight',	99,	200,	'low'),
(217,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:27',	0.75,	105,	'weight',	99,	200,	'low'),
(218,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:28',	0.75,	105,	'weight',	99,	200,	'low'),
(219,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:28',	0.75,	105,	'weight',	99,	200,	'low'),
(220,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:28',	0.75,	105,	'weight',	99,	200,	'low'),
(221,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:29',	0.75,	105,	'weight',	99,	200,	'low'),
(222,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:29',	0.73,	105,	'weight',	99,	200,	'low'),
(223,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:29',	0.71,	105,	'weight',	99,	200,	'low'),
(224,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:30',	0.7,	105,	'weight',	99,	200,	'low'),
(225,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:30',	0.69,	105,	'weight',	99,	200,	'low'),
(226,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:30',	0.66,	105,	'weight',	99,	200,	'low'),
(227,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:31',	0.59,	105,	'weight',	99,	200,	'low'),
(228,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:31',	0.56,	105,	'weight',	99,	200,	'low'),
(229,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:31',	0.55,	105,	'weight',	99,	200,	'low'),
(230,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:32',	0.51,	105,	'weight',	99,	200,	'low'),
(231,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:32',	0.38,	105,	'weight',	99,	200,	'low'),
(232,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:32',	0.33,	105,	'weight',	99,	200,	'low'),
(233,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:33',	0.33,	105,	'weight',	99,	200,	'low'),
(234,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:35',	1.35,	105,	'weight',	99,	200,	'low'),
(235,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:36',	3.59,	105,	'weight',	99,	200,	'low'),
(236,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:36',	8.88,	105,	'weight',	99,	200,	'low'),
(237,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:36',	9.26,	105,	'weight',	99,	200,	'low'),
(238,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:37',	9.37,	105,	'weight',	99,	200,	'low'),
(239,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:37',	9.52,	105,	'weight',	99,	200,	'low'),
(240,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:37',	9.74,	105,	'weight',	99,	200,	'low'),
(241,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:37',	9.75,	105,	'weight',	99,	200,	'low'),
(242,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:38',	9.75,	105,	'weight',	99,	200,	'low'),
(243,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:39',	9.78,	105,	'weight',	99,	200,	'low'),
(244,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:40',	10.77,	105,	'weight',	99,	200,	'low'),
(245,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:40',	10.77,	105,	'weight',	99,	200,	'low'),
(246,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:40',	10.78,	105,	'weight',	99,	200,	'low'),
(247,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:41',	10.78,	105,	'weight',	99,	200,	'low'),
(248,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:41',	10.78,	105,	'weight',	99,	200,	'low'),
(249,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:41',	10.81,	105,	'weight',	99,	200,	'low'),
(250,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:42',	10.78,	105,	'weight',	99,	200,	'low'),
(251,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:42',	10.78,	105,	'weight',	99,	200,	'low'),
(252,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:43',	10.6,	105,	'weight',	99,	200,	'low'),
(253,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:43',	10.55,	105,	'weight',	99,	200,	'low'),
(254,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:43',	10.6,	105,	'weight',	99,	200,	'low'),
(255,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:44',	10.6,	105,	'weight',	99,	200,	'low'),
(256,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:45',	10.82,	105,	'weight',	99,	200,	'low'),
(257,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:45',	10.82,	105,	'weight',	99,	200,	'low'),
(258,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:46',	10.82,	105,	'weight',	99,	200,	'low'),
(259,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:46',	10.82,	105,	'weight',	99,	200,	'low'),
(260,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:46',	10.42,	105,	'weight',	99,	200,	'low'),
(261,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:47',	10.36,	105,	'weight',	99,	200,	'low'),
(262,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:47',	10.26,	105,	'weight',	99,	200,	'low'),
(263,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:47',	9.85,	105,	'weight',	99,	200,	'low'),
(264,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:48',	4.94,	105,	'weight',	99,	200,	'low'),
(265,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:47:48',	1.19,	105,	'weight',	99,	200,	'low'),
(266,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'TEMPERATURE',	'2022-06-07 07:47:59',	32.53,	105,	'value',	95,	99,	'low'),
(267,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:48:00',	8.66,	105,	'weight',	99,	200,	'low'),
(268,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:48:00',	10.43,	105,	'weight',	99,	200,	'low'),
(269,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:48:00',	10.7,	105,	'weight',	99,	200,	'low'),
(270,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:48:01',	10.78,	105,	'weight',	99,	200,	'low'),
(271,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:48:01',	10.7,	105,	'weight',	99,	200,	'low'),
(272,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:48:01',	10.78,	105,	'weight',	99,	200,	'low'),
(273,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:48:02',	10.81,	105,	'weight',	99,	200,	'low'),
(274,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:48:03',	10.83,	105,	'weight',	99,	200,	'low'),
(275,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:50:44',	10.73,	105,	'weight',	99,	200,	'low'),
(276,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:50:44',	10.92,	105,	'weight',	99,	200,	'low'),
(277,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:50:44',	10.56,	105,	'weight',	99,	200,	'low'),
(278,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:50:45',	10.52,	105,	'weight',	99,	200,	'low'),
(279,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:50:45',	10.52,	105,	'weight',	99,	200,	'low'),
(280,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:50:45',	10.59,	105,	'weight',	99,	200,	'low'),
(281,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:50:46',	10.52,	105,	'weight',	99,	200,	'low'),
(282,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:50:46',	10.52,	105,	'weight',	99,	200,	'low'),
(283,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:50:47',	10.52,	105,	'weight',	99,	200,	'low'),
(284,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:50:47',	10.25,	105,	'weight',	99,	200,	'low'),
(285,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:50:47',	9.94,	105,	'weight',	99,	200,	'low'),
(286,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:50:48',	9.92,	105,	'weight',	99,	200,	'low'),
(287,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:50:48',	9.21,	105,	'weight',	99,	200,	'low'),
(288,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'DIGITAL SCALE',	'2022-06-07 07:50:48',	1.67,	105,	'weight',	99,	200,	'low'),
(289,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 10:10:18',	1000,	100,	'HR',	60,	100,	'high'),
(290,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 10:11:34',	1000,	100,	'HR',	60,	100,	'high'),
(291,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 10:13:45',	101,	100,	'HR',	60,	100,	'high'),
(292,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 10:13:56',	102,	100,	'HR',	60,	100,	'high'),
(293,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 10:27:13',	102,	100,	'HR',	60,	100,	'high'),
(294,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 10:27:26',	102,	100,	'HR',	60,	100,	'high'),
(295,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 10:31:46',	102,	100,	'HR',	60,	100,	'high'),
(296,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 10:33:02',	102,	100,	'HR',	60,	100,	'high'),
(297,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 10:33:09',	102,	100,	'HR',	60,	100,	'high'),
(298,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 10:33:13',	102,	100,	'HR',	60,	100,	'high'),
(299,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 10:34:04',	102,	100,	'HR',	60,	100,	'high'),
(300,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 10:35:12',	101,	100,	'HR',	60,	100,	'high'),
(301,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 10:37:14',	101,	100,	'HR',	60,	100,	'high'),
(302,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 10:50:58',	101,	100,	'HR',	60,	100,	'high'),
(303,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-07 10:57:39',	101,	100,	'HR',	60,	100,	'high'),
(304,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'ECG',	'2022-06-07 11:15:18',	1000,	105,	'HR',	60,	100,	'high'),
(305,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'ECG',	'2022-06-07 11:15:23',	1000,	105,	'HR',	60,	100,	'high'),
(306,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'ECG',	'2022-06-07 11:16:46',	1000,	105,	'HR',	60,	100,	'high'),
(307,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'ECG',	'2022-06-07 11:17:18',	1000,	105,	'HR',	60,	100,	'high'),
(308,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'ECG',	'2022-06-07 11:17:43',	1000,	105,	'HR',	60,	100,	'high'),
(309,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'ECG',	'2022-06-07 11:18:21',	1000,	105,	'HR',	60,	100,	'high'),
(310,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'ECG',	'2022-06-07 11:19:57',	1000,	105,	'HR',	60,	100,	'high'),
(311,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'ECG',	'2022-06-07 11:22:58',	1000,	105,	'HR',	60,	100,	'high'),
(312,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'ECG',	'2022-06-07 11:26:09',	1000,	105,	'HR',	60,	100,	'high'),
(313,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'ECG',	'2022-06-07 11:35:57',	1000,	105,	'HR',	60,	100,	'high'),
(314,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'ECG',	'2022-06-07 11:36:03',	1000,	105,	'HR',	60,	100,	'high'),
(315,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'ECG',	'2022-06-07 11:36:11',	1000,	105,	'HR',	60,	100,	'high'),
(316,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'ECG',	'2022-06-07 11:36:18',	1000,	105,	'HR',	60,	100,	'high'),
(317,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'ECG',	'2022-06-07 11:37:07',	1000,	105,	'HR',	60,	100,	'high'),
(318,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'ECG',	'2022-06-07 11:50:44',	1000,	105,	'HR',	60,	100,	'high'),
(319,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 01:47:27',	1000,	100,	'HR',	60,	100,	'high'),
(320,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 01:51:31',	1000,	100,	'HR',	60,	100,	'high'),
(321,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 01:52:27',	1000,	100,	'HR',	60,	100,	'high'),
(322,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 01:52:42',	1000,	100,	'HR',	60,	100,	'high'),
(323,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 01:56:44',	1000,	100,	'HR',	60,	100,	'high'),
(324,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 01:56:48',	1000,	100,	'HR',	60,	100,	'high'),
(325,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 01:57:05',	1000,	100,	'HR',	60,	100,	'high'),
(326,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 01:57:07',	1000,	100,	'HR',	60,	100,	'high'),
(327,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 01:57:09',	1000,	100,	'HR',	60,	100,	'high'),
(328,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 01:58:55',	0,	100,	'HR',	60,	100,	'low'),
(329,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 01:58:55',	0,	100,	'RR',	20,	25,	'low'),
(330,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:01:51',	0,	100,	'HR',	60,	100,	'low'),
(331,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:01:51',	0,	100,	'RR',	20,	25,	'low'),
(332,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:01:55',	0,	100,	'HR',	60,	100,	'low'),
(333,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:01:55',	0,	100,	'RR',	20,	25,	'low'),
(334,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:01:56',	0,	100,	'HR',	60,	100,	'low'),
(335,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:01:56',	0,	100,	'RR',	20,	25,	'low'),
(336,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:01:58',	0,	100,	'HR',	60,	100,	'low'),
(337,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:01:58',	0,	100,	'RR',	20,	25,	'low'),
(338,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:01:58',	0,	100,	'HR',	60,	100,	'low'),
(339,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:01:58',	0,	100,	'RR',	20,	25,	'low'),
(340,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:01:59',	0,	100,	'HR',	60,	100,	'low'),
(341,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:01:59',	0,	100,	'RR',	20,	25,	'low'),
(342,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:02:00',	0,	100,	'HR',	60,	100,	'low'),
(343,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:02:00',	0,	100,	'RR',	20,	25,	'low'),
(344,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:17:44',	0,	100,	'HR',	60,	100,	'low'),
(345,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:17:44',	0,	100,	'RR',	20,	25,	'low'),
(346,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:19:40',	0,	100,	'HR',	60,	100,	'low'),
(347,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:19:40',	0,	100,	'RR',	20,	25,	'low'),
(348,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:19:42',	0,	100,	'HR',	60,	100,	'low'),
(349,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:19:42',	0,	100,	'RR',	20,	25,	'low'),
(350,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:19:42',	0,	100,	'HR',	60,	100,	'low'),
(351,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:19:42',	0,	100,	'RR',	20,	25,	'low'),
(352,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:20:00',	0,	100,	'HR',	60,	100,	'low'),
(353,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:20:00',	0,	100,	'RR',	20,	25,	'low'),
(354,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:20:21',	0,	100,	'HR',	60,	100,	'low'),
(355,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:20:21',	0,	100,	'RR',	20,	25,	'low'),
(356,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:20:23',	0,	100,	'HR',	60,	100,	'low'),
(357,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:20:23',	0,	100,	'RR',	20,	25,	'low'),
(358,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:20:24',	0,	100,	'HR',	60,	100,	'low'),
(359,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:20:24',	0,	100,	'RR',	20,	25,	'low'),
(360,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:43:30',	0,	100,	'HR',	60,	100,	'low'),
(361,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:43:30',	0,	100,	'RR',	20,	25,	'low'),
(362,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:43:31',	0,	100,	'HR',	60,	100,	'low'),
(363,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:43:31',	0,	100,	'RR',	20,	25,	'low'),
(364,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:43:32',	0,	100,	'HR',	60,	100,	'low'),
(365,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:43:32',	0,	100,	'RR',	20,	25,	'low'),
(366,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:43:33',	0,	100,	'HR',	60,	100,	'low'),
(367,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:43:33',	0,	100,	'RR',	20,	25,	'low'),
(368,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:43:34',	0,	100,	'HR',	60,	100,	'low'),
(369,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:43:34',	0,	100,	'RR',	20,	25,	'low'),
(370,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:54:25',	0,	100,	'HR',	60,	100,	'low'),
(371,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:54:26',	0,	100,	'RR',	20,	25,	'low'),
(372,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:54:59',	0,	100,	'HR',	60,	100,	'low'),
(373,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 02:54:59',	0,	100,	'RR',	20,	25,	'low'),
(374,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 03:05:27',	0,	100,	'HR',	60,	100,	'low'),
(375,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 03:05:27',	0,	100,	'RR',	20,	25,	'low'),
(376,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 03:05:48',	0,	100,	'HR',	60,	100,	'low'),
(377,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 03:05:48',	0,	100,	'RR',	20,	25,	'low'),
(378,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 03:18:39',	0,	100,	'HR',	60,	100,	'low'),
(379,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 03:18:39',	0,	100,	'RR',	20,	25,	'low'),
(380,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 03:25:22',	0,	100,	'HR',	60,	100,	'low'),
(381,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 03:25:22',	0,	100,	'RR',	20,	25,	'low'),
(382,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 03:25:28',	0,	100,	'HR',	60,	100,	'low'),
(383,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 03:25:29',	0,	100,	'RR',	20,	25,	'low'),
(384,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 03:25:29',	0,	100,	'HR',	60,	100,	'low'),
(385,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 03:25:29',	0,	100,	'RR',	20,	25,	'low'),
(386,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 03:25:30',	0,	100,	'HR',	60,	100,	'low'),
(387,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 03:25:30',	0,	100,	'RR',	20,	25,	'low'),
(388,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 03:25:31',	0,	100,	'HR',	60,	100,	'low'),
(389,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 03:25:31',	0,	100,	'RR',	20,	25,	'low'),
(390,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 03:26:03',	0,	100,	'HR',	60,	100,	'low'),
(391,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 03:26:03',	0,	100,	'RR',	20,	25,	'low'),
(392,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 03:26:09',	0,	100,	'HR',	60,	100,	'low'),
(393,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 03:26:09',	0,	100,	'RR',	20,	25,	'low'),
(394,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'BP SENSOR',	'2022-06-08 04:23:29',	88,	105,	'bpd',	65,	85,	'high'),
(395,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'BP SENSOR',	'2022-06-08 04:23:31',	86,	105,	'bpd',	65,	85,	'high'),
(396,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'BP SENSOR',	'2022-06-08 04:23:32',	99,	105,	'bps',	110,	130,	'low'),
(397,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'BP SENSOR',	'2022-06-08 04:23:34',	137,	105,	'bps',	110,	130,	'high'),
(398,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'BP SENSOR',	'2022-06-08 04:23:34',	98,	105,	'bpd',	65,	85,	'high'),
(399,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'BP SENSOR',	'2022-06-08 04:23:34',	86,	105,	'bpd',	65,	85,	'high'),
(400,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'BP SENSOR',	'2022-06-08 04:23:35',	89,	105,	'bpd',	65,	85,	'high'),
(401,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'BP SENSOR',	'2022-06-08 04:23:36',	91,	105,	'bpd',	65,	85,	'high'),
(402,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'BP SENSOR',	'2022-06-08 04:23:36',	88,	105,	'bpd',	65,	85,	'high'),
(403,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'BP SENSOR',	'2022-06-08 04:23:37',	90,	105,	'bpd',	65,	85,	'high'),
(404,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'BP SENSOR',	'2022-06-08 04:23:38',	68,	105,	'bps',	110,	130,	'low'),
(405,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'BP SENSOR',	'2022-06-08 04:23:38',	55,	105,	'bpd',	65,	85,	'low'),
(406,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'BP SENSOR',	'2022-06-08 04:23:39',	88,	105,	'bpd',	65,	85,	'high'),
(407,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'BP SENSOR',	'2022-06-08 04:23:39',	150,	105,	'bps',	110,	130,	'high'),
(408,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'BP SENSOR',	'2022-06-08 04:23:39',	97,	105,	'bpd',	65,	85,	'high'),
(409,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'BP SENSOR',	'2022-06-08 04:23:40',	87,	105,	'bpd',	65,	85,	'high'),
(410,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'BP SENSOR',	'2022-06-08 04:23:40',	88,	105,	'bpd',	65,	85,	'high'),
(411,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'BP SENSOR',	'2022-06-08 04:23:40',	87,	105,	'bpd',	65,	85,	'high'),
(412,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 04:28:56',	9,	100,	'HR',	60,	100,	'low'),
(413,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 04:28:56',	10,	100,	'RR',	20,	25,	'low'),
(414,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 04:29:11',	9,	100,	'HR',	60,	100,	'low'),
(415,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 04:29:11',	10,	100,	'RR',	20,	25,	'low'),
(416,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 04:31:01',	9,	100,	'HR',	60,	100,	'low'),
(417,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 04:31:01',	10,	100,	'RR',	20,	25,	'low'),
(418,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 04:31:10',	9,	100,	'HR',	60,	100,	'low'),
(419,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 04:31:10',	10,	100,	'RR',	20,	25,	'low'),
(420,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 06:02:09',	9,	100,	'HR',	60,	100,	'low'),
(421,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 06:02:09',	10,	100,	'RR',	20,	25,	'low'),
(422,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 06:02:52',	9,	100,	'HR',	60,	100,	'low'),
(423,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 06:02:52',	10,	100,	'RR',	20,	25,	'low'),
(424,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 06:09:51',	9,	100,	'HR',	60,	100,	'low'),
(425,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'ECG',	'2022-06-08 06:09:51',	10,	100,	'RR',	20,	25,	'low')
ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `pid` = VALUES(`pid`), `device_type` = VALUES(`device_type`), `time` = VALUES(`time`), `value` = VALUES(`value`), `threshold_id` = VALUES(`threshold_id`), `value_of` = VALUES(`value_of`), `min` = VALUES(`min`), `max` = VALUES(`max`), `status` = VALUES(`status`);

DROP TABLE IF EXISTS `allergy`;
CREATE TABLE `allergy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` varchar(255) CHARACTER SET utf8 NOT NULL,
  `allergy_type` varchar(255) CHARACTER SET utf8 NOT NULL,
  `allergy_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `reaction` varchar(255) CHARACTER SET utf8 NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 NOT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tenant_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `allergy_uuid` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `amc_misc_data`;
CREATE TABLE `amc_misc_data` (
  `amc_id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Unique and maps to list_options list clinical_rules',
  `pid` bigint(20) DEFAULT NULL,
  `map_category` varchar(255) NOT NULL DEFAULT '' COMMENT 'Maps to an object category (such as prescriptions etc.)',
  `map_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Maps to an object id (such as prescription id etc.)',
  `date_created` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `soc_provided` datetime DEFAULT NULL,
  KEY `amc_id` (`amc_id`,`pid`,`map_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `amendments`;
CREATE TABLE `amendments` (
  `amendment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Amendment ID',
  `amendment_date` date NOT NULL COMMENT 'Amendement request date',
  `amendment_by` varchar(50) NOT NULL COMMENT 'Amendment requested from',
  `amendment_status` varchar(50) DEFAULT NULL COMMENT 'Amendment status accepted/rejected/null',
  `pid` bigint(20) NOT NULL COMMENT 'Patient ID from patient_data',
  `amendment_desc` text COMMENT 'Amendment Details',
  `created_by` int(11) NOT NULL COMMENT 'references users.id for session owner',
  `modified_by` int(11) DEFAULT NULL COMMENT 'references users.id for session owner',
  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'created time',
  `modified_time` timestamp NULL DEFAULT NULL COMMENT 'modified time',
  PRIMARY KEY (`amendment_id`),
  KEY `amendment_pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `amendments_history`;
CREATE TABLE `amendments_history` (
  `amendment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Amendment ID',
  `amendment_note` text COMMENT 'Amendment requested from',
  `amendment_status` varchar(50) DEFAULT NULL COMMENT 'Amendment Request Status',
  `created_by` int(11) NOT NULL COMMENT 'references users.id for session owner',
  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'created time',
  KEY `amendment_history_id` (`amendment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `api_token`;
CREATE TABLE `api_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `token` text,
  `token_auth_salt` varchar(255) DEFAULT NULL,
  `token_auth` text,
  `expiry` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8298 DEFAULT CHARSET=utf8;

INSERT INTO `api_token` (`id`, `user_id`, `token`, `token_auth_salt`, `token_auth`, `expiry`, `email`) VALUES
(8283,	215,	NULL,	NULL,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyRW1haWwiOiJzdXBlcmFkbWluQGRlbW9ob3NwaXRhbC5jb20iLCJ1c2VyUm9sZSI6IlN1cGVyQWRtaW4iLCJhcGlWZXJzaW9uIjoiMjEuMC4wIiwiaWF0IjoxNjU0NTczNjYyLCJleHAiOjE2NTQ2NjAwNjJ9.AB4S1i47H6Kbj9kS-LYQbjEu5qSk11oldCeEKhFzATM',	'2022-06-07 03:49:08',	'superadmin@demohospital.com'),
(8284,	215,	NULL,	NULL,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyRW1haWwiOiJzdXBlcmFkbWluQGRlbW9ob3NwaXRhbC5jb20iLCJ1c2VyUm9sZSI6IlN1cGVyQWRtaW4iLCJhcGlWZXJzaW9uIjoiMjEuMC4wIiwiaWF0IjoxNjU0NTc4ODk5LCJleHAiOjE2NTQ2NjUyOTl9.cc8_4q03izOHWTowS02v6ddd7jEckLZHezShqN7cmME',	'2022-06-07 05:16:25',	'superadmin@demohospital.com'),
(8285,	215,	NULL,	NULL,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyRW1haWwiOiJzdXBlcmFkbWluQGRlbW9ob3NwaXRhbC5jb20iLCJ1c2VyUm9sZSI6IlN1cGVyQWRtaW4iLCJhcGlWZXJzaW9uIjoiMjEuMC4wIiwiaWF0IjoxNjU0NTc5Nzg1LCJleHAiOjE2NTQ2NjYxODV9.ynRh0_lW3BktYKRXmhdrDQ0bI7ic6maGW3GgtGUUZJA',	'2022-06-07 05:31:12',	'superadmin@demohospital.com'),
(8286,	215,	NULL,	NULL,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyRW1haWwiOiJzdXBlcmFkbWluQGRlbW9ob3NwaXRhbC5jb20iLCJ1c2VyUm9sZSI6IlN1cGVyQWRtaW4iLCJhcGlWZXJzaW9uIjoiMjEuMC4wIiwiaWF0IjoxNjU0NTk2MzAyLCJleHAiOjE2NTQ2ODI3MDJ9.pXCMdghQ2PFVeyxnRAgaROmBkEECeeZL91vqUhkmPhs',	'2022-06-07 10:06:28',	'superadmin@demohospital.com'),
(8287,	215,	NULL,	NULL,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyRW1haWwiOiJzdXBlcmFkbWluQGRlbW9ob3NwaXRhbC5jb20iLCJ1c2VyUm9sZSI6IlN1cGVyQWRtaW4iLCJhcGlWZXJzaW9uIjoiMjEuMC4wIiwiaWF0IjoxNjU0NTk2NzAyLCJleHAiOjE2NTQ2ODMxMDJ9.cuiEhnon_BxoNPw_fIpxyyjv12D0CClus-qQuy7s2O4',	'2022-06-07 10:13:08',	'superadmin@demohospital.com'),
(8288,	215,	NULL,	NULL,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyRW1haWwiOiJzdXBlcmFkbWluQGRlbW9ob3NwaXRhbC5jb20iLCJ1c2VyUm9sZSI6IlN1cGVyQWRtaW4iLCJhcGlWZXJzaW9uIjoiMjEuMC4wIiwiaWF0IjoxNjU0NTk4MTk4LCJleHAiOjE2NTQ2ODQ1OTh9.14VPH5kwDqR5q4Mvf0uVJnnkbaijLSb6xalSHxqX7xs',	'2022-06-07 10:38:04',	'superadmin@demohospital.com'),
(8289,	215,	NULL,	NULL,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyRW1haWwiOiJzdXBlcmFkbWluQGRlbW9ob3NwaXRhbC5jb20iLCJ1c2VyUm9sZSI6IlN1cGVyQWRtaW4iLCJhcGlWZXJzaW9uIjoiMjEuMC4wIiwiaWF0IjoxNjU0NjEwNjM5LCJleHAiOjE2NTQ2OTcwMzl9.4S3rUPoLdWbee53ZXNAcWCLh9HAFEMvSwdblO7N8Sbw',	'2022-06-07 14:05:26',	'superadmin@demohospital.com'),
(8290,	215,	NULL,	NULL,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyRW1haWwiOiJzdXBlcmFkbWluQGRlbW9ob3NwaXRhbC5jb20iLCJ1c2VyUm9sZSI6IlN1cGVyQWRtaW4iLCJhcGlWZXJzaW9uIjoiMjEuMC4wIiwiaWF0IjoxNjU0NjI1NjE5LCJleHAiOjE2NTQ3MTIwMTl9.ZT9h1N4UG6t2C4h73dUZpPqnYC2TjaVyWaPF7nBvAeg',	'2022-06-07 18:15:06',	'superadmin@demohospital.com'),
(8291,	215,	NULL,	NULL,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyRW1haWwiOiJzdXBlcmFkbWluQGRlbW9ob3NwaXRhbC5jb20iLCJ1c2VyUm9sZSI6IlN1cGVyQWRtaW4iLCJhcGlWZXJzaW9uIjoiMjEuMC4wIiwiaWF0IjoxNjU0NjI4NTM3LCJleHAiOjE2NTQ3MTQ5Mzd9.Qfb9HTFbaVcFe-pnDOWiR51BS2vzKGi2yh4iIxDaY_w',	'2022-06-07 19:03:43',	'superadmin@demohospital.com'),
(8292,	215,	NULL,	NULL,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyRW1haWwiOiJzdXBlcmFkbWluQGRlbW9ob3NwaXRhbC5jb20iLCJ1c2VyUm9sZSI6IlN1cGVyQWRtaW4iLCJhcGlWZXJzaW9uIjoiMjEuMC4wIiwiaWF0IjoxNjU0NjMxMzY2LCJleHAiOjE2NTQ3MTc3NjZ9.GeXUIr9auuGl8es-2awIRTm4MKWpfrqviFucm9NxXWc',	'2022-06-07 19:50:52',	'superadmin@demohospital.com'),
(8293,	215,	NULL,	NULL,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyRW1haWwiOiJzdXBlcmFkbWluQGRlbW9ob3NwaXRhbC5jb20iLCJ1c2VyUm9sZSI6IlN1cGVyQWRtaW4iLCJhcGlWZXJzaW9uIjoiMjEuMC4wIiwiaWF0IjoxNjU0NjUxOTc3LCJleHAiOjE2NTQ3MzgzNzd9.4h2xqTqlUBOE9ZTY4LSxquqaVu7OHeJv9GKhM9y0ni4',	'2022-06-08 01:34:23',	'superadmin@demohospital.com'),
(8294,	215,	NULL,	NULL,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyRW1haWwiOiJzdXBlcmFkbWluQGRlbW9ob3NwaXRhbC5jb20iLCJ1c2VyUm9sZSI6IlN1cGVyQWRtaW4iLCJhcGlWZXJzaW9uIjoiMjEuMC4wIiwiaWF0IjoxNjU0NjU2MDUzLCJleHAiOjE2NTQ3NDI0NTN9.2Bzmz_yHS1zRGgPQ5I3XzT2aR2KVYzJLM9RKCZPEkek',	'2022-06-08 02:42:20',	'superadmin@demohospital.com'),
(8295,	215,	NULL,	NULL,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyRW1haWwiOiJzdXBlcmFkbWluQGRlbW9ob3NwaXRhbC5jb20iLCJ1c2VyUm9sZSI6IlN1cGVyQWRtaW4iLCJhcGlWZXJzaW9uIjoiMjEuMC4wIiwiaWF0IjoxNjU0NjU3NzA2LCJleHAiOjE2NTQ3NDQxMDZ9.eO13DXnwDs7tk_NIm-8q4qY3IizQTOKK-9BtIEIkM3Q',	'2022-06-08 03:09:53',	'superadmin@demohospital.com'),
(8296,	215,	NULL,	NULL,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyRW1haWwiOiJzdXBlcmFkbWluQGRlbW9ob3NwaXRhbC5jb20iLCJ1c2VyUm9sZSI6IlN1cGVyQWRtaW4iLCJhcGlWZXJzaW9uIjoiMjEuMC4wIiwiaWF0IjoxNjU0NjYyNTEzLCJleHAiOjE2NTQ3NDg5MTN9.83pgxXCa3HlrfViVsnn4n3bC83umOJkS3N_iZOHLiyE',	'2022-06-08 04:30:00',	'superadmin@demohospital.com'),
(8297,	215,	NULL,	NULL,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyRW1haWwiOiJzdXBlcmFkbWluQGRlbW9ob3NwaXRhbC5jb20iLCJ1c2VyUm9sZSI6IlN1cGVyQWRtaW4iLCJhcGlWZXJzaW9uIjoiMjEuMC4wIiwiaWF0IjoxNjU0NjY3NjI1LCJleHAiOjE2NTQ3NTQwMjV9.sRxQ-lfwnrAiwBI7LCF5_1jpQm0zB3WWglL85iVBMzw',	'2022-06-08 05:55:11',	'superadmin@demohospital.com')
ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `user_id` = VALUES(`user_id`), `token` = VALUES(`token`), `token_auth_salt` = VALUES(`token_auth_salt`), `token_auth` = VALUES(`token_auth`), `expiry` = VALUES(`expiry`), `email` = VALUES(`email`);

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `prac_uuid` varchar(255) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `pid` varchar(255) NOT NULL,
  `tenant_uuid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ar_activity`;
CREATE TABLE `ar_activity` (
  `pid` int(11) NOT NULL,
  `encounter` int(11) NOT NULL,
  `sequence_no` int(10) unsigned NOT NULL COMMENT 'Ar_activity sequence_no, incremented in code',
  `code_type` varchar(12) NOT NULL DEFAULT '',
  `code` varchar(20) NOT NULL COMMENT 'empty means claim level',
  `modifier` varchar(12) NOT NULL DEFAULT '',
  `payer_type` int(11) NOT NULL COMMENT '0=pt, 1=ins1, 2=ins2, etc',
  `post_time` datetime NOT NULL,
  `post_user` int(11) NOT NULL COMMENT 'references users.id',
  `session_id` int(10) unsigned NOT NULL COMMENT 'references ar_session.session_id',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT 'adjustment reasons go here',
  `pay_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT 'either pay or adj will always be 0',
  `adj_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `modified_time` datetime NOT NULL,
  `follow_up` char(1) NOT NULL,
  `follow_up_note` text,
  `account_code` varchar(15) NOT NULL,
  `reason_code` varchar(255) DEFAULT NULL COMMENT 'Use as needed to show the primary payer adjustment reason code',
  PRIMARY KEY (`pid`,`encounter`,`sequence_no`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ar_session`;
CREATE TABLE `ar_session` (
  `session_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payer_id` int(11) NOT NULL COMMENT '0=pt else references insurance_companies.id',
  `user_id` int(11) NOT NULL COMMENT 'references users.id for session owner',
  `closed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=no, 1=yes',
  `reference` varchar(255) NOT NULL DEFAULT '' COMMENT 'check or EOB number',
  `check_date` date DEFAULT NULL,
  `deposit_date` date DEFAULT NULL,
  `pay_total` decimal(12,2) NOT NULL DEFAULT '0.00',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` datetime NOT NULL,
  `global_amount` decimal(12,2) NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `description` text,
  `adjustment_code` varchar(50) NOT NULL,
  `post_to_date` date NOT NULL,
  `patient_id` bigint(20) NOT NULL,
  `payment_method` varchar(25) NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `user_closed` (`user_id`,`closed`),
  KEY `deposit_date` (`deposit_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `audit_details`;
CREATE TABLE `audit_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(100) NOT NULL COMMENT 'openemr table name',
  `field_name` varchar(100) NOT NULL COMMENT 'openemr table''s field name',
  `field_value` text COMMENT 'openemr table''s field value',
  `audit_master_id` bigint(20) NOT NULL COMMENT 'Id of the audit_master table',
  `entry_identification` varchar(255) NOT NULL DEFAULT '1' COMMENT 'Used when multiple entry occurs from the same table.1 means no multiple entry',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `audit_logs`;
CREATE TABLE `audit_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route` varchar(255) DEFAULT NULL,
  `verb` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_role` varchar(255) DEFAULT NULL,
  `tenant` varchar(255) DEFAULT NULL,
  `req_body` text,
  `rsp_body` text,
  `rsp_code` int(11) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=839 DEFAULT CHARSET=utf8;

INSERT INTO `audit_logs` (`id`, `route`, `verb`, `user_email`, `user_role`, `tenant`, `req_body`, `rsp_body`, `rsp_code`, `pid`, `createdAt`, `updatedAt`) VALUES
(836,	'/api/patients/patiente9c617e0-4242-4828-ba08-66e8d4aa9009/patch_map',	'post',	'superadmin@demohospital.com',	'superadmin',	'empty tenant',	'{\"tenantId\":\"tenant8ea56b12-ff44-4b5c-839c-f609363ba385\",\"pid\":\"patiente9c617e0-4242-4828-ba08-66e8d4aa9009\",\"associated_list\":[\"ecg\",\"ihealth\",\"spo2\"],\"list\":[{\"patch_uuid\":\"patchfd9a7cd2-1549-44f0-a617-f9f3f9a17d71\",\"gateway_patch_serial\":\"123456789\",\"type_device\":\"gateway\",\"gateway_duration\":[\"2022-06-20T06:50:12.922Z\",\"2022-07-19T06:50:12.922Z\"],\"duration\":\"2022-06-20,2022-07-19\",\"config\":{}}]}',	NULL,	0,	NULL,	'2022-06-07 06:48:55',	'2022-06-07 06:48:55'),
(837,	'/api/patients/patiente9c617e0-4242-4828-ba08-66e8d4aa9009/patch_map',	'post',	'superadmin@demohospital.com',	'superadmin',	'empty tenant',	'{\"tenantId\":\"tenant8ea56b12-ff44-4b5c-839c-f609363ba385\",\"pid\":\"patiente9c617e0-4242-4828-ba08-66e8d4aa9009\",\"associated_list\":[\"ecg\",\"ihealth\",\"spo2\",\"gateway\"],\"list\":[{\"patch_uuid\":\"patchec35eec4-fe02-488e-8029-e6e4a6a4f252\",\"ihealth_patch_serial\":\"123456789\",\"type_device\":\"ihealth\",\"ihealth_duration\":[\"2022-06-16T06:51:02.516Z\",\"2022-07-19T06:51:02.516Z\"],\"duration\":\"2022-06-16,2022-07-19\",\"config\":{}}]}',	NULL,	0,	NULL,	'2022-06-07 06:49:42',	'2022-06-07 06:49:42'),
(838,	'/api/patients/patiente9c617e0-4242-4828-ba08-66e8d4aa9009/patch_map',	'post',	'superadmin@demohospital.com',	'superadmin',	'empty tenant',	'{\"tenantId\":\"tenant8ea56b12-ff44-4b5c-839c-f609363ba385\",\"pid\":\"patiente9c617e0-4242-4828-ba08-66e8d4aa9009\",\"associated_list\":[\"ecg\",\"spo2\",\"gateway\",\"ihealth\"],\"list\":[{\"patch_uuid\":\"patch5db10bb5-1046-4019-80fa-af5511e9481b\",\"temperature_patch_serial\":\"123456789\",\"type_device\":\"temperature\",\"temperature_duration\":[\"2022-06-20T06:51:27.970Z\",\"2022-07-19T06:51:27.970Z\"],\"duration\":\"2022-06-20,2022-07-19\",\"config\":{}}]}',	NULL,	0,	NULL,	'2022-06-07 06:50:10',	'2022-06-07 06:50:10')
ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `route` = VALUES(`route`), `verb` = VALUES(`verb`), `user_email` = VALUES(`user_email`), `user_role` = VALUES(`user_role`), `tenant` = VALUES(`tenant`), `req_body` = VALUES(`req_body`), `rsp_body` = VALUES(`rsp_body`), `rsp_code` = VALUES(`rsp_code`), `pid` = VALUES(`pid`), `createdAt` = VALUES(`createdAt`), `updatedAt` = VALUES(`updatedAt`);

DROP TABLE IF EXISTS `audit_master`;
CREATE TABLE `audit_master` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT 'The Id of the user who approves or denies',
  `approval_status` tinyint(4) NOT NULL COMMENT '1-Pending,2-Approved,3-Denied,4-Appointment directly updated to calendar table,5-Cancelled appointment',
  `comments` text,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` datetime NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '1-new patient,2-existing patient,3-change is only in the document,4-Patient upload,5-random key,10-Appointment',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `automatic_notification`;
CREATE TABLE `automatic_notification` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `sms_gateway_type` varchar(255) NOT NULL,
  `next_app_date` date NOT NULL,
  `next_app_time` varchar(10) NOT NULL,
  `provider_name` varchar(100) NOT NULL,
  `message` text,
  `email_sender` varchar(100) NOT NULL,
  `email_subject` varchar(100) NOT NULL,
  `type` enum('SMS','Email') NOT NULL DEFAULT 'SMS',
  `notification_sent_date` datetime NOT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `background_services`;
CREATE TABLE `background_services` (
  `name` varchar(31) NOT NULL,
  `title` varchar(127) NOT NULL COMMENT 'name for reports',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `running` tinyint(1) NOT NULL DEFAULT '-1' COMMENT 'True indicates managed service is busy. Skip this interval',
  `next_run` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execute_interval` int(11) NOT NULL DEFAULT '0' COMMENT 'minimum number of minutes between function calls,0=manual mode',
  `function` varchar(127) NOT NULL COMMENT 'name of background service function',
  `require_once` varchar(255) DEFAULT NULL COMMENT 'include file (if necessary)',
  `sort_order` int(11) NOT NULL DEFAULT '100' COMMENT 'lower numbers will be run first',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `batchcom`;
CREATE TABLE `batchcom` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `patient_id` bigint(20) NOT NULL DEFAULT '0',
  `sent_by` bigint(20) NOT NULL DEFAULT '0',
  `msg_type` varchar(60) DEFAULT NULL,
  `msg_subject` varchar(255) DEFAULT NULL,
  `msg_text` mediumtext,
  `msg_date_sent` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `bed`;
CREATE TABLE `bed` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_uuid` varchar(255) NOT NULL,
  `bed_uuid` varchar(255) NOT NULL,
  `bed_num` varchar(100) NOT NULL,
  `archive` smallint(6) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `location_uuid` varchar(255) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `benefit_eligibility`;
CREATE TABLE `benefit_eligibility` (
  `response_id` bigint(20) NOT NULL,
  `verification_id` bigint(20) NOT NULL,
  `type` varchar(4) DEFAULT NULL,
  `benefit_type` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `coverage_level` varchar(255) DEFAULT NULL,
  `coverage_type` varchar(512) DEFAULT NULL,
  `plan_type` varchar(255) DEFAULT NULL,
  `plan_description` varchar(255) DEFAULT NULL,
  `coverage_period` varchar(255) DEFAULT NULL,
  `amount` decimal(5,2) DEFAULT NULL,
  `percent` decimal(3,2) DEFAULT NULL,
  `network_ind` varchar(2) DEFAULT NULL,
  `message` varchar(512) DEFAULT NULL,
  `response_status` enum('A','D') DEFAULT 'A',
  `response_create_date` date DEFAULT NULL,
  `response_modify_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `billing`;
CREATE TABLE `billing` (
  `params` json DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `code_type` varchar(15) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `authorized` tinyint(1) DEFAULT NULL,
  `encounter` int(11) DEFAULT NULL,
  `code_text` longtext,
  `billed` tinyint(1) DEFAULT NULL,
  `activity` tinyint(1) DEFAULT NULL,
  `payer_id` int(11) DEFAULT NULL,
  `bill_process` tinyint(4) NOT NULL DEFAULT '0',
  `bill_date` datetime DEFAULT NULL,
  `process_date` datetime DEFAULT NULL,
  `process_file` varchar(255) DEFAULT NULL,
  `modifier` varchar(12) DEFAULT NULL,
  `units` int(11) DEFAULT NULL,
  `fee` decimal(12,2) DEFAULT NULL,
  `justify` varchar(255) DEFAULT NULL,
  `target` varchar(30) DEFAULT NULL,
  `x12_partner_id` int(11) DEFAULT NULL,
  `ndc_info` varchar(255) DEFAULT NULL,
  `notecodes` varchar(25) NOT NULL DEFAULT '',
  `external_id` varchar(20) DEFAULT NULL,
  `pricelevel` varchar(31) DEFAULT '',
  `revenue_code` varchar(6) NOT NULL DEFAULT '' COMMENT 'Item revenue code',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

INSERT INTO `billing` (`params`, `id`, `date`, `code_type`, `code`, `pid`, `provider_id`, `user`, `groupname`, `authorized`, `encounter`, `code_text`, `billed`, `activity`, `payer_id`, `bill_process`, `bill_date`, `process_date`, `process_file`, `modifier`, `units`, `fee`, `justify`, `target`, `x12_partner_id`, `ndc_info`, `notecodes`, `external_id`, `pricelevel`, `revenue_code`) VALUES
('\"{\\\"time_spent\\\":0}\"',	1,	'2022-05-10 10:05:21',	'CPT',	'99453',	'patienta2417a82-ae21-4bf7-bd8a-43cef822cebc',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-10 10:05:21',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	2,	'2022-05-11 02:32:24',	'CPT',	'99453',	'patient6bdd3267-315e-4300-bf2f-d4f76b18d09a',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-11 02:33:29',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	3,	'2022-05-11 03:04:50',	'CPT',	'99453',	'patient08c0132f-a463-4bae-9aa5-30022e8b94e7',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-11 03:05:55',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	4,	'2022-05-11 03:24:32',	'CPT',	'99453',	'patientfd5f8e9d-e2e8-457d-9e8b-e8bea0fdd8bf',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-11 03:25:37',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	5,	'2022-05-11 03:48:37',	'CPT',	'99453',	'patient697187cd-ee39-482a-ab7f-b4c65b2f3af6',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-11 03:48:36',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	6,	'2022-05-12 03:17:18',	'CPT',	'99453',	'patientd7b23b5a-f12b-4c46-b2bb-3e7be9cd9b8c',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-12 03:18:23',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	8,	'2022-05-12 04:00:30',	'CPT',	'99453',	'patient0d16bf06-4554-489c-aa65-eb843b75247a',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-12 04:01:35',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	9,	'2022-05-12 04:09:06',	'CPT',	'99453',	'patient7fb9eadf-e6b8-4bff-abb4-1b1281fa7ea6',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-12 04:09:06',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	10,	'2022-05-13 08:07:00',	'CPT',	'99453',	'patient7bda92c0-d3f8-4b78-8d1e-a55596f79b73',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-13 08:06:59',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	11,	'2022-05-16 03:46:35',	'CPT',	'99453',	'patientd3a61ce6-81d5-4580-9d81-8390324b0e2d',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-16 03:47:40',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	12,	'2022-05-19 03:28:42',	'CPT',	'99453',	'patient6f6ba484-d786-4248-a3af-433cef3b313f',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-19 03:28:42',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	13,	'2022-05-19 06:12:48',	'CPT',	'99453',	'patientfc71e725-de29-48c4-acdd-25718cd6717b',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-19 06:12:47',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	14,	'2022-05-19 06:40:20',	'CPT',	'99453',	'patient554ee16f-a977-48fb-865b-70b796cec5f7',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-19 06:41:25',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	15,	'2022-05-19 06:41:35',	'CPT',	'99453',	'patientcbc54ba9-49e5-428a-a17d-02422332ee19',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-19 06:42:40',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	16,	'2022-05-19 08:30:35',	'CPT',	'99453',	'patientab80ac69-3e4b-4afd-8da5-7c7bb6a50f35',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-19 08:31:40',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	17,	'2022-05-19 08:42:27',	'CPT',	'99453',	'patientbda9187c-391f-4034-b814-aa2fce720383',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-19 08:43:32',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	18,	'2022-05-19 13:19:38',	'CPT',	'99453',	'patientc5038bf2-18e3-4fdc-b1ed-6c881990f76d',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-19 13:19:38',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	19,	'2022-05-20 01:52:47',	'CPT',	'99453',	'patientdb8ba4a7-9272-4a09-b066-58db330bdce2',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-20 01:53:52',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	20,	'2022-05-20 03:54:33',	'CPT',	'99453',	'patient69fa0682-d7c6-4c48-9273-9938a5370add',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-20 03:55:38',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	21,	'2022-05-20 04:01:13',	'CPT',	'99453',	'patientd0c78583-4576-4fbf-8ffd-e5acae898d29',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-20 04:01:13',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	23,	'2022-05-20 08:52:05',	'CPT',	'99453',	'patient889ae8a2-eba5-46f0-9624-7f9a7a0e7217',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-20 08:53:11',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	24,	'2022-05-23 02:57:37',	'CPT',	'99453',	'patientfc061c57-273a-4aac-af33-3a49e3bad65f',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-23 02:58:56',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{}\"',	25,	'2022-05-23 09:18:56',	'CPT',	'99457',	'patientfc061c57-273a-4aac-af33-3a49e3bad65f',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-23 09:20:14',	NULL,	NULL,	NULL,	NULL,	40.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{}\"',	26,	'2022-05-24 02:46:00',	'CPT',	'99457',	'patient889ae8a2-eba5-46f0-9624-7f9a7a0e7217',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-24 02:47:18',	NULL,	NULL,	NULL,	NULL,	40.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	27,	'2022-05-24 04:22:25',	'CPT',	'99453',	'patient73b699c7-571b-4fb2-a88f-768ba293349e',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-24 04:23:44',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"[{\\\"task_id\\\":1653366236055,\\\"task_date\\\":\\\"2022-05-02T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"a\\\",\\\"task_note\\\":\\\"a\\\",\\\"task_time_spend\\\":5},{\\\"task_id\\\":1653366509923,\\\"task_date\\\":\\\"2022-05-10T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"sda\\\",\\\"task_note\\\":\\\"asd\\\",\\\"task_time_spend\\\":7},{\\\"task_id\\\":1653378857899,\\\"task_date\\\":\\\"2022-05-06T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"a\\\",\\\"task_note\\\":\\\"a\\\",\\\"task_time_spend\\\":6},{\\\"task_id\\\":1653379324276,\\\"task_date\\\":\\\"2022-05-07T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"ád\\\",\\\"task_note\\\":\\\"ád\\\",\\\"task_time_spend\\\":10},{\\\"task_id\\\":1653380312320,\\\"task_date\\\":\\\"2022-05-09T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"ASD A\\\",\\\"task_note\\\":\\\"ASD \\\"}]\"',	28,	'2022-05-24 04:22:37',	'CPT',	'99457',	'patient73b699c7-571b-4fb2-a88f-768ba293349e',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-24 04:23:56',	NULL,	NULL,	NULL,	NULL,	40.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	29,	'2022-05-25 05:58:06',	'CPT',	'99453',	'patientb290946f-7402-438f-bcd7-ff5e63666d95',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-25 05:59:25',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"[{\\\"task_id\\\":1653459641300,\\\"task_date\\\":\\\"2022-05-10T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"ASD \\\",\\\"task_note\\\":\\\"ASD \\\"}]\"',	30,	'2022-05-25 06:19:23',	'CPT',	'99457',	'patientb290946f-7402-438f-bcd7-ff5e63666d95',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-25 06:20:41',	NULL,	NULL,	NULL,	NULL,	40.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	31,	'2022-05-25 07:30:21',	'CPT',	'99453',	'patienta58f6390-bf75-4ad1-86b3-a296c03e4701',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-25 07:31:39',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"[{\\\"task_id\\\":1653463912774,\\\"task_date\\\":\\\"2022-05-05T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"a\\\",\\\"task_note\\\":\\\"a\\\"}]\"',	32,	'2022-05-25 07:30:34',	'CPT',	'99457',	'patienta58f6390-bf75-4ad1-86b3-a296c03e4701',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-25 07:31:52',	NULL,	NULL,	NULL,	NULL,	40.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"[{\\\"task_id\\\":1653464161891,\\\"task_date\\\":\\\"2022-05-04T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"asd\\\",\\\"task_note\\\":\\\"asd\\\"}]\"',	33,	'2022-05-25 07:34:43',	'CPT',	'99457',	'patienta58f6390-bf75-4ad1-86b3-a296c03e4701',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-25 07:36:01',	NULL,	NULL,	NULL,	NULL,	40.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"[{\\\"task_id\\\":1653464172393,\\\"task_date\\\":\\\"2022-05-04T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"asd\\\",\\\"task_note\\\":\\\"asd\\\"},{\\\"task_id\\\":1653464196753,\\\"task_date\\\":\\\"2022-05-23T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"task staff name\\\",\\\"task_note\\\":\\\"task staff name\\\"},{\\\"task_id\\\":1653464212381,\\\"task_date\\\":\\\"2022-05-23T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"task staff name 22\\\",\\\"task_note\\\":\\\"task staff name 22\\\"}]\"',	34,	'2022-05-25 07:34:54',	'CPT',	'99457',	'patienta58f6390-bf75-4ad1-86b3-a296c03e4701',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-25 07:36:12',	NULL,	NULL,	NULL,	NULL,	40.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	35,	'2022-05-26 03:27:48',	'CPT',	'99453',	'patient99610849-06f2-4053-9c1e-08b01dfd9cde',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-26 03:29:06',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"[{\\\"task_id\\\":1653549657494,\\\"task_date\\\":\\\"2022-05-18T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"add task 99458\\\",\\\"task_note\\\":\\\"add task 99458\\\",\\\"task_time_spend\\\":1},{\\\"task_id\\\":1653553985229,\\\"task_date\\\":\\\"2022-05-06T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"asd\\\",\\\"task_note\\\":\\\"asd\\\",\\\"task_time_spend\\\":1}]\"',	38,	'2022-05-26 07:19:39',	'CPT',	'99458',	'patient99610849-06f2-4053-9c1e-08b01dfd9cde',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-26 07:20:57',	NULL,	NULL,	NULL,	NULL,	40.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"[{\\\"task_id\\\":1653552693516,\\\"task_date\\\":\\\"2022-05-11T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"sda\\\",\\\"task_note\\\":\\\"asd\\\"}]\"',	39,	'2022-05-26 08:10:15',	'CPT',	'99457',	'patient6f6ba484-d786-4248-a3af-433cef3b313f',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-26 08:11:33',	NULL,	NULL,	NULL,	NULL,	40.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"[{\\\"task_id\\\":1653552699183,\\\"task_date\\\":\\\"2022-05-19T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"asd\\\",\\\"task_note\\\":\\\"asd\\\"}]\"',	40,	'2022-05-26 08:10:20',	'CPT',	'99457',	'patient6f6ba484-d786-4248-a3af-433cef3b313f',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-26 08:11:39',	NULL,	NULL,	NULL,	NULL,	40.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"[{\\\"task_id\\\":1653552706819,\\\"task_date\\\":\\\"2022-05-27T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"asdasd\\\",\\\"task_note\\\":\\\"asdasd\\\"}]\"',	41,	'2022-05-26 08:10:28',	'CPT',	'99457',	'patient6f6ba484-d786-4248-a3af-433cef3b313f',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-26 08:11:46',	NULL,	NULL,	NULL,	NULL,	40.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"[{\\\"task_id\\\":1653552713330,\\\"task_date\\\":\\\"2022-05-13T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"asd\\\",\\\"task_note\\\":\\\"asd\\\"}]\"',	42,	'2022-05-26 08:10:35',	'CPT',	'99457',	'patient6f6ba484-d786-4248-a3af-433cef3b313f',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-26 08:11:53',	NULL,	NULL,	NULL,	NULL,	40.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"[{\\\"task_id\\\":1653552827760,\\\"task_date\\\":\\\"2022-05-19T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"asd \\\",\\\"task_note\\\":\\\"asd \\\"}]\"',	43,	'2022-05-26 08:12:29',	'CPT',	'99457',	'patient6f6ba484-d786-4248-a3af-433cef3b313f',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-26 08:13:47',	NULL,	NULL,	NULL,	NULL,	40.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"[{\\\"task_id\\\":1653552839602,\\\"task_date\\\":\\\"2022-05-20T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"eba\\\",\\\"task_note\\\":\\\"esdf\\\",\\\"task_time_spend\\\":0},{\\\"task_id\\\":1653552797351,\\\"task_date\\\":\\\"2022-05-12T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"as\\\",\\\"task_note\\\":\\\"asd\\\"}]\"',	44,	'2022-05-26 08:12:41',	'CPT',	'99457',	'patient6f6ba484-d786-4248-a3af-433cef3b313f',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-26 08:13:59',	NULL,	NULL,	NULL,	NULL,	40.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	45,	'2022-05-26 08:43:40',	'CPT',	'99453',	'patient00b14943-1c2d-4f53-bfb3-05ee520a6ceb',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-26 08:44:58',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"[{\\\"task_id\\\":1653554913414,\\\"task_date\\\":\\\"2022-05-11T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"a\\\",\\\"task_note\\\":\\\"a\\\",\\\"task_time_spend\\\":21},{\\\"task_id\\\":1653618497473,\\\"task_date\\\":\\\"2022-05-12T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"sdf sd\\\",\\\"task_note\\\":\\\"sdf \\\"}]\"',	46,	'2022-05-26 08:47:15',	'CPT',	'99457',	'patient00b14943-1c2d-4f53-bfb3-05ee520a6ceb',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-26 08:48:33',	NULL,	NULL,	NULL,	NULL,	40.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"[{\\\"task_id\\\":1653622489289,\\\"task_date\\\":\\\"2022-05-11T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"asd asd \\\",\\\"task_note\\\":\\\"asd asd\\\",\\\"task_time_spend\\\":31}]\"',	47,	'2022-05-27 03:33:30',	'CPT',	'99458',	'patient00b14943-1c2d-4f53-bfb3-05ee520a6ceb',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-27 03:34:49',	NULL,	NULL,	NULL,	NULL,	40.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	50,	'2022-05-31 08:05:39',	'CPT',	'99453',	'patient9b86f344-8369-45e0-ace1-818ded46e225',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-05-31 08:06:59',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"[{\\\"task_id\\\":1654072652966,\\\"temperature\\\":\\\"asd \\\",\\\"spo2\\\":\\\"asd \\\",\\\"heart_rate\\\":\\\"asd \\\",\\\"blood_pressure\\\":\\\"asd \\\",\\\"respiration_rate\\\":\\\"asd \\\",\\\"date\\\":\\\"2022-06-01T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"asd asd\\\",\\\"note\\\":\\\"asd\\\",\\\"time_spent\\\":\\\"2\\\"},{\\\"task_id\\\":1654072607895,\\\"temperature\\\":\\\"asd 2\\\",\\\"spo2\\\":\\\"asd 2\\\",\\\"heart_rate\\\":\\\"asd 2\\\",\\\"blood_pressure\\\":\\\"asd 2\\\",\\\"respiration_rate\\\":\\\"asd 2\\\",\\\"date\\\":\\\"2022-06-03T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"asd 2\\\",\\\"note\\\":\\\"note 2\\\",\\\"time_spent\\\":\\\"3\\\"},{\\\"task_id\\\":1654072666837,\\\"temperature\\\":\\\"asd 3\\\",\\\"spo2\\\":\\\"asd 3\\\",\\\"heart_rate\\\":\\\"asd 3\\\",\\\"blood_pressure\\\":\\\"asd 3\\\",\\\"respiration_rate\\\":\\\"asd 3\\\",\\\"date\\\":\\\"2022-06-16T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"asd 3\\\",\\\"note\\\":\\\"note 3\\\",\\\"time_spent\\\":\\\"3\\\"}]\"',	52,	'2022-06-01 00:00:00',	'CPT',	'99091',	'patient9b86f344-8369-45e0-ace1-818ded46e225',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-06-01 08:37:32',	NULL,	NULL,	NULL,	NULL,	40.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	58,	'2022-06-02 06:30:17',	'CPT',	'99453',	'patient83ea7e3b-2795-423a-b027-79b791c8a875',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-06-02 06:31:38',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"[{\\\"task_id\\\":1654154807310,\\\"temperature\\\":\\\"1\\\",\\\"spo2\\\":\\\"1\\\",\\\"heart_rate\\\":\\\"1\\\",\\\"blood_pressure\\\":\\\"1\\\",\\\"respiration_rate\\\":\\\"1\\\",\\\"date\\\":\\\"2022-06-02T07:24:52.858Z\\\",\\\"staff_name\\\":\\\"Staff name \\\",\\\"note\\\":\\\"NOTE\\\",\\\"time_spent\\\":\\\"1\\\"}]\"',	59,	'2022-06-02 07:24:52',	'CPT',	'99091',	'patient83ea7e3b-2795-423a-b027-79b791c8a875',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-06-02 07:26:47',	NULL,	NULL,	NULL,	NULL,	40.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	60,	'2022-06-03 03:23:41',	'CPT',	'99453',	'patient519d4f7b-5058-4ca4-a14c-b12eeb95d4c2',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-06-03 03:25:02',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	61,	'2022-06-03 03:32:29',	'CPT',	'99453',	'patientce04481e-0d54-4ec0-b9e9-c70d4745ae3a',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-06-03 03:33:50',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	62,	'2022-06-03 05:47:38',	'CPT',	'99453',	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-06-03 05:48:59',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"[{\\\"task_id\\\":1654242950373,\\\"task_date\\\":\\\"2022-06-03T07:55:37.383Z\\\",\\\"staff_name\\\":\\\"name\\\",\\\"task_note\\\":\\\"note\\\",\\\"task_time_spend\\\":10},{\\\"task_id\\\":1654242896597,\\\"task_date\\\":\\\"2022-06-04T00:00:00.000Z\\\",\\\"staff_name\\\":\\\"name 2\\\",\\\"task_note\\\":\\\"note 2\\\",\\\"task_time_spend\\\":7},{\\\"task_id\\\":1654580678428,\\\"task_date\\\":\\\"2022-06-07T05:43:27.269Z\\\",\\\"staff_name\\\":\\\"dd\\\",\\\"task_note\\\":\\\"sssss ssss\\\",\\\"task_time_spend\\\":62}]\"',	63,	'2022-06-03 07:54:29',	'CPT',	'99457',	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-06-03 07:55:50',	NULL,	NULL,	NULL,	NULL,	40.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	64,	'2022-06-03 13:33:13',	'CPT',	'99453',	'patienta8799480-7306-42a0-aa6a-46848de8c0a9',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-06-03 13:33:12',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	65,	'2022-06-03 18:46:05',	'CPT',	'99453',	'patienta4c4e3a3-0727-4ed9-b865-62b452e7319a',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-06-03 18:46:04',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	66,	'2022-06-06 04:15:04',	'CPT',	'99453',	'patientad1d31ca-5bea-4a99-8378-e535592ab402',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-06-06 04:16:25',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123'),
('\"{\\\"time_spent\\\":0}\"',	67,	'2022-06-07 08:06:48',	'CPT',	'99453',	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'2022-06-07 08:08:10',	NULL,	NULL,	NULL,	NULL,	20.00,	NULL,	NULL,	NULL,	NULL,	'pending',	NULL,	'',	'123')
ON DUPLICATE KEY UPDATE `params` = VALUES(`params`), `id` = VALUES(`id`), `date` = VALUES(`date`), `code_type` = VALUES(`code_type`), `code` = VALUES(`code`), `pid` = VALUES(`pid`), `provider_id` = VALUES(`provider_id`), `user` = VALUES(`user`), `groupname` = VALUES(`groupname`), `authorized` = VALUES(`authorized`), `encounter` = VALUES(`encounter`), `code_text` = VALUES(`code_text`), `billed` = VALUES(`billed`), `activity` = VALUES(`activity`), `payer_id` = VALUES(`payer_id`), `bill_process` = VALUES(`bill_process`), `bill_date` = VALUES(`bill_date`), `process_date` = VALUES(`process_date`), `process_file` = VALUES(`process_file`), `modifier` = VALUES(`modifier`), `units` = VALUES(`units`), `fee` = VALUES(`fee`), `justify` = VALUES(`justify`), `target` = VALUES(`target`), `x12_partner_id` = VALUES(`x12_partner_id`), `ndc_info` = VALUES(`ndc_info`), `notecodes` = VALUES(`notecodes`), `external_id` = VALUES(`external_id`), `pricelevel` = VALUES(`pricelevel`), `revenue_code` = VALUES(`revenue_code`);

DROP TABLE IF EXISTS `calendar_external`;
CREATE TABLE `calendar_external` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `description` varchar(45) NOT NULL,
  `source` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `parent` int(11) NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rght` int(11) NOT NULL DEFAULT '0',
  `aco_spec` varchar(63) NOT NULL DEFAULT 'patients|docs',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  KEY `lft` (`lft`,`rght`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `categories` (`id`, `name`, `value`, `parent`, `lft`, `rght`, `aco_spec`) VALUES
(1,	'Categories',	'',	0,	0,	57,	'patients|docs'),
(2,	'Lab Report',	'',	1,	1,	2,	'patients|docs'),
(3,	'Medical Record',	'',	1,	3,	4,	'patients|docs'),
(4,	'Patient Information',	'',	1,	5,	10,	'patients|docs'),
(5,	'Patient ID card',	'',	4,	6,	7,	'patients|docs'),
(6,	'Advance Directive',	'',	1,	11,	18,	'patients|docs'),
(7,	'Do Not Resuscitate Order',	'',	6,	12,	13,	'patients|docs'),
(8,	'Durable Power of Attorney',	'',	6,	14,	15,	'patients|docs'),
(9,	'Living Will',	'',	6,	16,	17,	'patients|docs'),
(10,	'Patient Photograph',	'',	4,	8,	9,	'patients|docs'),
(11,	'CCR',	'',	1,	19,	20,	'patients|docs'),
(12,	'CCD',	'',	1,	21,	22,	'patients|docs'),
(13,	'CCDA',	'',	1,	23,	24,	'patients|docs'),
(14,	'Eye Module',	'',	1,	25,	50,	'patients|docs'),
(15,	'Communication - Eye',	'',	14,	26,	27,	'patients|docs'),
(16,	'Encounters - Eye',	'',	14,	28,	29,	'patients|docs'),
(17,	'Imaging - Eye',	'',	14,	30,	49,	'patients|docs'),
(18,	'OCT - Eye',	'POSTSEG',	17,	31,	32,	'patients|docs'),
(19,	'FA/ICG - Eye',	'POSTSEG',	17,	33,	34,	'patients|docs'),
(20,	'External Photos - Eye',	'EXT',	17,	35,	36,	'patients|docs'),
(21,	'AntSeg Photos - Eye',	'ANTSEG',	17,	37,	38,	'patients|docs'),
(22,	'Optic Disc - Eye',	'POSTSEG',	17,	39,	40,	'patients|docs'),
(23,	'Fundus - Eye',	'POSTSEG',	17,	41,	42,	'patients|docs'),
(24,	'Radiology - Eye',	'NEURO',	17,	43,	44,	'patients|docs'),
(25,	'VF - Eye',	'NEURO',	17,	45,	46,	'patients|docs'),
(26,	'Drawings - Eye',	'',	17,	47,	48,	'patients|docs'),
(27,	'Onsite Portal',	'',	1,	51,	56,	'patients|docs'),
(28,	'Patient',	'',	27,	52,	53,	'patients|docs'),
(29,	'Reviewed',	'',	27,	54,	55,	'patients|docs')
ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `name` = VALUES(`name`), `value` = VALUES(`value`), `parent` = VALUES(`parent`), `lft` = VALUES(`lft`), `rght` = VALUES(`rght`), `aco_spec` = VALUES(`aco_spec`);

DROP TABLE IF EXISTS `categories_seq`;
CREATE TABLE `categories_seq` (
  `id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `categories_to_documents`;
CREATE TABLE `categories_to_documents` (
  `category_id` int(11) NOT NULL DEFAULT '0',
  `document_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`,`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ccda`;
CREATE TABLE `ccda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT NULL,
  `encounter` bigint(20) DEFAULT NULL,
  `ccda_data` mediumtext,
  `time` varchar(50) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` varchar(50) DEFAULT NULL,
  `couch_docid` varchar(100) DEFAULT NULL,
  `couch_revid` varchar(100) DEFAULT NULL,
  `view` tinyint(4) NOT NULL DEFAULT '0',
  `transfer` tinyint(4) NOT NULL DEFAULT '0',
  `emr_transfer` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_key` (`pid`,`encounter`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ccda_components`;
CREATE TABLE `ccda_components` (
  `ccda_components_id` int(11) NOT NULL AUTO_INCREMENT,
  `ccda_components_field` varchar(100) DEFAULT NULL,
  `ccda_components_name` varchar(100) DEFAULT NULL,
  `ccda_type` int(11) NOT NULL COMMENT '0=>sections,1=>components',
  PRIMARY KEY (`ccda_components_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ccda_field_mapping`;
CREATE TABLE `ccda_field_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_id` int(11) DEFAULT NULL,
  `ccda_field` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ccda_sections`;
CREATE TABLE `ccda_sections` (
  `ccda_sections_id` int(11) NOT NULL AUTO_INCREMENT,
  `ccda_components_id` int(11) DEFAULT NULL,
  `ccda_sections_field` varchar(100) DEFAULT NULL,
  `ccda_sections_name` varchar(100) DEFAULT NULL,
  `ccda_sections_req_mapping` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ccda_sections_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ccda_table_mapping`;
CREATE TABLE `ccda_table_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ccda_component` varchar(100) DEFAULT NULL,
  `ccda_component_section` varchar(100) DEFAULT NULL,
  `form_dir` varchar(100) DEFAULT NULL,
  `form_type` smallint(6) DEFAULT NULL,
  `form_table` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `chart_tracker`;
CREATE TABLE `chart_tracker` (
  `ct_pid` int(11) NOT NULL,
  `ct_when` datetime NOT NULL,
  `ct_userid` bigint(20) NOT NULL DEFAULT '0',
  `ct_location` varchar(31) NOT NULL DEFAULT '',
  PRIMARY KEY (`ct_pid`,`ct_when`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `claims`;
CREATE TABLE `claims` (
  `patient_id` bigint(20) NOT NULL,
  `encounter_id` int(11) NOT NULL,
  `version` int(10) unsigned NOT NULL COMMENT 'Claim version, incremented in code',
  `payer_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `payer_type` tinyint(4) NOT NULL DEFAULT '0',
  `bill_process` tinyint(4) NOT NULL DEFAULT '0',
  `bill_time` datetime DEFAULT NULL,
  `process_time` datetime DEFAULT NULL,
  `process_file` varchar(255) DEFAULT NULL,
  `target` varchar(30) DEFAULT NULL,
  `x12_partner_id` int(11) NOT NULL DEFAULT '0',
  `submitted_claim` text COMMENT 'This claims form claim data',
  PRIMARY KEY (`patient_id`,`encounter_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `clinical_plans`;
CREATE TABLE `clinical_plans` (
  `id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Unique and maps to list_options list clinical_plans',
  `pid` bigint(20) NOT NULL DEFAULT '0' COMMENT '0 is default for all patients, while > 0 is id from patient_data table',
  `normal_flag` tinyint(1) DEFAULT NULL COMMENT 'Normal Activation Flag',
  `cqm_flag` tinyint(1) DEFAULT NULL COMMENT 'Clinical Quality Measure flag (unable to customize per patient)',
  `cqm_2011_flag` tinyint(1) DEFAULT NULL COMMENT '2011 Clinical Quality Measure flag (unable to customize per patient)',
  `cqm_2014_flag` tinyint(1) DEFAULT NULL COMMENT '2014 Clinical Quality Measure flag (unable to customize per patient)',
  `cqm_measure_group` varchar(10) NOT NULL DEFAULT '' COMMENT 'Clinical Quality Measure Group Identifier',
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `clinical_plans_rules`;
CREATE TABLE `clinical_plans_rules` (
  `plan_id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Unique and maps to list_options list clinical_plans',
  `rule_id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Unique and maps to list_options list clinical_rules',
  PRIMARY KEY (`plan_id`,`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `clinical_rules`;
CREATE TABLE `clinical_rules` (
  `id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Unique and maps to list_options list clinical_rules',
  `pid` bigint(20) NOT NULL DEFAULT '0' COMMENT '0 is default for all patients, while > 0 is id from patient_data table',
  `active_alert_flag` tinyint(1) DEFAULT NULL COMMENT 'Active Alert Widget Module flag - note not yet utilized',
  `passive_alert_flag` tinyint(1) DEFAULT NULL COMMENT 'Passive Alert Widget Module flag',
  `cqm_flag` tinyint(1) DEFAULT NULL COMMENT 'Clinical Quality Measure flag (unable to customize per patient)',
  `cqm_2011_flag` tinyint(1) DEFAULT NULL COMMENT '2011 Clinical Quality Measure flag (unable to customize per patient)',
  `cqm_2014_flag` tinyint(1) DEFAULT NULL COMMENT '2014 Clinical Quality Measure flag (unable to customize per patient)',
  `cqm_nqf_code` varchar(10) NOT NULL DEFAULT '' COMMENT 'Clinical Quality Measure NQF identifier',
  `cqm_pqri_code` varchar(10) NOT NULL DEFAULT '' COMMENT 'Clinical Quality Measure PQRI identifier',
  `amc_flag` tinyint(1) DEFAULT NULL COMMENT 'Automated Measure Calculation flag (unable to customize per patient)',
  `amc_2011_flag` tinyint(1) DEFAULT NULL COMMENT '2011 Automated Measure Calculation flag for (unable to customize per patient)',
  `amc_2014_flag` tinyint(1) DEFAULT NULL COMMENT '2014 Automated Measure Calculation flag for (unable to customize per patient)',
  `amc_code` varchar(10) NOT NULL DEFAULT '' COMMENT 'Automated Measure Calculation indentifier (MU rule)',
  `amc_code_2014` varchar(30) NOT NULL DEFAULT '' COMMENT 'Automated Measure Calculation 2014 indentifier (MU rule)',
  `amc_2014_stage1_flag` tinyint(1) DEFAULT NULL COMMENT '2014 Stage 1 - Automated Measure Calculation flag for (unable to customize per patient)',
  `amc_2014_stage2_flag` tinyint(1) DEFAULT NULL COMMENT '2014 Stage 2 - Automated Measure Calculation flag for (unable to customize per patient)',
  `patient_reminder_flag` tinyint(1) DEFAULT NULL COMMENT 'Clinical Reminder Module flag',
  `developer` varchar(255) NOT NULL DEFAULT '' COMMENT 'Clinical Rule Developer',
  `funding_source` varchar(255) NOT NULL DEFAULT '' COMMENT 'Clinical Rule Funding Source',
  `release_version` varchar(255) NOT NULL DEFAULT '' COMMENT 'Clinical Rule Release Version',
  `web_reference` varchar(255) NOT NULL DEFAULT '' COMMENT 'Clinical Rule Web Reference',
  `access_control` varchar(255) NOT NULL DEFAULT 'patients:med' COMMENT 'ACO link for access control',
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `clinical_rules_log`;
CREATE TABLE `clinical_rules_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `pid` bigint(20) NOT NULL DEFAULT '0',
  `uid` bigint(20) NOT NULL DEFAULT '0',
  `category` varchar(255) NOT NULL DEFAULT '' COMMENT 'An example category is clinical_reminder_widget',
  `value` text,
  `new_value` text,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `uid` (`uid`),
  KEY `category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `codes`;
CREATE TABLE `codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_text` varchar(255) NOT NULL DEFAULT '',
  `code_text_short` varchar(24) NOT NULL DEFAULT '',
  `code` varchar(25) NOT NULL DEFAULT '',
  `code_type` smallint(6) DEFAULT NULL,
  `modifier` varchar(12) NOT NULL DEFAULT '',
  `units` int(11) DEFAULT NULL,
  `fee` decimal(12,2) DEFAULT NULL,
  `superbill` varchar(31) NOT NULL DEFAULT '',
  `related_code` varchar(255) NOT NULL DEFAULT '',
  `taxrates` varchar(255) NOT NULL DEFAULT '',
  `cyp_factor` float NOT NULL DEFAULT '0' COMMENT 'quantity representing a years supply',
  `active` tinyint(1) DEFAULT '1' COMMENT '0 = inactive, 1 = active',
  `reportable` tinyint(1) DEFAULT '0' COMMENT '0 = non-reportable, 1 = reportable',
  `financial_reporting` tinyint(1) DEFAULT '0' COMMENT '0 = negative, 1 = considered important code in financial reporting',
  `revenue_code` varchar(6) NOT NULL DEFAULT '' COMMENT 'Item revenue code',
  PRIMARY KEY (`id`),
  KEY `code` (`code`),
  KEY `code_type` (`code_type`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `codes_history`;
CREATE TABLE `codes_history` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `code` varchar(25) DEFAULT NULL,
  `modifier` varchar(12) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `diagnosis_reporting` tinyint(1) DEFAULT NULL,
  `financial_reporting` tinyint(1) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `code_type_name` varchar(255) DEFAULT NULL,
  `code_text` varchar(255) DEFAULT NULL,
  `code_text_short` varchar(24) DEFAULT NULL,
  `prices` text,
  `action_type` varchar(25) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `code_types`;
CREATE TABLE `code_types` (
  `ct_key` varchar(15) NOT NULL COMMENT 'short alphanumeric name',
  `ct_id` int(11) NOT NULL COMMENT 'numeric identifier',
  `ct_seq` int(11) NOT NULL DEFAULT '0' COMMENT 'sort order',
  `ct_mod` int(11) NOT NULL DEFAULT '0' COMMENT 'length of modifier field',
  `ct_just` varchar(15) NOT NULL DEFAULT '' COMMENT 'ct_key of justify type, if any',
  `ct_mask` varchar(9) NOT NULL DEFAULT '' COMMENT 'formatting mask for code values',
  `ct_fee` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if fees are used',
  `ct_rel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if can relate to other code types',
  `ct_nofs` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if to be hidden in the fee sheet',
  `ct_diag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if this is a diagnosis type',
  `ct_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 if this is active',
  `ct_label` varchar(31) NOT NULL DEFAULT '' COMMENT 'label of this code type',
  `ct_external` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 if stored codes in codes tables, 1 or greater if codes stored in external tables',
  `ct_claim` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if this is used in claims',
  `ct_proc` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if this is a procedure type',
  `ct_term` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if this is a clinical term',
  `ct_problem` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if this code type is used as a medical problem',
  `ct_drug` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if this code type is used as a medication',
  PRIMARY KEY (`ct_key`),
  UNIQUE KEY `ct_id` (`ct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


SET NAMES utf8mb4;

DROP TABLE IF EXISTS `connector`;
CREATE TABLE `connector` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `crontime` timestamp NULL DEFAULT NULL,
  `connector_uuid` varchar(255) DEFAULT NULL,
  `resources` varchar(255) DEFAULT NULL,
  `connector_specifics` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `customlists`;
CREATE TABLE `customlists` (
  `cl_list_slno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cl_list_id` int(10) unsigned NOT NULL COMMENT 'ID OF THE lIST FOR NEW TAKE SELECT MAX(cl_list_id)+1',
  `cl_list_item_id` int(10) unsigned DEFAULT NULL COMMENT 'ID OF THE lIST FOR NEW TAKE SELECT MAX(cl_list_item_id)+1',
  `cl_list_type` int(10) unsigned NOT NULL COMMENT '0=>List Name 1=>list items 2=>Context 3=>Template 4=>Sentence 5=> SavedTemplate 6=>CustomButton',
  `cl_list_item_short` varchar(10) DEFAULT NULL,
  `cl_list_item_long` text,
  `cl_list_item_level` int(11) DEFAULT NULL COMMENT 'Flow level for List Designation',
  `cl_order` int(11) DEFAULT NULL,
  `cl_deleted` tinyint(1) DEFAULT '0',
  `cl_creator` int(11) DEFAULT NULL,
  PRIMARY KEY (`cl_list_slno`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dated_reminders`;
CREATE TABLE `dated_reminders` (
  `dr_id` int(11) NOT NULL AUTO_INCREMENT,
  `dr_from_ID` int(11) NOT NULL,
  `dr_message_text` varchar(160) NOT NULL,
  `dr_message_sent_date` datetime NOT NULL,
  `dr_message_due_date` date NOT NULL,
  `pid` bigint(20) NOT NULL,
  `message_priority` tinyint(1) NOT NULL,
  `message_processed` tinyint(1) NOT NULL DEFAULT '0',
  `processed_date` timestamp NULL DEFAULT NULL,
  `dr_processed_by` int(11) NOT NULL,
  PRIMARY KEY (`dr_id`),
  KEY `dr_from_ID` (`dr_from_ID`,`dr_message_due_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dated_reminders_link`;
CREATE TABLE `dated_reminders_link` (
  `dr_link_id` int(11) NOT NULL AUTO_INCREMENT,
  `dr_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  PRIMARY KEY (`dr_link_id`),
  KEY `to_id` (`to_id`),
  KEY `dr_id` (`dr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `device_type`;
CREATE TABLE `device_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(25) DEFAULT NULL,
  `text` varchar(45) DEFAULT NULL,
  `sub` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO `device_type` (`id`, `key`, `text`, `sub`) VALUES
(2,	'ecg',	'EGC Sensor',	NULL),
(3,	'temperature',	'Temperature Sensor',	NULL),
(4,	'bps',	'BP Sensor',	NULL),
(5,	'alphamed',	'Alphamed',	'bps'),
(6,	'ihealth',	'iHealth',	'bps'),
(7,	'spo2',	'Sp02(Aeon)',	NULL)
ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `key` = VALUES(`key`), `text` = VALUES(`text`), `sub` = VALUES(`sub`);

DROP TABLE IF EXISTS `direct_message_log`;
CREATE TABLE `direct_message_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `msg_type` char(1) NOT NULL COMMENT 'S=sent,R=received',
  `msg_id` varchar(127) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `recipient` varchar(255) NOT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` char(1) NOT NULL COMMENT 'Q=queued,D=dispatched,R=received,F=failed',
  `status_info` varchar(511) DEFAULT NULL,
  `status_ts` timestamp NULL DEFAULT NULL,
  `patient_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `msg_id` (`msg_id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `documents`;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL DEFAULT '0',
  `type` enum('file_url','blob','web_url') DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `thumb_url` varchar(255) DEFAULT NULL,
  `mimetype` varchar(255) DEFAULT NULL,
  `pages` int(11) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `revision` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `foreign_id` bigint(20) DEFAULT NULL,
  `docdate` date DEFAULT NULL,
  `hash` varchar(40) DEFAULT NULL COMMENT '40-character SHA-1 hash of document',
  `list_id` bigint(20) NOT NULL DEFAULT '0',
  `couch_docid` varchar(100) DEFAULT NULL,
  `couch_revid` varchar(100) DEFAULT NULL,
  `storagemethod` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0->Harddisk,1->CouchDB',
  `path_depth` tinyint(4) DEFAULT '1' COMMENT 'Depth of path to use in url to find document. Not applicable for CouchDB.',
  `imported` tinyint(4) DEFAULT '0' COMMENT 'Parsing status for CCR/CCD/CCDA importing',
  `encounter_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Encounter id if tagged',
  `encounter_check` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'If encounter is created while tagging',
  `audit_master_approval_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'approval_status from audit_master table',
  `audit_master_id` int(11) DEFAULT NULL,
  `documentationOf` varchar(255) DEFAULT NULL,
  `encrypted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0->No,1->Yes',
  PRIMARY KEY (`id`),
  KEY `revision` (`revision`),
  KEY `foreign_id` (`foreign_id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `documents_legal_categories`;
CREATE TABLE `documents_legal_categories` (
  `dlc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dlc_category_type` int(10) unsigned NOT NULL COMMENT '1 category 2 subcategory',
  `dlc_category_name` varchar(45) NOT NULL,
  `dlc_category_parent` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`dlc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `documents_legal_detail`;
CREATE TABLE `documents_legal_detail` (
  `dld_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dld_pid` int(10) unsigned DEFAULT NULL,
  `dld_facility` int(10) unsigned DEFAULT NULL,
  `dld_provider` int(10) unsigned DEFAULT NULL,
  `dld_encounter` int(10) unsigned DEFAULT NULL,
  `dld_master_docid` int(10) unsigned NOT NULL,
  `dld_signed` smallint(5) unsigned NOT NULL COMMENT '0-Not Signed or Cannot Sign(Layout),1-Signed,2-Ready to sign,3-Denied(Pat Regi),4-Patient Upload,10-Save(Layout)',
  `dld_signed_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dld_filepath` varchar(75) DEFAULT NULL,
  `dld_filename` varchar(45) NOT NULL,
  `dld_signing_person` varchar(50) NOT NULL,
  `dld_sign_level` int(11) NOT NULL COMMENT 'Sign flow level',
  `dld_content` varchar(50) NOT NULL COMMENT 'Layout sign position',
  `dld_file_for_pdf_generation` blob NOT NULL COMMENT 'The filled details in the fdf file is stored here.Patient Registration Screen',
  `dld_denial_reason` longtext,
  `dld_moved` tinyint(4) NOT NULL DEFAULT '0',
  `dld_patient_comments` text COMMENT 'Patient comments stored here',
  PRIMARY KEY (`dld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `documents_legal_master`;
CREATE TABLE `documents_legal_master` (
  `dlm_category` int(10) unsigned DEFAULT NULL,
  `dlm_subcategory` int(10) unsigned DEFAULT NULL,
  `dlm_document_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dlm_document_name` varchar(75) NOT NULL,
  `dlm_filepath` varchar(75) NOT NULL,
  `dlm_facility` int(10) unsigned DEFAULT NULL,
  `dlm_provider` int(10) unsigned DEFAULT NULL,
  `dlm_sign_height` double NOT NULL,
  `dlm_sign_width` double NOT NULL,
  `dlm_filename` varchar(45) NOT NULL,
  `dlm_effective_date` datetime NOT NULL,
  `dlm_version` int(10) unsigned NOT NULL,
  `content` varchar(255) NOT NULL,
  `dlm_savedsign` varchar(255) DEFAULT NULL COMMENT '0-Yes 1-No',
  `dlm_review` varchar(255) DEFAULT NULL COMMENT '0-Yes 1-No',
  `dlm_upload_type` tinyint(4) DEFAULT '0' COMMENT '0-Provider Uploaded,1-Patient Uploaded',
  PRIMARY KEY (`dlm_document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of Master Docs to be signed';


DROP TABLE IF EXISTS `drugs`;
CREATE TABLE `drugs` (
  `drug_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `ndc_number` varchar(20) NOT NULL DEFAULT '',
  `on_order` int(11) NOT NULL DEFAULT '0',
  `reorder_point` float NOT NULL DEFAULT '0',
  `max_level` float NOT NULL DEFAULT '0',
  `last_notify` date NOT NULL DEFAULT '0000-00-00',
  `reactions` text,
  `form` int(11) NOT NULL DEFAULT '0',
  `size` varchar(25) NOT NULL DEFAULT '',
  `unit` int(11) NOT NULL DEFAULT '0',
  `route` int(11) NOT NULL DEFAULT '0',
  `substitute` int(11) NOT NULL DEFAULT '0',
  `related_code` varchar(255) NOT NULL DEFAULT '' COMMENT 'may reference a related codes.code',
  `cyp_factor` float NOT NULL DEFAULT '0' COMMENT 'quantity representing a years supply',
  `active` tinyint(1) DEFAULT '1' COMMENT '0 = inactive, 1 = active',
  `allow_combining` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = allow filling an order from multiple lots',
  `allow_multiple` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = allow multiple lots at one warehouse',
  `drug_code` varchar(25) DEFAULT NULL,
  `consumable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = will not show on the fee sheet',
  `dispensable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = pharmacy elsewhere, 1 = dispensed here',
  PRIMARY KEY (`drug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `drug_inventory`;
CREATE TABLE `drug_inventory` (
  `inventory_id` int(11) NOT NULL AUTO_INCREMENT,
  `drug_id` int(11) NOT NULL,
  `lot_number` varchar(20) DEFAULT NULL,
  `expiration` date DEFAULT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `on_hand` int(11) NOT NULL DEFAULT '0',
  `warehouse_id` varchar(31) NOT NULL DEFAULT '',
  `vendor_id` bigint(20) NOT NULL DEFAULT '0',
  `last_notify` date NOT NULL DEFAULT '0000-00-00',
  `destroy_date` date DEFAULT NULL,
  `destroy_method` varchar(255) DEFAULT NULL,
  `destroy_witness` varchar(255) DEFAULT NULL,
  `destroy_notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`inventory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `drug_sales`;
CREATE TABLE `drug_sales` (
  `sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `drug_id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `prescription_id` int(11) NOT NULL DEFAULT '0',
  `pid` bigint(20) NOT NULL DEFAULT '0',
  `encounter` int(11) NOT NULL DEFAULT '0',
  `user` varchar(255) DEFAULT NULL,
  `sale_date` date NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `fee` decimal(12,2) NOT NULL DEFAULT '0.00',
  `billed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'indicates if the sale is posted to accounting',
  `xfer_inventory_id` int(11) NOT NULL DEFAULT '0',
  `distributor_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references users.id',
  `notes` varchar(255) NOT NULL DEFAULT '',
  `bill_date` datetime DEFAULT NULL,
  `pricelevel` varchar(31) DEFAULT '',
  `selector` varchar(255) DEFAULT '' COMMENT 'references drug_templates.selector',
  PRIMARY KEY (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `drug_templates`;
CREATE TABLE `drug_templates` (
  `drug_id` int(11) NOT NULL,
  `selector` varchar(255) NOT NULL DEFAULT '',
  `dosage` varchar(10) DEFAULT NULL,
  `period` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `refills` int(11) NOT NULL DEFAULT '0',
  `taxrates` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`drug_id`,`selector`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `eligibility_verification`;
CREATE TABLE `eligibility_verification` (
  `verification_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `response_id` varchar(32) DEFAULT NULL,
  `insurance_id` bigint(20) DEFAULT NULL,
  `eligibility_check_date` datetime DEFAULT NULL,
  `copay` int(11) DEFAULT NULL,
  `deductible` int(11) DEFAULT NULL,
  `deductiblemet` enum('Y','N') DEFAULT 'Y',
  `create_date` date DEFAULT NULL,
  PRIMARY KEY (`verification_id`),
  KEY `insurance_id` (`insurance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `employer_data`;
CREATE TABLE `employer_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `pid` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `enc_category_map`;
CREATE TABLE `enc_category_map` (
  `rule_enc_id` varchar(31) NOT NULL DEFAULT '' COMMENT 'encounter id from rule_enc_types list in list_options',
  `main_cat_id` int(11) NOT NULL DEFAULT '0' COMMENT 'category id from event category in openemr_postcalendar_categories',
  KEY `rule_enc_id` (`rule_enc_id`,`main_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `erx_narcotics`;
CREATE TABLE `erx_narcotics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drug` varchar(255) NOT NULL,
  `dea_number` varchar(5) NOT NULL,
  `csa_sch` varchar(2) NOT NULL,
  `narc` varchar(2) NOT NULL,
  `other_names` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `erx_rx_log`;
CREATE TABLE `erx_rx_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prescription_id` int(11) NOT NULL,
  `date` varchar(25) NOT NULL,
  `time` varchar(15) NOT NULL,
  `code` int(11) NOT NULL,
  `status` text,
  `message_id` varchar(100) DEFAULT NULL,
  `read` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `erx_ttl_touch`;
CREATE TABLE `erx_ttl_touch` (
  `patient_id` bigint(20) unsigned NOT NULL COMMENT 'Patient record Id',
  `process` enum('allergies','medications') NOT NULL COMMENT 'NewCrop eRx SOAP process',
  `updated` datetime NOT NULL COMMENT 'Date and time of last process update for patient',
  PRIMARY KEY (`patient_id`,`process`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store records last update per patient data process';


DROP TABLE IF EXISTS `erx_weno_drugs`;
CREATE TABLE `erx_weno_drugs` (
  `drug_id` int(11) NOT NULL AUTO_INCREMENT,
  `rxcui_drug_coded` int(11) DEFAULT NULL,
  `generic_rxcui` int(11) DEFAULT NULL,
  `drug_db_code_qualifier` text,
  `full_name` varchar(250) NOT NULL,
  `rxn_dose_form` text,
  `full_generic_name` varchar(250) NOT NULL,
  `brand_name` varchar(250) NOT NULL,
  `display_name` varchar(250) NOT NULL,
  `route` text,
  `new_dose_form` varchar(100) DEFAULT NULL,
  `strength` varchar(15) DEFAULT NULL,
  `supress_for` text,
  `display_name_synonym` text,
  `is_retired` text,
  `sxdg_rxcui` varchar(10) DEFAULT NULL,
  `sxdg_tty` text,
  `sxdg_name` varchar(100) DEFAULT NULL,
  `psn_drugdescription` varchar(100) DEFAULT NULL,
  `ncpdp_quantity_term` text,
  `potency_unit_code` varchar(10) DEFAULT NULL,
  `dea_schedule_no` int(11) DEFAULT NULL,
  `dea_schedule` varchar(7) DEFAULT NULL,
  `ingredients` varchar(100) DEFAULT NULL,
  `drug_interaction` varchar(100) DEFAULT NULL,
  `unit_source_code` varchar(3) DEFAULT NULL,
  `code_list_qualifier` int(11) DEFAULT NULL,
  PRIMARY KEY (`drug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `esign_signatures`;
CREATE TABLE `esign_signatures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL COMMENT 'Table row ID for signature',
  `table` varchar(255) NOT NULL COMMENT 'table name for the signature',
  `uid` int(11) NOT NULL COMMENT 'user id for the signing user',
  `datetime` datetime NOT NULL COMMENT 'datetime of the signature action',
  `is_lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'sig, lock or amendment',
  `amendment` text COMMENT 'amendment text, if any',
  `hash` varchar(255) NOT NULL COMMENT 'hash of signed data',
  `signature_hash` varchar(255) NOT NULL COMMENT 'hash of signature itself',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `table` (`table`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ews_table`;
CREATE TABLE `ews_table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `calculated_time` varchar(255) NOT NULL,
  `score` varchar(20) NOT NULL,
  `score_split` json NOT NULL,
  `tenant_id` varchar(255) NOT NULL,
  `archive` tinyint(4) NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `extended_log`;
CREATE TABLE `extended_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `recipient` varchar(255) DEFAULT NULL,
  `description` longtext,
  `patient_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `external_encounters`;
CREATE TABLE `external_encounters` (
  `ee_id` int(11) NOT NULL AUTO_INCREMENT,
  `ee_date` date DEFAULT NULL,
  `ee_pid` int(11) DEFAULT NULL,
  `ee_provider_id` varchar(255) DEFAULT NULL,
  `ee_facility_id` varchar(255) DEFAULT NULL,
  `ee_encounter_diagnosis` varchar(255) DEFAULT NULL,
  `ee_external_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `external_procedures`;
CREATE TABLE `external_procedures` (
  `ep_id` int(11) NOT NULL AUTO_INCREMENT,
  `ep_date` date DEFAULT NULL,
  `ep_code_type` varchar(20) DEFAULT NULL,
  `ep_code` varchar(9) DEFAULT NULL,
  `ep_pid` int(11) DEFAULT NULL,
  `ep_encounter` int(11) DEFAULT NULL,
  `ep_code_text` longtext,
  `ep_facility_id` varchar(255) DEFAULT NULL,
  `ep_external_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `facility`;
CREATE TABLE `facility` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postal_code` varchar(11) DEFAULT NULL,
  `country_code` varchar(30) DEFAULT '',
  `federal_ein` varchar(15) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `service_location` tinyint(1) DEFAULT '1',
  `billing_location` tinyint(1) DEFAULT '0',
  `accepts_assignment` tinyint(1) DEFAULT '0',
  `pos_code` tinyint(4) DEFAULT NULL,
  `x12_sender_id` varchar(25) DEFAULT NULL,
  `attn` varchar(65) DEFAULT NULL,
  `domain_identifier` varchar(60) DEFAULT NULL,
  `facility_npi` varchar(15) DEFAULT NULL,
  `facility_taxonomy` varchar(15) DEFAULT NULL,
  `tax_id_type` varchar(31) DEFAULT '',
  `color` varchar(7) DEFAULT '',
  `primary_business_entity` int(11) DEFAULT '0' COMMENT '0-Not Set as business entity 1-Set as business entity',
  `facility_code` varchar(31) DEFAULT NULL,
  `extra_validation` tinyint(1) DEFAULT '1',
  `mail_street` varchar(30) DEFAULT NULL,
  `mail_street2` varchar(30) DEFAULT NULL,
  `mail_city` varchar(50) DEFAULT NULL,
  `mail_state` varchar(3) DEFAULT NULL,
  `mail_zip` varchar(10) DEFAULT NULL,
  `oid` varchar(255) DEFAULT '' COMMENT 'HIEs CCDA and FHIR an OID is required/wanted',
  `tenant_id` varchar(255) NOT NULL,
  `facility_map` json DEFAULT NULL,
  `facility_uuid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `facility_user_ids`;
CREATE TABLE `facility_user_ids` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `facility_id` bigint(20) DEFAULT NULL,
  `field_id` varchar(31) NOT NULL COMMENT 'references layout_options.field_id',
  `field_value` text,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`facility_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fee_sheet_options`;
CREATE TABLE `fee_sheet_options` (
  `fs_category` varchar(63) DEFAULT NULL,
  `fs_option` varchar(63) DEFAULT NULL,
  `fs_codes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `forms`;
CREATE TABLE `forms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `encounter` bigint(20) DEFAULT NULL,
  `form_name` longtext,
  `form_id` bigint(20) DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `authorized` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'flag indicates form has been deleted',
  `formdir` longtext,
  `therapy_group_id` int(11) DEFAULT NULL,
  `issue_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references lists.id to identify a case',
  `provider_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references users.id to identify a provider',
  PRIMARY KEY (`id`),
  KEY `pid_encounter` (`pid`,`encounter`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_care_plan`;
CREATE TABLE `form_care_plan` (
  `id` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `encounter` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `authorized` tinyint(4) DEFAULT NULL,
  `activity` tinyint(4) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `codetext` text,
  `description` text,
  `external_id` varchar(30) DEFAULT NULL,
  `care_plan_type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_clinical_instructions`;
CREATE TABLE `form_clinical_instructions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT NULL,
  `encounter` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `instruction` text,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `activity` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_dictation`;
CREATE TABLE `form_dictation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `authorized` tinyint(4) DEFAULT NULL,
  `activity` tinyint(4) DEFAULT NULL,
  `dictation` longtext,
  `additional_notes` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_encounter`;
CREATE TABLE `form_encounter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `reason` longtext,
  `facility` longtext,
  `facility_id` int(11) NOT NULL DEFAULT '0',
  `pid` bigint(20) DEFAULT NULL,
  `encounter` bigint(20) DEFAULT NULL,
  `onset_date` datetime DEFAULT NULL,
  `sensitivity` varchar(30) DEFAULT NULL,
  `billing_note` text,
  `pc_catid` int(11) NOT NULL DEFAULT '5' COMMENT 'event category from openemr_postcalendar_categories',
  `last_level_billed` int(11) NOT NULL DEFAULT '0' COMMENT '0=none, 1=ins1, 2=ins2, etc',
  `last_level_closed` int(11) NOT NULL DEFAULT '0' COMMENT '0=none, 1=ins1, 2=ins2, etc',
  `last_stmt_date` date DEFAULT NULL,
  `stmt_count` int(11) NOT NULL DEFAULT '0',
  `provider_id` int(11) DEFAULT '0' COMMENT 'default and main provider for this visit',
  `supervisor_id` int(11) DEFAULT '0' COMMENT 'supervising provider, if any, for this visit',
  `invoice_refno` varchar(31) NOT NULL DEFAULT '',
  `referral_source` varchar(31) NOT NULL DEFAULT '',
  `billing_facility` int(11) NOT NULL DEFAULT '0',
  `external_id` varchar(20) DEFAULT NULL,
  `pos_code` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid_encounter` (`pid`,`encounter`),
  KEY `encounter_date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_eye_acuity`;
CREATE TABLE `form_eye_acuity` (
  `id` bigint(20) NOT NULL COMMENT 'Links to forms.form_id',
  `pid` bigint(20) DEFAULT NULL,
  `SCODVA` varchar(25) DEFAULT NULL,
  `SCOSVA` varchar(25) DEFAULT NULL,
  `PHODVA` varchar(25) DEFAULT NULL,
  `PHOSVA` varchar(25) DEFAULT NULL,
  `CTLODVA` varchar(25) DEFAULT NULL,
  `CTLOSVA` varchar(25) DEFAULT NULL,
  `MRODVA` varchar(25) DEFAULT NULL,
  `MROSVA` varchar(25) DEFAULT NULL,
  `SCNEARODVA` varchar(25) DEFAULT NULL,
  `SCNEAROSVA` varchar(25) DEFAULT NULL,
  `MRNEARODVA` varchar(25) DEFAULT NULL,
  `MRNEAROSVA` varchar(25) DEFAULT NULL,
  `GLAREODVA` varchar(25) DEFAULT NULL,
  `GLAREOSVA` varchar(25) DEFAULT NULL,
  `GLARECOMMENTS` varchar(255) DEFAULT NULL,
  `ARODVA` varchar(25) DEFAULT NULL,
  `AROSVA` varchar(25) DEFAULT NULL,
  `CRODVA` varchar(25) DEFAULT NULL,
  `CROSVA` varchar(25) DEFAULT NULL,
  `CTLODVA1` varchar(25) DEFAULT NULL,
  `CTLOSVA1` varchar(25) DEFAULT NULL,
  `PAMODVA` varchar(25) DEFAULT NULL,
  `PAMOSVA` varchar(25) DEFAULT NULL,
  `LIODVA` varchar(25) NOT NULL,
  `LIOSVA` varchar(25) NOT NULL,
  `WODVANEAR` varchar(25) DEFAULT NULL,
  `OSVANEARCC` varchar(25) DEFAULT NULL,
  `BINOCVA` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_pid` (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_eye_antseg`;
CREATE TABLE `form_eye_antseg` (
  `id` bigint(20) NOT NULL COMMENT 'Links to forms.form_id',
  `pid` bigint(20) DEFAULT NULL,
  `ODSCHIRMER1` varchar(25) DEFAULT NULL,
  `OSSCHIRMER1` varchar(25) DEFAULT NULL,
  `ODSCHIRMER2` varchar(25) DEFAULT NULL,
  `OSSCHIRMER2` varchar(25) DEFAULT NULL,
  `ODTBUT` varchar(25) DEFAULT NULL,
  `OSTBUT` varchar(25) DEFAULT NULL,
  `OSCONJ` varchar(25) DEFAULT NULL,
  `ODCONJ` text,
  `ODCORNEA` text,
  `OSCORNEA` text,
  `ODAC` text,
  `OSAC` text,
  `ODLENS` text,
  `OSLENS` text,
  `ODIRIS` text,
  `OSIRIS` text,
  `PUPIL_NORMAL` varchar(2) DEFAULT '1',
  `ODPUPILSIZE1` varchar(25) DEFAULT NULL,
  `ODPUPILSIZE2` varchar(25) DEFAULT NULL,
  `ODPUPILREACTIVITY` char(25) DEFAULT NULL,
  `ODAPD` varchar(25) DEFAULT NULL,
  `OSPUPILSIZE1` varchar(25) DEFAULT NULL,
  `OSPUPILSIZE2` varchar(25) DEFAULT NULL,
  `OSPUPILREACTIVITY` char(25) DEFAULT NULL,
  `OSAPD` varchar(25) DEFAULT NULL,
  `DIMODPUPILSIZE1` varchar(25) DEFAULT NULL,
  `DIMODPUPILSIZE2` varchar(25) DEFAULT NULL,
  `DIMODPUPILREACTIVITY` varchar(25) DEFAULT NULL,
  `DIMOSPUPILSIZE1` varchar(25) DEFAULT NULL,
  `DIMOSPUPILSIZE2` varchar(25) DEFAULT NULL,
  `DIMOSPUPILREACTIVITY` varchar(25) DEFAULT NULL,
  `PUPIL_COMMENTS` text,
  `ODKTHICKNESS` varchar(25) DEFAULT NULL,
  `OSKTHICKNESS` varchar(25) DEFAULT NULL,
  `ODGONIO` varchar(25) DEFAULT NULL,
  `OSGONIO` varchar(25) DEFAULT NULL,
  `ANTSEG_COMMENTS` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_pid` (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_eye_base`;
CREATE TABLE `form_eye_base` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Links to forms.form_id',
  `date` datetime DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `authorized` tinyint(4) DEFAULT NULL,
  `activity` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_eye_biometrics`;
CREATE TABLE `form_eye_biometrics` (
  `id` bigint(20) NOT NULL COMMENT 'Links to forms.form_id',
  `pid` bigint(20) DEFAULT NULL,
  `ODK1` varchar(10) DEFAULT NULL,
  `ODK2` varchar(10) DEFAULT NULL,
  `ODK2AXIS` varchar(10) DEFAULT NULL,
  `OSK1` varchar(10) DEFAULT NULL,
  `OSK2` varchar(10) DEFAULT NULL,
  `OSK2AXIS` varchar(10) DEFAULT NULL,
  `ODAXIALLENGTH` varchar(20) DEFAULT NULL,
  `OSAXIALLENGTH` varchar(20) DEFAULT NULL,
  `ODPDMeasured` varchar(20) DEFAULT NULL,
  `OSPDMeasured` varchar(20) DEFAULT NULL,
  `ODACD` varchar(20) DEFAULT NULL,
  `OSACD` varchar(20) DEFAULT NULL,
  `ODW2W` varchar(20) DEFAULT NULL,
  `OSW2W` varchar(20) DEFAULT NULL,
  `ODLT` varchar(20) DEFAULT NULL,
  `OSLT` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_pid` (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_eye_external`;
CREATE TABLE `form_eye_external` (
  `id` bigint(20) NOT NULL COMMENT 'Links to forms.form_id',
  `pid` bigint(20) DEFAULT NULL,
  `RUL` text,
  `LUL` text,
  `RLL` text,
  `LLL` text,
  `RBROW` text,
  `LBROW` text,
  `RMCT` text,
  `LMCT` text,
  `RADNEXA` text,
  `LADNEXA` text,
  `RMRD` varchar(25) DEFAULT NULL,
  `LMRD` varchar(25) DEFAULT NULL,
  `RLF` varchar(25) DEFAULT NULL,
  `LLF` varchar(25) DEFAULT NULL,
  `RVFISSURE` varchar(25) DEFAULT NULL,
  `LVFISSURE` varchar(25) DEFAULT NULL,
  `ODHERTEL` varchar(25) DEFAULT NULL,
  `OSHERTEL` varchar(25) DEFAULT NULL,
  `HERTELBASE` varchar(25) DEFAULT NULL,
  `RCAROTID` text,
  `LCAROTID` text,
  `RTEMPART` text,
  `LTEMPART` text,
  `RCNV` text,
  `LCNV` text,
  `RCNVII` text,
  `LCNVII` text,
  `EXT_COMMENTS` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_pid` (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_eye_hpi`;
CREATE TABLE `form_eye_hpi` (
  `id` bigint(20) NOT NULL COMMENT 'Links to forms.form_id',
  `pid` bigint(20) DEFAULT NULL,
  `CC1` varchar(255) DEFAULT NULL,
  `HPI1` text,
  `QUALITY1` varchar(255) DEFAULT NULL,
  `TIMING1` varchar(255) DEFAULT NULL,
  `DURATION1` varchar(255) DEFAULT NULL,
  `CONTEXT1` varchar(255) DEFAULT NULL,
  `SEVERITY1` varchar(255) DEFAULT NULL,
  `MODIFY1` varchar(255) DEFAULT NULL,
  `ASSOCIATED1` varchar(255) DEFAULT NULL,
  `LOCATION1` varchar(255) DEFAULT NULL,
  `CHRONIC1` varchar(255) DEFAULT NULL,
  `CHRONIC2` varchar(255) DEFAULT NULL,
  `CHRONIC3` varchar(255) DEFAULT NULL,
  `CC2` text,
  `HPI2` text,
  `QUALITY2` text,
  `TIMING2` text,
  `DURATION2` text,
  `CONTEXT2` text,
  `SEVERITY2` text,
  `MODIFY2` text,
  `ASSOCIATED2` text,
  `LOCATION2` text,
  `CC3` text,
  `HPI3` text,
  `QUALITY3` text,
  `TIMING3` text,
  `DURATION3` text,
  `CONTEXT3` text,
  `SEVERITY3` text,
  `MODIFY3` text,
  `ASSOCIATED3` text,
  `LOCATION3` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_pid` (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_eye_locking`;
CREATE TABLE `form_eye_locking` (
  `id` bigint(20) NOT NULL COMMENT 'Links to forms.form_id',
  `pid` bigint(20) DEFAULT NULL,
  `IMP` text,
  `PLAN` text,
  `Resource` varchar(50) DEFAULT NULL,
  `Technician` varchar(50) DEFAULT NULL,
  `LOCKED` varchar(3) DEFAULT NULL,
  `LOCKEDDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LOCKEDBY` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_pid` (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_eye_mag_dispense`;
CREATE TABLE `form_eye_mag_dispense` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `encounter` bigint(20) DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `authorized` tinyint(4) DEFAULT NULL,
  `activity` tinyint(4) DEFAULT NULL,
  `REFDATE` datetime DEFAULT NULL,
  `REFTYPE` varchar(10) DEFAULT NULL,
  `RXTYPE` varchar(20) DEFAULT NULL,
  `ODSPH` varchar(10) DEFAULT NULL,
  `ODCYL` varchar(10) DEFAULT NULL,
  `ODAXIS` varchar(10) DEFAULT NULL,
  `OSSPH` varchar(10) DEFAULT NULL,
  `OSCYL` varchar(10) DEFAULT NULL,
  `OSAXIS` varchar(10) DEFAULT NULL,
  `ODMIDADD` varchar(10) DEFAULT NULL,
  `OSMIDADD` varchar(10) DEFAULT NULL,
  `ODADD` varchar(10) DEFAULT NULL,
  `OSADD` varchar(10) DEFAULT NULL,
  `ODHPD` varchar(20) DEFAULT NULL,
  `ODHBASE` varchar(20) DEFAULT NULL,
  `ODVPD` varchar(20) DEFAULT NULL,
  `ODVBASE` varchar(20) DEFAULT NULL,
  `ODSLABOFF` varchar(20) DEFAULT NULL,
  `ODVERTEXDIST` varchar(20) DEFAULT NULL,
  `OSHPD` varchar(20) DEFAULT NULL,
  `OSHBASE` varchar(20) DEFAULT NULL,
  `OSVPD` varchar(20) DEFAULT NULL,
  `OSVBASE` varchar(20) DEFAULT NULL,
  `OSSLABOFF` varchar(20) DEFAULT NULL,
  `OSVERTEXDIST` varchar(20) DEFAULT NULL,
  `ODMPDD` varchar(20) DEFAULT NULL,
  `ODMPDN` varchar(20) DEFAULT NULL,
  `OSMPDD` varchar(20) DEFAULT NULL,
  `OSMPDN` varchar(20) DEFAULT NULL,
  `BPDD` varchar(20) DEFAULT NULL,
  `BPDN` varchar(20) DEFAULT NULL,
  `LENS_MATERIAL` varchar(20) DEFAULT NULL,
  `LENS_TREATMENTS` varchar(100) DEFAULT NULL,
  `CTLMANUFACTUREROD` varchar(25) DEFAULT NULL,
  `CTLMANUFACTUREROS` varchar(25) DEFAULT NULL,
  `CTLSUPPLIEROD` varchar(25) DEFAULT NULL,
  `CTLSUPPLIEROS` varchar(25) DEFAULT NULL,
  `CTLBRANDOD` varchar(50) DEFAULT NULL,
  `CTLBRANDOS` varchar(50) DEFAULT NULL,
  `CTLODQUANTITY` varchar(255) DEFAULT NULL,
  `CTLOSQUANTITY` varchar(255) DEFAULT NULL,
  `ODDIAM` varchar(50) DEFAULT NULL,
  `ODBC` varchar(50) DEFAULT NULL,
  `OSDIAM` varchar(50) DEFAULT NULL,
  `OSBC` varchar(50) DEFAULT NULL,
  `RXCOMMENTS` text,
  `COMMENTS` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pid` (`pid`,`encounter`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_eye_mag_impplan`;
CREATE TABLE `form_eye_mag_impplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` bigint(20) NOT NULL,
  `pid` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `codetype` varchar(50) DEFAULT NULL,
  `codedesc` varchar(255) DEFAULT NULL,
  `codetext` varchar(255) DEFAULT NULL,
  `plan` varchar(3000) DEFAULT NULL,
  `PMSFH_link` varchar(50) DEFAULT NULL,
  `IMPPLAN_order` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `second_index` (`form_id`,`pid`,`title`,`plan`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_eye_mag_orders`;
CREATE TABLE `form_eye_mag_orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `pid` bigint(20) NOT NULL,
  `ORDER_DETAILS` varchar(255) NOT NULL,
  `ORDER_STATUS` varchar(50) DEFAULT NULL,
  `ORDER_PRIORITY` varchar(50) DEFAULT NULL,
  `ORDER_DATE_PLACED` date NOT NULL,
  `ORDER_PLACED_BYWHOM` varchar(50) DEFAULT NULL,
  `ORDER_DATE_COMPLETED` date DEFAULT NULL,
  `ORDER_COMPLETED_BYWHOM` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `VISIT_ID` (`pid`,`ORDER_DETAILS`,`ORDER_DATE_PLACED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_eye_mag_prefs`;
CREATE TABLE `form_eye_mag_prefs` (
  `PEZONE` varchar(25) DEFAULT NULL,
  `LOCATION` varchar(25) DEFAULT NULL,
  `LOCATION_text` varchar(25) NOT NULL,
  `id` bigint(20) DEFAULT NULL,
  `selection` varchar(255) DEFAULT NULL,
  `ZONE_ORDER` int(11) DEFAULT NULL,
  `GOVALUE` varchar(10) DEFAULT '0',
  `ordering` tinyint(4) DEFAULT NULL,
  `FILL_ACTION` varchar(10) NOT NULL DEFAULT 'ADD',
  `GORIGHT` varchar(50) NOT NULL,
  `GOLEFT` varchar(50) NOT NULL,
  `UNSPEC` varchar(50) NOT NULL,
  UNIQUE KEY `id` (`id`,`PEZONE`,`LOCATION`,`selection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_eye_mag_wearing`;
CREATE TABLE `form_eye_mag_wearing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ENCOUNTER` int(11) NOT NULL,
  `FORM_ID` smallint(6) NOT NULL,
  `PID` bigint(20) NOT NULL,
  `RX_NUMBER` int(11) NOT NULL,
  `ODSPH` varchar(10) DEFAULT NULL,
  `ODCYL` varchar(10) DEFAULT NULL,
  `ODAXIS` varchar(10) DEFAULT NULL,
  `OSSPH` varchar(10) DEFAULT NULL,
  `OSCYL` varchar(10) DEFAULT NULL,
  `OSAXIS` varchar(10) DEFAULT NULL,
  `ODMIDADD` varchar(10) DEFAULT NULL,
  `OSMIDADD` varchar(10) DEFAULT NULL,
  `ODADD` varchar(10) DEFAULT NULL,
  `OSADD` varchar(10) DEFAULT NULL,
  `ODVA` varchar(10) DEFAULT NULL,
  `OSVA` varchar(10) DEFAULT NULL,
  `ODNEARVA` varchar(10) DEFAULT NULL,
  `OSNEARVA` varchar(10) DEFAULT NULL,
  `ODHPD` varchar(20) DEFAULT NULL,
  `ODHBASE` varchar(20) DEFAULT NULL,
  `ODVPD` varchar(20) DEFAULT NULL,
  `ODVBASE` varchar(20) DEFAULT NULL,
  `ODSLABOFF` varchar(20) DEFAULT NULL,
  `ODVERTEXDIST` varchar(20) DEFAULT NULL,
  `OSHPD` varchar(20) DEFAULT NULL,
  `OSHBASE` varchar(20) DEFAULT NULL,
  `OSVPD` varchar(20) DEFAULT NULL,
  `OSVBASE` varchar(20) DEFAULT NULL,
  `OSSLABOFF` varchar(20) DEFAULT NULL,
  `OSVERTEXDIST` varchar(20) DEFAULT NULL,
  `ODMPDD` varchar(20) DEFAULT NULL,
  `ODMPDN` varchar(20) DEFAULT NULL,
  `OSMPDD` varchar(20) DEFAULT NULL,
  `OSMPDN` varchar(20) DEFAULT NULL,
  `BPDD` varchar(20) DEFAULT NULL,
  `BPDN` varchar(20) DEFAULT NULL,
  `LENS_MATERIAL` varchar(20) DEFAULT NULL,
  `LENS_TREATMENTS` varchar(100) DEFAULT NULL,
  `RX_TYPE` varchar(25) DEFAULT NULL,
  `COMMENTS` text,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `FORM_ID` (`FORM_ID`,`ENCOUNTER`,`PID`,`RX_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_eye_neuro`;
CREATE TABLE `form_eye_neuro` (
  `id` bigint(20) NOT NULL COMMENT 'Links to forms.form_id',
  `pid` bigint(20) DEFAULT NULL,
  `ACT` char(3) NOT NULL DEFAULT 'on',
  `ACT5CCDIST` text,
  `ACT1CCDIST` text,
  `ACT2CCDIST` text,
  `ACT3CCDIST` text,
  `ACT4CCDIST` text,
  `ACT6CCDIST` text,
  `ACT7CCDIST` text,
  `ACT8CCDIST` text,
  `ACT9CCDIST` text,
  `ACT10CCDIST` text,
  `ACT11CCDIST` text,
  `ACT1SCDIST` text,
  `ACT2SCDIST` text,
  `ACT3SCDIST` text,
  `ACT4SCDIST` text,
  `ACT5SCDIST` text,
  `ACT6SCDIST` text,
  `ACT7SCDIST` text,
  `ACT8SCDIST` text,
  `ACT9SCDIST` text,
  `ACT10SCDIST` text,
  `ACT11SCDIST` text,
  `ACT1SCNEAR` text,
  `ACT2SCNEAR` text,
  `ACT3SCNEAR` text,
  `ACT4SCNEAR` text,
  `ACT5CCNEAR` text,
  `ACT6CCNEAR` text,
  `ACT7CCNEAR` text,
  `ACT8CCNEAR` text,
  `ACT9CCNEAR` text,
  `ACT10CCNEAR` text,
  `ACT11CCNEAR` text,
  `ACT5SCNEAR` text,
  `ACT6SCNEAR` text,
  `ACT7SCNEAR` text,
  `ACT8SCNEAR` text,
  `ACT9SCNEAR` text,
  `ACT10SCNEAR` text,
  `ACT11SCNEAR` text,
  `ACT1CCNEAR` text,
  `ACT2CCNEAR` text,
  `ACT3CCNEAR` text,
  `ACT4CCNEAR` text,
  `MOTILITYNORMAL` char(3) NOT NULL DEFAULT 'on',
  `MOTILITY_RS` char(1) DEFAULT '0',
  `MOTILITY_RI` char(1) DEFAULT '0',
  `MOTILITY_RR` char(1) DEFAULT '0',
  `MOTILITY_RL` char(1) DEFAULT '0',
  `MOTILITY_LS` char(1) DEFAULT '0',
  `MOTILITY_LI` char(1) DEFAULT '0',
  `MOTILITY_LR` char(1) DEFAULT '0',
  `MOTILITY_LL` char(1) DEFAULT '0',
  `MOTILITY_RRSO` int(11) DEFAULT NULL,
  `MOTILITY_RLSO` int(11) DEFAULT NULL,
  `MOTILITY_RRIO` int(11) DEFAULT NULL,
  `MOTILITY_RLIO` int(11) DEFAULT NULL,
  `MOTILITY_LRSO` int(11) DEFAULT NULL,
  `MOTILITY_LLSO` int(11) DEFAULT NULL,
  `MOTILITY_LRIO` int(11) DEFAULT NULL,
  `MOTILITY_LLIO` int(11) DEFAULT NULL,
  `NEURO_COMMENTS` text,
  `STEREOPSIS` varchar(25) DEFAULT NULL,
  `ODNPA` text,
  `OSNPA` text,
  `VERTFUSAMPS` text,
  `DIVERGENCEAMPS` text,
  `NPC` varchar(10) DEFAULT NULL,
  `DACCDIST` varchar(20) DEFAULT NULL,
  `DACCNEAR` varchar(20) DEFAULT NULL,
  `CACCDIST` varchar(20) DEFAULT NULL,
  `CACCNEAR` varchar(20) DEFAULT NULL,
  `ODCOLOR` text,
  `OSCOLOR` text,
  `ODCOINS` text,
  `OSCOINS` text,
  `ODREDDESAT` varchar(20) DEFAULT NULL,
  `OSREDDESAT` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_pid` (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_eye_postseg`;
CREATE TABLE `form_eye_postseg` (
  `id` bigint(20) NOT NULL COMMENT 'Links to forms.form_id',
  `pid` bigint(20) DEFAULT NULL,
  `ODDISC` text,
  `OSDISC` text,
  `ODCUP` text,
  `OSCUP` text,
  `ODMACULA` text,
  `OSMACULA` text,
  `ODVESSELS` text,
  `OSVESSELS` text,
  `ODVITREOUS` text,
  `OSVITREOUS` text,
  `ODPERIPH` text,
  `OSPERIPH` text,
  `ODCMT` text,
  `OSCMT` text,
  `RETINA_COMMENTS` text,
  `DIL_RISKS` char(2) NOT NULL DEFAULT 'on',
  `DIL_MEDS` mediumtext,
  `WETTYPE` varchar(10) NOT NULL,
  `ATROPINE` varchar(25) NOT NULL,
  `CYCLOMYDRIL` varchar(25) NOT NULL,
  `TROPICAMIDE` varchar(25) NOT NULL,
  `CYCLOGYL` varchar(25) NOT NULL,
  `NEO25` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_pid` (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_eye_refraction`;
CREATE TABLE `form_eye_refraction` (
  `id` bigint(20) NOT NULL COMMENT 'Links to forms.form_id',
  `pid` bigint(20) DEFAULT NULL,
  `MRODSPH` varchar(25) DEFAULT NULL,
  `MRODCYL` varchar(25) DEFAULT NULL,
  `MRODAXIS` varchar(25) DEFAULT NULL,
  `MRODPRISM` varchar(25) DEFAULT NULL,
  `MRODBASE` varchar(25) DEFAULT NULL,
  `MRODADD` varchar(25) DEFAULT NULL,
  `MROSSPH` varchar(25) DEFAULT NULL,
  `MROSCYL` varchar(25) DEFAULT NULL,
  `MROSAXIS` varchar(25) DEFAULT NULL,
  `MROSPRISM` varchar(50) DEFAULT NULL,
  `MROSBASE` varchar(50) DEFAULT NULL,
  `MROSADD` varchar(25) DEFAULT NULL,
  `MRODNEARSPHERE` varchar(25) DEFAULT NULL,
  `MRODNEARCYL` varchar(25) DEFAULT NULL,
  `MRODNEARAXIS` varchar(25) DEFAULT NULL,
  `MRODPRISMNEAR` varchar(50) DEFAULT NULL,
  `MRODBASENEAR` varchar(25) DEFAULT NULL,
  `MROSNEARSHPERE` varchar(25) DEFAULT NULL,
  `MROSNEARCYL` varchar(25) DEFAULT NULL,
  `MROSNEARAXIS` varchar(125) DEFAULT NULL,
  `MROSPRISMNEAR` varchar(50) DEFAULT NULL,
  `MROSBASENEAR` varchar(25) DEFAULT NULL,
  `CRODSPH` varchar(25) DEFAULT NULL,
  `CRODCYL` varchar(25) DEFAULT NULL,
  `CRODAXIS` varchar(25) DEFAULT NULL,
  `CROSSPH` varchar(25) DEFAULT NULL,
  `CROSCYL` varchar(25) DEFAULT NULL,
  `CROSAXIS` varchar(25) DEFAULT NULL,
  `CRCOMMENTS` varchar(255) DEFAULT NULL,
  `BALANCED` char(2) NOT NULL,
  `ARODSPH` varchar(25) DEFAULT NULL,
  `ARODCYL` varchar(25) DEFAULT NULL,
  `ARODAXIS` varchar(25) DEFAULT NULL,
  `AROSSPH` varchar(25) DEFAULT NULL,
  `AROSCYL` varchar(25) DEFAULT NULL,
  `AROSAXIS` varchar(25) DEFAULT NULL,
  `ARODADD` varchar(25) DEFAULT NULL,
  `AROSADD` varchar(25) DEFAULT NULL,
  `ARNEARODVA` varchar(25) DEFAULT NULL,
  `ARNEAROSVA` varchar(25) DEFAULT NULL,
  `ARODPRISM` varchar(50) DEFAULT NULL,
  `AROSPRISM` varchar(50) DEFAULT NULL,
  `CTLODSPH` varchar(25) DEFAULT NULL,
  `CTLODCYL` varchar(25) DEFAULT NULL,
  `CTLODAXIS` varchar(25) DEFAULT NULL,
  `CTLODBC` varchar(25) DEFAULT NULL,
  `CTLODDIAM` varchar(25) DEFAULT NULL,
  `CTLOSSPH` varchar(25) DEFAULT NULL,
  `CTLOSCYL` varchar(25) DEFAULT NULL,
  `CTLOSAXIS` varchar(25) DEFAULT NULL,
  `CTLOSBC` varchar(25) DEFAULT NULL,
  `CTLOSDIAM` varchar(25) DEFAULT NULL,
  `CTL_COMMENTS` text,
  `CTLMANUFACTUREROD` varchar(50) DEFAULT NULL,
  `CTLSUPPLIEROD` varchar(50) DEFAULT NULL,
  `CTLBRANDOD` varchar(50) DEFAULT NULL,
  `CTLMANUFACTUREROS` varchar(50) DEFAULT NULL,
  `CTLSUPPLIEROS` varchar(50) DEFAULT NULL,
  `CTLBRANDOS` varchar(50) DEFAULT NULL,
  `CTLODADD` varchar(25) DEFAULT NULL,
  `CTLOSADD` varchar(25) DEFAULT NULL,
  `NVOCHECKED` varchar(25) DEFAULT NULL,
  `ADDCHECKED` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_pid` (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_eye_ros`;
CREATE TABLE `form_eye_ros` (
  `id` bigint(20) NOT NULL COMMENT 'Links to forms.form_id',
  `pid` bigint(20) DEFAULT NULL,
  `ROSGENERAL` text,
  `ROSHEENT` text,
  `ROSCV` text,
  `ROSPULM` text,
  `ROSGI` text,
  `ROSGU` text,
  `ROSDERM` text,
  `ROSNEURO` text,
  `ROSPSYCH` text,
  `ROSMUSCULO` text,
  `ROSIMMUNO` text,
  `ROSENDOCRINE` text,
  `ROSCOMMENTS` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_pid` (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_eye_vitals`;
CREATE TABLE `form_eye_vitals` (
  `id` bigint(20) NOT NULL COMMENT 'Links to forms.form_id',
  `pid` bigint(20) DEFAULT NULL,
  `alert` char(3) DEFAULT 'yes',
  `oriented` char(3) DEFAULT 'TPP',
  `confused` char(3) DEFAULT 'nml',
  `ODIOPAP` varchar(10) DEFAULT NULL,
  `OSIOPAP` varchar(10) DEFAULT NULL,
  `ODIOPTPN` varchar(10) DEFAULT NULL,
  `OSIOPTPN` varchar(10) DEFAULT NULL,
  `ODIOPFTN` varchar(10) DEFAULT NULL,
  `OSIOPFTN` varchar(10) DEFAULT NULL,
  `IOPTIME` time NOT NULL,
  `ODIOPPOST` varchar(10) NOT NULL,
  `OSIOPPOST` varchar(10) NOT NULL,
  `IOPPOSTTIME` time DEFAULT NULL,
  `ODIOPTARGET` varchar(10) NOT NULL,
  `OSIOPTARGET` varchar(10) NOT NULL,
  `AMSLEROD` smallint(6) DEFAULT NULL,
  `AMSLEROS` smallint(6) DEFAULT NULL,
  `ODVF1` tinyint(1) DEFAULT NULL,
  `ODVF2` tinyint(1) DEFAULT NULL,
  `ODVF3` tinyint(1) DEFAULT NULL,
  `ODVF4` tinyint(1) DEFAULT NULL,
  `OSVF1` tinyint(1) DEFAULT NULL,
  `OSVF2` tinyint(1) DEFAULT NULL,
  `OSVF3` tinyint(1) DEFAULT NULL,
  `OSVF4` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_pid` (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_functional_cognitive_status`;
CREATE TABLE `form_functional_cognitive_status` (
  `id` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `encounter` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `authorized` tinyint(4) DEFAULT NULL,
  `activity` tinyint(4) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `codetext` text,
  `description` text,
  `external_id` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_groups_encounter`;
CREATE TABLE `form_groups_encounter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `reason` longtext,
  `facility` longtext,
  `facility_id` int(11) NOT NULL DEFAULT '0',
  `group_id` bigint(20) DEFAULT NULL,
  `encounter` bigint(20) DEFAULT NULL,
  `onset_date` datetime DEFAULT NULL,
  `sensitivity` varchar(30) DEFAULT NULL,
  `billing_note` text,
  `pc_catid` int(11) NOT NULL DEFAULT '5' COMMENT 'event category from openemr_postcalendar_categories',
  `last_level_billed` int(11) NOT NULL DEFAULT '0' COMMENT '0=none, 1=ins1, 2=ins2, etc',
  `last_level_closed` int(11) NOT NULL DEFAULT '0' COMMENT '0=none, 1=ins1, 2=ins2, etc',
  `last_stmt_date` date DEFAULT NULL,
  `stmt_count` int(11) NOT NULL DEFAULT '0',
  `provider_id` int(11) DEFAULT '0' COMMENT 'default and main provider for this visit',
  `supervisor_id` int(11) DEFAULT '0' COMMENT 'supervising provider, if any, for this visit',
  `invoice_refno` varchar(31) NOT NULL DEFAULT '',
  `referral_source` varchar(31) NOT NULL DEFAULT '',
  `billing_facility` int(11) NOT NULL DEFAULT '0',
  `external_id` varchar(20) DEFAULT NULL,
  `pos_code` tinyint(4) DEFAULT NULL,
  `counselors` varchar(255) DEFAULT NULL,
  `appt_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid_encounter` (`group_id`,`encounter`),
  KEY `encounter_date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_group_attendance`;
CREATE TABLE `form_group_attendance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `authorized` tinyint(4) DEFAULT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  `activity` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_misc_billing_options`;
CREATE TABLE `form_misc_billing_options` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `authorized` tinyint(4) DEFAULT NULL,
  `activity` tinyint(4) DEFAULT NULL,
  `employment_related` tinyint(1) DEFAULT NULL,
  `auto_accident` tinyint(1) DEFAULT NULL,
  `accident_state` varchar(2) DEFAULT NULL,
  `other_accident` tinyint(1) DEFAULT NULL,
  `medicaid_referral_code` varchar(2) DEFAULT NULL,
  `epsdt_flag` tinyint(1) DEFAULT NULL,
  `provider_qualifier_code` varchar(2) DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `outside_lab` tinyint(1) DEFAULT NULL,
  `lab_amount` decimal(5,2) DEFAULT NULL,
  `is_unable_to_work` tinyint(1) DEFAULT NULL,
  `onset_date` date DEFAULT NULL,
  `date_initial_treatment` date DEFAULT NULL,
  `off_work_from` date DEFAULT NULL,
  `off_work_to` date DEFAULT NULL,
  `is_hospitalized` tinyint(1) DEFAULT NULL,
  `hospitalization_date_from` date DEFAULT NULL,
  `hospitalization_date_to` date DEFAULT NULL,
  `medicaid_resubmission_code` varchar(10) DEFAULT NULL,
  `medicaid_original_reference` varchar(15) DEFAULT NULL,
  `prior_auth_number` varchar(20) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `replacement_claim` tinyint(1) DEFAULT '0',
  `icn_resubmission_number` varchar(35) DEFAULT NULL,
  `box_14_date_qual` char(3) DEFAULT NULL,
  `box_15_date_qual` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_observation`;
CREATE TABLE `form_observation` (
  `id` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `encounter` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `authorized` tinyint(4) DEFAULT NULL,
  `activity` tinyint(4) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `observation` varchar(255) DEFAULT NULL,
  `ob_value` varchar(255) DEFAULT NULL,
  `ob_unit` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `code_type` varchar(255) DEFAULT NULL,
  `table_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_reviewofs`;
CREATE TABLE `form_reviewofs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `authorized` tinyint(4) DEFAULT NULL,
  `activity` tinyint(4) DEFAULT NULL,
  `fever` varchar(5) DEFAULT NULL,
  `chills` varchar(5) DEFAULT NULL,
  `night_sweats` varchar(5) DEFAULT NULL,
  `weight_loss` varchar(5) DEFAULT NULL,
  `poor_appetite` varchar(5) DEFAULT NULL,
  `insomnia` varchar(5) DEFAULT NULL,
  `fatigued` varchar(5) DEFAULT NULL,
  `depressed` varchar(5) DEFAULT NULL,
  `hyperactive` varchar(5) DEFAULT NULL,
  `exposure_to_foreign_countries` varchar(5) DEFAULT NULL,
  `cataracts` varchar(5) DEFAULT NULL,
  `cataract_surgery` varchar(5) DEFAULT NULL,
  `glaucoma` varchar(5) DEFAULT NULL,
  `double_vision` varchar(5) DEFAULT NULL,
  `blurred_vision` varchar(5) DEFAULT NULL,
  `poor_hearing` varchar(5) DEFAULT NULL,
  `headaches` varchar(5) DEFAULT NULL,
  `ringing_in_ears` varchar(5) DEFAULT NULL,
  `bloody_nose` varchar(5) DEFAULT NULL,
  `sinusitis` varchar(5) DEFAULT NULL,
  `sinus_surgery` varchar(5) DEFAULT NULL,
  `dry_mouth` varchar(5) DEFAULT NULL,
  `strep_throat` varchar(5) DEFAULT NULL,
  `tonsillectomy` varchar(5) DEFAULT NULL,
  `swollen_lymph_nodes` varchar(5) DEFAULT NULL,
  `throat_cancer` varchar(5) DEFAULT NULL,
  `throat_cancer_surgery` varchar(5) DEFAULT NULL,
  `heart_attack` varchar(5) DEFAULT NULL,
  `irregular_heart_beat` varchar(5) DEFAULT NULL,
  `chest_pains` varchar(5) DEFAULT NULL,
  `shortness_of_breath` varchar(5) DEFAULT NULL,
  `high_blood_pressure` varchar(5) DEFAULT NULL,
  `heart_failure` varchar(5) DEFAULT NULL,
  `poor_circulation` varchar(5) DEFAULT NULL,
  `vascular_surgery` varchar(5) DEFAULT NULL,
  `cardiac_catheterization` varchar(5) DEFAULT NULL,
  `coronary_artery_bypass` varchar(5) DEFAULT NULL,
  `heart_transplant` varchar(5) DEFAULT NULL,
  `stress_test` varchar(5) DEFAULT NULL,
  `emphysema` varchar(5) DEFAULT NULL,
  `chronic_bronchitis` varchar(5) DEFAULT NULL,
  `interstitial_lung_disease` varchar(5) DEFAULT NULL,
  `shortness_of_breath_2` varchar(5) DEFAULT NULL,
  `lung_cancer` varchar(5) DEFAULT NULL,
  `lung_cancer_surgery` varchar(5) DEFAULT NULL,
  `pheumothorax` varchar(5) DEFAULT NULL,
  `stomach_pains` varchar(5) DEFAULT NULL,
  `peptic_ulcer_disease` varchar(5) DEFAULT NULL,
  `gastritis` varchar(5) DEFAULT NULL,
  `endoscopy` varchar(5) DEFAULT NULL,
  `polyps` varchar(5) DEFAULT NULL,
  `colonoscopy` varchar(5) DEFAULT NULL,
  `colon_cancer` varchar(5) DEFAULT NULL,
  `colon_cancer_surgery` varchar(5) DEFAULT NULL,
  `ulcerative_colitis` varchar(5) DEFAULT NULL,
  `crohns_disease` varchar(5) DEFAULT NULL,
  `appendectomy` varchar(5) DEFAULT NULL,
  `divirticulitis` varchar(5) DEFAULT NULL,
  `divirticulitis_surgery` varchar(5) DEFAULT NULL,
  `gall_stones` varchar(5) DEFAULT NULL,
  `cholecystectomy` varchar(5) DEFAULT NULL,
  `hepatitis` varchar(5) DEFAULT NULL,
  `cirrhosis_of_the_liver` varchar(5) DEFAULT NULL,
  `splenectomy` varchar(5) DEFAULT NULL,
  `kidney_failure` varchar(5) DEFAULT NULL,
  `kidney_stones` varchar(5) DEFAULT NULL,
  `kidney_cancer` varchar(5) DEFAULT NULL,
  `kidney_infections` varchar(5) DEFAULT NULL,
  `bladder_infections` varchar(5) DEFAULT NULL,
  `bladder_cancer` varchar(5) DEFAULT NULL,
  `prostate_problems` varchar(5) DEFAULT NULL,
  `prostate_cancer` varchar(5) DEFAULT NULL,
  `kidney_transplant` varchar(5) DEFAULT NULL,
  `sexually_transmitted_disease` varchar(5) DEFAULT NULL,
  `burning_with_urination` varchar(5) DEFAULT NULL,
  `discharge_from_urethra` varchar(5) DEFAULT NULL,
  `rashes` varchar(5) DEFAULT NULL,
  `infections` varchar(5) DEFAULT NULL,
  `ulcerations` varchar(5) DEFAULT NULL,
  `pemphigus` varchar(5) DEFAULT NULL,
  `herpes` varchar(5) DEFAULT NULL,
  `osetoarthritis` varchar(5) DEFAULT NULL,
  `rheumotoid_arthritis` varchar(5) DEFAULT NULL,
  `lupus` varchar(5) DEFAULT NULL,
  `ankylosing_sondlilitis` varchar(5) DEFAULT NULL,
  `swollen_joints` varchar(5) DEFAULT NULL,
  `stiff_joints` varchar(5) DEFAULT NULL,
  `broken_bones` varchar(5) DEFAULT NULL,
  `neck_problems` varchar(5) DEFAULT NULL,
  `back_problems` varchar(5) DEFAULT NULL,
  `back_surgery` varchar(5) DEFAULT NULL,
  `scoliosis` varchar(5) DEFAULT NULL,
  `herniated_disc` varchar(5) DEFAULT NULL,
  `shoulder_problems` varchar(5) DEFAULT NULL,
  `elbow_problems` varchar(5) DEFAULT NULL,
  `wrist_problems` varchar(5) DEFAULT NULL,
  `hand_problems` varchar(5) DEFAULT NULL,
  `hip_problems` varchar(5) DEFAULT NULL,
  `knee_problems` varchar(5) DEFAULT NULL,
  `ankle_problems` varchar(5) DEFAULT NULL,
  `foot_problems` varchar(5) DEFAULT NULL,
  `insulin_dependent_diabetes` varchar(5) DEFAULT NULL,
  `noninsulin_dependent_diabetes` varchar(5) DEFAULT NULL,
  `hypothyroidism` varchar(5) DEFAULT NULL,
  `hyperthyroidism` varchar(5) DEFAULT NULL,
  `cushing_syndrom` varchar(5) DEFAULT NULL,
  `addison_syndrom` varchar(5) DEFAULT NULL,
  `additional_notes` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_ros`;
CREATE TABLE `form_ros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NOT NULL,
  `activity` int(11) NOT NULL DEFAULT '1',
  `date` datetime DEFAULT NULL,
  `weight_change` varchar(3) DEFAULT NULL,
  `weakness` varchar(3) DEFAULT NULL,
  `fatigue` varchar(3) DEFAULT NULL,
  `anorexia` varchar(3) DEFAULT NULL,
  `fever` varchar(3) DEFAULT NULL,
  `chills` varchar(3) DEFAULT NULL,
  `night_sweats` varchar(3) DEFAULT NULL,
  `insomnia` varchar(3) DEFAULT NULL,
  `irritability` varchar(3) DEFAULT NULL,
  `heat_or_cold` varchar(3) DEFAULT NULL,
  `intolerance` varchar(3) DEFAULT NULL,
  `change_in_vision` varchar(3) DEFAULT NULL,
  `glaucoma_history` varchar(3) DEFAULT NULL,
  `eye_pain` varchar(3) DEFAULT NULL,
  `irritation` varchar(3) DEFAULT NULL,
  `redness` varchar(3) DEFAULT NULL,
  `excessive_tearing` varchar(3) DEFAULT NULL,
  `double_vision` varchar(3) DEFAULT NULL,
  `blind_spots` varchar(3) DEFAULT NULL,
  `photophobia` varchar(3) DEFAULT NULL,
  `hearing_loss` varchar(3) DEFAULT NULL,
  `discharge` varchar(3) DEFAULT NULL,
  `pain` varchar(3) DEFAULT NULL,
  `vertigo` varchar(3) DEFAULT NULL,
  `tinnitus` varchar(3) DEFAULT NULL,
  `frequent_colds` varchar(3) DEFAULT NULL,
  `sore_throat` varchar(3) DEFAULT NULL,
  `sinus_problems` varchar(3) DEFAULT NULL,
  `post_nasal_drip` varchar(3) DEFAULT NULL,
  `nosebleed` varchar(3) DEFAULT NULL,
  `snoring` varchar(3) DEFAULT NULL,
  `apnea` varchar(3) DEFAULT NULL,
  `breast_mass` varchar(3) DEFAULT NULL,
  `breast_discharge` varchar(3) DEFAULT NULL,
  `biopsy` varchar(3) DEFAULT NULL,
  `abnormal_mammogram` varchar(3) DEFAULT NULL,
  `cough` varchar(3) DEFAULT NULL,
  `sputum` varchar(3) DEFAULT NULL,
  `shortness_of_breath` varchar(3) DEFAULT NULL,
  `wheezing` varchar(3) DEFAULT NULL,
  `hemoptsyis` varchar(3) DEFAULT NULL,
  `asthma` varchar(3) DEFAULT NULL,
  `copd` varchar(3) DEFAULT NULL,
  `chest_pain` varchar(3) DEFAULT NULL,
  `palpitation` varchar(3) DEFAULT NULL,
  `syncope` varchar(3) DEFAULT NULL,
  `pnd` varchar(3) DEFAULT NULL,
  `doe` varchar(3) DEFAULT NULL,
  `orthopnea` varchar(3) DEFAULT NULL,
  `peripheal` varchar(3) DEFAULT NULL,
  `edema` varchar(3) DEFAULT NULL,
  `legpain_cramping` varchar(3) DEFAULT NULL,
  `history_murmur` varchar(3) DEFAULT NULL,
  `arrythmia` varchar(3) DEFAULT NULL,
  `heart_problem` varchar(3) DEFAULT NULL,
  `dysphagia` varchar(3) DEFAULT NULL,
  `heartburn` varchar(3) DEFAULT NULL,
  `bloating` varchar(3) DEFAULT NULL,
  `belching` varchar(3) DEFAULT NULL,
  `flatulence` varchar(3) DEFAULT NULL,
  `nausea` varchar(3) DEFAULT NULL,
  `vomiting` varchar(3) DEFAULT NULL,
  `hematemesis` varchar(3) DEFAULT NULL,
  `gastro_pain` varchar(3) DEFAULT NULL,
  `food_intolerance` varchar(3) DEFAULT NULL,
  `hepatitis` varchar(3) DEFAULT NULL,
  `jaundice` varchar(3) DEFAULT NULL,
  `hematochezia` varchar(3) DEFAULT NULL,
  `changed_bowel` varchar(3) DEFAULT NULL,
  `diarrhea` varchar(3) DEFAULT NULL,
  `constipation` varchar(3) DEFAULT NULL,
  `polyuria` varchar(3) DEFAULT NULL,
  `polydypsia` varchar(3) DEFAULT NULL,
  `dysuria` varchar(3) DEFAULT NULL,
  `hematuria` varchar(3) DEFAULT NULL,
  `frequency` varchar(3) DEFAULT NULL,
  `urgency` varchar(3) DEFAULT NULL,
  `incontinence` varchar(3) DEFAULT NULL,
  `renal_stones` varchar(3) DEFAULT NULL,
  `utis` varchar(3) DEFAULT NULL,
  `hesitancy` varchar(3) DEFAULT NULL,
  `dribbling` varchar(3) DEFAULT NULL,
  `stream` varchar(3) DEFAULT NULL,
  `nocturia` varchar(3) DEFAULT NULL,
  `erections` varchar(3) DEFAULT NULL,
  `ejaculations` varchar(3) DEFAULT NULL,
  `g` varchar(3) DEFAULT NULL,
  `p` varchar(3) DEFAULT NULL,
  `ap` varchar(3) DEFAULT NULL,
  `lc` varchar(3) DEFAULT NULL,
  `mearche` varchar(3) DEFAULT NULL,
  `menopause` varchar(3) DEFAULT NULL,
  `lmp` varchar(3) DEFAULT NULL,
  `f_frequency` varchar(3) DEFAULT NULL,
  `f_flow` varchar(3) DEFAULT NULL,
  `f_symptoms` varchar(3) DEFAULT NULL,
  `abnormal_hair_growth` varchar(3) DEFAULT NULL,
  `f_hirsutism` varchar(3) DEFAULT NULL,
  `joint_pain` varchar(3) DEFAULT NULL,
  `swelling` varchar(3) DEFAULT NULL,
  `m_redness` varchar(3) DEFAULT NULL,
  `m_warm` varchar(3) DEFAULT NULL,
  `m_stiffness` varchar(3) DEFAULT NULL,
  `muscle` varchar(3) DEFAULT NULL,
  `m_aches` varchar(3) DEFAULT NULL,
  `fms` varchar(3) DEFAULT NULL,
  `arthritis` varchar(3) DEFAULT NULL,
  `loc` varchar(3) DEFAULT NULL,
  `seizures` varchar(3) DEFAULT NULL,
  `stroke` varchar(3) DEFAULT NULL,
  `tia` varchar(3) DEFAULT NULL,
  `n_numbness` varchar(3) DEFAULT NULL,
  `n_weakness` varchar(3) DEFAULT NULL,
  `paralysis` varchar(3) DEFAULT NULL,
  `intellectual_decline` varchar(3) DEFAULT NULL,
  `memory_problems` varchar(3) DEFAULT NULL,
  `dementia` varchar(3) DEFAULT NULL,
  `n_headache` varchar(3) DEFAULT NULL,
  `s_cancer` varchar(3) DEFAULT NULL,
  `psoriasis` varchar(3) DEFAULT NULL,
  `s_acne` varchar(3) DEFAULT NULL,
  `s_other` varchar(3) DEFAULT NULL,
  `s_disease` varchar(3) DEFAULT NULL,
  `p_diagnosis` varchar(3) DEFAULT NULL,
  `p_medication` varchar(3) DEFAULT NULL,
  `depression` varchar(3) DEFAULT NULL,
  `anxiety` varchar(3) DEFAULT NULL,
  `social_difficulties` varchar(3) DEFAULT NULL,
  `thyroid_problems` varchar(3) DEFAULT NULL,
  `diabetes` varchar(3) DEFAULT NULL,
  `abnormal_blood` varchar(3) DEFAULT NULL,
  `anemia` varchar(3) DEFAULT NULL,
  `fh_blood_problems` varchar(3) DEFAULT NULL,
  `bleeding_problems` varchar(3) DEFAULT NULL,
  `allergies` varchar(3) DEFAULT NULL,
  `frequent_illness` varchar(3) DEFAULT NULL,
  `hiv` varchar(3) DEFAULT NULL,
  `hai_status` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_soap`;
CREATE TABLE `form_soap` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `pid` bigint(20) DEFAULT '0',
  `user` varchar(255) DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `authorized` tinyint(4) DEFAULT '0',
  `activity` tinyint(4) DEFAULT '0',
  `subjective` text,
  `objective` text,
  `assessment` text,
  `plan` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_taskman`;
CREATE TABLE `form_taskman` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `REQ_DATE` datetime NOT NULL,
  `FROM_ID` bigint(20) NOT NULL,
  `TO_ID` bigint(20) NOT NULL,
  `PATIENT_ID` bigint(20) NOT NULL,
  `DOC_TYPE` varchar(20) DEFAULT NULL,
  `DOC_ID` bigint(20) DEFAULT NULL,
  `ENC_ID` bigint(20) DEFAULT NULL,
  `METHOD` varchar(20) NOT NULL,
  `COMPLETED` varchar(1) DEFAULT NULL COMMENT '1 = completed',
  `COMPLETED_DATE` datetime DEFAULT NULL,
  `COMMENT` varchar(50) DEFAULT NULL,
  `USERFIELD_1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `form_vitals`;
CREATE TABLE `form_vitals` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `pid` varchar(255) NOT NULL DEFAULT '0',
  `user` varchar(255) DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `authorized` tinyint(4) DEFAULT '0',
  `activity` tinyint(4) DEFAULT '0',
  `bps` varchar(40) DEFAULT NULL,
  `bpd` varchar(40) DEFAULT NULL,
  `weight` float(5,2) DEFAULT '0.00',
  `height` float(5,2) DEFAULT '0.00',
  `temperature` float(5,2) DEFAULT '0.00',
  `temp_method` varchar(255) DEFAULT NULL,
  `pulse` float(5,2) DEFAULT '0.00',
  `respiration` float(5,2) DEFAULT '0.00',
  `note` varchar(255) DEFAULT NULL,
  `BMI` float(4,1) DEFAULT '0.0',
  `BMI_status` varchar(255) DEFAULT NULL,
  `waist_circ` float(5,2) DEFAULT '0.00',
  `head_circ` float(4,2) DEFAULT '0.00',
  `oxygen_saturation` float(5,2) DEFAULT '0.00',
  `external_id` varchar(20) DEFAULT NULL,
  `vital_uuid` varchar(255) DEFAULT '0',
  `spo2` varchar(255) DEFAULT NULL,
  `pain_index` varchar(255) DEFAULT NULL,
  `vital_date` date DEFAULT NULL,
  `tenant_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_acl`;
CREATE TABLE `gacl_acl` (
  `id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(150) NOT NULL DEFAULT 'system',
  `allow` int(11) NOT NULL DEFAULT '0',
  `enabled` int(11) NOT NULL DEFAULT '0',
  `return_value` text,
  `note` text,
  `updated_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `gacl_enabled_acl` (`enabled`),
  KEY `gacl_section_value_acl` (`section_value`),
  KEY `gacl_updated_date_acl` (`updated_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_acl_sections`;
CREATE TABLE `gacl_acl_sections` (
  `id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(150) NOT NULL,
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(230) NOT NULL,
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gacl_value_acl_sections` (`value`),
  KEY `gacl_hidden_acl_sections` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_acl_seq`;
CREATE TABLE `gacl_acl_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_aco`;
CREATE TABLE `gacl_aco` (
  `id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(150) NOT NULL DEFAULT '0',
  `value` varchar(150) NOT NULL,
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gacl_section_value_value_aco` (`section_value`,`value`),
  KEY `gacl_hidden_aco` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_aco_map`;
CREATE TABLE `gacl_aco_map` (
  `acl_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(150) NOT NULL DEFAULT '0',
  `value` varchar(150) NOT NULL,
  PRIMARY KEY (`acl_id`,`section_value`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_aco_sections`;
CREATE TABLE `gacl_aco_sections` (
  `id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(150) NOT NULL,
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(230) NOT NULL,
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gacl_value_aco_sections` (`value`),
  KEY `gacl_hidden_aco_sections` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_aco_sections_seq`;
CREATE TABLE `gacl_aco_sections_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_aco_seq`;
CREATE TABLE `gacl_aco_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_aro`;
CREATE TABLE `gacl_aro` (
  `id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(150) NOT NULL DEFAULT '0',
  `value` varchar(150) NOT NULL,
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gacl_section_value_value_aro` (`section_value`,`value`),
  KEY `gacl_hidden_aro` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_aro_groups`;
CREATE TABLE `gacl_aro_groups` (
  `id` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` varchar(150) NOT NULL,
  PRIMARY KEY (`id`,`value`),
  UNIQUE KEY `gacl_value_aro_groups` (`value`),
  KEY `gacl_parent_id_aro_groups` (`parent_id`),
  KEY `gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_aro_groups_id_seq`;
CREATE TABLE `gacl_aro_groups_id_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_aro_groups_map`;
CREATE TABLE `gacl_aro_groups_map` (
  `acl_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`acl_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_aro_map`;
CREATE TABLE `gacl_aro_map` (
  `acl_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(150) NOT NULL DEFAULT '0',
  `value` varchar(150) NOT NULL,
  PRIMARY KEY (`acl_id`,`section_value`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_aro_sections`;
CREATE TABLE `gacl_aro_sections` (
  `id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(150) NOT NULL,
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(230) NOT NULL,
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gacl_value_aro_sections` (`value`),
  KEY `gacl_hidden_aro_sections` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_aro_sections_seq`;
CREATE TABLE `gacl_aro_sections_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_aro_seq`;
CREATE TABLE `gacl_aro_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_axo`;
CREATE TABLE `gacl_axo` (
  `id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(150) NOT NULL DEFAULT '0',
  `value` varchar(150) NOT NULL,
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gacl_section_value_value_axo` (`section_value`,`value`),
  KEY `gacl_hidden_axo` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_axo_groups`;
CREATE TABLE `gacl_axo_groups` (
  `id` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` varchar(150) NOT NULL,
  PRIMARY KEY (`id`,`value`),
  UNIQUE KEY `gacl_value_axo_groups` (`value`),
  KEY `gacl_parent_id_axo_groups` (`parent_id`),
  KEY `gacl_lft_rgt_axo_groups` (`lft`,`rgt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_axo_groups_map`;
CREATE TABLE `gacl_axo_groups_map` (
  `acl_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`acl_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_axo_map`;
CREATE TABLE `gacl_axo_map` (
  `acl_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(150) NOT NULL DEFAULT '0',
  `value` varchar(150) NOT NULL,
  PRIMARY KEY (`acl_id`,`section_value`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_axo_sections`;
CREATE TABLE `gacl_axo_sections` (
  `id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(150) NOT NULL,
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(230) NOT NULL,
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gacl_value_axo_sections` (`value`),
  KEY `gacl_hidden_axo_sections` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_groups_aro_map`;
CREATE TABLE `gacl_groups_aro_map` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `aro_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`,`aro_id`),
  KEY `gacl_aro_id` (`aro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_groups_axo_map`;
CREATE TABLE `gacl_groups_axo_map` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `axo_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`,`axo_id`),
  KEY `gacl_axo_id` (`axo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gacl_phpgacl`;
CREATE TABLE `gacl_phpgacl` (
  `name` varchar(230) NOT NULL,
  `value` varchar(150) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `globals`;
CREATE TABLE `globals` (
  `gl_name` varchar(63) NOT NULL,
  `gl_index` int(11) NOT NULL DEFAULT '0',
  `gl_value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`gl_name`,`gl_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gprelations`;
CREATE TABLE `gprelations` (
  `type1` int(11) NOT NULL,
  `id1` bigint(20) NOT NULL,
  `type2` int(11) NOT NULL,
  `id2` bigint(20) NOT NULL,
  PRIMARY KEY (`type1`,`id1`,`type2`,`id2`),
  KEY `key2` (`type2`,`id2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='general purpose relations';


DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` longtext,
  `user` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `history_data`;
CREATE TABLE `history_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coffee` longtext,
  `tobacco` longtext,
  `alcohol` longtext,
  `sleep_patterns` longtext,
  `exercise_patterns` longtext,
  `seatbelt_use` longtext,
  `counseling` longtext,
  `hazardous_activities` longtext,
  `recreational_drugs` longtext,
  `last_breast_exam` varchar(255) DEFAULT NULL,
  `last_mammogram` varchar(255) DEFAULT NULL,
  `last_gynocological_exam` varchar(255) DEFAULT NULL,
  `last_rectal_exam` varchar(255) DEFAULT NULL,
  `last_prostate_exam` varchar(255) DEFAULT NULL,
  `last_physical_exam` varchar(255) DEFAULT NULL,
  `last_sigmoidoscopy_colonoscopy` varchar(255) DEFAULT NULL,
  `last_ecg` varchar(255) DEFAULT NULL,
  `last_cardiac_echo` varchar(255) DEFAULT NULL,
  `last_retinal` varchar(255) DEFAULT NULL,
  `last_fluvax` varchar(255) DEFAULT NULL,
  `last_pneuvax` varchar(255) DEFAULT NULL,
  `last_ldl` varchar(255) DEFAULT NULL,
  `last_hemoglobin` varchar(255) DEFAULT NULL,
  `last_psa` varchar(255) DEFAULT NULL,
  `last_exam_results` varchar(255) DEFAULT NULL,
  `history_mother` longtext,
  `dc_mother` text,
  `history_father` longtext,
  `dc_father` text,
  `history_siblings` longtext,
  `dc_siblings` text,
  `history_offspring` longtext,
  `dc_offspring` text,
  `history_spouse` longtext,
  `dc_spouse` text,
  `relatives_cancer` longtext,
  `relatives_tuberculosis` longtext,
  `relatives_diabetes` longtext,
  `relatives_high_blood_pressure` longtext,
  `relatives_heart_problems` longtext,
  `relatives_stroke` longtext,
  `relatives_epilepsy` longtext,
  `relatives_mental_illness` longtext,
  `relatives_suicide` longtext,
  `cataract_surgery` datetime DEFAULT NULL,
  `tonsillectomy` datetime DEFAULT NULL,
  `cholecystestomy` datetime DEFAULT NULL,
  `heart_surgery` datetime DEFAULT NULL,
  `hysterectomy` datetime DEFAULT NULL,
  `hernia_repair` datetime DEFAULT NULL,
  `hip_replacement` datetime DEFAULT NULL,
  `knee_replacement` datetime DEFAULT NULL,
  `appendectomy` datetime DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `pid` bigint(20) NOT NULL DEFAULT '0',
  `name_1` varchar(255) DEFAULT NULL,
  `value_1` varchar(255) DEFAULT NULL,
  `name_2` varchar(255) DEFAULT NULL,
  `value_2` varchar(255) DEFAULT NULL,
  `additional_history` text,
  `exams` text,
  `usertext11` text,
  `usertext12` varchar(255) NOT NULL DEFAULT '',
  `usertext13` varchar(255) NOT NULL DEFAULT '',
  `usertext14` varchar(255) NOT NULL DEFAULT '',
  `usertext15` varchar(255) NOT NULL DEFAULT '',
  `usertext16` varchar(255) NOT NULL DEFAULT '',
  `usertext17` varchar(255) NOT NULL DEFAULT '',
  `usertext18` varchar(255) NOT NULL DEFAULT '',
  `usertext19` varchar(255) NOT NULL DEFAULT '',
  `usertext20` varchar(255) NOT NULL DEFAULT '',
  `usertext21` varchar(255) NOT NULL DEFAULT '',
  `usertext22` varchar(255) NOT NULL DEFAULT '',
  `usertext23` varchar(255) NOT NULL DEFAULT '',
  `usertext24` varchar(255) NOT NULL DEFAULT '',
  `usertext25` varchar(255) NOT NULL DEFAULT '',
  `usertext26` varchar(255) NOT NULL DEFAULT '',
  `usertext27` varchar(255) NOT NULL DEFAULT '',
  `usertext28` varchar(255) NOT NULL DEFAULT '',
  `usertext29` varchar(255) NOT NULL DEFAULT '',
  `usertext30` varchar(255) NOT NULL DEFAULT '',
  `userdate11` date DEFAULT NULL,
  `userdate12` date DEFAULT NULL,
  `userdate13` date DEFAULT NULL,
  `userdate14` date DEFAULT NULL,
  `userdate15` date DEFAULT NULL,
  `userarea11` text,
  `userarea12` text,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `icd10_dx_order_code`;
CREATE TABLE `icd10_dx_order_code` (
  `dx_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `dx_code` varchar(7) DEFAULT NULL,
  `formatted_dx_code` varchar(10) DEFAULT NULL,
  `valid_for_coding` char(1) DEFAULT NULL,
  `short_desc` varchar(60) DEFAULT NULL,
  `long_desc` varchar(300) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '0',
  `revision` int(11) DEFAULT '0',
  UNIQUE KEY `dx_id` (`dx_id`),
  KEY `formatted_dx_code` (`formatted_dx_code`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `icd10_gem_dx_10_9`;
CREATE TABLE `icd10_gem_dx_10_9` (
  `map_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `dx_icd10_source` varchar(7) DEFAULT NULL,
  `dx_icd9_target` varchar(5) DEFAULT NULL,
  `flags` varchar(5) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '0',
  `revision` int(11) DEFAULT '0',
  UNIQUE KEY `map_id` (`map_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `icd10_gem_dx_9_10`;
CREATE TABLE `icd10_gem_dx_9_10` (
  `map_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `dx_icd9_source` varchar(5) DEFAULT NULL,
  `dx_icd10_target` varchar(7) DEFAULT NULL,
  `flags` varchar(5) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '0',
  `revision` int(11) DEFAULT '0',
  UNIQUE KEY `map_id` (`map_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `icd10_gem_pcs_10_9`;
CREATE TABLE `icd10_gem_pcs_10_9` (
  `map_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pcs_icd10_source` varchar(7) DEFAULT NULL,
  `pcs_icd9_target` varchar(5) DEFAULT NULL,
  `flags` varchar(5) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '0',
  `revision` int(11) DEFAULT '0',
  UNIQUE KEY `map_id` (`map_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `icd10_gem_pcs_9_10`;
CREATE TABLE `icd10_gem_pcs_9_10` (
  `map_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pcs_icd9_source` varchar(5) DEFAULT NULL,
  `pcs_icd10_target` varchar(7) DEFAULT NULL,
  `flags` varchar(5) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '0',
  `revision` int(11) DEFAULT '0',
  UNIQUE KEY `map_id` (`map_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `icd10_pcs_order_code`;
CREATE TABLE `icd10_pcs_order_code` (
  `pcs_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pcs_code` varchar(7) DEFAULT NULL,
  `valid_for_coding` char(1) DEFAULT NULL,
  `short_desc` varchar(60) DEFAULT NULL,
  `long_desc` varchar(300) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '0',
  `revision` int(11) DEFAULT '0',
  UNIQUE KEY `pcs_id` (`pcs_id`),
  KEY `pcs_code` (`pcs_code`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `icd10_reimbr_dx_9_10`;
CREATE TABLE `icd10_reimbr_dx_9_10` (
  `map_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(8) DEFAULT NULL,
  `code_cnt` tinyint(4) DEFAULT NULL,
  `ICD9_01` varchar(5) DEFAULT NULL,
  `ICD9_02` varchar(5) DEFAULT NULL,
  `ICD9_03` varchar(5) DEFAULT NULL,
  `ICD9_04` varchar(5) DEFAULT NULL,
  `ICD9_05` varchar(5) DEFAULT NULL,
  `ICD9_06` varchar(5) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '0',
  `revision` int(11) DEFAULT '0',
  UNIQUE KEY `map_id` (`map_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `icd10_reimbr_pcs_9_10`;
CREATE TABLE `icd10_reimbr_pcs_9_10` (
  `map_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(8) DEFAULT NULL,
  `code_cnt` tinyint(4) DEFAULT NULL,
  `ICD9_01` varchar(5) DEFAULT NULL,
  `ICD9_02` varchar(5) DEFAULT NULL,
  `ICD9_03` varchar(5) DEFAULT NULL,
  `ICD9_04` varchar(5) DEFAULT NULL,
  `ICD9_05` varchar(5) DEFAULT NULL,
  `ICD9_06` varchar(5) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '0',
  `revision` int(11) DEFAULT '0',
  UNIQUE KEY `map_id` (`map_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `icd9_dx_code`;
CREATE TABLE `icd9_dx_code` (
  `dx_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `dx_code` varchar(5) DEFAULT NULL,
  `formatted_dx_code` varchar(6) DEFAULT NULL,
  `short_desc` varchar(60) DEFAULT NULL,
  `long_desc` varchar(300) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '0',
  `revision` int(11) DEFAULT '0',
  UNIQUE KEY `dx_id` (`dx_id`),
  KEY `dx_code` (`dx_code`),
  KEY `formatted_dx_code` (`formatted_dx_code`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `icd9_dx_long_code`;
CREATE TABLE `icd9_dx_long_code` (
  `dx_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `dx_code` varchar(5) DEFAULT NULL,
  `long_desc` varchar(300) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '0',
  `revision` int(11) DEFAULT '0',
  UNIQUE KEY `dx_id` (`dx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `icd9_sg_code`;
CREATE TABLE `icd9_sg_code` (
  `sg_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sg_code` varchar(5) DEFAULT NULL,
  `formatted_sg_code` varchar(6) DEFAULT NULL,
  `short_desc` varchar(60) DEFAULT NULL,
  `long_desc` varchar(300) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '0',
  `revision` int(11) DEFAULT '0',
  UNIQUE KEY `sg_id` (`sg_id`),
  KEY `sg_code` (`sg_code`),
  KEY `formatted_sg_code` (`formatted_sg_code`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `icd9_sg_long_code`;
CREATE TABLE `icd9_sg_long_code` (
  `sq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sg_code` varchar(5) DEFAULT NULL,
  `long_desc` varchar(300) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '0',
  `revision` int(11) DEFAULT '0',
  UNIQUE KEY `sq_id` (`sq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `data` text,
  `image_uuid` varchar(255) DEFAULT NULL,
  `template_uuid` varchar(255) DEFAULT NULL,
  `template_type` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `tags` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `immunizations`;
CREATE TABLE `immunizations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `patient_id` bigint(20) DEFAULT NULL,
  `administered_date` datetime DEFAULT NULL,
  `immunization_id` int(11) DEFAULT NULL,
  `cvx_code` varchar(10) DEFAULT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `lot_number` varchar(50) DEFAULT NULL,
  `administered_by_id` bigint(20) DEFAULT NULL,
  `administered_by` varchar(255) DEFAULT NULL COMMENT 'Alternative to administered_by_id',
  `education_date` date DEFAULT NULL,
  `vis_date` date DEFAULT NULL COMMENT 'Date of VIS Statement',
  `note` text,
  `create_date` datetime DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `amount_administered` float DEFAULT NULL,
  `amount_administered_unit` varchar(50) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `route` varchar(100) DEFAULT NULL,
  `administration_site` varchar(100) DEFAULT NULL,
  `added_erroneously` tinyint(1) NOT NULL DEFAULT '0',
  `external_id` varchar(20) DEFAULT NULL,
  `completion_status` varchar(50) DEFAULT NULL,
  `information_source` varchar(31) DEFAULT NULL,
  `refusal_reason` varchar(31) DEFAULT NULL,
  `ordering_provider` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `immunization_observation`;
CREATE TABLE `immunization_observation` (
  `imo_id` int(11) NOT NULL AUTO_INCREMENT,
  `imo_im_id` int(11) NOT NULL,
  `imo_pid` int(11) DEFAULT NULL,
  `imo_criteria` varchar(255) DEFAULT NULL,
  `imo_criteria_value` varchar(255) DEFAULT NULL,
  `imo_user` int(11) DEFAULT NULL,
  `imo_code` varchar(255) DEFAULT NULL,
  `imo_codetext` varchar(255) DEFAULT NULL,
  `imo_codetype` varchar(255) DEFAULT NULL,
  `imo_vis_date_published` date DEFAULT NULL,
  `imo_vis_date_presented` date DEFAULT NULL,
  `imo_date_observation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`imo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `insurance_companies`;
CREATE TABLE `insurance_companies` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `attn` varchar(255) DEFAULT NULL,
  `cms_id` varchar(15) DEFAULT NULL,
  `ins_type_code` tinyint(4) DEFAULT NULL,
  `x12_receiver_id` varchar(25) DEFAULT NULL,
  `x12_default_partner_id` int(11) DEFAULT NULL,
  `alt_cms_id` varchar(15) NOT NULL DEFAULT '',
  `inactive` int(11) NOT NULL DEFAULT '0',
  `eligibility_id` varchar(32) DEFAULT NULL,
  `x12_default_eligibility_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `insurance_data`;
CREATE TABLE `insurance_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` enum('primary','secondary','tertiary') DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `plan_name` varchar(255) DEFAULT NULL,
  `policy_number` varchar(255) DEFAULT NULL,
  `group_number` varchar(255) DEFAULT NULL,
  `subscriber_lname` varchar(255) DEFAULT NULL,
  `subscriber_mname` varchar(255) DEFAULT NULL,
  `subscriber_fname` varchar(255) DEFAULT NULL,
  `subscriber_relationship` varchar(255) DEFAULT NULL,
  `subscriber_ss` varchar(255) DEFAULT NULL,
  `subscriber_DOB` date DEFAULT NULL,
  `subscriber_street` varchar(255) DEFAULT NULL,
  `subscriber_postal_code` varchar(255) DEFAULT NULL,
  `subscriber_city` varchar(255) DEFAULT NULL,
  `subscriber_state` varchar(255) DEFAULT NULL,
  `subscriber_country` varchar(255) DEFAULT NULL,
  `subscriber_phone` varchar(255) DEFAULT NULL,
  `subscriber_employer` varchar(255) DEFAULT NULL,
  `subscriber_employer_street` varchar(255) DEFAULT NULL,
  `subscriber_employer_postal_code` varchar(255) DEFAULT NULL,
  `subscriber_employer_state` varchar(255) DEFAULT NULL,
  `subscriber_employer_country` varchar(255) DEFAULT NULL,
  `subscriber_employer_city` varchar(255) DEFAULT NULL,
  `copay` varchar(255) DEFAULT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `pid` bigint(20) NOT NULL DEFAULT '0',
  `subscriber_sex` varchar(25) DEFAULT NULL,
  `accept_assignment` varchar(5) NOT NULL DEFAULT 'TRUE',
  `policy_type` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pid_type_date` (`pid`,`type`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `insurance_numbers`;
CREATE TABLE `insurance_numbers` (
  `id` int(11) NOT NULL DEFAULT '0',
  `provider_id` int(11) NOT NULL DEFAULT '0',
  `insurance_company_id` int(11) DEFAULT NULL,
  `provider_number` varchar(20) DEFAULT NULL,
  `rendering_provider_number` varchar(20) DEFAULT NULL,
  `group_number` varchar(20) DEFAULT NULL,
  `provider_number_type` varchar(4) DEFAULT NULL,
  `rendering_provider_number_type` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `issue_encounter`;
CREATE TABLE `issue_encounter` (
  `pid` bigint(20) NOT NULL,
  `list_id` int(11) NOT NULL,
  `encounter` int(11) NOT NULL,
  `resolved` tinyint(1) NOT NULL,
  PRIMARY KEY (`pid`,`list_id`,`encounter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `issue_types`;
CREATE TABLE `issue_types` (
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `category` varchar(75) NOT NULL DEFAULT '',
  `type` varchar(75) NOT NULL DEFAULT '',
  `plural` varchar(75) NOT NULL DEFAULT '',
  `singular` varchar(75) NOT NULL DEFAULT '',
  `abbreviation` varchar(75) NOT NULL DEFAULT '',
  `style` smallint(6) NOT NULL DEFAULT '0',
  `force_show` smallint(6) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `aco_spec` varchar(63) NOT NULL DEFAULT 'patients|med',
  PRIMARY KEY (`category`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keys`;
CREATE TABLE `keys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `lang_constants`;
CREATE TABLE `lang_constants` (
  `cons_id` int(11) NOT NULL AUTO_INCREMENT,
  `constant_name` mediumtext CHARACTER SET utf8 COLLATE utf8_bin,
  UNIQUE KEY `cons_id` (`cons_id`),
  KEY `constant_name` (`constant_name`(100))
) ENGINE=InnoDB AUTO_INCREMENT=11756 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `lang_custom`;
CREATE TABLE `lang_custom` (
  `lang_description` varchar(100) NOT NULL DEFAULT '',
  `lang_code` char(2) NOT NULL DEFAULT '',
  `constant_name` mediumtext,
  `definition` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `lang_definitions`;
CREATE TABLE `lang_definitions` (
  `def_id` int(11) NOT NULL AUTO_INCREMENT,
  `cons_id` int(11) NOT NULL DEFAULT '0',
  `lang_id` int(11) NOT NULL DEFAULT '0',
  `definition` mediumtext,
  UNIQUE KEY `def_id` (`def_id`),
  KEY `cons_id` (`cons_id`)
) ENGINE=InnoDB AUTO_INCREMENT=186363 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `lang_languages`;
CREATE TABLE `lang_languages` (
  `lang_id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_code` char(2) NOT NULL DEFAULT '',
  `lang_description` varchar(100) DEFAULT NULL,
  `lang_is_rtl` tinyint(4) DEFAULT '0',
  UNIQUE KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `layout_group_properties`;
CREATE TABLE `layout_group_properties` (
  `grp_form_id` varchar(31) NOT NULL,
  `grp_group_id` varchar(31) NOT NULL DEFAULT '' COMMENT 'empty when representing the whole form',
  `grp_title` varchar(63) NOT NULL DEFAULT '' COMMENT 'descriptive name of the form or group',
  `grp_subtitle` varchar(63) NOT NULL DEFAULT '' COMMENT 'for display under the title',
  `grp_mapping` varchar(31) NOT NULL DEFAULT '' COMMENT 'the form category',
  `grp_seq` int(11) NOT NULL DEFAULT '0' COMMENT 'optional order within mapping',
  `grp_activity` tinyint(1) NOT NULL DEFAULT '1',
  `grp_repeats` int(11) NOT NULL DEFAULT '0',
  `grp_columns` int(11) NOT NULL DEFAULT '0',
  `grp_size` int(11) NOT NULL DEFAULT '0',
  `grp_issue_type` varchar(75) NOT NULL DEFAULT '',
  `grp_aco_spec` varchar(63) NOT NULL DEFAULT '',
  `grp_services` varchar(4095) NOT NULL DEFAULT '',
  `grp_products` varchar(4095) NOT NULL DEFAULT '',
  `grp_diags` varchar(4095) NOT NULL DEFAULT '',
  PRIMARY KEY (`grp_form_id`,`grp_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `layout_options`;
CREATE TABLE `layout_options` (
  `form_id` varchar(31) NOT NULL DEFAULT '',
  `field_id` varchar(31) NOT NULL DEFAULT '',
  `group_id` varchar(31) NOT NULL DEFAULT '',
  `title` varchar(63) NOT NULL DEFAULT '',
  `seq` int(11) NOT NULL DEFAULT '0',
  `data_type` tinyint(4) NOT NULL DEFAULT '0',
  `uor` tinyint(1) NOT NULL DEFAULT '1',
  `fld_length` int(11) NOT NULL DEFAULT '15',
  `max_length` int(11) NOT NULL DEFAULT '0',
  `list_id` varchar(100) NOT NULL DEFAULT '',
  `titlecols` tinyint(4) NOT NULL DEFAULT '1',
  `datacols` tinyint(4) NOT NULL DEFAULT '1',
  `default_value` varchar(255) NOT NULL DEFAULT '',
  `edit_options` varchar(36) NOT NULL DEFAULT '',
  `description` text,
  `fld_rows` int(11) NOT NULL DEFAULT '0',
  `list_backup_id` varchar(100) NOT NULL DEFAULT '',
  `source` char(1) NOT NULL DEFAULT 'F' COMMENT 'F=Form, D=Demographics, H=History, E=Encounter',
  `conditions` text COMMENT 'serialized array of skip conditions',
  `validation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`form_id`,`field_id`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `lbf_data`;
CREATE TABLE `lbf_data` (
  `form_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'references forms.form_id',
  `field_id` varchar(31) NOT NULL COMMENT 'references layout_options.field_id',
  `field_value` longtext,
  PRIMARY KEY (`form_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='contains all data from layout-based forms';


DROP TABLE IF EXISTS `lbt_data`;
CREATE TABLE `lbt_data` (
  `form_id` bigint(20) NOT NULL COMMENT 'references transactions.id',
  `field_id` varchar(31) NOT NULL COMMENT 'references layout_options.field_id',
  `field_value` text,
  PRIMARY KEY (`form_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='contains all data from layout-based transactions';


DROP TABLE IF EXISTS `lists`;
CREATE TABLE `lists` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `subtype` varchar(31) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `begdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `returndate` date DEFAULT NULL,
  `occurrence` int(11) DEFAULT '0',
  `classification` int(11) DEFAULT '0',
  `referredby` varchar(255) DEFAULT NULL,
  `extrainfo` varchar(255) DEFAULT NULL,
  `diagnosis` varchar(255) DEFAULT NULL,
  `activity` tinyint(4) DEFAULT NULL,
  `comments` longtext,
  `pid` bigint(20) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `outcome` int(11) NOT NULL DEFAULT '0',
  `destination` varchar(255) DEFAULT NULL,
  `reinjury_id` bigint(20) NOT NULL DEFAULT '0',
  `injury_part` varchar(31) NOT NULL DEFAULT '',
  `injury_type` varchar(31) NOT NULL DEFAULT '',
  `injury_grade` varchar(31) NOT NULL DEFAULT '',
  `reaction` varchar(255) NOT NULL DEFAULT '',
  `external_allergyid` int(11) DEFAULT NULL,
  `erx_source` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0-OpenEMR 1-External',
  `erx_uploaded` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0-Pending NewCrop upload 1-Uploaded TO NewCrop',
  `modifydate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `severity_al` varchar(50) DEFAULT NULL,
  `external_id` varchar(20) DEFAULT NULL,
  `list_option_id` varchar(100) DEFAULT NULL COMMENT 'Reference to list_options table',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `lists_touch`;
CREATE TABLE `lists_touch` (
  `pid` bigint(20) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`pid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `list_options`;
CREATE TABLE `list_options` (
  `list_id` varchar(100) NOT NULL DEFAULT '',
  `option_id` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `seq` int(11) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `option_value` float NOT NULL DEFAULT '0',
  `mapping` varchar(31) NOT NULL DEFAULT '',
  `notes` text,
  `codes` varchar(255) NOT NULL DEFAULT '',
  `toggle_setting_1` tinyint(1) NOT NULL DEFAULT '0',
  `toggle_setting_2` tinyint(1) NOT NULL DEFAULT '0',
  `activity` tinyint(4) NOT NULL DEFAULT '1',
  `subtype` varchar(31) NOT NULL DEFAULT '',
  `edit_options` tinyint(1) NOT NULL DEFAULT '1',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`list_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location_uuid` varchar(255) NOT NULL,
  `tenant_uuid` varchar(255) NOT NULL,
  `archive` smallint(6) NOT NULL,
  `active` smallint(6) NOT NULL,
  `date` datetime NOT NULL,
  `building` varchar(100) NOT NULL,
  `floor` varchar(100) DEFAULT NULL,
  `ward` varchar(100) DEFAULT NULL,
  `bed_count` varchar(100) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `facility_uuid` varchar(250) DEFAULT NULL,
  `ward_tag` mediumtext,
  `building_tag` mediumtext,
  `floor_tag` mediumtext,
  `ward_description` longtext,
  `floor_description` longtext,
  `building_description` longtext,
  `current_date` datetime DEFAULT NULL,
  `bed_uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=419 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `comments` longtext,
  `user_notes` longtext,
  `patient_id` bigint(20) DEFAULT NULL,
  `success` tinyint(1) DEFAULT '1',
  `checksum` longtext,
  `crt_user` varchar(255) DEFAULT NULL,
  `log_from` varchar(20) DEFAULT 'open-emr',
  `menu_item_id` int(11) DEFAULT NULL,
  `ccda_doc_id` int(11) DEFAULT NULL COMMENT 'CCDA document id from ccda',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `login_mfa_registrations`;
CREATE TABLE `login_mfa_registrations` (
  `user_id` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `last_challenge` datetime DEFAULT NULL,
  `method` varchar(31) NOT NULL COMMENT 'Q&A, U2F, TOTP etc.',
  `var1` varchar(4096) NOT NULL DEFAULT '' COMMENT 'Question, U2F registration etc.',
  `var2` varchar(256) NOT NULL DEFAULT '' COMMENT 'Answer etc.',
  PRIMARY KEY (`user_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `log_comment_encrypt`;
CREATE TABLE `log_comment_encrypt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_id` int(11) NOT NULL,
  `encrypt` enum('Yes','No') NOT NULL DEFAULT 'No',
  `checksum` longtext,
  `version` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 for mycrypt and 1 for openssl',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `log_validator`;
CREATE TABLE `log_validator` (
  `log_id` bigint(20) NOT NULL,
  `log_checksum` longtext,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `medex_icons`;
CREATE TABLE `medex_icons` (
  `i_UID` int(11) NOT NULL AUTO_INCREMENT,
  `msg_type` varchar(50) NOT NULL,
  `msg_status` varchar(10) NOT NULL,
  `i_description` varchar(255) DEFAULT NULL,
  `i_html` text,
  `i_blob` longtext,
  PRIMARY KEY (`i_UID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `medex_outgoing`;
CREATE TABLE `medex_outgoing` (
  `msg_uid` int(11) NOT NULL AUTO_INCREMENT,
  `msg_pid` int(11) NOT NULL,
  `msg_pc_eid` varchar(11) NOT NULL,
  `campaign_uid` int(11) NOT NULL DEFAULT '0',
  `msg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `msg_type` varchar(50) NOT NULL,
  `msg_reply` varchar(50) DEFAULT NULL,
  `msg_extra_text` text,
  `medex_uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`msg_uid`),
  UNIQUE KEY `msg_eid` (`msg_uid`,`msg_pc_eid`,`medex_uid`),
  KEY `i_msg_date` (`msg_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `medex_prefs`;
CREATE TABLE `medex_prefs` (
  `MedEx_id` int(11) DEFAULT '0',
  `ME_username` varchar(100) DEFAULT NULL,
  `ME_api_key` text,
  `ME_facilities` varchar(50) DEFAULT NULL,
  `ME_providers` varchar(100) DEFAULT NULL,
  `ME_hipaa_default_override` varchar(3) DEFAULT NULL,
  `PHONE_country_code` int(11) NOT NULL DEFAULT '1',
  `MSGS_default_yes` varchar(3) DEFAULT NULL,
  `POSTCARDS_local` varchar(3) DEFAULT NULL,
  `POSTCARDS_remote` varchar(3) DEFAULT NULL,
  `LABELS_local` varchar(3) DEFAULT NULL,
  `LABELS_choice` varchar(50) DEFAULT NULL,
  `combine_time` tinyint(4) DEFAULT NULL,
  `postcard_top` varchar(255) DEFAULT NULL,
  `status` text,
  `MedEx_lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `ME_username` (`ME_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `medex_recalls`;
CREATE TABLE `medex_recalls` (
  `r_ID` int(11) NOT NULL AUTO_INCREMENT,
  `r_PRACTID` int(11) NOT NULL,
  `r_pid` int(11) NOT NULL COMMENT 'PatientID from pat_data',
  `r_eventDate` date NOT NULL COMMENT 'Date of Appt or Recall',
  `r_facility` int(11) NOT NULL,
  `r_provider` int(11) NOT NULL,
  `r_reason` varchar(255) DEFAULT NULL,
  `r_created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`r_ID`),
  UNIQUE KEY `r_PRACTID` (`r_PRACTID`,`r_pid`),
  KEY `i_eventDate` (`r_eventDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `medical_history`;
CREATE TABLE `medical_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_of_treatment` date DEFAULT NULL,
  `treatment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `hospital_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `doctor_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `tenant_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pid` varchar(255) CHARACTER SET utf8 NOT NULL,
  `medical_history_uuid` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `medscheds`;
CREATE TABLE `medscheds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prescription_id` int(11) NOT NULL,
  `endedAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=567 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `misc_address_book`;
CREATE TABLE `misc_address_book` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) DEFAULT NULL,
  `mname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `street` varchar(60) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `mod_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_name` varchar(64) NOT NULL DEFAULT '0',
  `mod_directory` varchar(64) NOT NULL DEFAULT '',
  `mod_parent` varchar(64) NOT NULL DEFAULT '',
  `mod_type` varchar(64) NOT NULL DEFAULT '',
  `mod_active` int(10) unsigned NOT NULL DEFAULT '0',
  `mod_ui_name` varchar(20) NOT NULL DEFAULT '''',
  `mod_relative_link` varchar(64) NOT NULL DEFAULT '',
  `mod_ui_order` tinyint(4) NOT NULL DEFAULT '0',
  `mod_ui_active` int(10) unsigned NOT NULL DEFAULT '0',
  `mod_description` varchar(255) NOT NULL DEFAULT '',
  `mod_nick_name` varchar(25) NOT NULL DEFAULT '',
  `mod_enc_menu` varchar(10) NOT NULL DEFAULT 'no',
  `permissions_item_table` char(100) DEFAULT NULL,
  `directory` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `sql_run` tinyint(4) DEFAULT '0',
  `type` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`mod_id`,`mod_directory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `modules_hooks_settings`;
CREATE TABLE `modules_hooks_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_id` int(11) DEFAULT NULL,
  `enabled_hooks` varchar(255) DEFAULT NULL,
  `attached_to` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `modules_settings`;
CREATE TABLE `modules_settings` (
  `mod_id` int(11) DEFAULT NULL,
  `fld_type` smallint(6) DEFAULT NULL COMMENT '1=>ACL,2=>preferences,3=>hooks',
  `obj_name` varchar(255) DEFAULT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `module_acl_group_settings`;
CREATE TABLE `module_acl_group_settings` (
  `module_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `allowed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`module_id`,`group_id`,`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `module_acl_sections`;
CREATE TABLE `module_acl_sections` (
  `section_id` int(11) DEFAULT NULL,
  `section_name` varchar(255) DEFAULT NULL,
  `parent_section` int(11) DEFAULT NULL,
  `section_identifier` varchar(50) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `module_acl_user_settings`;
CREATE TABLE `module_acl_user_settings` (
  `module_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `allowed` int(11) DEFAULT NULL,
  PRIMARY KEY (`module_id`,`user_id`,`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `module_configuration`;
CREATE TABLE `module_configuration` (
  `module_config_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(10) unsigned NOT NULL,
  `field_name` varchar(45) NOT NULL,
  `field_value` varchar(255) NOT NULL,
  PRIMARY KEY (`module_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `multiple_db`;
CREATE TABLE `multiple_db` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text,
  `dbname` varchar(255) NOT NULL,
  `host` varchar(255) NOT NULL DEFAULT 'localhost',
  `port` smallint(6) NOT NULL DEFAULT '3306',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `namespace` (`namespace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `note_uuid` varchar(250) NOT NULL,
  `note` longtext,
  `user_uuid` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL COMMENT 'create date time',
  `revision` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` varchar(255) NOT NULL,
  `pid` varchar(255) NOT NULL,
  `note_type` varchar(255) NOT NULL COMMENT 'doctor notes, nurse notes, lab notes, prescription notes',
  `note_type_uuid` varchar(255) DEFAULT NULL COMMENT 'value of uuid from different tables like prescription_uuid, lab_uuid etc',
  `flag` smallint(6) DEFAULT '0',
  `prac_uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `foreign_id` (`user_uuid`),
  KEY `foreign_id_2` (`note_uuid`),
  KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=427 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `notification_log`;
CREATE TABLE `notification_log` (
  `iLogId` int(11) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NOT NULL,
  `pc_eid` int(10) unsigned DEFAULT NULL,
  `sms_gateway_type` varchar(50) NOT NULL,
  `smsgateway_info` varchar(255) NOT NULL,
  `message` text,
  `email_sender` varchar(255) NOT NULL,
  `email_subject` varchar(255) NOT NULL,
  `type` enum('SMS','Email') NOT NULL,
  `patient_info` text,
  `pc_eventDate` date NOT NULL,
  `pc_endDate` date NOT NULL,
  `pc_startTime` time NOT NULL,
  `pc_endTime` time NOT NULL,
  `dSentDateTime` datetime NOT NULL,
  PRIMARY KEY (`iLogId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `notification_settings`;
CREATE TABLE `notification_settings` (
  `SettingsId` int(11) NOT NULL AUTO_INCREMENT,
  `Send_SMS_Before_Hours` int(11) NOT NULL,
  `Send_Email_Before_Hours` int(11) NOT NULL,
  `SMS_gateway_username` varchar(100) NOT NULL,
  `SMS_gateway_password` varchar(100) NOT NULL,
  `SMS_gateway_apikey` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`SettingsId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `onotes`;
CREATE TABLE `onotes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `body` longtext,
  `user` varchar(255) DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `activity` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `onsite_documents`;
CREATE TABLE `onsite_documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned DEFAULT NULL,
  `facility` int(10) unsigned DEFAULT NULL,
  `provider` int(10) unsigned DEFAULT NULL,
  `encounter` int(10) unsigned DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `doc_type` varchar(255) NOT NULL,
  `patient_signed_status` smallint(5) unsigned NOT NULL,
  `patient_signed_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `authorize_signed_time` datetime DEFAULT NULL,
  `accept_signed_status` smallint(6) NOT NULL,
  `authorizing_signator` varchar(50) NOT NULL,
  `review_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `denial_reason` varchar(255) NOT NULL,
  `authorized_signature` text,
  `patient_signature` text,
  `full_document` mediumblob,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `onsite_mail`;
CREATE TABLE `onsite_mail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `owner` varchar(128) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `activity` tinyint(4) DEFAULT NULL,
  `authorized` tinyint(4) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` longtext,
  `recipient_id` varchar(128) DEFAULT NULL,
  `recipient_name` varchar(255) DEFAULT NULL,
  `sender_id` varchar(128) DEFAULT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `assigned_to` varchar(255) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0' COMMENT 'flag indicates note is deleted',
  `delete_date` datetime DEFAULT NULL,
  `mtype` varchar(128) DEFAULT NULL,
  `message_status` varchar(20) NOT NULL DEFAULT 'New',
  `mail_chain` int(11) DEFAULT NULL,
  `reply_mail_chain` int(11) DEFAULT NULL,
  `is_msg_encrypted` tinyint(4) DEFAULT '0' COMMENT 'Whether messsage encrypted 0-Not encrypted, 1-Encrypted',
  PRIMARY KEY (`id`),
  KEY `pid` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `onsite_messages`;
CREATE TABLE `onsite_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `message` longtext,
  `ip` varchar(15) NOT NULL,
  `date` datetime NOT NULL,
  `sender_id` varchar(64) DEFAULT NULL COMMENT 'who sent id',
  `recip_id` varchar(255) NOT NULL COMMENT 'who to id array',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Portal messages';


DROP TABLE IF EXISTS `onsite_online`;
CREATE TABLE `onsite_online` (
  `hash` varchar(32) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `last_update` datetime NOT NULL,
  `username` varchar(64) NOT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `onsite_portal_activity`;
CREATE TABLE `onsite_portal_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `patient_id` bigint(20) DEFAULT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `require_audit` tinyint(1) DEFAULT '1',
  `pending_action` varchar(255) DEFAULT NULL,
  `action_taken` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `narrative` longtext,
  `table_action` longtext,
  `table_args` longtext,
  `action_user` int(11) DEFAULT NULL,
  `action_taken_time` datetime DEFAULT NULL,
  `checksum` longtext,
  PRIMARY KEY (`id`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `onsite_signatures`;
CREATE TABLE `onsite_signatures` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` varchar(128) NOT NULL DEFAULT 'waiting',
  `type` varchar(128) NOT NULL,
  `created` int(11) NOT NULL,
  `lastmod` datetime NOT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `encounter` int(11) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `activity` tinyint(4) NOT NULL DEFAULT '0',
  `authorized` tinyint(4) DEFAULT NULL,
  `signator` varchar(255) NOT NULL,
  `sig_image` text,
  `signature` text,
  `sig_hash` varchar(128) NOT NULL,
  `ip` varchar(46) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pid` (`pid`,`user`),
  KEY `encounter` (`encounter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `openemr_modules`;
CREATE TABLE `openemr_modules` (
  `pn_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pn_name` varchar(64) DEFAULT NULL,
  `pn_type` int(11) NOT NULL DEFAULT '0',
  `pn_displayname` varchar(64) DEFAULT NULL,
  `pn_description` varchar(255) DEFAULT NULL,
  `pn_regid` int(10) unsigned NOT NULL DEFAULT '0',
  `pn_directory` varchar(64) DEFAULT NULL,
  `pn_version` varchar(10) DEFAULT NULL,
  `pn_admin_capable` tinyint(1) NOT NULL DEFAULT '0',
  `pn_user_capable` tinyint(1) NOT NULL DEFAULT '0',
  `pn_state` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `openemr_module_vars`;
CREATE TABLE `openemr_module_vars` (
  `pn_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pn_modname` varchar(64) DEFAULT NULL,
  `pn_name` varchar(64) DEFAULT NULL,
  `pn_value` longtext,
  PRIMARY KEY (`pn_id`),
  KEY `pn_modname` (`pn_modname`),
  KEY `pn_name` (`pn_name`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `openemr_postcalendar_categories`;
CREATE TABLE `openemr_postcalendar_categories` (
  `pc_catid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pc_constant_id` varchar(255) DEFAULT NULL,
  `pc_catname` varchar(100) DEFAULT NULL,
  `pc_catcolor` varchar(50) DEFAULT NULL,
  `pc_catdesc` text,
  `pc_recurrtype` int(11) NOT NULL DEFAULT '0',
  `pc_enddate` date DEFAULT NULL,
  `pc_recurrspec` text,
  `pc_recurrfreq` int(11) NOT NULL DEFAULT '0',
  `pc_duration` bigint(20) NOT NULL DEFAULT '0',
  `pc_end_date_flag` tinyint(1) NOT NULL DEFAULT '0',
  `pc_end_date_type` int(11) DEFAULT NULL,
  `pc_end_date_freq` int(11) NOT NULL DEFAULT '0',
  `pc_end_all_day` tinyint(1) NOT NULL DEFAULT '0',
  `pc_dailylimit` int(11) NOT NULL DEFAULT '0',
  `pc_cattype` int(11) NOT NULL COMMENT 'Used in grouping categories',
  `pc_active` tinyint(1) NOT NULL DEFAULT '1',
  `pc_seq` int(11) NOT NULL DEFAULT '0',
  `aco_spec` varchar(63) NOT NULL DEFAULT 'encounters|notes',
  PRIMARY KEY (`pc_catid`),
  UNIQUE KEY `pc_constant_id` (`pc_constant_id`),
  KEY `basic_cat` (`pc_catname`,`pc_catcolor`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `openemr_postcalendar_events`;
CREATE TABLE `openemr_postcalendar_events` (
  `pc_eid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pc_catid` int(11) NOT NULL DEFAULT '0',
  `pc_multiple` int(10) unsigned NOT NULL,
  `pc_aid` varchar(30) DEFAULT NULL,
  `pc_pid` varchar(11) DEFAULT NULL,
  `pc_gid` int(11) DEFAULT '0',
  `pc_title` varchar(150) DEFAULT NULL,
  `pc_time` datetime DEFAULT NULL,
  `pc_hometext` text,
  `pc_comments` int(11) DEFAULT '0',
  `pc_counter` mediumint(8) unsigned DEFAULT '0',
  `pc_topic` int(11) NOT NULL DEFAULT '1',
  `pc_informant` varchar(20) DEFAULT NULL,
  `pc_eventDate` date NOT NULL DEFAULT '0000-00-00',
  `pc_endDate` date NOT NULL DEFAULT '0000-00-00',
  `pc_duration` bigint(20) NOT NULL DEFAULT '0',
  `pc_recurrtype` int(11) NOT NULL DEFAULT '0',
  `pc_recurrspec` text,
  `pc_recurrfreq` int(11) NOT NULL DEFAULT '0',
  `pc_startTime` time DEFAULT NULL,
  `pc_endTime` time DEFAULT NULL,
  `pc_alldayevent` int(11) NOT NULL DEFAULT '0',
  `pc_location` text,
  `pc_conttel` varchar(50) DEFAULT NULL,
  `pc_contname` varchar(50) DEFAULT NULL,
  `pc_contemail` varchar(255) DEFAULT NULL,
  `pc_website` varchar(255) DEFAULT NULL,
  `pc_fee` varchar(50) DEFAULT NULL,
  `pc_eventstatus` int(11) NOT NULL DEFAULT '0',
  `pc_sharing` int(11) NOT NULL DEFAULT '0',
  `pc_language` varchar(30) DEFAULT NULL,
  `pc_apptstatus` varchar(15) NOT NULL DEFAULT '-',
  `pc_prefcatid` int(11) NOT NULL DEFAULT '0',
  `pc_facility` int(11) NOT NULL DEFAULT '0' COMMENT 'facility id for this event',
  `pc_sendalertsms` varchar(3) NOT NULL DEFAULT 'NO',
  `pc_sendalertemail` varchar(3) NOT NULL DEFAULT 'NO',
  `pc_billing_location` smallint(6) NOT NULL DEFAULT '0',
  `pc_room` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`pc_eid`),
  KEY `basic_event` (`pc_catid`,`pc_aid`,`pc_eventDate`,`pc_endDate`,`pc_eventstatus`,`pc_sharing`,`pc_topic`),
  KEY `pc_eventDate` (`pc_eventDate`),
  KEY `index_pcid` (`pc_pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `patch`;
CREATE TABLE `patch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `patch_type` varchar(200) NOT NULL,
  `patch_name` varchar(200) DEFAULT NULL,
  `patch_uuid` varchar(250) NOT NULL,
  `patch_status` varchar(255) NOT NULL,
  `patch_group_id` varchar(250) DEFAULT NULL,
  `patch_mac` varchar(255) DEFAULT NULL,
  `patch_bluetooth` smallint(6) DEFAULT '1',
  `patch_sensor_id` varchar(250) DEFAULT NULL,
  `patch_serial` varchar(250) NOT NULL,
  `tenant_id` varchar(255) NOT NULL,
  `pid` varchar(255) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `patch_state` varchar(255) DEFAULT NULL,
  `group_type` varchar(10) NOT NULL,
  `in_use` varchar(5) NOT NULL,
  `enterprise` varchar(255) DEFAULT 'http://20.230.234.202:7124',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=805 DEFAULT CHARSET=utf8;

INSERT INTO `patch` (`id`, `patch_type`, `patch_name`, `patch_uuid`, `patch_status`, `patch_group_id`, `patch_mac`, `patch_bluetooth`, `patch_sensor_id`, `patch_serial`, `tenant_id`, `pid`, `date`, `patch_state`, `group_type`, `in_use`, `enterprise`) VALUES
(782,	'spo2',	NULL,	'patch4d48668c-f20d-40ae-be30-9f5a1442bad2',	'Inactive',	'patch4d48668c-f20d-40ae-be30-9f5a1442bad2',	'ser-spo-123',	1,	NULL,	'ser-spo-123',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'0',	'2022-06-06 07:14:19',	NULL,	'Device',	'true',	'http://20.230.234.202:7124'),
(783,	'gateway',	NULL,	'patch0284fc16-c9b1-40ca-8c89-ca93ce347c3d',	'Inactive',	'patch0284fc16-c9b1-40ca-8c89-ca93ce347c3d',	'861629052033002',	1,	NULL,	'861629052033002',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'0',	'2022-06-06 07:17:01',	NULL,	'Device',	'true',	'http://20.230.234.202:7124'),
(785,	'alphamed',	NULL,	'patch63252160-5c17-439c-bcec-551d3ad09e7c',	'Inactive',	'patch63252160-5c17-439c-bcec-551d3ad09e7c',	'D1:F0:01:01:2C:4E',	1,	NULL,	'861629052033002',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'0',	'2022-06-06 07:17:39',	NULL,	'Device',	'true',	'http://20.230.234.202:7124'),
(786,	'gateway',	NULL,	'patch89d58de4-1a80-46ff-a121-a3c4bf55737e',	'Inactive',	'patch89d58de4-1a80-46ff-a121-a3c4bf55737e',	'861629052033010',	1,	NULL,	'861629052033010',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'0',	'2022-06-06 07:22:44',	NULL,	'Device',	'true',	'http://20.230.234.202:7124'),
(787,	'digital',	NULL,	'patch75aa9e18-aba6-4090-851f-a0fd3b2a68e1',	'Inactive',	'patch75aa9e18-aba6-4090-851f-a0fd3b2a68e1',	'01:B6:EC:BA:B1:2C',	1,	NULL,	'861629052033010',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'0',	'2022-06-06 07:23:18',	NULL,	'Device',	'true',	'http://20.230.234.202:7124'),
(788,	'alphamed',	NULL,	'patchaeab7707-6f58-4cbe-8eaf-b508eb1121b2',	'Inactive',	'patchaeab7707-6f58-4cbe-8eaf-b508eb1121b2',	'D1:F0:01:01:38:66',	1,	NULL,	'861629052033010',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'0',	'2022-06-06 07:23:40',	NULL,	'Device',	'true',	'http://20.230.234.202:7124'),
(789,	'gateway',	NULL,	'patchc6d4cc7a-cb53-4c07-b159-a990dbb42092',	'Inactive',	'patchc6d4cc7a-cb53-4c07-b159-a990dbb42092',	'861629052032988',	1,	NULL,	'861629052032988',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'0',	'2022-06-06 07:25:29',	NULL,	'Device',	'true',	'http://20.230.234.202:7124'),
(790,	'digital',	NULL,	'patchfacc62f0-fa69-4507-80e2-3585d6326994',	'Inactive',	'patchfacc62f0-fa69-4507-80e2-3585d6326994',	'01:B6:EC:B9:A3:7E',	1,	NULL,	'861629052032988',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'0',	'2022-06-06 07:25:53',	NULL,	'Device',	'true',	'http://20.230.234.202:7124'),
(791,	'alphamed',	NULL,	'patch200af847-b65d-493a-aef3-7ce416b36e02',	'Inactive',	'patch200af847-b65d-493a-aef3-7ce416b36e02',	'D1:F0:01:01:32:50',	1,	NULL,	'861629052032988',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'0',	'2022-06-06 07:26:08',	NULL,	'Device',	'true',	'http://20.230.234.202:7124'),
(792,	'temperature',	NULL,	'patch9a56eeb7-4c5f-4d02-a6a6-ee1d6f9e0ce0',	'Inactive',	'patch9a56eeb7-4c5f-4d02-a6a6-ee1d6f9e0ce0',	'AB:55:D5:E8:R1',	1,	NULL,	'1111',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'0',	'2022-06-06 07:35:49',	NULL,	'Device',	'true',	'http://20.230.234.202:7124'),
(793,	'digital',	NULL,	'patch391b1eb6-00ce-4ac8-81d6-7cd4c698adc7',	'Inactive',	'patch391b1eb6-00ce-4ac8-81d6-7cd4c698adc7',	'01:B6:EC:B9:51:92',	1,	NULL,	'861629052033002',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'0',	'2022-06-06 07:48:11',	NULL,	'Device',	'true',	'http://20.230.234.202:7124'),
(794,	'gateway',	NULL,	'patch79e6d3d9-3699-44c9-ada8-a3d2033f7731',	'Inactive',	'patch79e6d3d9-3699-44c9-ada8-a3d2033f7731',	'861629050058340',	1,	NULL,	'861629050058340',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'0',	'2022-06-06 09:21:01',	NULL,	'Device',	'true',	'http://20.230.234.202:7124'),
(795,	'alphamed',	NULL,	'patch12572e20-5640-4eca-8e97-e6445f3a0858',	'Inactive',	'patch12572e20-5640-4eca-8e97-e6445f3a0858',	'D1:F0:01:01:2A:8F',	1,	NULL,	'861629050058340',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'0',	'2022-06-06 09:21:24',	NULL,	'Device',	'true',	'http://20.230.234.202:7124'),
(796,	'digital',	NULL,	'patchb3d5154a-56dd-462f-9b5e-95b9a26e0bcd',	'Inactive',	'patchb3d5154a-56dd-462f-9b5e-95b9a26e0bcd',	'01:B6:EC:C5:F6:47',	1,	NULL,	'861629050058340',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'0',	'2022-06-06 09:21:46',	NULL,	'Device',	'true',	'http://20.230.234.202:7124'),
(797,	'temperature',	NULL,	'patch7631550f-bf73-48d7-a05c-2c996452f0db',	'Inactive',	'patch7631550f-bf73-48d7-a05c-2c996452f0db',	'B35.00099885',	1,	NULL,	'861629050058340',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'0',	'2022-06-06 09:22:08',	NULL,	'Device',	'true',	'http://20.230.234.202:7124'),
(798,	'gateway',	NULL,	'patch89a07cec-0b47-4d8f-bcb0-c52d9bbeabbe',	'Inactive',	'patch89a07cec-0b47-4d8f-bcb0-c52d9bbeabbe',	'861629050058431',	1,	NULL,	'861629050058431',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'0',	'2022-06-06 09:23:21',	NULL,	'Device',	'true',	'http://20.230.234.202:7124'),
(799,	'alphamed',	NULL,	'patch914bce35-6fbc-48f0-ade6-e5ca41763926',	'Inactive',	'patch914bce35-6fbc-48f0-ade6-e5ca41763926',	'D1:F0:01:01:2B:AB',	1,	NULL,	'861629050058431',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'0',	'2022-06-06 09:23:41',	NULL,	'Device',	'true',	'http://20.230.234.202:7124'),
(800,	'digital',	NULL,	'patche7b10b0a-bc9e-4a81-bab6-6cfc53686fa3',	'Inactive',	'patche7b10b0a-bc9e-4a81-bab6-6cfc53686fa3',	'01:B6:EC:BA:B7:8D',	1,	NULL,	'861629050058431',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'0',	'2022-06-06 09:24:01',	NULL,	'Device',	'true',	'http://20.230.234.202:7124'),
(801,	'temperature',	NULL,	'patch7a6fcecc-b85b-4697-a4b7-c67d9ae91469',	'Inactive',	'patch7a6fcecc-b85b-4697-a4b7-c67d9ae91469',	'B34.00064935',	1,	NULL,	'861629050058431',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'0',	'2022-06-06 09:24:20',	NULL,	'Device',	'true',	'http://20.230.234.202:7124'),
(802,	'gateway',	NULL,	'patchfd9a7cd2-1549-44f0-a617-f9f3f9a17d71',	'Inactive',	'patchfd9a7cd2-1549-44f0-a617-f9f3f9a17d71',	'123456789',	1,	NULL,	'123456789',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'0',	'2022-06-07 06:47:43',	NULL,	'Device',	'true',	'http://20.230.234.202:7124'),
(803,	'temperature',	NULL,	'patch5db10bb5-1046-4019-80fa-af5511e9481b',	'Inactive',	'patch5db10bb5-1046-4019-80fa-af5511e9481b',	'fg:45:g5:8d',	1,	NULL,	'123456789',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'0',	'2022-06-07 06:48:00',	NULL,	'Device',	'true',	'http://20.230.234.202:7124'),
(804,	'ihealth',	NULL,	'patchec35eec4-fe02-488e-8029-e6e4a6a4f252',	'Inactive',	'patchec35eec4-fe02-488e-8029-e6e4a6a4f252',	'fg:48:g7:dp:8l',	1,	NULL,	'123456789',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'0',	'2022-06-07 06:48:24',	NULL,	'Device',	'true',	'http://20.230.234.202:7124')
ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `patch_type` = VALUES(`patch_type`), `patch_name` = VALUES(`patch_name`), `patch_uuid` = VALUES(`patch_uuid`), `patch_status` = VALUES(`patch_status`), `patch_group_id` = VALUES(`patch_group_id`), `patch_mac` = VALUES(`patch_mac`), `patch_bluetooth` = VALUES(`patch_bluetooth`), `patch_sensor_id` = VALUES(`patch_sensor_id`), `patch_serial` = VALUES(`patch_serial`), `tenant_id` = VALUES(`tenant_id`), `pid` = VALUES(`pid`), `date` = VALUES(`date`), `patch_state` = VALUES(`patch_state`), `group_type` = VALUES(`group_type`), `in_use` = VALUES(`in_use`), `enterprise` = VALUES(`enterprise`);

DROP TABLE IF EXISTS `patch_patient_map`;
CREATE TABLE `patch_patient_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` varchar(255) NOT NULL,
  `patch_uuid` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `tenant_id` varchar(255) NOT NULL,
  `duration` varchar(300) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `config` json DEFAULT NULL,
  `command` varchar(255) DEFAULT NULL,
  `keepaliveTime` varchar(255) DEFAULT NULL,
  `configFlag` varchar(255) DEFAULT NULL,
  `prevConfig` json DEFAULT NULL,
  `keepaliveHistory` json DEFAULT NULL,
  `discoverDevices` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=590 DEFAULT CHARSET=utf8;

INSERT INTO `patch_patient_map` (`id`, `pid`, `patch_uuid`, `tenant_id`, `duration`, `date`, `config`, `command`, `keepaliveTime`, `configFlag`, `prevConfig`, `keepaliveHistory`, `discoverDevices`) VALUES
(540,	'patientd1ab78ce-dc24-472c-8538-e1510dfef545',	'patch78a2821b-8c3f-4e5c-982b-abeb1d0084d3',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-03,2022-06-25',	'2022-06-03 04:22:28',	'{}',	'',	NULL,	NULL,	NULL,	NULL,	NULL),
(541,	'patientd1ab78ce-dc24-472c-8538-e1510dfef545',	'patch40ad6bf1-b9a1-4fed-a680-4075b14d129b',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-03,2022-06-17',	'2022-06-03 04:22:36',	'{}',	'',	NULL,	NULL,	NULL,	NULL,	NULL),
(542,	'patientd1ab78ce-dc24-472c-8538-e1510dfef545',	'patch271efd8e-426d-40f0-a51a-f0bc767474d8',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-03,2022-06-25',	'2022-06-03 04:22:44',	'{}',	'',	NULL,	NULL,	NULL,	NULL,	NULL),
(546,	'patienta8799480-7306-42a0-aa6a-46848de8c0a9',	'patch5a7160b5-fb8b-496c-a54a-11dc4782fbbc',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-03,2022-06-16',	'2022-06-03 04:27:06',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(547,	'patienta8799480-7306-42a0-aa6a-46848de8c0a9',	'patch36c6f0ef-ce59-4a7b-a6a7-5d697dff9e82',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-09,2022-07-02',	'2022-06-03 04:27:15',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(548,	'patienta8799480-7306-42a0-aa6a-46848de8c0a9',	'patch54713fc8-6951-4168-a0ab-2029a36c6b1b',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-10,2022-07-01',	'2022-06-03 04:27:23',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(552,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'patch944b312d-5237-4b4e-9e15-d591e8ddf232',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-07,2022-06-10',	'2022-06-03 05:47:34',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(553,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'patchd2a4700f-d88e-4901-94c9-1acf669cadad',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-14,2022-07-14',	'2022-06-03 06:37:29',	'{}',	'',	NULL,	NULL,	NULL,	NULL,	NULL),
(554,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'patch5b8e6c52-2d2f-4ec2-a236-0444e7db9370',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-07,2022-07-07',	'2022-06-03 06:37:41',	'{}',	'',	NULL,	NULL,	NULL,	NULL,	NULL),
(555,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'patchb5bd3dbd-a34c-4dd1-b1ba-0cd15320ac08',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-08,2022-07-14',	'2022-06-03 06:37:54',	'{}',	'',	NULL,	NULL,	NULL,	NULL,	NULL),
(556,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'patch625610b6-dd85-42d4-bbb5-ff7f63a5276c',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-07,2022-07-06',	'2022-06-03 06:38:02',	'{}',	'',	NULL,	NULL,	NULL,	NULL,	NULL),
(557,	'patient49f476ac-62a9-4182-ac98-e2b0f96acfd5',	'patchc4a2a76b-0024-4a53-8e99-a52192634303',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-21,2022-07-21',	'2022-06-03 06:40:51',	'{}',	'',	NULL,	NULL,	NULL,	NULL,	NULL),
(558,	'patient49f476ac-62a9-4182-ac98-e2b0f96acfd5',	'patch3c9baeae-ad78-4b2e-8f6a-fae3eb375a7e',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-08,2022-07-11',	'2022-06-03 06:40:58',	'{}',	'',	NULL,	NULL,	NULL,	NULL,	NULL),
(559,	'patient49f476ac-62a9-4182-ac98-e2b0f96acfd5',	'patchff051f16-1b0b-468f-988d-2733121974b0',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-16,2022-07-15',	'2022-06-03 06:41:05',	'{}',	'',	NULL,	NULL,	NULL,	NULL,	NULL),
(560,	'patient49f476ac-62a9-4182-ac98-e2b0f96acfd5',	'patch2dfdea18-ca50-4263-9cc7-84e4522e3e0e',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-23,2022-07-22',	'2022-06-03 06:41:12',	'{}',	'',	NULL,	NULL,	NULL,	NULL,	NULL),
(561,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'patchd70e55b1-32a8-45d2-91d9-65763836239b',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-29,2022-07-19',	'2022-06-03 08:06:34',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(565,	'patienta4c4e3a3-0727-4ed9-b865-62b452e7319a',	'patch0284fc16-c9b1-40ca-8c89-ca93ce347c3d',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-21,2022-07-21',	'2022-06-06 07:18:18',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(567,	'patienta4c4e3a3-0727-4ed9-b865-62b452e7319a',	'patch63252160-5c17-439c-bcec-551d3ad09e7c',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-21,2022-07-20',	'2022-06-06 07:18:37',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(568,	'patientd1ab78ce-dc24-472c-8538-e1510dfef545',	'patch89d58de4-1a80-46ff-a121-a3c4bf55737e',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-22,2022-07-27',	'2022-06-06 07:24:46',	'{}',	'',	NULL,	NULL,	NULL,	NULL,	NULL),
(569,	'patientd1ab78ce-dc24-472c-8538-e1510dfef545',	'patch75aa9e18-aba6-4090-851f-a0fd3b2a68e1',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-20,2022-07-20',	'2022-06-06 07:24:54',	'{}',	'',	NULL,	NULL,	NULL,	NULL,	NULL),
(570,	'patientd1ab78ce-dc24-472c-8538-e1510dfef545',	'patchaeab7707-6f58-4cbe-8eaf-b508eb1121b2',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-15,2022-07-14',	'2022-06-06 07:25:02',	'{}',	'',	NULL,	NULL,	NULL,	NULL,	NULL),
(571,	'patientc10c064c-fd5a-4ddc-85ca-1744d6104229',	'patchc6d4cc7a-cb53-4c07-b159-a990dbb42092',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-14,2022-07-15',	'2022-06-06 07:32:14',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(572,	'patientc10c064c-fd5a-4ddc-85ca-1744d6104229',	'patchfacc62f0-fa69-4507-80e2-3585d6326994',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-13,2022-07-20',	'2022-06-06 07:32:21',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(573,	'patientc10c064c-fd5a-4ddc-85ca-1744d6104229',	'patch200af847-b65d-493a-aef3-7ce416b36e02',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-13,2022-07-20',	'2022-06-06 07:32:27',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(576,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'patch4d48668c-f20d-40ae-be30-9f5a1442bad2',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-07-04,2022-07-28',	'2022-06-06 07:39:53',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(577,	'patienta4c4e3a3-0727-4ed9-b865-62b452e7319a',	'patch391b1eb6-00ce-4ac8-81d6-7cd4c698adc7',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-14,2022-07-29',	'2022-06-06 07:49:15',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(578,	'patientad1d31ca-5bea-4a99-8378-e535592ab402',	'patch9a56eeb7-4c5f-4d02-a6a6-ee1d6f9e0ce0',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-06,2022-06-08',	'2022-06-06 08:20:04',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(579,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'patch79e6d3d9-3699-44c9-ada8-a3d2033f7731',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-21,2022-07-21',	'2022-06-06 09:22:33',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(580,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'patch7631550f-bf73-48d7-a05c-2c996452f0db',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-15,2022-07-27',	'2022-06-06 09:22:40',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(581,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'patchb3d5154a-56dd-462f-9b5e-95b9a26e0bcd',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-23,2022-07-26',	'2022-06-06 09:22:49',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(582,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	'patch12572e20-5640-4eca-8e97-e6445f3a0858',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-20,2022-07-27',	'2022-06-06 09:22:55',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(583,	'patient49f476ac-62a9-4182-ac98-e2b0f96acfd5',	'patch89a07cec-0b47-4d8f-bcb0-c52d9bbeabbe',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-14,2022-07-12',	'2022-06-06 09:24:40',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(584,	'patient49f476ac-62a9-4182-ac98-e2b0f96acfd5',	'patch7a6fcecc-b85b-4697-a4b7-c67d9ae91469',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-07-11,2022-07-28',	'2022-06-06 09:24:48',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(585,	'patient49f476ac-62a9-4182-ac98-e2b0f96acfd5',	'patche7b10b0a-bc9e-4a81-bab6-6cfc53686fa3',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-06,2022-07-20',	'2022-06-06 09:24:56',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(586,	'patient49f476ac-62a9-4182-ac98-e2b0f96acfd5',	'patch914bce35-6fbc-48f0-ade6-e5ca41763926',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-20,2022-07-20',	'2022-06-06 09:25:02',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(587,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'patchfd9a7cd2-1549-44f0-a617-f9f3f9a17d71',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-20,2022-07-19',	'2022-06-07 06:48:55',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(588,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'patchec35eec4-fe02-488e-8029-e6e4a6a4f252',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-16,2022-07-19',	'2022-06-07 06:49:42',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(589,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	'patch5db10bb5-1046-4019-80fa-af5511e9481b',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-20,2022-07-19',	'2022-06-07 06:50:10',	'{}',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL)
ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `pid` = VALUES(`pid`), `patch_uuid` = VALUES(`patch_uuid`), `tenant_id` = VALUES(`tenant_id`), `duration` = VALUES(`duration`), `date` = VALUES(`date`), `config` = VALUES(`config`), `command` = VALUES(`command`), `keepaliveTime` = VALUES(`keepaliveTime`), `configFlag` = VALUES(`configFlag`), `prevConfig` = VALUES(`prevConfig`), `keepaliveHistory` = VALUES(`keepaliveHistory`), `discoverDevices` = VALUES(`discoverDevices`);

DROP TABLE IF EXISTS `patient_access_offsite`;
CREATE TABLE `patient_access_offsite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NOT NULL,
  `portal_username` varchar(100) NOT NULL,
  `portal_pwd` varchar(100) NOT NULL,
  `portal_pwd_status` tinyint(4) DEFAULT '1' COMMENT '0=>Password Created Through Demographics by The provider or staff. Patient Should Change it at first time it.1=>Pwd updated or created by patient itself',
  `authorize_net_id` varchar(20) DEFAULT NULL COMMENT 'authorize.net profile id',
  `portal_relation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `patient_access_onsite`;
CREATE TABLE `patient_access_onsite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT NULL,
  `portal_username` varchar(100) DEFAULT NULL,
  `portal_pwd` varchar(100) DEFAULT NULL,
  `portal_pwd_status` tinyint(4) DEFAULT '1' COMMENT '0=>Password Created Through Demographics by The provider or staff. Patient Should Change it at first time it.1=>Pwd updated or created by patient itself',
  `portal_salt` varchar(100) DEFAULT NULL,
  `portal_login_username` varchar(100) DEFAULT NULL COMMENT 'User entered username',
  `portal_onetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `patient_birthday_alert`;
CREATE TABLE `patient_birthday_alert` (
  `pid` bigint(20) NOT NULL DEFAULT '0',
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `turned_off_on` date NOT NULL,
  PRIMARY KEY (`pid`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `patient_data`;
CREATE TABLE `patient_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '',
  `language` varchar(255) DEFAULT '',
  `financial` varchar(255) DEFAULT '',
  `fname` varchar(255) DEFAULT '',
  `lname` varchar(255) DEFAULT '',
  `mname` varchar(255) DEFAULT '',
  `DOB` date NOT NULL,
  `street` varchar(255) DEFAULT '',
  `postal_code` varchar(255) DEFAULT '',
  `city` varchar(255) DEFAULT '',
  `state` varchar(255) DEFAULT '',
  `country_code` varchar(255) DEFAULT '',
  `idtype` varchar(255) DEFAULT '',
  `idnumber` varchar(255) DEFAULT '',
  `occupation` longtext,
  `phone_home` varchar(255) DEFAULT '',
  `phone_biz` varchar(255) DEFAULT '',
  `phone_contact` varchar(255) DEFAULT '',
  `phone_cell` varchar(255) DEFAULT '',
  `pharmacy_id` int(11) DEFAULT '0',
  `status` varchar(255) DEFAULT '',
  `contact_relationship` varchar(255) DEFAULT '',
  `admission_date` date DEFAULT NULL,
  `sex` varchar(255) NOT NULL DEFAULT '',
  `referrer` varchar(255) DEFAULT '',
  `referrerID` varchar(255) DEFAULT '',
  `providerID` int(11) DEFAULT NULL,
  `ref_providerID` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT '',
  `email_direct` varchar(255) DEFAULT '',
  `ethnoracial` varchar(255) DEFAULT '',
  `race` varchar(255) DEFAULT '',
  `ethnicity` varchar(255) DEFAULT '',
  `religion` varchar(40) DEFAULT '',
  `interpretter` varchar(255) DEFAULT '',
  `migrantseasonal` varchar(255) DEFAULT '',
  `family_size` varchar(255) DEFAULT '',
  `monthly_income` varchar(255) DEFAULT '',
  `billing_note` text,
  `homeless` varchar(255) DEFAULT '',
  `financial_review` datetime DEFAULT NULL,
  `pubpid` varchar(255) DEFAULT '',
  `pid` varchar(255) NOT NULL DEFAULT '0',
  `genericname1` varchar(255) DEFAULT '',
  `genericval1` varchar(255) DEFAULT '',
  `genericname2` varchar(255) DEFAULT '',
  `genericval2` varchar(255) DEFAULT '',
  `hipaa_mail` varchar(3) DEFAULT '',
  `hipaa_voice` varchar(3) DEFAULT '',
  `hipaa_notice` varchar(3) DEFAULT '',
  `hipaa_message` varchar(20) DEFAULT '',
  `hipaa_allowsms` varchar(3) DEFAULT 'NO',
  `hipaa_allowemail` varchar(3) DEFAULT 'NO',
  `squad` varchar(32) DEFAULT '',
  `fitness` int(11) DEFAULT '0',
  `referral_source` varchar(30) DEFAULT '',
  `usertext1` varchar(255) DEFAULT '',
  `usertext2` varchar(255) DEFAULT '',
  `usertext3` varchar(255) DEFAULT '',
  `usertext4` varchar(255) DEFAULT '',
  `usertext5` varchar(255) DEFAULT '',
  `usertext6` varchar(255) DEFAULT '',
  `usertext7` varchar(255) DEFAULT '',
  `usertext8` varchar(255) DEFAULT '',
  `userlist1` varchar(255) DEFAULT '',
  `userlist2` varchar(255) DEFAULT '',
  `userlist3` varchar(255) DEFAULT '',
  `userlist4` varchar(255) DEFAULT '',
  `userlist5` varchar(255) DEFAULT '',
  `userlist6` varchar(255) DEFAULT '',
  `userlist7` varchar(255) DEFAULT '',
  `pricelevel` varchar(255) DEFAULT 'standard',
  `regdate` date DEFAULT NULL COMMENT 'Registration Date',
  `contrastart` date DEFAULT NULL COMMENT 'Date contraceptives initially used',
  `completed_ad` varchar(3) DEFAULT 'NO',
  `ad_reviewed` date DEFAULT NULL,
  `vfc` varchar(255) DEFAULT '',
  `mothersname` varchar(255) DEFAULT '',
  `guardiansname` text,
  `allow_imm_reg_use` varchar(255) DEFAULT '',
  `allow_imm_info_share` varchar(255) DEFAULT '',
  `allow_health_info_ex` varchar(255) DEFAULT '',
  `allow_patient_portal` varchar(31) DEFAULT '',
  `deceased_date` date DEFAULT NULL,
  `deceased_reason` varchar(255) DEFAULT '',
  `soap_import_status` tinyint(4) DEFAULT NULL COMMENT '1-Prescription Press 2-Prescription Import 3-Allergy Press 4-Allergy Import',
  `cmsportal_login` varchar(60) DEFAULT '',
  `care_team` int(11) DEFAULT NULL,
  `county` varchar(40) DEFAULT '',
  `industry` text,
  `imm_reg_status` text,
  `imm_reg_stat_effdate` text,
  `publicity_code` text,
  `publ_code_eff_date` text,
  `protect_indicator` text,
  `prot_indi_effdate` text,
  `guardianrelationship` text,
  `guardiansex` text,
  `guardianaddress` text,
  `guardiancity` text,
  `guardianstate` text,
  `guardianpostalcode` text,
  `guardiancountry` text,
  `guardianphone` text,
  `guardianworkphone` text,
  `guardianemail` text,
  `tenant_id` varchar(255) NOT NULL,
  `location_uuid` varchar(255) DEFAULT NULL,
  `bed_uuid` varchar(255) DEFAULT NULL,
  `med_record` varchar(150) NOT NULL,
  `vital_uuid` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `discharge_date` date DEFAULT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT '1',
  `associated_list` varchar(255) CHARACTER SET armscii8 NOT NULL DEFAULT '[]',
  UNIQUE KEY `pid` (`pid`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=749 DEFAULT CHARSET=utf8 COMMENT='list of devices that been associated to patient';

INSERT INTO `patient_data` (`id`, `title`, `language`, `financial`, `fname`, `lname`, `mname`, `DOB`, `street`, `postal_code`, `city`, `state`, `country_code`, `idtype`, `idnumber`, `occupation`, `phone_home`, `phone_biz`, `phone_contact`, `phone_cell`, `pharmacy_id`, `status`, `contact_relationship`, `admission_date`, `sex`, `referrer`, `referrerID`, `providerID`, `ref_providerID`, `email`, `email_direct`, `ethnoracial`, `race`, `ethnicity`, `religion`, `interpretter`, `migrantseasonal`, `family_size`, `monthly_income`, `billing_note`, `homeless`, `financial_review`, `pubpid`, `pid`, `genericname1`, `genericval1`, `genericname2`, `genericval2`, `hipaa_mail`, `hipaa_voice`, `hipaa_notice`, `hipaa_message`, `hipaa_allowsms`, `hipaa_allowemail`, `squad`, `fitness`, `referral_source`, `usertext1`, `usertext2`, `usertext3`, `usertext4`, `usertext5`, `usertext6`, `usertext7`, `usertext8`, `userlist1`, `userlist2`, `userlist3`, `userlist4`, `userlist5`, `userlist6`, `userlist7`, `pricelevel`, `regdate`, `contrastart`, `completed_ad`, `ad_reviewed`, `vfc`, `mothersname`, `guardiansname`, `allow_imm_reg_use`, `allow_imm_info_share`, `allow_health_info_ex`, `allow_patient_portal`, `deceased_date`, `deceased_reason`, `soap_import_status`, `cmsportal_login`, `care_team`, `county`, `industry`, `imm_reg_status`, `imm_reg_stat_effdate`, `publicity_code`, `publ_code_eff_date`, `protect_indicator`, `prot_indi_effdate`, `guardianrelationship`, `guardiansex`, `guardianaddress`, `guardiancity`, `guardianstate`, `guardianpostalcode`, `guardiancountry`, `guardianphone`, `guardianworkphone`, `guardianemail`, `tenant_id`, `location_uuid`, `bed_uuid`, `med_record`, `vital_uuid`, `date`, `discharge_date`, `disabled`, `associated_list`) VALUES
(747,	'Dr.',	NULL,	NULL,	'India-patient-1',	'One',	NULL,	'2022-07-08',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0355320212',	NULL,	0,	'active',	NULL,	'2022-06-22',	'female',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'patient0c176902-b636-4f52-8743-d71b507cf321',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'NO',	'NO',	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	NULL,	NULL,	'NO',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	NULL,	NULL,	'1123121112aa',	NULL,	'2022-06-06 06:14:51',	NULL,	1,	'[]'),
(745,	'Mr.',	NULL,	NULL,	'Himen',	'India',	NULL,	'2022-06-03',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'3500099885',	NULL,	0,	'active',	NULL,	'2022-06-03',	'male',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'patient49f476ac-62a9-4182-ac98-e2b0f96acfd5',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'NO',	'NO',	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	NULL,	NULL,	'NO',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	NULL,	NULL,	'0.236',	NULL,	'2022-06-03 06:38:58',	NULL,	1,	'[\"alphamed\"]'),
(737,	'Mr.',	NULL,	NULL,	'T.Patient',	'Test',	NULL,	'2022-06-03',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0355320212',	NULL,	0,	'active',	NULL,	'2022-06-03',	'male',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'patient4aa19741-ea6d-437d-954e-2108b4e19620',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'NO',	'NO',	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	NULL,	NULL,	'NO',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	NULL,	NULL,	'DISABLED',	NULL,	'2022-06-03 03:40:12',	'2022-06-17',	0,	'[]'),
(744,	'Mr.',	NULL,	NULL,	'Rakesh',	'India',	NULL,	'1987-07-06',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'1234211111',	NULL,	0,	'active',	NULL,	'2022-06-03',	'male',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'NO',	'NO',	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	NULL,	NULL,	'NO',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	NULL,	NULL,	'333-222-06',	NULL,	'2022-06-03 06:15:22',	NULL,	1,	'[\"alphamed\"]'),
(742,	'Mr.',	NULL,	NULL,	'GLORIA',	'FERNANDEZ',	NULL,	'1984-06-03',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'1234211111',	NULL,	0,	'active',	NULL,	'2022-06-03',	'male',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'patienta4c4e3a3-0727-4ed9-b865-62b452e7319a',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'NO',	'NO',	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	NULL,	NULL,	'NO',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	NULL,	NULL,	'333-222-03',	NULL,	'2022-06-03 04:17:31',	NULL,	1,	'[\"alphamed\",\"digital\"]'),
(743,	'Ms.',	NULL,	NULL,	'nguyet',	'test',	NULL,	'1988-06-03',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'1234211111',	NULL,	0,	'active',	NULL,	'2022-06-03',	'female',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'patienta8799480-7306-42a0-aa6a-46848de8c0a9',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'NO',	'NO',	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	NULL,	NULL,	'NO',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	NULL,	NULL,	'333-222-04',	NULL,	'2022-06-03 04:25:58',	NULL,	1,	'[\"alphamed\"]'),
(739,	'Mr.',	NULL,	NULL,	'Patient ',	'Three',	'DDD',	'2022-06-01',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0355320212',	NULL,	0,	'active',	NULL,	'2022-06-14',	'female',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'patientad1d31ca-5bea-4a99-8378-e535592ab402',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'NO',	'NO',	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	NULL,	NULL,	'NO',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	NULL,	NULL,	'DISABLED',	NULL,	'2022-06-03 03:49:01',	NULL,	0,	'[\"spo2\",\"temperature\"]'),
(748,	'Mr.',	NULL,	NULL,	'DREW',	'MEYER',	NULL,	'2022-06-06',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0365572875',	NULL,	0,	'active',	NULL,	'2022-06-06',	'male',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'patientc10c064c-fd5a-4ddc-85ca-1744d6104229',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'NO',	'NO',	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	NULL,	NULL,	'NO',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	NULL,	NULL,	'test01.2558',	NULL,	'2022-06-06 07:28:59',	NULL,	1,	'[\"alphamed\"]'),
(741,	'Mr.',	NULL,	NULL,	'STEVEN',	'FRIEDMAN',	NULL,	'1998-06-03',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'1234211111',	NULL,	0,	'active',	NULL,	'2022-06-03',	'male',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'patientd1ab78ce-dc24-472c-8538-e1510dfef545',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'NO',	'NO',	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	NULL,	NULL,	'NO',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	NULL,	NULL,	'333-222-02',	NULL,	'2022-06-03 04:16:54',	NULL,	1,	'[\"alphamed\"]'),
(746,	'Mrs.',	NULL,	NULL,	'TT',	'T',	NULL,	'2022-06-03',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'3400064935',	NULL,	0,	'active',	NULL,	'2022-06-03',	'female',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'patiente0d30617-22a2-4809-9f02-0714fedabab6',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'NO',	'NO',	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	NULL,	NULL,	'NO',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	NULL,	NULL,	'DISABLED',	NULL,	'2022-06-03 08:08:41',	NULL,	0,	'[\"spo2\"]'),
(738,	'Mr.',	NULL,	NULL,	'Patient ',	'asd',	NULL,	'2022-06-03',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0355320212',	NULL,	0,	'active',	NULL,	'2022-06-15',	'male',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'patiente63ad450-0720-4b45-8b65-ea8e6e4ebbde',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'NO',	'NO',	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	NULL,	NULL,	'NO',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	NULL,	NULL,	'DISABLED',	NULL,	'2022-06-03 03:43:52',	NULL,	0,	'[\"ecg\"]'),
(736,	'Mr.',	NULL,	NULL,	'D.Trieu',	'Nguyen',	'edi',	'1999-02-10',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0355320212',	NULL,	0,	'active',	NULL,	'2022-06-01',	'male',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'NO',	'NO',	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	NULL,	NULL,	'NO',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	NULL,	NULL,	'trieu_123',	NULL,	'2022-06-03 03:36:33',	'2022-06-08',	1,	'[\"ecg\",\"spo2\",\"gateway\",\"ihealth\",\"temperature\"]')
ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `title` = VALUES(`title`), `language` = VALUES(`language`), `financial` = VALUES(`financial`), `fname` = VALUES(`fname`), `lname` = VALUES(`lname`), `mname` = VALUES(`mname`), `DOB` = VALUES(`DOB`), `street` = VALUES(`street`), `postal_code` = VALUES(`postal_code`), `city` = VALUES(`city`), `state` = VALUES(`state`), `country_code` = VALUES(`country_code`), `idtype` = VALUES(`idtype`), `idnumber` = VALUES(`idnumber`), `occupation` = VALUES(`occupation`), `phone_home` = VALUES(`phone_home`), `phone_biz` = VALUES(`phone_biz`), `phone_contact` = VALUES(`phone_contact`), `phone_cell` = VALUES(`phone_cell`), `pharmacy_id` = VALUES(`pharmacy_id`), `status` = VALUES(`status`), `contact_relationship` = VALUES(`contact_relationship`), `admission_date` = VALUES(`admission_date`), `sex` = VALUES(`sex`), `referrer` = VALUES(`referrer`), `referrerID` = VALUES(`referrerID`), `providerID` = VALUES(`providerID`), `ref_providerID` = VALUES(`ref_providerID`), `email` = VALUES(`email`), `email_direct` = VALUES(`email_direct`), `ethnoracial` = VALUES(`ethnoracial`), `race` = VALUES(`race`), `ethnicity` = VALUES(`ethnicity`), `religion` = VALUES(`religion`), `interpretter` = VALUES(`interpretter`), `migrantseasonal` = VALUES(`migrantseasonal`), `family_size` = VALUES(`family_size`), `monthly_income` = VALUES(`monthly_income`), `billing_note` = VALUES(`billing_note`), `homeless` = VALUES(`homeless`), `financial_review` = VALUES(`financial_review`), `pubpid` = VALUES(`pubpid`), `pid` = VALUES(`pid`), `genericname1` = VALUES(`genericname1`), `genericval1` = VALUES(`genericval1`), `genericname2` = VALUES(`genericname2`), `genericval2` = VALUES(`genericval2`), `hipaa_mail` = VALUES(`hipaa_mail`), `hipaa_voice` = VALUES(`hipaa_voice`), `hipaa_notice` = VALUES(`hipaa_notice`), `hipaa_message` = VALUES(`hipaa_message`), `hipaa_allowsms` = VALUES(`hipaa_allowsms`), `hipaa_allowemail` = VALUES(`hipaa_allowemail`), `squad` = VALUES(`squad`), `fitness` = VALUES(`fitness`), `referral_source` = VALUES(`referral_source`), `usertext1` = VALUES(`usertext1`), `usertext2` = VALUES(`usertext2`), `usertext3` = VALUES(`usertext3`), `usertext4` = VALUES(`usertext4`), `usertext5` = VALUES(`usertext5`), `usertext6` = VALUES(`usertext6`), `usertext7` = VALUES(`usertext7`), `usertext8` = VALUES(`usertext8`), `userlist1` = VALUES(`userlist1`), `userlist2` = VALUES(`userlist2`), `userlist3` = VALUES(`userlist3`), `userlist4` = VALUES(`userlist4`), `userlist5` = VALUES(`userlist5`), `userlist6` = VALUES(`userlist6`), `userlist7` = VALUES(`userlist7`), `pricelevel` = VALUES(`pricelevel`), `regdate` = VALUES(`regdate`), `contrastart` = VALUES(`contrastart`), `completed_ad` = VALUES(`completed_ad`), `ad_reviewed` = VALUES(`ad_reviewed`), `vfc` = VALUES(`vfc`), `mothersname` = VALUES(`mothersname`), `guardiansname` = VALUES(`guardiansname`), `allow_imm_reg_use` = VALUES(`allow_imm_reg_use`), `allow_imm_info_share` = VALUES(`allow_imm_info_share`), `allow_health_info_ex` = VALUES(`allow_health_info_ex`), `allow_patient_portal` = VALUES(`allow_patient_portal`), `deceased_date` = VALUES(`deceased_date`), `deceased_reason` = VALUES(`deceased_reason`), `soap_import_status` = VALUES(`soap_import_status`), `cmsportal_login` = VALUES(`cmsportal_login`), `care_team` = VALUES(`care_team`), `county` = VALUES(`county`), `industry` = VALUES(`industry`), `imm_reg_status` = VALUES(`imm_reg_status`), `imm_reg_stat_effdate` = VALUES(`imm_reg_stat_effdate`), `publicity_code` = VALUES(`publicity_code`), `publ_code_eff_date` = VALUES(`publ_code_eff_date`), `protect_indicator` = VALUES(`protect_indicator`), `prot_indi_effdate` = VALUES(`prot_indi_effdate`), `guardianrelationship` = VALUES(`guardianrelationship`), `guardiansex` = VALUES(`guardiansex`), `guardianaddress` = VALUES(`guardianaddress`), `guardiancity` = VALUES(`guardiancity`), `guardianstate` = VALUES(`guardianstate`), `guardianpostalcode` = VALUES(`guardianpostalcode`), `guardiancountry` = VALUES(`guardiancountry`), `guardianphone` = VALUES(`guardianphone`), `guardianworkphone` = VALUES(`guardianworkphone`), `guardianemail` = VALUES(`guardianemail`), `tenant_id` = VALUES(`tenant_id`), `location_uuid` = VALUES(`location_uuid`), `bed_uuid` = VALUES(`bed_uuid`), `med_record` = VALUES(`med_record`), `vital_uuid` = VALUES(`vital_uuid`), `date` = VALUES(`date`), `discharge_date` = VALUES(`discharge_date`), `disabled` = VALUES(`disabled`), `associated_list` = VALUES(`associated_list`);

DROP TABLE IF EXISTS `patient_location_table`;
CREATE TABLE `patient_location_table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ChangeDate` date DEFAULT NULL,
  `current_date` datetime DEFAULT NULL,
  `location_uuid` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `location_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `bed_no` bigint(20) DEFAULT NULL,
  `pid` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `patient_medication_table`;
CREATE TABLE `patient_medication_table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` varchar(255) CHARACTER SET utf8 NOT NULL,
  `drug` json NOT NULL,
  `time_given` date NOT NULL,
  `internal_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `patient_portal_menu`;
CREATE TABLE `patient_portal_menu` (
  `patient_portal_menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_portal_menu_group_id` int(11) DEFAULT NULL,
  `menu_name` varchar(40) DEFAULT NULL,
  `menu_order` smallint(6) DEFAULT NULL,
  `menu_status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`patient_portal_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `patient_reminders`;
CREATE TABLE `patient_reminders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 if active and 0 if not active',
  `date_inactivated` datetime DEFAULT NULL,
  `reason_inactivated` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_reminder_inactive_opt',
  `due_status` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_reminder_due_opt',
  `pid` bigint(20) NOT NULL COMMENT 'id from patient_data table',
  `category` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the category item in the rule_action_item table',
  `item` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the item column in the rule_action_item table',
  `date_created` datetime DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `voice_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 if not sent and 1 if sent',
  `sms_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 if not sent and 1 if sent',
  `email_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 if not sent and 1 if sent',
  `mail_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 if not sent and 1 if sent',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `category` (`category`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `patient_tracker`;
CREATE TABLE `patient_tracker` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `apptdate` date DEFAULT NULL,
  `appttime` time DEFAULT NULL,
  `eid` bigint(20) NOT NULL DEFAULT '0',
  `pid` bigint(20) NOT NULL DEFAULT '0',
  `original_user` varchar(255) NOT NULL DEFAULT '' COMMENT 'This is the user that created the original record',
  `encounter` bigint(20) NOT NULL DEFAULT '0',
  `lastseq` varchar(4) NOT NULL DEFAULT '' COMMENT 'The element file should contain this number of elements',
  `random_drug_test` tinyint(1) DEFAULT NULL COMMENT 'NULL if not randomized. If randomized, 0 is no, 1 is yes',
  `drug_screen_completed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `eid` (`eid`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `patient_tracker_element`;
CREATE TABLE `patient_tracker_element` (
  `pt_tracker_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'maps to id column in patient_tracker table',
  `start_datetime` datetime DEFAULT NULL,
  `room` varchar(20) NOT NULL DEFAULT '',
  `status` varchar(31) NOT NULL DEFAULT '',
  `seq` varchar(4) NOT NULL DEFAULT '' COMMENT 'This is a numerical sequence for this pt_tracker_id events',
  `user` varchar(255) NOT NULL DEFAULT '' COMMENT 'This is the user that created this element',
  KEY `pt_tracker_id` (`pt_tracker_id`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NOT NULL DEFAULT '0',
  `dtime` datetime NOT NULL,
  `encounter` bigint(20) NOT NULL DEFAULT '0',
  `user` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `amount1` decimal(12,2) NOT NULL DEFAULT '0.00',
  `amount2` decimal(12,2) NOT NULL DEFAULT '0.00',
  `posted1` decimal(12,2) NOT NULL DEFAULT '0.00',
  `posted2` decimal(12,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `payment_gateway_details`;
CREATE TABLE `payment_gateway_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(100) DEFAULT NULL,
  `login_id` varchar(255) DEFAULT NULL,
  `transaction_key` varchar(255) DEFAULT NULL,
  `md5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `pharmacies`;
CREATE TABLE `pharmacies` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `transmit_method` int(11) NOT NULL DEFAULT '1',
  `email` varchar(255) DEFAULT NULL,
  `ncpdp` int(11) DEFAULT NULL,
  `npi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `phone_numbers`;
CREATE TABLE `phone_numbers` (
  `id` int(11) NOT NULL DEFAULT '0',
  `country_code` varchar(5) DEFAULT NULL,
  `area_code` char(3) DEFAULT NULL,
  `prefix` char(3) DEFAULT NULL,
  `number` varchar(4) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `foreign_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `foreign_id` (`foreign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `pnotes`;
CREATE TABLE `pnotes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `body` longtext,
  `pid` bigint(20) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `activity` tinyint(4) DEFAULT NULL,
  `authorized` tinyint(4) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `assigned_to` varchar(255) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0' COMMENT 'flag indicates note is deleted',
  `message_status` varchar(20) NOT NULL DEFAULT 'New',
  `portal_relation` varchar(100) DEFAULT NULL,
  `is_msg_encrypted` tinyint(4) DEFAULT '0' COMMENT 'Whether messsage encrypted 0-Not encrypted, 1-Encrypted',
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `practictioner_patient_map`;
CREATE TABLE `practictioner_patient_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `users_uuid` json DEFAULT NULL,
  `tenant_id` varchar(255) DEFAULT NULL,
  `archive` smallint(6) DEFAULT NULL,
  `primary` smallint(6) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `primary_consultant` json DEFAULT NULL,
  `secondary_consultant` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `prescriptions`;
CREATE TABLE `prescriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prescription_uuid` varchar(250) DEFAULT NULL,
  `filled_by_id` int(11) DEFAULT NULL,
  `pharmacy_id` int(11) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `encounter` int(11) DEFAULT NULL,
  `drug` json NOT NULL,
  `drug_uuid` int(11) DEFAULT '0',
  `rxnorm_drugcode` int(11) DEFAULT NULL,
  `form` varchar(250) DEFAULT NULL,
  `dosage` varchar(500) DEFAULT NULL,
  `quantity` varchar(31) DEFAULT NULL,
  `size` varchar(25) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `route` int(11) DEFAULT NULL,
  `interval` int(11) DEFAULT NULL,
  `substitute` int(11) DEFAULT NULL,
  `refills` int(11) DEFAULT NULL,
  `per_refill` int(11) DEFAULT NULL,
  `filled_date` date DEFAULT NULL,
  `medication` int(11) DEFAULT NULL,
  `note_uuid` varchar(255) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `date` datetime DEFAULT NULL,
  `prac_uuid` varchar(250) DEFAULT NULL,
  `site` varchar(50) DEFAULT NULL,
  `prescriptionguid` varchar(50) DEFAULT NULL,
  `erx_source` tinyint(4) DEFAULT '0' COMMENT '0-OpenEMR 1-External',
  `erx_uploaded` tinyint(4) DEFAULT '0' COMMENT '0-Pending NewCrop upload 1-Uploaded to NewCrop',
  `drug_info_erx` text,
  `external_id` varchar(20) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `indication` text,
  `prn` varchar(30) DEFAULT NULL,
  `ntx` int(11) DEFAULT NULL,
  `rtx` int(11) DEFAULT NULL,
  `txDate` date NOT NULL,
  `tenant_uuid` varchar(255) NOT NULL,
  `pid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`prescription_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `prices`;
CREATE TABLE `prices` (
  `pr_id` varchar(11) NOT NULL DEFAULT '',
  `pr_selector` varchar(255) NOT NULL DEFAULT '' COMMENT 'template selector for drugs, empty for codes',
  `pr_level` varchar(31) NOT NULL DEFAULT '',
  `pr_price` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT 'price in local currency',
  PRIMARY KEY (`pr_id`,`pr_selector`,`pr_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `procedure_answers`;
CREATE TABLE `procedure_answers` (
  `procedure_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references procedure_order.procedure_order_id',
  `procedure_order_seq` int(11) NOT NULL DEFAULT '0' COMMENT 'references procedure_order_code.procedure_order_seq',
  `question_code` varchar(31) NOT NULL DEFAULT '' COMMENT 'references procedure_questions.question_code',
  `answer_seq` int(11) NOT NULL COMMENT 'supports multiple-choice questions. answer_seq, incremented in code',
  `answer` varchar(255) NOT NULL DEFAULT '' COMMENT 'answer data',
  PRIMARY KEY (`procedure_order_id`,`procedure_order_seq`,`question_code`,`answer_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `procedure_order`;
CREATE TABLE `procedure_order` (
  `procedure_order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `provider_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references users.id, the ordering provider',
  `patient_id` bigint(20) NOT NULL COMMENT 'references patient_data.pid',
  `encounter_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references form_encounter.encounter',
  `date_collected` datetime DEFAULT NULL COMMENT 'time specimen collected',
  `date_ordered` date DEFAULT NULL,
  `order_priority` varchar(31) NOT NULL DEFAULT '',
  `order_status` varchar(31) NOT NULL DEFAULT '' COMMENT 'pending,routed,complete,canceled',
  `patient_instructions` text,
  `activity` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 if deleted',
  `control_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'This is the CONTROL ID that is sent back from lab',
  `lab_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references procedure_providers.ppid',
  `specimen_type` varchar(31) NOT NULL DEFAULT '' COMMENT 'from the Specimen_Type list',
  `specimen_location` varchar(31) NOT NULL DEFAULT '' COMMENT 'from the Specimen_Location list',
  `specimen_volume` varchar(30) NOT NULL DEFAULT '' COMMENT 'from a text input field',
  `date_transmitted` datetime DEFAULT NULL COMMENT 'time of order transmission, null if unsent',
  `clinical_hx` varchar(255) NOT NULL DEFAULT '' COMMENT 'clinical history text that may be relevant to the order',
  `external_id` varchar(20) DEFAULT NULL,
  `history_order` enum('0','1') DEFAULT '0' COMMENT 'references order is added for history purpose only.',
  `order_diagnosis` varchar(255) DEFAULT '' COMMENT 'primary order diagnosis',
  PRIMARY KEY (`procedure_order_id`),
  KEY `datepid` (`date_ordered`,`patient_id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `procedure_order_code`;
CREATE TABLE `procedure_order_code` (
  `procedure_order_id` bigint(20) NOT NULL COMMENT 'references procedure_order.procedure_order_id',
  `procedure_order_seq` int(11) NOT NULL COMMENT 'Supports multiple tests per order. Procedure_order_seq, incremented in code',
  `procedure_code` varchar(31) NOT NULL DEFAULT '' COMMENT 'like procedure_type.procedure_code',
  `procedure_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'descriptive name of the procedure code',
  `procedure_source` char(1) NOT NULL DEFAULT '1' COMMENT '1=original order, 2=added after order sent',
  `diagnoses` text COMMENT 'diagnoses and maybe other coding (e.g. ICD9:111.11)',
  `do_not_send` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = normal, 1 = do not transmit to lab',
  `procedure_order_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`procedure_order_id`,`procedure_order_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `procedure_providers`;
CREATE TABLE `procedure_providers` (
  `ppid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `npi` varchar(15) NOT NULL DEFAULT '',
  `send_app_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sending application ID (MSH-3.1)',
  `send_fac_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sending facility ID (MSH-4.1)',
  `recv_app_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'Receiving application ID (MSH-5.1)',
  `recv_fac_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'Receiving facility ID (MSH-6.1)',
  `DorP` char(1) NOT NULL DEFAULT 'D' COMMENT 'Debugging or Production (MSH-11)',
  `direction` char(1) NOT NULL DEFAULT 'B' COMMENT 'Bidirectional or Results-only',
  `protocol` varchar(15) NOT NULL DEFAULT 'DL',
  `remote_host` varchar(255) NOT NULL DEFAULT '',
  `login` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `orders_path` varchar(255) NOT NULL DEFAULT '',
  `results_path` varchar(255) NOT NULL DEFAULT '',
  `notes` text,
  `lab_director` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ppid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `procedure_questions`;
CREATE TABLE `procedure_questions` (
  `lab_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references procedure_providers.ppid to identify the lab',
  `procedure_code` varchar(31) NOT NULL DEFAULT '' COMMENT 'references procedure_type.procedure_code to identify this order type',
  `question_code` varchar(31) NOT NULL DEFAULT '' COMMENT 'code identifying this question',
  `seq` int(11) NOT NULL DEFAULT '0' COMMENT 'sequence number for ordering',
  `question_text` varchar(255) NOT NULL DEFAULT '' COMMENT 'descriptive text for question_code',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = required, 0 = not',
  `maxsize` int(11) NOT NULL DEFAULT '0' COMMENT 'maximum length if text input field',
  `fldtype` char(1) NOT NULL DEFAULT 'T' COMMENT 'Text, Number, Select, Multiselect, Date, Gestational-age',
  `options` text COMMENT 'choices for fldtype S and T',
  `tips` varchar(255) NOT NULL DEFAULT '' COMMENT 'Additional instructions for answering the question',
  `activity` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = active, 0 = inactive',
  PRIMARY KEY (`lab_id`,`procedure_code`,`question_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `procedure_report`;
CREATE TABLE `procedure_report` (
  `procedure_report_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `procedure_order_id` bigint(20) DEFAULT NULL COMMENT 'references procedure_order.procedure_order_id',
  `procedure_order_seq` int(11) NOT NULL DEFAULT '1' COMMENT 'references procedure_order_code.procedure_order_seq',
  `date_collected` datetime DEFAULT NULL,
  `date_collected_tz` varchar(5) DEFAULT '' COMMENT '+-hhmm offset from UTC',
  `date_report` datetime DEFAULT NULL,
  `date_report_tz` varchar(5) DEFAULT '' COMMENT '+-hhmm offset from UTC',
  `source` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references users.id, who entered this data',
  `specimen_num` varchar(63) NOT NULL DEFAULT '',
  `report_status` varchar(31) NOT NULL DEFAULT '' COMMENT 'received,complete,error',
  `review_status` varchar(31) NOT NULL DEFAULT 'received' COMMENT 'pending review status: received,reviewed',
  `report_notes` text COMMENT 'notes from the lab',
  PRIMARY KEY (`procedure_report_id`),
  KEY `procedure_order_id` (`procedure_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `procedure_result`;
CREATE TABLE `procedure_result` (
  `procedure_result_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `procedure_report_id` bigint(20) NOT NULL COMMENT 'references procedure_report.procedure_report_id',
  `result_data_type` char(1) NOT NULL DEFAULT 'S' COMMENT 'N=Numeric, S=String, F=Formatted, E=External, L=Long text as first line of comments',
  `result_code` varchar(31) NOT NULL DEFAULT '' COMMENT 'LOINC code, might match a procedure_type.procedure_code',
  `result_text` varchar(255) NOT NULL DEFAULT '' COMMENT 'Description of result_code',
  `date` datetime DEFAULT NULL COMMENT 'lab-provided date specific to this result',
  `facility` varchar(255) NOT NULL DEFAULT '' COMMENT 'lab-provided testing facility ID',
  `units` varchar(31) NOT NULL DEFAULT '',
  `result` varchar(255) NOT NULL DEFAULT '',
  `range` varchar(255) NOT NULL DEFAULT '',
  `abnormal` varchar(31) NOT NULL DEFAULT '' COMMENT 'no,yes,high,low',
  `comments` text COMMENT 'comments from the lab',
  `document_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references documents.id if this result is a document',
  `result_status` varchar(31) NOT NULL DEFAULT '' COMMENT 'preliminary, cannot be done, final, corrected, incomplete...etc.',
  PRIMARY KEY (`procedure_result_id`),
  KEY `procedure_report_id` (`procedure_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `procedure_type`;
CREATE TABLE `procedure_type` (
  `procedure_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references procedure_type.procedure_type_id',
  `name` varchar(63) NOT NULL DEFAULT '' COMMENT 'name for this category, procedure or result type',
  `lab_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references procedure_providers.ppid, 0 means default to parent',
  `procedure_code` varchar(31) NOT NULL DEFAULT '' COMMENT 'code identifying this procedure',
  `procedure_type` varchar(31) NOT NULL DEFAULT '' COMMENT 'see list proc_type',
  `body_site` varchar(31) NOT NULL DEFAULT '' COMMENT 'where to do injection, e.g. arm, buttock',
  `specimen` varchar(31) NOT NULL DEFAULT '' COMMENT 'blood, urine, saliva, etc.',
  `route_admin` varchar(31) NOT NULL DEFAULT '' COMMENT 'oral, injection',
  `laterality` varchar(31) NOT NULL DEFAULT '' COMMENT 'left, right, ...',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT 'descriptive text for procedure_code',
  `standard_code` varchar(255) NOT NULL DEFAULT '' COMMENT 'industry standard code type and code (e.g. CPT4:12345)',
  `related_code` varchar(255) NOT NULL DEFAULT '' COMMENT 'suggested code(s) for followup services if result is abnormal',
  `units` varchar(31) NOT NULL DEFAULT '' COMMENT 'default for procedure_result.units',
  `range` varchar(255) NOT NULL DEFAULT '' COMMENT 'default for procedure_result.range',
  `seq` int(11) NOT NULL DEFAULT '0' COMMENT 'sequence number for ordering',
  `activity` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active, 0=inactive',
  `notes` varchar(255) NOT NULL DEFAULT '' COMMENT 'additional notes to enhance description',
  PRIMARY KEY (`procedure_type_id`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `product_registration`;
CREATE TABLE `product_registration` (
  `registration_id` char(36) NOT NULL DEFAULT '',
  `email` varchar(255) DEFAULT NULL,
  `opt_out` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`registration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `product_warehouse`;
CREATE TABLE `product_warehouse` (
  `pw_drug_id` int(11) NOT NULL,
  `pw_warehouse` varchar(31) NOT NULL,
  `pw_min_level` float DEFAULT '0',
  `pw_max_level` float DEFAULT '0',
  PRIMARY KEY (`pw_drug_id`,`pw_warehouse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `registry`;
CREATE TABLE `registry` (
  `name` varchar(255) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `directory` varchar(255) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sql_run` tinyint(4) DEFAULT NULL,
  `unpackaged` tinyint(4) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `priority` int(11) DEFAULT '0',
  `category` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `patient_encounter` tinyint(4) NOT NULL DEFAULT '1',
  `therapy_group_encounter` tinyint(4) NOT NULL DEFAULT '0',
  `aco_spec` varchar(63) NOT NULL DEFAULT 'encounters|notes',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `data` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `report_itemized`;
CREATE TABLE `report_itemized` (
  `report_id` bigint(20) NOT NULL,
  `itemized_test_id` smallint(6) NOT NULL,
  `numerator_label` varchar(25) NOT NULL DEFAULT '' COMMENT 'Only used in special cases',
  `pass` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 is fail, 1 is pass, 2 is excluded',
  `pid` bigint(20) NOT NULL,
  KEY `report_id` (`report_id`,`itemized_test_id`,`numerator_label`,`pass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `report_results`;
CREATE TABLE `report_results` (
  `report_id` bigint(20) NOT NULL,
  `field_id` varchar(31) NOT NULL DEFAULT '',
  `field_value` text,
  PRIMARY KEY (`report_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_uuid` varchar(250) NOT NULL,
  `description` tinytext,
  `active` tinyint(4) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `content` text,
  `role_name` varchar(255) NOT NULL,
  `tenant_id` varchar(255) NOT NULL,
  `role_permission` json DEFAULT NULL,
  `categories_permission` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `rule_action`;
CREATE TABLE `rule_action` (
  `id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the id column in the clinical_rules table',
  `group_id` bigint(20) NOT NULL DEFAULT '1' COMMENT 'Contains group id to identify collection of targets in a rule',
  `category` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the category item in the rule_action_item table',
  `item` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the item column in the rule_action_item table',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `rule_action_item`;
CREATE TABLE `rule_action_item` (
  `category` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_action_category',
  `item` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_action',
  `clin_rem_link` varchar(255) NOT NULL DEFAULT '' COMMENT 'Custom html link in clinical reminder widget',
  `reminder_message` text COMMENT 'Custom message in patient reminder',
  `custom_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 indexed to rule_patient_data, 0 indexed within main schema',
  PRIMARY KEY (`category`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `rule_filter`;
CREATE TABLE `rule_filter` (
  `id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the id column in the clinical_rules table',
  `include_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 is exclude and 1 is include',
  `required_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 is required and 1 is optional',
  `method` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_filters',
  `method_detail` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options lists rule__intervals',
  `value` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `rule_patient_data`;
CREATE TABLE `rule_patient_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `pid` bigint(20) NOT NULL,
  `category` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the category item in the rule_action_item table',
  `item` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the item column in the rule_action_item table',
  `complete` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list yesno',
  `result` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `category` (`category`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `rule_reminder`;
CREATE TABLE `rule_reminder` (
  `id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the id column in the clinical_rules table',
  `method` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_reminder_methods',
  `method_detail` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_reminder_intervals',
  `value` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `rule_target`;
CREATE TABLE `rule_target` (
  `id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the id column in the clinical_rules table',
  `group_id` bigint(20) NOT NULL DEFAULT '1' COMMENT 'Contains group id to identify collection of targets in a rule',
  `include_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 is exclude and 1 is include',
  `required_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 is required and 1 is optional',
  `method` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_targets',
  `value` varchar(255) NOT NULL DEFAULT '' COMMENT 'Data is dependent on the method',
  `interval` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Only used in interval entries',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sequences`;
CREATE TABLE `sequences` (
  `id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `shared_attributes`;
CREATE TABLE `shared_attributes` (
  `pid` bigint(20) NOT NULL,
  `encounter` bigint(20) NOT NULL COMMENT '0 if patient attribute, else encounter attribute',
  `field_id` varchar(31) NOT NULL COMMENT 'references layout_options.field_id',
  `last_update` datetime NOT NULL COMMENT 'time of last update',
  `user_id` bigint(20) NOT NULL COMMENT 'user who last updated',
  `field_value` text,
  PRIMARY KEY (`pid`,`encounter`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `standardized_tables_track`;
CREATE TABLE `standardized_tables_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imported_date` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'name of standardized tables such as RXNORM',
  `revision_version` varchar(255) NOT NULL DEFAULT '' COMMENT 'revision of standardized tables that were imported',
  `revision_date` datetime DEFAULT NULL COMMENT 'revision of standardized tables that were imported',
  `file_checksum` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `supported_external_dataloads`;
CREATE TABLE `supported_external_dataloads` (
  `load_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `load_type` varchar(24) NOT NULL DEFAULT '',
  `load_source` varchar(24) NOT NULL DEFAULT 'CMS',
  `load_release_date` date NOT NULL,
  `load_filename` varchar(256) NOT NULL DEFAULT '',
  `load_checksum` varchar(32) NOT NULL DEFAULT '',
  UNIQUE KEY `load_id` (`load_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `syndromic_surveillance`;
CREATE TABLE `syndromic_surveillance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lists_id` bigint(20) NOT NULL,
  `submission_date` datetime NOT NULL,
  `filename` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `lists_id` (`lists_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `template_users`;
CREATE TABLE `template_users` (
  `tu_id` int(11) NOT NULL AUTO_INCREMENT,
  `tu_user_id` int(11) DEFAULT NULL,
  `tu_facility_id` int(11) DEFAULT NULL,
  `tu_template_id` int(11) DEFAULT NULL,
  `tu_template_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`tu_id`),
  UNIQUE KEY `templateuser` (`tu_user_id`,`tu_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tenant`;
CREATE TABLE `tenant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_name` varchar(500) NOT NULL,
  `tenant_uuid` varchar(256) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `therapy_groups`;
CREATE TABLE `therapy_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `group_start_date` date NOT NULL,
  `group_end_date` date DEFAULT NULL,
  `group_type` tinyint(4) NOT NULL,
  `group_participation` tinyint(4) NOT NULL,
  `group_status` int(11) NOT NULL,
  `group_notes` text,
  `group_guest_counselors` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `therapy_groups_counselors`;
CREATE TABLE `therapy_groups_counselors` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `therapy_groups_participants`;
CREATE TABLE `therapy_groups_participants` (
  `group_id` int(11) NOT NULL,
  `pid` bigint(20) NOT NULL,
  `group_patient_status` int(11) NOT NULL,
  `group_patient_start` date NOT NULL,
  `group_patient_end` date DEFAULT NULL,
  `group_patient_comment` text,
  PRIMARY KEY (`group_id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `therapy_groups_participant_attendance`;
CREATE TABLE `therapy_groups_participant_attendance` (
  `form_id` int(11) NOT NULL,
  `pid` bigint(20) NOT NULL,
  `meeting_patient_comment` text,
  `meeting_patient_status` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`form_id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `pid` bigint(20) DEFAULT NULL,
  `user` varchar(255) NOT NULL DEFAULT '',
  `groupname` varchar(255) NOT NULL DEFAULT '',
  `authorized` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `upgradegateway`;
CREATE TABLE `upgradegateway` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `upgradeDetails` json NOT NULL,
  `createdDate` date DEFAULT NULL,
  `tenant_uuid` varchar(255) DEFAULT NULL,
  `upgradeGatewayUUID` varchar(255) DEFAULT NULL COMMENT 'gate way id updated from SENSOR sevice',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `upgrademobile`;
CREATE TABLE `upgrademobile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upgradeDetails` json NOT NULL,
  `createdDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `tenant_uuid` varchar(255) NOT NULL,
  `upgradeMobileUUID` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` longtext,
  `authorized` tinyint(4) DEFAULT NULL,
  `info` longtext,
  `source` tinyint(4) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `mname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `suffix` varchar(255) DEFAULT NULL,
  `federaltaxid` varchar(255) DEFAULT NULL,
  `federaldrugid` varchar(255) DEFAULT NULL,
  `upin` varchar(255) DEFAULT NULL,
  `facility` varchar(255) DEFAULT NULL,
  `facility_id` int(11) NOT NULL DEFAULT '0',
  `see_auth` int(11) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `npi` varchar(15) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `specialty` varchar(255) DEFAULT NULL,
  `billname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_direct` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) DEFAULT NULL,
  `assistant` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `valedictory` varchar(255) DEFAULT NULL,
  `street` varchar(60) DEFAULT NULL,
  `streetb` varchar(60) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `street2` varchar(60) DEFAULT NULL,
  `streetb2` varchar(60) DEFAULT NULL,
  `city2` varchar(30) DEFAULT NULL,
  `state2` varchar(30) DEFAULT NULL,
  `zip2` varchar(20) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `phonew1` varchar(30) DEFAULT NULL,
  `phonew2` varchar(30) DEFAULT NULL,
  `phonecell` varchar(30) DEFAULT NULL,
  `notes` text,
  `cal_ui` tinyint(4) NOT NULL DEFAULT '1',
  `taxonomy` varchar(30) NOT NULL DEFAULT '207Q00000X',
  `calendar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = appears in calendar',
  `abook_type` varchar(31) NOT NULL DEFAULT '',
  `pwd_expiration_date` date DEFAULT NULL,
  `pwd_history1` longtext,
  `pwd_history2` longtext,
  `default_warehouse` varchar(31) NOT NULL DEFAULT '',
  `irnpool` varchar(31) NOT NULL DEFAULT '',
  `state_license_number` varchar(25) DEFAULT NULL,
  `weno_prov_id` varchar(15) DEFAULT NULL,
  `newcrop_user_role` varchar(30) DEFAULT NULL,
  `cpoe` tinyint(1) DEFAULT NULL,
  `physician_type` varchar(50) DEFAULT NULL,
  `main_menu_role` varchar(50) NOT NULL DEFAULT 'standard',
  `patient_menu_role` varchar(50) NOT NULL DEFAULT 'standard',
  `tenant_id` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `user_uuid` varchar(255) NOT NULL,
  `date` datetime DEFAULT NULL,
  `pid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `username`, `password`, `authorized`, `info`, `source`, `fname`, `mname`, `lname`, `suffix`, `federaltaxid`, `federaldrugid`, `upin`, `facility`, `facility_id`, `see_auth`, `active`, `npi`, `title`, `specialty`, `billname`, `email`, `email_direct`, `url`, `assistant`, `organization`, `valedictory`, `street`, `streetb`, `city`, `state`, `zip`, `street2`, `streetb2`, `city2`, `state2`, `zip2`, `phone`, `fax`, `phonew1`, `phonew2`, `phonecell`, `notes`, `cal_ui`, `taxonomy`, `calendar`, `abook_type`, `pwd_expiration_date`, `pwd_history1`, `pwd_history2`, `default_warehouse`, `irnpool`, `state_license_number`, `weno_prov_id`, `newcrop_user_role`, `cpoe`, `physician_type`, `main_menu_role`, `patient_menu_role`, `tenant_id`, `role`, `user_uuid`, `date`, `pid`) VALUES
(20,	'doctor',	'$2b$10$xnUE544lOqfC5v2uvRXjMerb.A.U.AEMfdTNe3C0HNSE1yW6a4DBu',	NULL,	NULL,	NULL,	'John',	'',	'Carry',	NULL,	NULL,	NULL,	NULL,	'Facility',	0,	1,	1,	NULL,	'Mr',	'Orthopedician',	NULL,	'doctor@demohospital.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'City',	'State',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9765185321',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	'Cardio',	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Doctor',	'user072fbb20-3320-4fc4-81cc-c590e5062ea3',	NULL,	''),
(189,	'nurse@demohospital.com',	'$2b$10$xnUE544lOqfC5v2uvRXjMerb.A.U.AEMfdTNe3C0HNSE1yW6a4DBu',	NULL,	NULL,	NULL,	'firstname',	NULL,	'LastName',	NULL,	NULL,	NULL,	NULL,	'Facility',	0,	1,	1,	NULL,	'Mr',	'Orthopedician',	NULL,	'nurse@demohospital.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'City',	'State',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9654321000',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	'Cardio',	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Nurse',	'user4ae7047e-1bfa-4408-8c22-148b6a6242d0',	'2021-07-09 08:48:10',	''),
(190,	'spatel@demohospital.com',	'$2b$10$yS35Xkuaw/5GZ7KvbSoFzujaCS7gIZYCoFT4UMIKKbn3v4LBoBKzi',	NULL,	NULL,	NULL,	'Salman',	NULL,	'Khan',	NULL,	NULL,	NULL,	NULL,	'Facility',	0,	1,	1,	NULL,	'Mr',	'Orthopedician',	NULL,	'spatel@demohospital.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'City',	'State',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9654321000',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	'Cardio',	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Admin',	'user7e7ec33f-360f-4bca-987e-73138009ccb9',	'2021-07-15 09:11:14',	''),
(191,	'UserName',	'$2b$10$s/DPEU17ywKl8KAg1pU/eOgwZOJhOaQvf5BE1xoOohTpbcBQ0aqGS',	NULL,	NULL,	NULL,	'firstname',	NULL,	'LastName',	NULL,	NULL,	NULL,	NULL,	'Facility',	0,	1,	1,	NULL,	'Mr',	'Orthopedician',	NULL,	'username@tenant.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'City',	'State',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9654321890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	'Cardio',	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Nurse',	'user10202753-be85-4aa3-a232-f73f0d5a9f74',	'2021-07-27 06:49:06',	''),
(192,	'UserName',	'$2b$10$q6NM3A2QuGmt5wScfDPQL.BTZpXOxJMA3cwA8KIB0qyqGPiAKse3q',	NULL,	NULL,	NULL,	'Azam',	NULL,	'LastName',	NULL,	NULL,	NULL,	NULL,	'Facility',	0,	1,	1,	NULL,	'Mr',	'Orthopedician',	NULL,	'username@tenant.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'City',	'State',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9654321890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	'Cardio',	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'doctor',	'user56e2179d-6db6-412c-806a-5ef425a34c32',	'2021-07-29 07:08:41',	''),
(193,	'Dewansh',	'$2b$10$jY3kzD3I3QPR/uG0MYEqIOumDOAJm42MM79yywl/7qoJWmrIR1aZS',	NULL,	NULL,	NULL,	'dewansh',	NULL,	'Patle',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mr',	NULL,	NULL,	'asdfadf@adsfdsf.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'1233456789',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Admin',	'user1f45d522-ba50-41d5-881f-43336eab44fe',	'2021-07-29 07:16:11',	''),
(194,	'Jimmy',	'$2b$10$K5Pki54Xzw2mTOHfiIfUguIQnlbv/FMwpMYkLwu8EqIQYaaZSLqjG',	NULL,	NULL,	NULL,	'firstname',	NULL,	'LastName',	NULL,	NULL,	NULL,	NULL,	'Facility',	0,	1,	1,	NULL,	'Mr',	'Orthopedician',	NULL,	'username@tenant.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'City',	'State',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9654321890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	'Cardio',	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'doctor',	'usere23c4bd8-57ad-4544-8411-f2f64499508f',	'2021-07-29 07:22:17',	''),
(195,	'doctor',	'$2b$10$rYywTLYRzeYJZOlhglslfe8Q6HqygBSG/sKw1t./mSfwFH5oygcp2',	NULL,	NULL,	NULL,	'Roman',	NULL,	'Templar',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mr',	NULL,	NULL,	'nurse@demohospital.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9886398863',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Doctor',	'usera555dfc1-0769-4cb6-9209-1b2b35a5ffef',	'2021-08-14 16:23:12',	''),
(196,	'Dewansh',	'$2b$10$xT9.Yxv2hzRKsVy/igArs.zrpOGZXl831cNOtozfM8vKmrPg9He2C',	NULL,	NULL,	NULL,	'firstname',	NULL,	'LastName',	NULL,	NULL,	NULL,	NULL,	'Facility',	0,	1,	1,	NULL,	'Mr',	'Orthopedician',	NULL,	'username@tenant.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'City',	'State',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9654321890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	'Cardio',	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'doctor',	'userbc3d1223-0e75-4d7d-a8d1-dc29a1337d72',	'2021-08-17 18:47:14',	''),
(197,	'Dewansh',	'$2b$10$alf6GdtM9Pkv2L7/GM5mbe27TYCFUeqv/r3HuQClRl4sjAAj/Ra8G',	NULL,	NULL,	NULL,	'firstname',	NULL,	'LastName',	NULL,	NULL,	NULL,	NULL,	'Facility',	0,	1,	1,	NULL,	'Mr',	'Orthopedician',	NULL,	'username@tenant.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'City',	'State',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9654321890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	'Cardio',	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'doctor',	'user2c13a6fd-c207-4cc6-89ad-42d3cbae5b13',	'2021-08-17 18:52:49',	''),
(198,	'UserName',	'$2b$10$xM0xIbI0.KS.OS8sfsihH.v5WUzzlfoKjhnCkfHd23unkoQZ4r6fq',	NULL,	NULL,	NULL,	'firstname',	NULL,	'LastName',	NULL,	NULL,	NULL,	NULL,	'Facility',	0,	1,	1,	NULL,	'Mr',	'Orthopedician',	NULL,	'username@tenant.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'City',	'State',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9654321890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	'Cardio',	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'doctor',	'userdb5e5f74-db85-40b9-9196-3168458901c8',	'2021-08-17 18:57:24',	''),
(199,	'nurse',	'$2b$10$CCsv8ATWwtySOXQOgSS/4eqD2qtNBWwyhoojpm8YzpBQUC5RWoyJ6',	NULL,	NULL,	NULL,	'Check',	NULL,	'LastName',	NULL,	NULL,	NULL,	NULL,	'Facility',	0,	1,	1,	NULL,	'Mr',	'Orthopedician',	NULL,	'nurse@demohospital.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'City',	'State',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9654321890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	'Cardio',	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Nurse',	'user25e4ffb3-470d-4300-a0aa-7e8495460c74',	'2021-08-17 19:01:34',	''),
(200,	'UserName',	'$2b$10$Bilf0eDdtcexdBtCpa9IM.Ce2aoMhr9lbXo.I3QUVVxZzL/pWftfe',	NULL,	NULL,	NULL,	'firstname',	NULL,	'LastName',	NULL,	NULL,	NULL,	NULL,	'Facility',	0,	1,	1,	NULL,	'Mr',	'Orthopedician',	NULL,	'username@tenant.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'City',	'State',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9654321890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	'Cardio',	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'doctor',	'user0e467762-0fad-497f-bbe4-c2446fde1c8a',	'2021-08-17 19:04:23',	''),
(201,	'spatel',	'$2b$10$gsXP327YZl77gzFQ2ynYbuhDrplxvJ1Mr1Yz46ehQuqpSYnLpc.pS',	NULL,	NULL,	NULL,	'firstname',	NULL,	'LastName',	NULL,	NULL,	NULL,	NULL,	'Facility',	0,	1,	1,	NULL,	'Mr',	'Orthopedician',	NULL,	'username@tenant.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'City',	'State',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9654321890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	'Cardio',	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'doctor',	'userf6cbefd3-2c3d-4e49-a73a-27d61ba6df6f',	'2021-08-17 19:08:29',	''),
(202,	'James8',	'$2b$10$0uB/YgVjnOyDL6MrwXyGBOMIL0mzREMtAvNISDoiot0oRFBGCyz52',	NULL,	NULL,	NULL,	'firstname',	NULL,	'LastName',	NULL,	NULL,	NULL,	NULL,	'Facility',	0,	1,	1,	NULL,	'Mr',	'Orthopedician',	NULL,	'username@tenant.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'City',	'State',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9654321890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	'Cardio',	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'doctor',	'user66369148-4acb-4262-a001-d8b6bdaa2400',	'2021-08-17 19:11:28',	''),
(203,	'Jimmy',	'$2b$10$GmGCC/k9lD/g.Q2E3mP2ful2AoOGFsNxe3hXbOmo.hN.vPxPn98mq',	NULL,	NULL,	NULL,	'Saul',	NULL,	'Goodman',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mr',	NULL,	NULL,	'asdfadf@adsfdsf.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'1233456789',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Admin',	'usera752d686-2b9c-423e-be3f-bd3703eeb0da',	'2021-08-18 10:15:37',	''),
(204,	'checking',	'$2b$10$b4eEi3JLXacNPFQy7Wl0QeU56emRAnG.pNJyrQOwviz5GGTGMZCUK',	NULL,	NULL,	NULL,	'Check',	NULL,	'LastName',	NULL,	NULL,	NULL,	NULL,	'Facility',	0,	1,	1,	NULL,	'Mr',	'Orthopedician',	NULL,	'username@tenant.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'City',	'State',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9654321890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	'Cardio',	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'doctor',	'user9881e408-d227-4aaa-8f90-ad2c8db0cebc',	'2021-08-19 06:46:07',	''),
(205,	'harry',	'$2b$10$DKNeZilp2SYxHrFY0/J/q.ohjkx9D5zds0SXCxhsCjrVLQETcVPrK',	NULL,	NULL,	NULL,	'Check',	NULL,	'LastName',	NULL,	NULL,	NULL,	NULL,	'Facility',	0,	1,	1,	NULL,	'Mr',	'Orthopedician',	NULL,	'username@tenant.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'City',	'State',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9654321890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	'Cardio',	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'doctor',	'user38ddf388-cf6e-42c6-9631-4492258bf924',	'2021-08-19 06:48:21',	''),
(206,	'UserName',	'$2b$10$ijWPD7A8ZcN/HRs.dErmuOhSqfyRVK9/z0wzjXJbKPSCCYHQtSk5y',	NULL,	NULL,	NULL,	'firstname',	NULL,	'LastName',	NULL,	NULL,	NULL,	NULL,	'Facility',	0,	1,	1,	NULL,	'Mr',	'Orthopedician',	NULL,	'username@tenant.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'City',	'State',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9654321890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	'Cardio',	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'doctor',	'user65ef7b17-bc45-4ed6-8ea9-9d8f312d6c24',	'2021-08-24 18:20:29',	''),
(207,	'admin',	'$2b$10$PLEUIIjJ6HLa.3Fnj12gHert9Qep1fP6zuJqS5xzeNLLO/BEijmCm',	NULL,	NULL,	NULL,	'Mathur',	NULL,	'Forester',	NULL,	NULL,	NULL,	NULL,	'Facility',	0,	1,	1,	NULL,	'Mr',	'Orthopedician',	NULL,	'admin@demohospital.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'City',	'State',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9654321890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	'Cardio',	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Admin',	'user3cb8f982-9f58-4778-bca7-e72c671f8329',	'2021-08-24 18:33:19',	''),
(208,	'aaaa@MB1.com',	'$2b$10$ckcCXRsNwFDXv3HQx2hClOd1dsdhAHuf9/7UCina3nSdUvOJw3sS6',	NULL,	NULL,	NULL,	'aa',	NULL,	'aa',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mr',	NULL,	NULL,	NULL,	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'1234567890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Doctor',	'user1df57d90-dc2d-4a58-96d7-edb6e067681c',	'2021-08-25 02:03:39',	''),
(209,	'trewq',	'$2b$10$EydRpSNnaPpIjOBjfl5SUuci1Cyyg4VYkyTr.sLRvHN14uw5TuLNK',	NULL,	NULL,	NULL,	'Mitsi',	NULL,	'Nohara',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mrs',	NULL,	NULL,	'sasukeUchiha@gmail.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'1234567890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Nurse',	'user8be04631-d7de-4076-9513-960fcd492eb6',	'2021-08-25 10:07:13',	''),
(210,	'poiuy',	'$2b$10$y499L//Nq5OZdzSwBXw1SeGfLUFVwT3LKq8VKwVwSejm5w7fVg3Zu',	NULL,	NULL,	NULL,	'Hiroshi',	NULL,	'Nohara',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mr',	NULL,	NULL,	'keUchiha@gmail.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'1234567890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Doctor',	'user6078f440-f9d6-4f3c-9f39-6957465f6e44',	'2021-08-25 10:10:12',	''),
(211,	'Doga',	'$2b$10$gjwQrshscaZ/ey/IEbhE4.TzHFXz4rGdlFMJ.kpxHYyQyij55G.gW',	NULL,	NULL,	NULL,	'Karoshi',	NULL,	'Nohara',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mr',	NULL,	NULL,	'keUa@gmail.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'1234567890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Nurse',	'user5e471c1c-716c-4c4b-86c9-42d4abee0d2c',	'2021-08-25 10:26:53',	''),
(212,	'Spiderman',	'$2b$10$Tz28ZiaAzSSh73mjuoGYTOWUvZ3y.gj3JoLTDdB/F3X3ck2cJZk7a',	NULL,	NULL,	NULL,	'Peter',	NULL,	'Parker',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mr',	NULL,	NULL,	'asdfasdf@gmail.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'1234567899',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8b50fd47-5ddb-4d3a-a52d-a0475a9ee5eb',	'Admin',	'user8504d45e-e6fd-45bf-8e94-295fb92cfd03',	'2021-08-25 12:02:18',	''),
(213,	'konoha',	'$2b$10$fiEzFtN6ILgD2mV9K7mSL.55nTPH83FT.RCTkNk9OK3dOxGh0vh.e',	NULL,	NULL,	NULL,	'Ninja',	NULL,	'Hatori',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mr',	NULL,	NULL,	'Hanzohatori@gmail.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'1234567890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant2facb3e8-18c9-4310-9a58-426c441734fb',	'SuperAdmin',	'user5c8a8ab8-307c-4822-8937-b95e78fd1423',	'2021-08-26 18:56:11',	''),
(214,	'admin@tagTest.com',	'$2b$10$gco3lKh5P2k97QFUkruLguk6aMnNb9DeGphviI2tHQ5mE5c1drf/u',	NULL,	NULL,	NULL,	'admin',	NULL,	'admin',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mr',	NULL,	NULL,	'admin@tagTest.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'1234567890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant9f27c903-7054-4e61-b50f-7d4f85fd6604',	'Doctor',	'userb81368d9-8cab-4723-8ca8-49686488771e',	'2021-08-27 14:52:13',	''),
(215,	'superadmin@demohospital.com',	'$2b$10$3q.BgYxkJrqztKNJL4yujOpUNyojp5ZPXkQcW/P2wMYLxQlQ20oKa',	NULL,	NULL,	NULL,	'superadmin',	NULL,	'superadmin',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mr',	NULL,	NULL,	'superadmin@demohospital.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'1234567890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'SuperAdmin',	'user03e58014-3992-4c75-9b8d-42146c463f77',	'2021-08-27 19:07:36',	''),
(216,	'awe',	'$2b$10$RFSEZyQADej7nMplDFL2EuSCedEZEbgergidx8HsgvY8/Y28Gw/jK',	NULL,	NULL,	NULL,	'firstname',	NULL,	'LastName',	NULL,	NULL,	NULL,	NULL,	'Facility',	0,	1,	1,	NULL,	'Mr',	'Orthopedician',	NULL,	'username@tenant.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'City',	'State',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9654321890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	'Cardio',	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'123',	'usercd9d8b08-78ed-4be6-9e52-45fba4d6c24d',	'2021-08-28 20:00:09',	''),
(217,	'Kevin',	'$2b$10$qZzDFDkbDqrP/Q.ZU1/qquWGrKeZmMlAD/I/wBDzIHztjE4O6biYm',	NULL,	NULL,	NULL,	'Kevin',	NULL,	'Pie',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mr',	NULL,	NULL,	'kevin@demohospital.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9876543210',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'SuperAdmin',	'usera2981bc9-5696-4ea7-8c60-6c46759cfd04',	'2021-08-28 20:29:45',	''),
(218,	'superadmin@mjrhospital.com',	'$2b$10$VxhIWwNMbTG1NmwxaUerxeiaayBvbuRDL0wnfD6iyuY3kNKOmGIsm',	NULL,	NULL,	NULL,	'Brad',	NULL,	'Pitt',	NULL,	NULL,	NULL,	NULL,	'Facility',	0,	1,	1,	NULL,	'Mr',	'Orthopedician',	NULL,	'superadmin@mjrjospital.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'City',	'State',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9654321890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	'Cardio',	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'SuperAdmin',	'user82477e03-239d-4f21-a7ba-6103a5a549ad',	'2021-09-19 13:35:56',	''),
(219,	'xy',	'$2b$10$4bGObvHdFMXd/dUXWTlS..pPk4TEB1h142ozunUyc0udFuUctvOQS',	NULL,	NULL,	NULL,	'x',	NULL,	'y',	NULL,	NULL,	NULL,	NULL,	'Facility',	0,	1,	1,	NULL,	'Mr',	'derma',	NULL,	'xy@xy.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'ny',	'ny',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'3164975280',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	'derma',	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'doctor',	'useraa21414f-d5f7-4f1a-a24d-93d3ea77f3eb',	'2021-09-25 11:23:30',	''),
(220,	'ThomasCarl',	'$2b$10$OkGhw390IZwcdIwFdIw/A.LsQozXEkCESf13qUmi2fIVXcpvPzOCi',	NULL,	NULL,	NULL,	'Thomas',	NULL,	'Carlton',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mr.',	NULL,	NULL,	'Thomas@birkbanks.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'1346795628',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Doctor',	'user87f90005-e847-48dc-8e78-460d0227ab88',	'2021-09-25 11:31:03',	''),
(221,	'madzrima',	'$2b$10$lvwpUnt3XqrWdP7HbsMo6O9OmfJ4VECzrlKWKIzTiIw8jiNsvolWW',	NULL,	NULL,	NULL,	'Mad',	NULL,	'Rim',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mr',	NULL,	NULL,	'madrim@narayana.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'1234567899',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'',	'Doctor',	'userc59be7b7-0550-445f-9e66-6b814d253a43',	'2021-09-25 17:40:53',	''),
(222,	'UserName',	'$2b$10$nuaugxwCJr6m4QyysxGxNeFzrTARp/YFh7mRbSaImr1No1Izkl/Ia',	NULL,	NULL,	NULL,	'firstname',	NULL,	'LastName',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mr',	NULL,	NULL,	'username@tenant.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9654321890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'doctor',	'userc890d92e-69f5-489e-a89d-fb06aa3dec6b',	'2021-09-26 10:56:20',	''),
(223,	'gillsstephanny',	'$2b$10$cL8X1RLeNuB3hkMExVB3/enoB4e.0gsrd67igJJP/eF8HxR8IqBTi',	NULL,	NULL,	NULL,	'stephanny',	NULL,	'gills',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mrs',	NULL,	NULL,	'gills@demo.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'7894561123',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Nurse',	'user4df52c7b-5a2b-4a44-9810-cbe52540cab6',	'2021-09-26 11:02:09',	''),
(224,	'UserName',	'$2b$10$TM5ZIZ0jR8fYn1nA0SpMTuA5vU3yMkuZW2tuYzbydDwPFJ1wQMote',	NULL,	NULL,	NULL,	'firstname',	NULL,	'LastName',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mr',	NULL,	NULL,	'username@tenant.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9654321890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'doctor',	'user1c79a271-28bb-4fa0-af9e-5d49fc39e407',	'2021-09-26 11:44:33',	''),
(225,	'UserName',	'$2b$10$FtrIvA/DKRcCzgFVP3GcNO2QPmSHVyeNk8N728jwpDqrIUAu5DXaC',	NULL,	NULL,	NULL,	'firstname',	NULL,	'LastName',	NULL,	NULL,	NULL,	NULL,	'Facility',	0,	1,	1,	NULL,	'Mr',	'Orthopedician',	NULL,	'username@tenant.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'City',	'State',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9654321890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	'Cardio',	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'doctor',	'user700c239e-1d23-409a-8f2d-d0eda849af3b',	'2021-09-26 11:57:42',	''),
(226,	'UserName',	'$2b$10$G8X9MOh1cp4wEN8sQVmmyeb3mAvnk2T7xJnr2nTo40aovbYDzQYOe',	NULL,	NULL,	NULL,	'firstname',	NULL,	'LastName',	NULL,	NULL,	NULL,	NULL,	'Facility',	0,	1,	1,	NULL,	'Mr',	'Orthopedician',	NULL,	'superadmin@checkhospital.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'City',	'State',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'9654321890',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	'Cardio',	'standard',	'standard',	'tenantf1b7b6c7-0cac-4243-9b7d-efc0c1358fe0',	'SuperAdmin',	'userfdab60fb-3b7b-47f0-9846-b2eaacf6ad2c',	'2021-09-27 06:23:09',	''),
(227,	'xyzzyx',	'$2b$10$6rYOehjPYshvDVaJI6URC.4Hr5uoTqb5axSYSWpxAo7aiICcWDvXi',	NULL,	NULL,	NULL,	'wxyz',	NULL,	'xyz',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mr',	NULL,	NULL,	'xyz@demo.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'1234567123',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Nurse',	'user7f97005b-45fd-4b82-b68c-eb30602b26ff',	'2021-09-27 06:37:37',	''),
(228,	'xyz',	'$2b$10$ZUw9USA5SmDClUaY7T4BLOtPzHHkKpecjJkHRpsIQU4MjV9YkvyDa',	NULL,	NULL,	NULL,	'xyz',	NULL,	'xyz',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mr',	NULL,	NULL,	'xyz@demo.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'1234567000',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Doctor',	'user4ef24fa1-663b-446a-a6ea-550f770e631f',	'2021-09-27 17:01:06',	''),
(229,	'jamie',	'$2b$10$cXovlSPWeD6kciUapkvRK.0HiOkAQahv0kK8E5mqOFMXsJmBGXcZS',	NULL,	NULL,	NULL,	'james',	NULL,	'smith',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mr.',	NULL,	NULL,	'jamessmith@demo.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'7894561000',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Doctor',	'usera2f497ef-90b0-40f7-acc1-71b62134c02b',	'2021-09-28 09:09:49',	''),
(230,	'xyzxyz',	'$2b$10$SX0xmZdUBtygRmA9BWimme0yP.5wntKg3fD5h2Tabdr1MiXut7lLu',	NULL,	NULL,	NULL,	'xyz',	NULL,	'xyz',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mr',	NULL,	NULL,	'xyz@demo.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'1234567000',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenantaafe7cfd-0fe2-4a47-9430-5c6052f86185',	'Doctor',	'userad2094ef-fc64-4a90-92f0-e2ada5ab721e',	'2021-10-03 15:45:07',	''),
(231,	'willams',	'$2b$10$IFxf0p9ZFNjS5dwBQ6Lusu4WUOVavr8jHsVwclC3oYhyUtFT0uNwy',	NULL,	NULL,	NULL,	'serena',	NULL,	'williams',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mrs',	NULL,	NULL,	'serena@demo.com',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'4567981235',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenantaafe7cfd-0fe2-4a47-9430-5c6052f86185',	'Doctor',	'usera06bd4f0-4fdc-4de8-be18-ff6157828a38',	'2021-10-08 07:25:55',	''),
(250,	'teddy2022-04-15@undefined',	'$2b$10$.T67uq8lbHll4ZijKs2Aze8c1ABPMdBOBcA7ts4uV0WlkXwJkpr/C',	NULL,	NULL,	NULL,	'teddy',	NULL,	'bear',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mrs.',	NULL,	NULL,	'teddy2022-04-15@undefined',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0031654656',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Patient',	'user6308b02a-c4fd-4731-bab1-8dad267e77f0',	'2022-04-15 08:08:49',	'patient140ef20f-187e-4593-8422-a19ba2e0d4c7'),
(251,	'teddy2022-04-15@undefined',	'$2b$10$4C003o1AQGGzp4Wf/cFJne7udixtxtzm2BZOWDjO7LoFDbuUjetSC',	NULL,	NULL,	NULL,	'teddy',	NULL,	'bear',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mrs.',	NULL,	NULL,	'teddy2022-04-15@undefined',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0031654656',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Patient',	'user4fbd1e7d-33a7-42df-bba1-19f878d767ab',	'2022-04-15 09:04:03',	'patient4afda2af-22df-4c56-8b9c-7db456027045'),
(252,	'teddy2022-04-15@undefined',	'$2b$10$DMDm0by9Rs1X4Qv0aN6XseoC94/iAl0.GiKyB1LNmegPdOxmy23Oi',	NULL,	NULL,	NULL,	'teddy',	NULL,	'bear',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mrs.',	NULL,	NULL,	'teddy2022-04-15@undefined',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0031654656',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Patient',	'userc8a0139d-5c66-417c-a9e2-3524b1b2bb38',	'2022-04-15 09:04:46',	'patientc6bcec26-a7cf-45a0-aa79-0e2cc137cc9f'),
(253,	'teddy2022-04-15@undefined',	'$2b$10$d6huVL1XAdY5Le2Pn7ymfOHVkktFVOogM/Ls5L/JGVsh51lhbHhxq',	NULL,	NULL,	NULL,	'teddy',	NULL,	'bear',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mrs.',	NULL,	NULL,	'teddy2022-04-15@undefined',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0031654656',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Patient',	'userda656edc-561a-4846-84e4-5277ec821509',	'2022-04-15 09:06:33',	'patient59cc6353-1858-4f80-913e-21c8f318468f'),
(254,	'teddy2022-04-15@undefined',	'$2b$10$xiRZo7sdQg2Rc0Tef222Kuvr7FQwLOsYrsFTNKL1bxvsEUPBJvgY6',	NULL,	NULL,	NULL,	'teddy',	NULL,	'bear',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mrs.',	NULL,	NULL,	'teddy2022-04-15@undefined',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0031654656',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Patient',	'userf0cd90b0-9fcb-4a8b-95ea-5db2b56368ab',	'2022-04-15 09:07:07',	'patient61ce218b-ee4c-4363-9829-0c0dd6901a52'),
(255,	'teddy2022-04-15@undefined',	'$2b$10$tmi6sfFKIW1.gM/lccKwLOhvVb1EjRyq7OHP.9ICVlJwzNp2qlJlq',	NULL,	NULL,	NULL,	'teddy',	NULL,	'bear',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mrs.',	NULL,	NULL,	'teddy2022-04-15@undefined',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0031654656',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Patient',	'user254e6908-6875-4f33-a3fa-f2a328816549',	'2022-04-15 09:08:49',	'patiente4232ae2-d1a0-42e1-98cc-c0b5e3b30d19'),
(256,	'teddy2022-04-15@undefined',	'$2b$10$gGpmc1eZV9MIZN2r2hPzMu0zsMCcCeYqeH0fdVKnbzR4eOAfgHEMG',	NULL,	NULL,	NULL,	'teddy',	NULL,	'bear',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mrs.',	NULL,	NULL,	'teddy2022-04-15@undefined',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0031654656',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Patient',	'userc153b41e-b158-41d0-8312-01cf487a14fc',	'2022-04-15 09:10:44',	'patientb3288628-43f5-424a-957e-382e86a1202f'),
(257,	'teddy2022-04-15@undefined',	'$2b$10$.BO.Ejxsf/K/5Ezm4YmcAORD1Ws6nEaKd51mIEVHLSPXyzsTmvTeK',	NULL,	NULL,	NULL,	'teddy',	NULL,	'bear',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mrs.',	NULL,	NULL,	'teddy2022-04-15@undefined',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0031654656',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Patient',	'user18a625b9-541e-480f-b048-6d6776ac9f68',	'2022-04-15 09:12:08',	'patientfe18df81-6351-4066-852f-46a0bed4ff28'),
(258,	'teddy2022-04-15@undefined',	'$2b$10$dnBa.YrnmT9ptbhM44xIvOiXXpvo9e8NSXQ4j0jHiu3KyC8MuWonO',	NULL,	NULL,	NULL,	'teddy',	NULL,	'bear',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mrs.',	NULL,	NULL,	'teddy2022-04-15@undefined',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0031654656',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Patient',	'userb2c36ed7-6123-4c26-a636-64da3b29e5f4',	'2022-04-15 09:14:43',	'patientf4c5fe02-3d2d-48b6-918b-3062825417bd'),
(259,	'teddy2022-04-18@undefined',	'$2b$10$Petl6Y7f5KEuzrajt7JtI.ayZWl4MIM7x.4LeQZ.w9fwR2yx.Crhu',	NULL,	NULL,	NULL,	'teddy',	NULL,	'bear',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mx.',	NULL,	NULL,	'teddy2022-04-18@undefined',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0031654656',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Patient',	'user64407094-88a0-4cc0-a89a-8183a5b01719',	'2022-04-18 08:06:13',	'patienta0c2501b-96c2-4b53-bd0a-b9b2f93d55c4'),
(260,	'teddy2022-04-18@undefined',	'$2b$10$IJd8Sss1hnq.hWg3Khwg..Wq1J6sQBBP.T54ebYvXHL6FIGaKHS5.',	NULL,	NULL,	NULL,	'teddy',	NULL,	'bear',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mx.',	NULL,	NULL,	'teddy2022-04-18@undefined',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0031654656',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Patient',	'user68e57eb8-43ba-4ca1-83e2-dab61c67c870',	'2022-04-18 08:22:30',	'patientf8945c7d-7e2b-4aae-8c0c-7ef85a8f79f8'),
(265,	'teddy2022-04-19@undefined',	'$2b$10$vSQgTxf7FqYxkxAmRYhXxOnvgoFBE2PFJx7BMyuJzPOSy9vu92S1m',	NULL,	NULL,	NULL,	'teddy',	NULL,	'bear',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Ms.',	NULL,	NULL,	'teddy2022-04-19@undefined',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'4567758123',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Patient',	'userb08b8ac8-2202-4b92-b811-fee44b6f5095',	'2022-04-19 07:46:03',	'patientacc89309-11c4-4acb-84af-717fcb26ef24'),
(266,	'teddy2022-04-20@undefined',	'$2b$10$AZ92lGjncLiw61gNm35/Eu5Nmbdii5ak72o1vJe3iDGffeGaW/Gw6',	NULL,	NULL,	NULL,	'teddy',	NULL,	'bear',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Miss',	NULL,	NULL,	'teddy2022-04-20@undefined',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0031654656',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Patient',	'user6e2a12fb-debb-4256-9235-2ddebb5413a9',	'2022-04-20 02:34:08',	'patient1fccb1fd-9f68-4dd3-8945-73d3f62fc80d'),
(267,	'teddy2022-04-20@undefined',	'$2b$10$cNztTp3UTZaqbCM5xLuTlOjaQNZUUjCvcreeeyb9Jxm2d/jG0Zow.',	NULL,	NULL,	NULL,	'teddy',	NULL,	'Last Name',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Dr.',	NULL,	NULL,	'teddy2022-04-20@undefined',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0031654656',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Patient',	'user62dc54ea-62d8-4a0d-bdb9-d9dd7341e5a6',	'2022-04-20 03:52:27',	'patientdb64742d-1e2b-467e-bfbb-39c3f1c70f75'),
(269,	'teddy2022-04-21@undefined',	'$2b$10$wFAx3zqTfbz2KA0Cdii.becwMGfhQy7aXmf8tNI/WSwy4Ixn8B2e6',	NULL,	NULL,	NULL,	'teddy',	NULL,	'bear',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Master',	NULL,	NULL,	'teddy2022-04-21@undefined',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0031654656',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Patient',	'user0cfd1582-c8d0-447a-a572-736fa057385a',	'2022-04-21 07:23:41',	'patientd16a7f64-4302-48d0-ae72-bc95c1828843'),
(270,	'teddy2022-04-22@undefined',	'$2b$10$TDcTwfDrgDL9jmlFadyY9u6iyfEVfxTAL.1fvH.i8hXIsDL5R3Dvy',	NULL,	NULL,	NULL,	'teddy',	NULL,	'the bear',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mx.',	NULL,	NULL,	'teddy2022-04-22@undefined',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0031654656',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Patient',	'user1d3fc598-6825-4751-a134-cae464483064',	'2022-04-22 06:57:58',	'patient19fed735-8e8e-40e1-a850-a99bd5ffd8f3'),
(271,	'teddy2022-04-22@undefined',	'$2b$10$Hc1AcVbGGgZ9YZ9Ixz5B3uOByxwCVuAZDPsSyoTWc0iUuZG.ubw3S',	NULL,	NULL,	NULL,	'teddy',	NULL,	'the bear',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mrs.',	NULL,	NULL,	'teddy2022-04-22@undefined',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0031654656',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Patient',	'user94542e9d-2291-4eca-9bbb-623954600d36',	'2022-04-22 07:22:55',	'patient830bce00-2fa7-4a22-8ab6-8d5c30c10650'),
(272,	'teddy2022-04-22@undefined',	'$2b$10$ZGqTxStygB5r8Wtnq77Eh./GzpKYCm77zgWEWhKj/ZGgwbZUAgmau',	NULL,	NULL,	NULL,	'teddy',	NULL,	'the bear',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Mrs.',	NULL,	NULL,	'teddy2022-04-22@undefined',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0031654656',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Patient',	'useraddfbd86-233b-43a7-821a-dd4124230b19',	'2022-04-22 09:23:28',	'patientbba0f682-e15e-48eb-bf5b-4128158740f0'),
(273,	'teddy2022-04-25@undefined',	'$2b$10$BtEFpfsrfA2Vgvo/hd4HPekpeAmzGTLKg5jwKS7uDzgVZNQ6O1D8O',	NULL,	NULL,	NULL,	'teddy',	NULL,	'the bear',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	'Miss',	NULL,	NULL,	'teddy2022-04-25@undefined',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0031654656',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'207Q00000X',	0,	'',	NULL,	NULL,	NULL,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'standard',	'standard',	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'Patient',	'user35bc596f-fba5-4abb-a5c5-704710a28174',	'2022-04-25 01:42:41',	'patient3dcbacf4-2c63-4377-9917-b29bb344190d')
ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `username` = VALUES(`username`), `password` = VALUES(`password`), `authorized` = VALUES(`authorized`), `info` = VALUES(`info`), `source` = VALUES(`source`), `fname` = VALUES(`fname`), `mname` = VALUES(`mname`), `lname` = VALUES(`lname`), `suffix` = VALUES(`suffix`), `federaltaxid` = VALUES(`federaltaxid`), `federaldrugid` = VALUES(`federaldrugid`), `upin` = VALUES(`upin`), `facility` = VALUES(`facility`), `facility_id` = VALUES(`facility_id`), `see_auth` = VALUES(`see_auth`), `active` = VALUES(`active`), `npi` = VALUES(`npi`), `title` = VALUES(`title`), `specialty` = VALUES(`specialty`), `billname` = VALUES(`billname`), `email` = VALUES(`email`), `email_direct` = VALUES(`email_direct`), `url` = VALUES(`url`), `assistant` = VALUES(`assistant`), `organization` = VALUES(`organization`), `valedictory` = VALUES(`valedictory`), `street` = VALUES(`street`), `streetb` = VALUES(`streetb`), `city` = VALUES(`city`), `state` = VALUES(`state`), `zip` = VALUES(`zip`), `street2` = VALUES(`street2`), `streetb2` = VALUES(`streetb2`), `city2` = VALUES(`city2`), `state2` = VALUES(`state2`), `zip2` = VALUES(`zip2`), `phone` = VALUES(`phone`), `fax` = VALUES(`fax`), `phonew1` = VALUES(`phonew1`), `phonew2` = VALUES(`phonew2`), `phonecell` = VALUES(`phonecell`), `notes` = VALUES(`notes`), `cal_ui` = VALUES(`cal_ui`), `taxonomy` = VALUES(`taxonomy`), `calendar` = VALUES(`calendar`), `abook_type` = VALUES(`abook_type`), `pwd_expiration_date` = VALUES(`pwd_expiration_date`), `pwd_history1` = VALUES(`pwd_history1`), `pwd_history2` = VALUES(`pwd_history2`), `default_warehouse` = VALUES(`default_warehouse`), `irnpool` = VALUES(`irnpool`), `state_license_number` = VALUES(`state_license_number`), `weno_prov_id` = VALUES(`weno_prov_id`), `newcrop_user_role` = VALUES(`newcrop_user_role`), `cpoe` = VALUES(`cpoe`), `physician_type` = VALUES(`physician_type`), `main_menu_role` = VALUES(`main_menu_role`), `patient_menu_role` = VALUES(`patient_menu_role`), `tenant_id` = VALUES(`tenant_id`), `role` = VALUES(`role`), `user_uuid` = VALUES(`user_uuid`), `date` = VALUES(`date`), `pid` = VALUES(`pid`);

DROP TABLE IF EXISTS `users_facility`;
CREATE TABLE `users_facility` (
  `tablename` varchar(64) NOT NULL,
  `table_id` int(11) NOT NULL,
  `facility_id` int(11) NOT NULL,
  PRIMARY KEY (`tablename`,`table_id`,`facility_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='joins users or patient_data to facility table';


DROP TABLE IF EXISTS `users_secure`;
CREATE TABLE `users_secure` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password_history1` varchar(255) DEFAULT NULL,
  `salt_history1` varchar(255) DEFAULT NULL,
  `password_history2` varchar(255) DEFAULT NULL,
  `salt_history2` varchar(255) DEFAULT NULL,
  `last_challenge_response` datetime DEFAULT NULL,
  `login_work_area` text,
  `login_fail_counter` int(11) DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `tenant` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `USERNAME_ID` (`id`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `user_patient_map`;
CREATE TABLE `user_patient_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(255) NOT NULL,
  `patient_uuid` varchar(255) NOT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL,
  `archive` smallint(6) NOT NULL,
  `role` varchar(255) NOT NULL,
  `pid` varchar(255) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `user_settings`;
CREATE TABLE `user_settings` (
  `setting_user` bigint(20) NOT NULL DEFAULT '0',
  `setting_label` varchar(100) NOT NULL,
  `setting_value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`setting_user`,`setting_label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `uuid`;
CREATE TABLE `uuid` (
  `uuid` varchar(400) NOT NULL COMMENT 'with the uuidType',
  `tenant_uuid` varchar(255) NOT NULL,
  PRIMARY KEY (`uuid`,`tenant_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `valueset`;
CREATE TABLE `valueset` (
  `nqf_code` varchar(255) NOT NULL DEFAULT '',
  `code` varchar(255) NOT NULL DEFAULT '',
  `code_system` varchar(255) NOT NULL DEFAULT '',
  `code_type` varchar(255) DEFAULT NULL,
  `valueset` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `valueset_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`nqf_code`,`code`,`valueset`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `version`;
CREATE TABLE `version` (
  `v_major` int(11) NOT NULL DEFAULT '0',
  `v_minor` int(11) NOT NULL DEFAULT '0',
  `v_patch` int(11) NOT NULL DEFAULT '0',
  `v_realpatch` int(11) NOT NULL DEFAULT '0',
  `v_tag` varchar(31) NOT NULL DEFAULT '',
  `v_database` int(11) NOT NULL DEFAULT '0',
  `v_acl` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `vital_threshold`;
CREATE TABLE `vital_threshold` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` varchar(255) NOT NULL,
  `min_temp` float(5,2) DEFAULT NULL,
  `max_temp` float(5,2) DEFAULT NULL,
  `min_hr` float(5,2) DEFAULT NULL,
  `max_hr` float(5,2) DEFAULT NULL,
  `min_rr` float(5,2) DEFAULT NULL,
  `max_rr` float(5,2) DEFAULT NULL,
  `min_spo2` float(5,2) DEFAULT NULL,
  `max_spo2` float(5,2) DEFAULT NULL,
  `tenant_uuid` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `weight_min` varchar(20) DEFAULT NULL,
  `weight_max` varchar(20) DEFAULT NULL,
  `bps_min` varchar(20) DEFAULT NULL,
  `bps_max` varchar(20) DEFAULT NULL,
  `bpd_min` varchar(20) DEFAULT NULL,
  `bpd_max` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

INSERT INTO `vital_threshold` (`id`, `pid`, `min_temp`, `max_temp`, `min_hr`, `max_hr`, `min_rr`, `max_rr`, `min_spo2`, `max_spo2`, `tenant_uuid`, `createdAt`, `updatedAt`, `weight_min`, `weight_max`, `bps_min`, `bps_max`, `bpd_min`, `bpd_max`) VALUES
(97,	'patient519d4f7b-5058-4ca4-a14c-b12eeb95d4c2',	95.00,	99.00,	60.00,	100.00,	20.00,	25.00,	96.00,	100.00,	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-03 01:57:30',	'2022-06-03 01:57:30',	'',	'',	'110',	'130',	'65',	'85'),
(98,	'patient519d4f7b-5058-4ca4-a14c-b12eeb95d4c2',	95.00,	99.00,	60.00,	100.00,	20.00,	25.00,	96.00,	100.00,	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-03 01:58:41',	'2022-06-03 01:58:41',	'',	'',	'110',	'130',	'65',	'85'),
(99,	'patient265f6107-ed92-4e51-a153-7c862ee22183',	95.00,	99.00,	60.00,	100.00,	20.00,	25.00,	96.00,	100.00,	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-03 02:29:30',	'2022-06-03 02:29:30',	'',	'',	'110',	'130',	'65',	'85'),
(100,	'patiente9c617e0-4242-4828-ba08-66e8d4aa9009',	95.00,	99.00,	60.00,	100.00,	20.00,	25.00,	96.00,	100.00,	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-03 09:43:56',	'2022-06-03 09:43:56',	'',	'',	'110',	'130',	'65',	'85'),
(101,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	95.00,	99.00,	60.00,	100.00,	20.00,	25.00,	85.00,	100.00,	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-03 11:16:05',	'2022-06-03 11:16:05',	'',	'',	'110',	'130',	'65',	'85'),
(102,	'patient49f476ac-62a9-4182-ac98-e2b0f96acfd5',	95.00,	99.00,	60.00,	100.00,	20.00,	25.00,	96.00,	100.00,	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-06 02:07:32',	'2022-06-06 02:07:32',	'',	'',	'110',	'130',	'65',	'85'),
(103,	'patient49f476ac-62a9-4182-ac98-e2b0f96acfd5',	95.00,	99.00,	60.00,	100.00,	20.00,	25.00,	96.00,	100.00,	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-06 02:07:44',	'2022-06-06 02:07:44',	'',	'',	'110',	'130',	'65',	'85'),
(104,	'patient49f476ac-62a9-4182-ac98-e2b0f96acfd5',	95.00,	99.00,	60.00,	100.00,	20.00,	25.00,	96.00,	100.00,	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-06 02:16:39',	'2022-06-06 02:16:39',	'150',	'200',	'110',	'130',	'65',	'85'),
(105,	'patient505fe2a9-5aff-46b4-94c2-11b686e73b28',	95.00,	99.00,	60.00,	100.00,	20.00,	25.00,	96.00,	100.00,	'tenant8ea56b12-ff44-4b5c-839c-f609363ba385',	'2022-06-06 03:12:38',	'2022-06-06 03:12:38',	'99',	'200',	'110',	'130',	'65',	'85')
ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `pid` = VALUES(`pid`), `min_temp` = VALUES(`min_temp`), `max_temp` = VALUES(`max_temp`), `min_hr` = VALUES(`min_hr`), `max_hr` = VALUES(`max_hr`), `min_rr` = VALUES(`min_rr`), `max_rr` = VALUES(`max_rr`), `min_spo2` = VALUES(`min_spo2`), `max_spo2` = VALUES(`max_spo2`), `tenant_uuid` = VALUES(`tenant_uuid`), `createdAt` = VALUES(`createdAt`), `updatedAt` = VALUES(`updatedAt`), `weight_min` = VALUES(`weight_min`), `weight_max` = VALUES(`weight_max`), `bps_min` = VALUES(`bps_min`), `bps_max` = VALUES(`bps_max`), `bpd_min` = VALUES(`bpd_min`), `bpd_max` = VALUES(`bpd_max`);

DROP TABLE IF EXISTS `voids`;
CREATE TABLE `voids` (
  `void_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `patient_id` bigint(20) NOT NULL COMMENT 'references patient_data.pid',
  `encounter_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'references form_encounter.encounter',
  `what_voided` varchar(31) NOT NULL COMMENT 'checkout,receipt and maybe other options later',
  `date_original` datetime DEFAULT NULL COMMENT 'time of original action that is now voided',
  `date_voided` datetime NOT NULL COMMENT 'time of void action',
  `user_id` bigint(20) NOT NULL COMMENT 'references users.id',
  `amount1` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT 'for checkout,receipt total voided adjustments',
  `amount2` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT 'for checkout,receipt total voided payments',
  `other_info` text COMMENT 'for checkout,receipt the old invoice refno',
  PRIMARY KEY (`void_id`),
  KEY `datevoided` (`date_voided`),
  KEY `pidenc` (`patient_id`,`encounter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `x12_partners`;
CREATE TABLE `x12_partners` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `id_number` varchar(255) DEFAULT NULL,
  `x12_sender_id` varchar(255) DEFAULT NULL,
  `x12_receiver_id` varchar(255) DEFAULT NULL,
  `processing_format` enum('standard','medi-cal','cms','proxymed','oa_eligibility','availity_eligibility') DEFAULT NULL,
  `x12_isa01` varchar(2) NOT NULL DEFAULT '00' COMMENT 'User logon Required Indicator',
  `x12_isa02` varchar(10) NOT NULL DEFAULT '          ' COMMENT 'User Logon',
  `x12_isa03` varchar(2) NOT NULL DEFAULT '00' COMMENT 'User password required Indicator',
  `x12_isa04` varchar(10) NOT NULL DEFAULT '          ' COMMENT 'User Password',
  `x12_isa05` char(2) NOT NULL DEFAULT 'ZZ',
  `x12_isa07` char(2) NOT NULL DEFAULT 'ZZ',
  `x12_isa14` char(1) NOT NULL DEFAULT '0',
  `x12_isa15` char(1) NOT NULL DEFAULT 'P',
  `x12_gs02` varchar(15) NOT NULL DEFAULT '',
  `x12_per06` varchar(80) NOT NULL DEFAULT '',
  `x12_dtp03` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 2022-06-08 06:15:44