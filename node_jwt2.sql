/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 100432
Source Host           : localhost:3306
Source Database       : node_jwt2

Target Server Type    : MYSQL
Target Server Version : 100432
File Encoding         : 65001

Date: 2024-04-29 03:47:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for requests
-- ----------------------------
DROP TABLE IF EXISTS `requests`;
CREATE TABLE `requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isApproved` tinyint(4) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `workId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `workId` (`workId`),
  CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `requests_ibfk_2` FOREIGN KEY (`workId`) REFERENCES `works` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of requests
-- ----------------------------
INSERT INTO `requests` VALUES ('1', '1', '2024-04-21 21:24:09', '2024-04-28 22:48:08', '1', '1');
INSERT INTO `requests` VALUES ('2', '0', '2024-04-21 21:27:07', '2024-04-21 21:27:07', '1', '2');
INSERT INTO `requests` VALUES ('3', '1', '2024-04-28 21:16:51', '2024-04-28 22:48:08', '6', '1');

-- ----------------------------
-- Table structure for skills
-- ----------------------------
DROP TABLE IF EXISTS `skills`;
CREATE TABLE `skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `skills_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of skills
-- ----------------------------
INSERT INTO `skills` VALUES ('12', 'Node', '2024-04-28 21:15:08', '2024-04-28 21:15:08', '6');
INSERT INTO `skills` VALUES ('13', 'Css', '2024-04-28 21:15:14', '2024-04-28 21:15:14', '6');
INSERT INTO `skills` VALUES ('14', 'HTML', '2024-04-28 21:15:24', '2024-04-28 21:15:24', '6');
INSERT INTO `skills` VALUES ('15', 'JS', '2024-04-28 21:15:29', '2024-04-28 21:15:29', '6');
INSERT INTO `skills` VALUES ('16', 'Java', '2024-04-28 21:38:43', '2024-04-28 21:38:43', '6');

-- ----------------------------
-- Table structure for skillworks
-- ----------------------------
DROP TABLE IF EXISTS `skillworks`;
CREATE TABLE `skillworks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `workId` int(11) DEFAULT NULL,
  `skillId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workId` (`workId`),
  KEY `skillId` (`skillId`),
  CONSTRAINT `skillworks_ibfk_1` FOREIGN KEY (`workId`) REFERENCES `works` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `skillworks_ibfk_2` FOREIGN KEY (`skillId`) REFERENCES `skills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of skillworks
-- ----------------------------
INSERT INTO `skillworks` VALUES ('3', '2024-04-28 21:15:08', '2024-04-28 21:15:08', '2', '12');
INSERT INTO `skillworks` VALUES ('4', '2024-04-28 21:15:08', '2024-04-28 21:15:08', '3', '12');
INSERT INTO `skillworks` VALUES ('5', '2024-04-28 21:15:24', '2024-04-28 21:15:24', '1', '14');
INSERT INTO `skillworks` VALUES ('6', '2024-04-28 21:15:24', '2024-04-28 21:15:24', '2', '14');
INSERT INTO `skillworks` VALUES ('7', '2024-04-28 21:15:29', '2024-04-28 21:15:29', '1', '15');
INSERT INTO `skillworks` VALUES ('8', '2024-04-28 21:46:44', '2024-04-28 21:46:44', '4', '16');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `emailToken` varchar(255) DEFAULT NULL,
  `isVerified` tinyint(4) DEFAULT 0,
  `refreshToken` varchar(255) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Lilit', 'Madoyan', '1@gmail.com', '$2b$10$ecBV2KGO75fxj1xJpg8twO3iMc8INBYDa6g8HkV4RuoQEcP8Pc9ka', '270B20', '1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibmFtZSI6IkxpbGl0Iiwic3VybmFtZSI6Ik1hZG95YW4iLCJlbWFpbCI6IjFAZ21haWwuY29tIiwiaXNWZXJpZmllZCI6MSwidHlwZSI6MCwiaWF0IjoxNzEzNzg0NDY1LCJleHAiOjE3MTM3ODU5NjV9.mlsAnIy1Fp4k-5d5g9vWMsLPdyUah-rrEB6RYrfNFCw', '0', '2024-04-21 21:04:23', '2024-04-22 11:14:25');
INSERT INTO `users` VALUES ('2', 'Ani', 'Anyan', '2@gmail.com', '$2b$10$uadY3PYSYpF/OosKa5sFPeC/mWjgixGvtkD1EHwJQX/iYboJHU1Na', 'DBF670', '1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwibmFtZSI6IkFuaSIsInN1cm5hbWUiOiJBbnlhbiIsImVtYWlsIjoiMkBnbWFpbC5jb20iLCJpc1ZlcmlmaWVkIjowLCJ0eXBlIjoiY3VzdG9tZXIiLCJpYXQiOjE3MTM3MzM1MTksImV4cCI6MTcxMzczNTAxOX0.21LlFGggb-81q_Yfy2sW86EbdRsBMina9J4u5wyAzYk', '0', '2024-04-21 21:05:19', '2024-04-21 21:05:19');
INSERT INTO `users` VALUES ('3', 'Anna', 'Anyan', '3@gmail.com', '$2b$10$CPTOQHPL/./Wz3CSRx.iaeWBkQjcRuGYQstjnxJ3/big3bo4Zfqke', '009552', '1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywibmFtZSI6IkFubmEiLCJzdXJuYW1lIjoiQW55YW4iLCJlbWFpbCI6IjNAZ21haWwuY29tIiwiaXNWZXJpZmllZCI6MSwidHlwZSI6MSwiaWF0IjoxNzE0MzQ2MTQzLCJleHAiOjE3MTQzNDc2NDN9.LtQFsqTnul4xn3ngoQ0VUnZAOwKHANcTLFBhLQtGjO4', '1', '2024-04-21 21:09:02', '2024-04-28 23:15:43');
INSERT INTO `users` VALUES ('6', 'Ani', 'Amiryan', 't@gmail.com', '$2b$10$aCPoqGfiT/MRgmTsGhgycO12U.TSydeHaZznhTToQ62MwfWvblaRq', '8F5466', '1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwibmFtZSI6IkFuaSIsInN1cm5hbWUiOiJBbWlyeWFuIiwiZW1haWwiOiJ0QGdtYWlsLmNvbSIsImlzVmVyaWZpZWQiOjEsInR5cGUiOjAsImlhdCI6MTcxNDM0NjE2NSwiZXhwIjoxNzE0MzQ3NjY1fQ.BeW5BQQE-731TQB5yBd-4YxY9p3x62sZY-jkZ1GRk1A', '0', '2024-04-28 21:03:40', '2024-04-28 23:16:05');
INSERT INTO `users` VALUES ('7', 'Ani', 'Amiryan', 'wt@gmail.com', '$2b$10$SR7OCDje7k1TB6leijS41.MGQBK5/H.XlVHAsbxtx/OMAdgonA7CK', '41EAB0', '0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywibmFtZSI6IkFuaSIsInN1cm5hbWUiOiJBbWlyeWFuIiwiZW1haWwiOiJ3dEBnbWFpbC5jb20iLCJpc1ZlcmlmaWVkIjowLCJ0eXBlIjowLCJpYXQiOjE3MTQzNDc0MzMsImV4cCI6MTcxNDM0ODkzM30.13fyUCEBtZiBo0-gYJyJyAPiJKR6UiHFjB2zTutXWnU', '0', '2024-04-28 23:37:13', '2024-04-28 23:37:13');

-- ----------------------------
-- Table structure for works
-- ----------------------------
DROP TABLE IF EXISTS `works`;
CREATE TABLE `works` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `skills` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `works_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of works
-- ----------------------------
INSERT INTO `works` VALUES ('1', 'Developer', '12344', '12', 'good', 'HTML, CSS, JS', '2024-04-21 21:18:11', '2024-04-21 21:18:11', '3');
INSERT INTO `works` VALUES ('2', 'Front', '12344', '12', 'good', 'HTML, CSS, React.js, Node.js', '2024-04-21 21:18:34', '2024-04-21 21:18:34', '3');
INSERT INTO `works` VALUES ('3', 'Back', '12344', '12', 'good', 'Node.js, Vue', '2024-04-21 21:18:58', '2024-04-21 21:18:58', '3');
INSERT INTO `works` VALUES ('4', 'Back', '2222', '111', 'highly paid', 'Java, C#', '2024-04-28 21:46:44', '2024-04-28 21:46:44', '3');
INSERT INTO `works` VALUES ('5', 'Back1', '2222', '111', 'highly paid', 'C#', '2024-04-28 21:51:32', '2024-04-28 21:51:32', '3');
INSERT INTO `works` VALUES ('6', 'Back1', '2222', '111', 'highly paid', 'C#', '2024-04-28 21:52:55', '2024-04-28 21:52:55', '3');
INSERT INTO `works` VALUES ('9', 'Back1', '2222', '111', 'highly paid', 'C#', '2024-04-28 23:08:54', '2024-04-28 23:08:54', '3');
SET FOREIGN_KEY_CHECKS=1;
