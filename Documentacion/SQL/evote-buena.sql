/*
 Navicat Premium Data Transfer

 Source Server         : 10.224.0.250_3306
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : 10.224.0.250:3306
 Source Schema         : evote

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 15/03/2020 21:28:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbladministrador
-- ----------------------------
DROP TABLE IF EXISTS `tbladministrador`;
CREATE TABLE `tbladministrador`  (
  `AdmCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `AdmEstado` enum('Activo','Inactivo') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AdmPerCodigo` bigint(20) NOT NULL,
  `AdmFunCodigo` bigint(20) NOT NULL,
  PRIMARY KEY (`AdmCodigo`) USING BTREE,
  INDEX `Administrador_fk_funcion`(`AdmFunCodigo`) USING BTREE,
  INDEX `Persona_fk_Administrador`(`AdmPerCodigo`) USING BTREE,
  CONSTRAINT `Administrador_fk_funcion` FOREIGN KEY (`AdmFunCodigo`) REFERENCES `tblfuncion` (`FunCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Persona_fk_Administrador` FOREIGN KEY (`AdmPerCodigo`) REFERENCES `tblpersona` (`PerCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbladministrador
-- ----------------------------
INSERT INTO `tbladministrador` VALUES (1, 'Activo', 1, 1);

-- ----------------------------
-- Table structure for tblaspirante
-- ----------------------------
DROP TABLE IF EXISTS `tblaspirante`;
CREATE TABLE `tblaspirante`  (
  `AspCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `AspFormPost` longblob NULL,
  `AspDoc1` longblob NULL,
  `AspDoc2` longblob NULL,
  `AspEstado` enum('Activo','Inactivo') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AspEstCodigo` bigint(20) NOT NULL,
  PRIMARY KEY (`AspCodigo`, `AspEstCodigo`) USING BTREE,
  INDEX `5`(`AspEstCodigo`) USING BTREE,
  INDEX `AspCodigo`(`AspCodigo`) USING BTREE,
  CONSTRAINT `5` FOREIGN KEY (`AspEstCodigo`) REFERENCES `tblestudiante` (`EstCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tblcandidato
-- ----------------------------
DROP TABLE IF EXISTS `tblcandidato`;
CREATE TABLE `tblcandidato`  (
  `CanCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `CanNTarjeton` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CanFoto` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CanEstado` enum('Activo','Inactivo') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CanProVotCodigo` bigint(20) NOT NULL,
  `CanEstCodigo` bigint(20) NULL DEFAULT NULL,
  `CanFotoRuta` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CanCodigo`) USING BTREE,
  INDEX `Candidato_fk_ProcVot`(`CanProVotCodigo`) USING BTREE,
  INDEX `CanEstCodigo`(`CanEstCodigo`) USING BTREE,
  CONSTRAINT `CanEstCodigo` FOREIGN KEY (`CanEstCodigo`) REFERENCES `tblestudiante` (`EstCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `CanProVotCodigo` FOREIGN KEY (`CanProVotCodigo`) REFERENCES `tblprocesovotacion` (`ProVotCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tblestudiante
-- ----------------------------
DROP TABLE IF EXISTS `tblestudiante`;
CREATE TABLE `tblestudiante`  (
  `EstCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `EstFicha` int(11) NOT NULL,
  `EstEstado` enum('Activo','Inactivo') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EstPerCodigo` bigint(20) NOT NULL,
  `EstJorCodigo` bigint(20) NOT NULL,
  `EstProforCodigo` bigint(20) NOT NULL,
  `EstHueCodigo` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`EstCodigo`) USING BTREE,
  INDEX `Huella_fk_Estudiante`(`EstHueCodigo`) USING BTREE,
  INDEX `Persona_fk_Estudiante`(`EstPerCodigo`) USING BTREE,
  INDEX `Estudiante_fk_jornada`(`EstJorCodigo`) USING BTREE,
  INDEX `Estudiante_fk_programaformacion`(`EstProforCodigo`) USING BTREE,
  INDEX `EstFicha`(`EstFicha`) USING BTREE,
  CONSTRAINT `Estudiante_fk_jornada` FOREIGN KEY (`EstJorCodigo`) REFERENCES `tbljornada` (`JorCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Estudiante_fk_programaformacion` FOREIGN KEY (`EstProforCodigo`) REFERENCES `tblprogramaformacion` (`ProforCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Huella_fk_Estudiante` FOREIGN KEY (`EstHueCodigo`) REFERENCES `tblhuella` (`HueCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Persona_fk_Estudiante` FOREIGN KEY (`EstPerCodigo`) REFERENCES `tblpersona` (`PerCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1829 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tblestudiante
-- ----------------------------
INSERT INTO `tblestudiante` VALUES (1, 0, 'Activo', 1, 1, 1, NULL);
INSERT INTO `tblestudiante` VALUES (2, 0, 'Activo', 2, 1, 1, NULL);
INSERT INTO `tblestudiante` VALUES (3, 1754662, 'Activo', 3, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (4, 1754662, 'Activo', 4, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (5, 1754662, 'Activo', 5, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (6, 1754662, 'Activo', 6, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (7, 1754662, 'Activo', 7, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (8, 1754662, 'Activo', 8, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (9, 1754662, 'Activo', 9, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (10, 1754662, 'Activo', 10, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (11, 1754662, 'Activo', 11, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (12, 1754662, 'Activo', 12, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (13, 1754662, 'Activo', 13, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (14, 1754662, 'Activo', 14, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (15, 1754662, 'Activo', 15, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (16, 1754662, 'Activo', 16, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (17, 1754662, 'Activo', 17, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (18, 1754662, 'Activo', 18, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (19, 1754662, 'Activo', 19, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (20, 1754662, 'Activo', 20, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (21, 1754662, 'Activo', 21, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (22, 1754662, 'Activo', 22, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (23, 1754662, 'Activo', 23, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (24, 1754662, 'Activo', 24, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (25, 1754662, 'Activo', 25, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (26, 1754662, 'Activo', 26, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (27, 1754662, 'Activo', 27, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (28, 1754662, 'Activo', 28, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (29, 1754662, 'Activo', 29, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (30, 1754661, 'Activo', 30, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (31, 1754661, 'Activo', 31, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (32, 1754661, 'Activo', 32, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (33, 1754661, 'Activo', 33, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (34, 1754661, 'Activo', 34, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (35, 1754661, 'Activo', 35, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (36, 1754661, 'Activo', 36, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (37, 1754661, 'Activo', 37, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (38, 1754661, 'Activo', 38, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (39, 1754661, 'Activo', 39, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (40, 1754661, 'Activo', 40, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (41, 1754661, 'Activo', 41, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (42, 1754661, 'Activo', 42, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (43, 1754661, 'Activo', 43, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (44, 1754661, 'Activo', 44, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (45, 1754661, 'Activo', 45, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (46, 1754661, 'Activo', 46, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (47, 1754661, 'Activo', 47, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (48, 1754661, 'Activo', 48, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (49, 1754661, 'Activo', 49, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (50, 1754661, 'Activo', 50, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (51, 1754661, 'Activo', 51, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (52, 1754661, 'Activo', 52, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (53, 1754661, 'Activo', 53, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (54, 1754661, 'Activo', 54, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (55, 1754661, 'Activo', 55, 2, 7, NULL);
INSERT INTO `tblestudiante` VALUES (56, 1754708, 'Activo', 56, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (57, 1754708, 'Activo', 57, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (58, 1754708, 'Activo', 58, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (59, 1754708, 'Activo', 59, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (60, 1754708, 'Activo', 60, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (61, 1754708, 'Activo', 61, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (62, 1754708, 'Activo', 62, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (63, 1754708, 'Activo', 63, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (64, 1754708, 'Activo', 64, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (65, 1754708, 'Activo', 65, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (66, 1754708, 'Activo', 66, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (67, 1754708, 'Activo', 67, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (68, 1754708, 'Activo', 68, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (69, 1754708, 'Activo', 69, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (70, 1754708, 'Activo', 70, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (71, 1754708, 'Activo', 71, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (72, 1754708, 'Activo', 72, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (73, 1754708, 'Activo', 73, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (74, 1754708, 'Activo', 74, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (75, 1754708, 'Activo', 75, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (76, 1754708, 'Activo', 76, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (77, 1754708, 'Activo', 77, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (78, 1754708, 'Activo', 78, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (79, 1754719, 'Activo', 79, 2, 2, NULL);
INSERT INTO `tblestudiante` VALUES (80, 1754719, 'Activo', 80, 2, 2, NULL);
INSERT INTO `tblestudiante` VALUES (81, 1754719, 'Activo', 81, 2, 2, NULL);
INSERT INTO `tblestudiante` VALUES (82, 1754719, 'Activo', 82, 2, 2, NULL);
INSERT INTO `tblestudiante` VALUES (83, 1754719, 'Activo', 83, 2, 2, NULL);
INSERT INTO `tblestudiante` VALUES (84, 1754719, 'Activo', 84, 2, 2, NULL);
INSERT INTO `tblestudiante` VALUES (85, 1754719, 'Activo', 85, 2, 2, NULL);
INSERT INTO `tblestudiante` VALUES (86, 1754719, 'Activo', 86, 2, 2, NULL);
INSERT INTO `tblestudiante` VALUES (87, 1754719, 'Activo', 87, 2, 2, NULL);
INSERT INTO `tblestudiante` VALUES (88, 1754719, 'Activo', 88, 2, 2, NULL);
INSERT INTO `tblestudiante` VALUES (89, 1754719, 'Activo', 89, 2, 2, NULL);
INSERT INTO `tblestudiante` VALUES (90, 1754719, 'Activo', 90, 2, 2, NULL);
INSERT INTO `tblestudiante` VALUES (91, 1754719, 'Activo', 91, 2, 2, NULL);
INSERT INTO `tblestudiante` VALUES (92, 1754719, 'Activo', 92, 2, 2, NULL);
INSERT INTO `tblestudiante` VALUES (93, 1754719, 'Activo', 93, 2, 2, NULL);
INSERT INTO `tblestudiante` VALUES (94, 1754719, 'Activo', 94, 2, 2, NULL);
INSERT INTO `tblestudiante` VALUES (95, 1754719, 'Activo', 95, 2, 2, NULL);
INSERT INTO `tblestudiante` VALUES (96, 1754722, 'Activo', 96, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (97, 1754722, 'Activo', 97, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (98, 1754722, 'Activo', 98, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (99, 1754722, 'Activo', 99, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (100, 1754722, 'Activo', 100, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (101, 1754722, 'Activo', 101, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (102, 1754722, 'Activo', 102, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (103, 1754722, 'Activo', 103, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (104, 1754722, 'Activo', 104, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (105, 1754722, 'Activo', 105, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (106, 1754722, 'Activo', 106, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (107, 1754722, 'Activo', 107, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (108, 1754722, 'Activo', 108, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (109, 1754722, 'Activo', 109, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (110, 1754722, 'Activo', 110, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (111, 1754722, 'Activo', 111, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (112, 1754722, 'Activo', 112, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (113, 1754722, 'Activo', 113, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (114, 1754722, 'Activo', 114, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (115, 1754722, 'Activo', 115, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (116, 1754722, 'Activo', 116, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (117, 1754722, 'Activo', 117, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (118, 1754722, 'Activo', 118, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (119, 1754722, 'Activo', 119, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (120, 1754722, 'Activo', 120, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (121, 1754722, 'Activo', 121, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (122, 1754722, 'Activo', 122, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (123, 1754722, 'Activo', 123, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (124, 1754722, 'Activo', 124, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (125, 1773332, 'Activo', 125, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (126, 1773332, 'Activo', 126, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (127, 1773332, 'Activo', 127, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (128, 1773332, 'Activo', 128, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (129, 1773332, 'Activo', 129, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (130, 1773332, 'Activo', 130, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (131, 1773332, 'Activo', 131, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (132, 1773332, 'Activo', 132, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (133, 1773332, 'Activo', 133, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (134, 1773332, 'Activo', 134, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (135, 1773332, 'Activo', 135, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (136, 1773332, 'Activo', 136, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (137, 1773332, 'Activo', 137, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (138, 1773332, 'Activo', 138, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (139, 1773332, 'Activo', 139, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (140, 1773332, 'Activo', 140, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (141, 1773332, 'Activo', 141, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (142, 1783220, 'Activo', 142, 1, 6, NULL);
INSERT INTO `tblestudiante` VALUES (143, 1783220, 'Activo', 143, 1, 6, NULL);
INSERT INTO `tblestudiante` VALUES (144, 1783220, 'Activo', 144, 1, 6, NULL);
INSERT INTO `tblestudiante` VALUES (145, 1783220, 'Activo', 145, 1, 6, NULL);
INSERT INTO `tblestudiante` VALUES (146, 1783220, 'Activo', 146, 1, 6, NULL);
INSERT INTO `tblestudiante` VALUES (147, 1783220, 'Activo', 147, 1, 6, NULL);
INSERT INTO `tblestudiante` VALUES (148, 1783220, 'Activo', 148, 1, 6, NULL);
INSERT INTO `tblestudiante` VALUES (149, 1783220, 'Activo', 149, 1, 6, NULL);
INSERT INTO `tblestudiante` VALUES (150, 1783220, 'Activo', 150, 1, 6, NULL);
INSERT INTO `tblestudiante` VALUES (151, 1783220, 'Activo', 151, 1, 6, NULL);
INSERT INTO `tblestudiante` VALUES (152, 1783220, 'Activo', 152, 1, 6, NULL);
INSERT INTO `tblestudiante` VALUES (153, 1783220, 'Activo', 153, 1, 6, NULL);
INSERT INTO `tblestudiante` VALUES (154, 1783220, 'Activo', 154, 1, 6, NULL);
INSERT INTO `tblestudiante` VALUES (155, 1783220, 'Activo', 155, 1, 6, NULL);
INSERT INTO `tblestudiante` VALUES (156, 1783220, 'Activo', 156, 1, 6, NULL);
INSERT INTO `tblestudiante` VALUES (157, 1783220, 'Activo', 157, 1, 6, NULL);
INSERT INTO `tblestudiante` VALUES (158, 1783220, 'Activo', 158, 1, 6, NULL);
INSERT INTO `tblestudiante` VALUES (159, 1783241, 'Activo', 159, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (160, 1783241, 'Activo', 160, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (161, 1783241, 'Activo', 161, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (162, 1783241, 'Activo', 162, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (163, 1783241, 'Activo', 163, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (164, 1783241, 'Activo', 164, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (165, 1783241, 'Activo', 165, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (166, 1783241, 'Activo', 166, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (167, 1783241, 'Activo', 167, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (168, 1783241, 'Activo', 168, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (169, 1783241, 'Activo', 169, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (170, 1783241, 'Activo', 170, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (171, 1783241, 'Activo', 171, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (172, 1783241, 'Activo', 172, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (173, 1783241, 'Activo', 173, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (174, 1783241, 'Activo', 174, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (175, 1783241, 'Activo', 175, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (176, 1805361, 'Activo', 176, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (177, 1805361, 'Activo', 177, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (178, 1805361, 'Activo', 178, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (179, 1805361, 'Activo', 179, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (180, 1805361, 'Activo', 180, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (181, 1805361, 'Activo', 181, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (182, 1805361, 'Activo', 182, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (183, 1805361, 'Activo', 183, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (184, 1805361, 'Activo', 184, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (185, 1805361, 'Activo', 185, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (186, 1805361, 'Activo', 186, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (187, 1805361, 'Activo', 187, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (188, 1805361, 'Activo', 188, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (189, 1805361, 'Activo', 189, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (190, 1812457, 'Activo', 190, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (191, 1812457, 'Activo', 191, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (192, 1812457, 'Activo', 192, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (193, 1812457, 'Activo', 193, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (194, 1812457, 'Activo', 194, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (195, 1812457, 'Activo', 195, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (196, 1812457, 'Activo', 196, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (197, 1812457, 'Activo', 197, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (198, 1812457, 'Activo', 198, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (199, 1812457, 'Activo', 199, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (200, 1812457, 'Activo', 200, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (201, 1812457, 'Activo', 201, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (202, 1812457, 'Activo', 202, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (203, 1812457, 'Activo', 203, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (204, 1812457, 'Activo', 204, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (205, 1812457, 'Activo', 205, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (206, 1812457, 'Activo', 206, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (207, 1812457, 'Activo', 207, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (208, 1812457, 'Activo', 208, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (209, 1812457, 'Activo', 209, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (210, 1812457, 'Activo', 210, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (211, 1812457, 'Activo', 211, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (212, 1812457, 'Activo', 212, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (213, 1812457, 'Activo', 213, 2, 42, NULL);
INSERT INTO `tblestudiante` VALUES (214, 1837225, 'Activo', 214, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (215, 1837225, 'Activo', 215, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (216, 1837225, 'Activo', 216, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (217, 1837225, 'Activo', 217, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (218, 1837225, 'Activo', 218, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (219, 1837225, 'Activo', 219, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (220, 1837225, 'Activo', 220, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (221, 1837225, 'Activo', 221, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (222, 1837225, 'Activo', 222, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (223, 1837225, 'Activo', 223, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (224, 1837225, 'Activo', 224, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (225, 1837225, 'Activo', 225, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (226, 1837225, 'Activo', 226, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (227, 1837225, 'Activo', 227, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (228, 1837225, 'Activo', 228, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (229, 1837225, 'Activo', 229, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (230, 1837225, 'Activo', 230, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (231, 1837225, 'Activo', 231, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (232, 1837225, 'Activo', 232, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (233, 1837225, 'Activo', 233, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (234, 1837225, 'Activo', 234, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (235, 1837225, 'Activo', 235, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (236, 1837225, 'Activo', 236, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (237, 1837225, 'Activo', 237, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (238, 1837225, 'Activo', 238, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (239, 1837225, 'Activo', 239, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (240, 1837225, 'Activo', 240, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (241, 1837225, 'Activo', 241, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (242, 1837225, 'Activo', 242, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (243, 1837225, 'Activo', 243, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (244, 1837225, 'Activo', 244, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (245, 1837225, 'Activo', 245, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (246, 1837225, 'Activo', 246, 2, 33, NULL);
INSERT INTO `tblestudiante` VALUES (247, 1837252, 'Activo', 247, 2, 4, NULL);
INSERT INTO `tblestudiante` VALUES (248, 1837252, 'Activo', 248, 2, 4, NULL);
INSERT INTO `tblestudiante` VALUES (249, 1837252, 'Activo', 249, 2, 4, NULL);
INSERT INTO `tblestudiante` VALUES (250, 1837252, 'Activo', 250, 2, 4, NULL);
INSERT INTO `tblestudiante` VALUES (251, 1837252, 'Activo', 251, 2, 4, NULL);
INSERT INTO `tblestudiante` VALUES (252, 1837252, 'Activo', 252, 2, 4, NULL);
INSERT INTO `tblestudiante` VALUES (253, 1837252, 'Activo', 253, 2, 4, NULL);
INSERT INTO `tblestudiante` VALUES (254, 1837252, 'Activo', 254, 2, 4, NULL);
INSERT INTO `tblestudiante` VALUES (255, 1837252, 'Activo', 255, 2, 4, NULL);
INSERT INTO `tblestudiante` VALUES (256, 1837252, 'Activo', 256, 2, 4, NULL);
INSERT INTO `tblestudiante` VALUES (257, 1837252, 'Activo', 257, 2, 4, NULL);
INSERT INTO `tblestudiante` VALUES (258, 1837252, 'Activo', 258, 2, 4, NULL);
INSERT INTO `tblestudiante` VALUES (259, 1837252, 'Activo', 259, 2, 4, NULL);
INSERT INTO `tblestudiante` VALUES (260, 1837252, 'Activo', 260, 2, 4, NULL);
INSERT INTO `tblestudiante` VALUES (261, 1837252, 'Activo', 261, 2, 4, NULL);
INSERT INTO `tblestudiante` VALUES (262, 1837252, 'Activo', 262, 2, 4, NULL);
INSERT INTO `tblestudiante` VALUES (263, 1837252, 'Activo', 263, 2, 4, NULL);
INSERT INTO `tblestudiante` VALUES (264, 1837252, 'Activo', 264, 2, 4, NULL);
INSERT INTO `tblestudiante` VALUES (265, 1837252, 'Activo', 265, 2, 4, NULL);
INSERT INTO `tblestudiante` VALUES (266, 1837252, 'Activo', 266, 2, 4, NULL);
INSERT INTO `tblestudiante` VALUES (267, 1837265, 'Activo', 267, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (268, 1837265, 'Activo', 268, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (269, 1837265, 'Activo', 269, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (270, 1837265, 'Activo', 270, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (271, 1837265, 'Activo', 271, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (272, 1837265, 'Activo', 272, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (273, 1837265, 'Activo', 273, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (274, 1837265, 'Activo', 274, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (275, 1837265, 'Activo', 275, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (276, 1837265, 'Activo', 276, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (277, 1837265, 'Activo', 277, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (278, 1837265, 'Activo', 278, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (279, 1837265, 'Activo', 279, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (280, 1837265, 'Activo', 280, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (281, 1837265, 'Activo', 281, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (282, 1837265, 'Activo', 282, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (283, 1837265, 'Activo', 283, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (284, 1837265, 'Activo', 284, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (285, 1837265, 'Activo', 285, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (286, 1837265, 'Activo', 286, 2, 29, NULL);
INSERT INTO `tblestudiante` VALUES (287, 1837270, 'Activo', 287, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (288, 1837270, 'Activo', 288, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (289, 1837270, 'Activo', 289, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (290, 1837270, 'Activo', 290, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (291, 1837270, 'Activo', 291, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (292, 1837270, 'Activo', 292, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (293, 1837270, 'Activo', 293, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (294, 1837270, 'Activo', 294, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (295, 1837270, 'Activo', 295, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (296, 1837270, 'Activo', 296, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (297, 1837270, 'Activo', 297, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (298, 1837270, 'Activo', 298, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (299, 1837270, 'Activo', 299, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (300, 1837270, 'Activo', 300, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (301, 1837270, 'Activo', 301, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (302, 1837270, 'Activo', 302, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (303, 1837270, 'Activo', 303, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (304, 1837270, 'Activo', 304, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (305, 1837270, 'Activo', 305, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (306, 1837270, 'Activo', 306, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (307, 1837270, 'Activo', 307, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (308, 1837270, 'Activo', 308, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (309, 1837270, 'Activo', 309, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (310, 1837270, 'Activo', 310, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (311, 1837270, 'Activo', 311, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (312, 1837270, 'Activo', 312, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (313, 1837270, 'Activo', 313, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (314, 1837270, 'Activo', 314, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (315, 1837270, 'Activo', 315, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (316, 1837270, 'Activo', 316, 2, 8, NULL);
INSERT INTO `tblestudiante` VALUES (317, 1837376, 'Activo', 317, 2, 20, NULL);
INSERT INTO `tblestudiante` VALUES (318, 1837376, 'Activo', 318, 2, 20, NULL);
INSERT INTO `tblestudiante` VALUES (319, 1837376, 'Activo', 319, 2, 20, NULL);
INSERT INTO `tblestudiante` VALUES (320, 1837376, 'Activo', 320, 2, 20, NULL);
INSERT INTO `tblestudiante` VALUES (321, 1837376, 'Activo', 321, 2, 20, NULL);
INSERT INTO `tblestudiante` VALUES (322, 1837376, 'Activo', 322, 2, 20, NULL);
INSERT INTO `tblestudiante` VALUES (323, 1837376, 'Activo', 323, 2, 20, NULL);
INSERT INTO `tblestudiante` VALUES (324, 1837376, 'Activo', 324, 2, 20, NULL);
INSERT INTO `tblestudiante` VALUES (325, 1837376, 'Activo', 325, 2, 20, NULL);
INSERT INTO `tblestudiante` VALUES (326, 1837376, 'Activo', 326, 2, 20, NULL);
INSERT INTO `tblestudiante` VALUES (327, 1837376, 'Activo', 327, 2, 20, NULL);
INSERT INTO `tblestudiante` VALUES (328, 1837376, 'Activo', 328, 2, 20, NULL);
INSERT INTO `tblestudiante` VALUES (329, 1837376, 'Activo', 329, 2, 20, NULL);
INSERT INTO `tblestudiante` VALUES (330, 1837376, 'Activo', 330, 2, 20, NULL);
INSERT INTO `tblestudiante` VALUES (331, 1837376, 'Activo', 331, 2, 20, NULL);
INSERT INTO `tblestudiante` VALUES (332, 1837376, 'Activo', 332, 2, 20, NULL);
INSERT INTO `tblestudiante` VALUES (333, 1837376, 'Activo', 333, 2, 20, NULL);
INSERT INTO `tblestudiante` VALUES (334, 1837376, 'Activo', 334, 2, 20, NULL);
INSERT INTO `tblestudiante` VALUES (335, 1837376, 'Activo', 335, 2, 20, NULL);
INSERT INTO `tblestudiante` VALUES (336, 1837376, 'Activo', 336, 2, 20, NULL);
INSERT INTO `tblestudiante` VALUES (337, 1837376, 'Activo', 337, 2, 20, NULL);
INSERT INTO `tblestudiante` VALUES (338, 1837376, 'Activo', 338, 2, 20, NULL);
INSERT INTO `tblestudiante` VALUES (339, 1837457, 'Activo', 339, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (340, 1837457, 'Activo', 340, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (341, 1837457, 'Activo', 341, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (342, 1837457, 'Activo', 342, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (343, 1837457, 'Activo', 343, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (344, 1837457, 'Activo', 344, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (345, 1837457, 'Activo', 345, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (346, 1837457, 'Activo', 346, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (347, 1837457, 'Activo', 347, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (348, 1837457, 'Activo', 348, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (349, 1837457, 'Activo', 349, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (350, 1837457, 'Activo', 350, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (351, 1837457, 'Activo', 351, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (352, 1837457, 'Activo', 352, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (353, 1837457, 'Activo', 353, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (354, 1837457, 'Activo', 354, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (355, 1837457, 'Activo', 355, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (356, 1837457, 'Activo', 356, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (357, 1837457, 'Activo', 357, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (358, 1837457, 'Activo', 358, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (359, 1837457, 'Activo', 359, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (360, 1837457, 'Activo', 360, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (361, 1837457, 'Activo', 361, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (362, 1837457, 'Activo', 362, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (363, 1837457, 'Activo', 363, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (364, 1837457, 'Activo', 364, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (365, 1837457, 'Activo', 365, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (366, 1837457, 'Activo', 366, 2, 21, NULL);
INSERT INTO `tblestudiante` VALUES (367, 1837473, 'Activo', 367, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (368, 1837473, 'Activo', 368, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (369, 1837473, 'Activo', 369, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (370, 1837473, 'Activo', 370, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (371, 1837473, 'Activo', 371, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (372, 1837473, 'Activo', 372, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (373, 1837473, 'Activo', 373, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (374, 1837473, 'Activo', 374, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (375, 1837473, 'Activo', 375, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (376, 1837473, 'Activo', 376, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (377, 1837473, 'Activo', 377, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (378, 1837473, 'Activo', 378, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (379, 1837473, 'Activo', 379, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (380, 1837473, 'Activo', 380, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (381, 1837473, 'Activo', 381, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (382, 1837473, 'Activo', 382, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (383, 1837473, 'Activo', 383, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (384, 1837473, 'Activo', 384, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (385, 1837473, 'Activo', 385, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (386, 1837473, 'Activo', 386, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (387, 1837473, 'Activo', 387, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (388, 1837473, 'Activo', 388, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (389, 1837473, 'Activo', 389, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (390, 1837473, 'Activo', 390, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (391, 1837473, 'Activo', 391, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (392, 1837473, 'Activo', 392, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (393, 1837473, 'Activo', 393, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (394, 1837473, 'Activo', 394, 2, 22, NULL);
INSERT INTO `tblestudiante` VALUES (395, 1884508, 'Activo', 395, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (396, 1884508, 'Activo', 396, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (397, 1884508, 'Activo', 397, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (398, 1884508, 'Activo', 398, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (399, 1884508, 'Activo', 399, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (400, 1884508, 'Activo', 400, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (401, 1884508, 'Activo', 401, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (402, 1884508, 'Activo', 402, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (403, 1884508, 'Activo', 403, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (404, 1884508, 'Activo', 404, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (405, 1884508, 'Activo', 405, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (406, 1884508, 'Activo', 406, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (407, 1884508, 'Activo', 407, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (408, 1884508, 'Activo', 408, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (409, 1884508, 'Activo', 409, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (410, 1884508, 'Activo', 410, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (411, 1884508, 'Activo', 411, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (412, 1884508, 'Activo', 412, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (413, 1884508, 'Activo', 413, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (414, 1884508, 'Activo', 414, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (415, 1884508, 'Activo', 415, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (416, 1884508, 'Activo', 416, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (417, 1884508, 'Activo', 417, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (418, 1884508, 'Activo', 418, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (419, 1884508, 'Activo', 419, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (420, 1884508, 'Activo', 420, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (421, 1884508, 'Activo', 421, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (422, 1907025, 'Activo', 422, 2, 9, NULL);
INSERT INTO `tblestudiante` VALUES (423, 1907025, 'Activo', 423, 2, 9, NULL);
INSERT INTO `tblestudiante` VALUES (424, 1907025, 'Activo', 424, 2, 9, NULL);
INSERT INTO `tblestudiante` VALUES (425, 1907025, 'Activo', 425, 2, 9, NULL);
INSERT INTO `tblestudiante` VALUES (426, 1907025, 'Activo', 426, 2, 9, NULL);
INSERT INTO `tblestudiante` VALUES (427, 1907025, 'Activo', 427, 2, 9, NULL);
INSERT INTO `tblestudiante` VALUES (428, 1907025, 'Activo', 428, 2, 9, NULL);
INSERT INTO `tblestudiante` VALUES (429, 1907025, 'Activo', 429, 2, 9, NULL);
INSERT INTO `tblestudiante` VALUES (430, 1907025, 'Activo', 430, 2, 9, NULL);
INSERT INTO `tblestudiante` VALUES (431, 1907025, 'Activo', 431, 2, 9, NULL);
INSERT INTO `tblestudiante` VALUES (432, 1907025, 'Activo', 432, 2, 9, NULL);
INSERT INTO `tblestudiante` VALUES (433, 1907025, 'Activo', 433, 2, 9, NULL);
INSERT INTO `tblestudiante` VALUES (434, 1907025, 'Activo', 434, 2, 9, NULL);
INSERT INTO `tblestudiante` VALUES (435, 1907025, 'Activo', 435, 2, 9, NULL);
INSERT INTO `tblestudiante` VALUES (436, 1907025, 'Activo', 436, 2, 9, NULL);
INSERT INTO `tblestudiante` VALUES (437, 1907025, 'Activo', 437, 2, 9, NULL);
INSERT INTO `tblestudiante` VALUES (438, 1907025, 'Activo', 438, 2, 9, NULL);
INSERT INTO `tblestudiante` VALUES (439, 1907031, 'Activo', 439, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (440, 1907031, 'Activo', 440, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (441, 1907031, 'Activo', 441, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (442, 1907031, 'Activo', 442, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (443, 1907031, 'Activo', 443, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (444, 1907031, 'Activo', 444, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (445, 1907031, 'Activo', 445, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (446, 1907031, 'Activo', 446, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (447, 1907031, 'Activo', 447, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (448, 1907031, 'Activo', 448, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (449, 1907031, 'Activo', 449, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (450, 1907031, 'Activo', 450, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (451, 1907031, 'Activo', 451, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (452, 1907031, 'Activo', 452, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (453, 1907031, 'Activo', 453, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (454, 1907031, 'Activo', 454, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (455, 1907031, 'Activo', 455, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (456, 1907031, 'Activo', 456, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (457, 1907031, 'Activo', 457, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (458, 1907031, 'Activo', 458, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (459, 1907031, 'Activo', 459, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (460, 1907031, 'Activo', 460, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (461, 1907031, 'Activo', 461, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (462, 1907031, 'Activo', 462, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (463, 1907031, 'Activo', 463, 2, 30, NULL);
INSERT INTO `tblestudiante` VALUES (464, 1907056, 'Activo', 464, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (465, 1907056, 'Activo', 465, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (466, 1907056, 'Activo', 466, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (467, 1907056, 'Activo', 467, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (468, 1907056, 'Activo', 468, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (469, 1907056, 'Activo', 469, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (470, 1907056, 'Activo', 470, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (471, 1907056, 'Activo', 471, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (472, 1907056, 'Activo', 472, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (473, 1907056, 'Activo', 473, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (474, 1907056, 'Activo', 474, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (475, 1907056, 'Activo', 475, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (476, 1907056, 'Activo', 476, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (477, 1907056, 'Activo', 477, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (478, 1907056, 'Activo', 478, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (479, 1907056, 'Activo', 479, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (480, 1907056, 'Activo', 480, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (481, 1907056, 'Activo', 481, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (482, 1907056, 'Activo', 482, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (483, 1907056, 'Activo', 483, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (484, 1907056, 'Activo', 484, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (485, 1907056, 'Activo', 485, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (486, 1907056, 'Activo', 486, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (487, 1907056, 'Activo', 487, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (488, 1907056, 'Activo', 488, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (489, 1907056, 'Activo', 489, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (490, 1907077, 'Activo', 490, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (491, 1907077, 'Activo', 491, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (492, 1907077, 'Activo', 492, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (493, 1907077, 'Activo', 493, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (494, 1907077, 'Activo', 494, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (495, 1907077, 'Activo', 495, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (496, 1907077, 'Activo', 496, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (497, 1907077, 'Activo', 497, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (498, 1907077, 'Activo', 498, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (499, 1907077, 'Activo', 499, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (500, 1907077, 'Activo', 500, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (501, 1907077, 'Activo', 501, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (502, 1907077, 'Activo', 502, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (503, 1907077, 'Activo', 503, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (504, 1907077, 'Activo', 504, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (505, 1907077, 'Activo', 505, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (506, 1907077, 'Activo', 506, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (507, 1907077, 'Activo', 507, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (508, 1907077, 'Activo', 508, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (509, 1907077, 'Activo', 509, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (510, 1907077, 'Activo', 510, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (511, 1907077, 'Activo', 511, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (512, 1907077, 'Activo', 512, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (513, 1907077, 'Activo', 513, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (514, 1907204, 'Activo', 514, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (515, 1907204, 'Activo', 515, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (516, 1907204, 'Activo', 516, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (517, 1907204, 'Activo', 517, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (518, 1907204, 'Activo', 518, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (519, 1907204, 'Activo', 519, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (520, 1907204, 'Activo', 520, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (521, 1907204, 'Activo', 521, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (522, 1907204, 'Activo', 522, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (523, 1907204, 'Activo', 523, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (524, 1907204, 'Activo', 524, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (525, 1907204, 'Activo', 525, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (526, 1907204, 'Activo', 526, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (527, 1907204, 'Activo', 527, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (528, 1907204, 'Activo', 528, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (529, 1907204, 'Activo', 529, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (530, 1907204, 'Activo', 530, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (531, 1907204, 'Activo', 531, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (532, 1907204, 'Activo', 532, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (533, 1907204, 'Activo', 533, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (534, 1907204, 'Activo', 534, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (535, 1907204, 'Activo', 535, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (536, 1907204, 'Activo', 536, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (537, 1907204, 'Activo', 537, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (538, 1907204, 'Activo', 538, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (539, 1907204, 'Activo', 539, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (540, 1907204, 'Activo', 540, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (541, 1907204, 'Activo', 541, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (542, 1907204, 'Activo', 542, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (543, 1907204, 'Activo', 543, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (544, 1907204, 'Activo', 544, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (545, 1907204, 'Activo', 545, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (546, 1907204, 'Activo', 546, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (547, 1907204, 'Activo', 547, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (548, 1907204, 'Activo', 548, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (549, 1907204, 'Activo', 549, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (550, 1907204, 'Activo', 550, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (551, 1907204, 'Activo', 551, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (552, 1907212, 'Activo', 552, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (553, 1907212, 'Activo', 553, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (554, 1907212, 'Activo', 554, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (555, 1907212, 'Activo', 555, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (556, 1907212, 'Activo', 556, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (557, 1907212, 'Activo', 557, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (558, 1907212, 'Activo', 558, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (559, 1907212, 'Activo', 559, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (560, 1907212, 'Activo', 560, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (561, 1907212, 'Activo', 561, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (562, 1907212, 'Activo', 562, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (563, 1907212, 'Activo', 563, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (564, 1907212, 'Activo', 564, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (565, 1907212, 'Activo', 565, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (566, 1907212, 'Activo', 566, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (567, 1907212, 'Activo', 567, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (568, 1907212, 'Activo', 568, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (569, 1907212, 'Activo', 569, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (570, 1907212, 'Activo', 570, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (571, 1907212, 'Activo', 571, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (572, 1907212, 'Activo', 572, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (573, 1907212, 'Activo', 573, 2, 3, NULL);
INSERT INTO `tblestudiante` VALUES (574, 1907213, 'Activo', 574, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (575, 1907213, 'Activo', 575, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (576, 1907213, 'Activo', 576, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (577, 1907213, 'Activo', 577, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (578, 1907213, 'Activo', 578, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (579, 1907213, 'Activo', 579, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (580, 1907213, 'Activo', 580, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (581, 1907213, 'Activo', 581, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (582, 1907213, 'Activo', 582, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (583, 1907213, 'Activo', 583, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (584, 1907213, 'Activo', 584, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (585, 1907213, 'Activo', 585, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (586, 1907213, 'Activo', 586, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (587, 1907213, 'Activo', 587, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (588, 1907213, 'Activo', 588, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (589, 1907213, 'Activo', 589, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (590, 1907213, 'Activo', 590, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (591, 1907213, 'Activo', 591, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (592, 1907213, 'Activo', 592, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (593, 1907213, 'Activo', 593, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (594, 1907213, 'Activo', 594, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (595, 1907213, 'Activo', 595, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (596, 1907213, 'Activo', 596, 1, 14, NULL);
INSERT INTO `tblestudiante` VALUES (597, 1907215, 'Activo', 597, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (598, 1907215, 'Activo', 598, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (599, 1907215, 'Activo', 599, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (600, 1907215, 'Activo', 600, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (601, 1907215, 'Activo', 601, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (602, 1907215, 'Activo', 602, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (603, 1907215, 'Activo', 603, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (604, 1907215, 'Activo', 604, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (605, 1907215, 'Activo', 605, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (606, 1907215, 'Activo', 606, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (607, 1907215, 'Activo', 607, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (608, 1907215, 'Activo', 608, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (609, 1907215, 'Activo', 609, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (610, 1907215, 'Activo', 610, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (611, 1907215, 'Activo', 611, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (612, 1907215, 'Activo', 612, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (613, 1907215, 'Activo', 613, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (614, 1907215, 'Activo', 614, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (615, 1907215, 'Activo', 615, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (616, 1907215, 'Activo', 616, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (617, 1907215, 'Activo', 617, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (618, 1907215, 'Activo', 618, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (619, 1907215, 'Activo', 619, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (620, 1907215, 'Activo', 620, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (621, 1907215, 'Activo', 621, 1, 31, NULL);
INSERT INTO `tblestudiante` VALUES (622, 1907255, 'Activo', 622, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (623, 1907255, 'Activo', 623, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (624, 1907255, 'Activo', 624, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (625, 1907255, 'Activo', 625, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (626, 1907255, 'Activo', 626, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (627, 1907255, 'Activo', 627, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (628, 1907255, 'Activo', 628, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (629, 1907255, 'Activo', 629, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (630, 1907255, 'Activo', 630, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (631, 1907255, 'Activo', 631, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (632, 1907255, 'Activo', 632, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (633, 1907255, 'Activo', 633, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (634, 1907255, 'Activo', 634, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (635, 1907255, 'Activo', 635, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (636, 1907255, 'Activo', 636, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (637, 1907255, 'Activo', 637, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (638, 1907255, 'Activo', 638, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (639, 1907255, 'Activo', 639, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (640, 1907255, 'Activo', 640, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (641, 1907255, 'Activo', 641, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (642, 1907255, 'Activo', 642, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (643, 1907298, 'Activo', 643, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (644, 1907298, 'Activo', 644, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (645, 1907298, 'Activo', 645, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (646, 1907298, 'Activo', 646, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (647, 1907298, 'Activo', 647, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (648, 1907298, 'Activo', 648, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (649, 1907298, 'Activo', 649, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (650, 1907298, 'Activo', 650, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (651, 1907298, 'Activo', 651, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (652, 1907298, 'Activo', 652, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (653, 1907298, 'Activo', 653, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (654, 1907298, 'Activo', 654, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (655, 1907298, 'Activo', 655, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (656, 1907298, 'Activo', 656, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (657, 1907298, 'Activo', 657, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (658, 1907298, 'Activo', 658, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (659, 1907298, 'Activo', 659, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (660, 1907298, 'Activo', 660, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (661, 1907298, 'Activo', 661, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (662, 1907298, 'Activo', 662, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (663, 1907298, 'Activo', 663, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (664, 1907298, 'Activo', 664, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (665, 1907298, 'Activo', 665, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (666, 1907298, 'Activo', 666, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (667, 1907298, 'Activo', 667, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (668, 1907298, 'Activo', 668, 1, 16, NULL);
INSERT INTO `tblestudiante` VALUES (669, 1907309, 'Activo', 669, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (670, 1907309, 'Activo', 670, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (671, 1907309, 'Activo', 671, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (672, 1907309, 'Activo', 672, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (673, 1907309, 'Activo', 673, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (674, 1907309, 'Activo', 674, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (675, 1907309, 'Activo', 675, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (676, 1907309, 'Activo', 676, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (677, 1907309, 'Activo', 677, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (678, 1907309, 'Activo', 678, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (679, 1907309, 'Activo', 679, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (680, 1907309, 'Activo', 680, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (681, 1907309, 'Activo', 681, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (682, 1907309, 'Activo', 682, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (683, 1907309, 'Activo', 683, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (684, 1907309, 'Activo', 684, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (685, 1907309, 'Activo', 685, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (686, 1907309, 'Activo', 686, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (687, 1907314, 'Activo', 687, 1, 11, NULL);
INSERT INTO `tblestudiante` VALUES (688, 1907314, 'Activo', 688, 1, 11, NULL);
INSERT INTO `tblestudiante` VALUES (689, 1907314, 'Activo', 689, 1, 11, NULL);
INSERT INTO `tblestudiante` VALUES (690, 1907314, 'Activo', 690, 1, 11, NULL);
INSERT INTO `tblestudiante` VALUES (691, 1907314, 'Activo', 691, 1, 11, NULL);
INSERT INTO `tblestudiante` VALUES (692, 1907314, 'Activo', 692, 1, 11, NULL);
INSERT INTO `tblestudiante` VALUES (693, 1907314, 'Activo', 693, 1, 11, NULL);
INSERT INTO `tblestudiante` VALUES (694, 1907314, 'Activo', 694, 1, 11, NULL);
INSERT INTO `tblestudiante` VALUES (695, 1907314, 'Activo', 695, 1, 11, NULL);
INSERT INTO `tblestudiante` VALUES (696, 1907314, 'Activo', 696, 1, 11, NULL);
INSERT INTO `tblestudiante` VALUES (697, 1907314, 'Activo', 697, 1, 11, NULL);
INSERT INTO `tblestudiante` VALUES (698, 1907314, 'Activo', 698, 1, 11, NULL);
INSERT INTO `tblestudiante` VALUES (699, 1907343, 'Activo', 699, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (700, 1907343, 'Activo', 700, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (701, 1907343, 'Activo', 701, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (702, 1907343, 'Activo', 702, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (703, 1907343, 'Activo', 703, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (704, 1907343, 'Activo', 704, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (705, 1907343, 'Activo', 705, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (706, 1907343, 'Activo', 706, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (707, 1907343, 'Activo', 707, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (708, 1907343, 'Activo', 708, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (709, 1907343, 'Activo', 709, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (710, 1907343, 'Activo', 710, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (711, 1907343, 'Activo', 711, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (712, 1907343, 'Activo', 712, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (713, 1907343, 'Activo', 713, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (714, 1907343, 'Activo', 714, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (715, 1907343, 'Activo', 715, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (716, 1907343, 'Activo', 716, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (717, 1907343, 'Activo', 717, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (718, 1907343, 'Activo', 718, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (719, 1907343, 'Activo', 719, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (720, 1907343, 'Activo', 720, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (721, 1907343, 'Activo', 721, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (722, 1907343, 'Activo', 722, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (723, 1907343, 'Activo', 723, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (724, 1907343, 'Activo', 724, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (725, 1907343, 'Activo', 725, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (726, 1907343, 'Activo', 726, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (727, 1907343, 'Activo', 727, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (728, 1907365, 'Activo', 728, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (729, 1907365, 'Activo', 729, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (730, 1907365, 'Activo', 730, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (731, 1907365, 'Activo', 731, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (732, 1907365, 'Activo', 732, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (733, 1907365, 'Activo', 733, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (734, 1907365, 'Activo', 734, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (735, 1907365, 'Activo', 735, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (736, 1907365, 'Activo', 736, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (737, 1907365, 'Activo', 737, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (738, 1907365, 'Activo', 738, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (739, 1907365, 'Activo', 739, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (740, 1907365, 'Activo', 740, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (741, 1907365, 'Activo', 741, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (742, 1907365, 'Activo', 742, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (743, 1907365, 'Activo', 743, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (744, 1907365, 'Activo', 744, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (745, 1907365, 'Activo', 745, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (746, 1907365, 'Activo', 746, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (747, 1907365, 'Activo', 747, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (748, 1907365, 'Activo', 748, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (749, 1907365, 'Activo', 749, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (750, 1907365, 'Activo', 750, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (751, 1907365, 'Activo', 751, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (752, 1907365, 'Activo', 752, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (753, 1907365, 'Activo', 753, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (754, 1938912, 'Activo', 754, 1, 26, NULL);
INSERT INTO `tblestudiante` VALUES (755, 1938912, 'Activo', 755, 1, 26, NULL);
INSERT INTO `tblestudiante` VALUES (756, 1938912, 'Activo', 756, 1, 26, NULL);
INSERT INTO `tblestudiante` VALUES (757, 1938912, 'Activo', 757, 1, 26, NULL);
INSERT INTO `tblestudiante` VALUES (758, 1938912, 'Activo', 758, 1, 26, NULL);
INSERT INTO `tblestudiante` VALUES (759, 1938912, 'Activo', 759, 1, 26, NULL);
INSERT INTO `tblestudiante` VALUES (760, 1938912, 'Activo', 760, 1, 26, NULL);
INSERT INTO `tblestudiante` VALUES (761, 1938912, 'Activo', 761, 1, 26, NULL);
INSERT INTO `tblestudiante` VALUES (762, 1938912, 'Activo', 762, 1, 26, NULL);
INSERT INTO `tblestudiante` VALUES (763, 1938912, 'Activo', 763, 1, 26, NULL);
INSERT INTO `tblestudiante` VALUES (764, 1938912, 'Activo', 764, 1, 26, NULL);
INSERT INTO `tblestudiante` VALUES (765, 1938912, 'Activo', 765, 1, 26, NULL);
INSERT INTO `tblestudiante` VALUES (766, 1938912, 'Activo', 766, 1, 26, NULL);
INSERT INTO `tblestudiante` VALUES (767, 1938912, 'Activo', 767, 1, 26, NULL);
INSERT INTO `tblestudiante` VALUES (768, 1938912, 'Activo', 768, 1, 26, NULL);
INSERT INTO `tblestudiante` VALUES (769, 1938912, 'Activo', 769, 1, 26, NULL);
INSERT INTO `tblestudiante` VALUES (770, 1938912, 'Activo', 770, 1, 26, NULL);
INSERT INTO `tblestudiante` VALUES (771, 1938912, 'Activo', 771, 1, 26, NULL);
INSERT INTO `tblestudiante` VALUES (772, 1938912, 'Activo', 772, 1, 26, NULL);
INSERT INTO `tblestudiante` VALUES (773, 1938944, 'Activo', 773, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (774, 1938944, 'Activo', 774, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (775, 1938944, 'Activo', 775, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (776, 1938944, 'Activo', 776, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (777, 1938944, 'Activo', 777, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (778, 1938944, 'Activo', 778, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (779, 1938944, 'Activo', 779, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (780, 1938944, 'Activo', 780, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (781, 1938944, 'Activo', 781, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (782, 1938944, 'Activo', 782, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (783, 1938944, 'Activo', 783, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (784, 1938944, 'Activo', 784, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (785, 1938944, 'Activo', 785, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (786, 1938944, 'Activo', 786, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (787, 1938944, 'Activo', 787, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (788, 1938944, 'Activo', 788, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (789, 1938944, 'Activo', 789, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (790, 1938944, 'Activo', 790, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (791, 1938944, 'Activo', 791, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (792, 1938944, 'Activo', 792, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (793, 1938944, 'Activo', 793, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (794, 1938944, 'Activo', 794, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (795, 1938944, 'Activo', 795, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (796, 1938944, 'Activo', 796, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (797, 1938944, 'Activo', 797, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (798, 1938944, 'Activo', 798, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (799, 1938944, 'Activo', 799, 1, 44, NULL);
INSERT INTO `tblestudiante` VALUES (800, 1938959, 'Activo', 800, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (801, 1938959, 'Activo', 801, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (802, 1938959, 'Activo', 802, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (803, 1938959, 'Activo', 803, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (804, 1938959, 'Activo', 804, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (805, 1938959, 'Activo', 805, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (806, 1938959, 'Activo', 806, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (807, 1938959, 'Activo', 807, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (808, 1938959, 'Activo', 808, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (809, 1938959, 'Activo', 809, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (810, 1938959, 'Activo', 810, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (811, 1938959, 'Activo', 811, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (812, 1938959, 'Activo', 812, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (813, 1938959, 'Activo', 813, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (814, 1938959, 'Activo', 814, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (815, 1938959, 'Activo', 815, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (816, 1938959, 'Activo', 816, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (817, 1938959, 'Activo', 817, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (818, 1938959, 'Activo', 818, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (819, 1938959, 'Activo', 819, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (820, 1938959, 'Activo', 820, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (821, 1938959, 'Activo', 821, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (822, 1938959, 'Activo', 822, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (823, 1938959, 'Activo', 823, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (824, 1938959, 'Activo', 824, 1, 29, NULL);
INSERT INTO `tblestudiante` VALUES (825, 1968081, 'Activo', 825, 1, 46, NULL);
INSERT INTO `tblestudiante` VALUES (826, 1968081, 'Activo', 826, 1, 46, NULL);
INSERT INTO `tblestudiante` VALUES (827, 1968081, 'Activo', 827, 1, 46, NULL);
INSERT INTO `tblestudiante` VALUES (828, 1968081, 'Activo', 828, 1, 46, NULL);
INSERT INTO `tblestudiante` VALUES (829, 1968081, 'Activo', 829, 1, 46, NULL);
INSERT INTO `tblestudiante` VALUES (830, 1968081, 'Activo', 830, 1, 46, NULL);
INSERT INTO `tblestudiante` VALUES (831, 1968081, 'Activo', 831, 1, 46, NULL);
INSERT INTO `tblestudiante` VALUES (832, 1968081, 'Activo', 832, 1, 46, NULL);
INSERT INTO `tblestudiante` VALUES (833, 1968081, 'Activo', 833, 1, 46, NULL);
INSERT INTO `tblestudiante` VALUES (834, 1968081, 'Activo', 834, 1, 46, NULL);
INSERT INTO `tblestudiante` VALUES (835, 1968081, 'Activo', 835, 1, 46, NULL);
INSERT INTO `tblestudiante` VALUES (836, 1968081, 'Activo', 836, 1, 46, NULL);
INSERT INTO `tblestudiante` VALUES (837, 1968081, 'Activo', 837, 1, 46, NULL);
INSERT INTO `tblestudiante` VALUES (838, 1968081, 'Activo', 838, 1, 46, NULL);
INSERT INTO `tblestudiante` VALUES (839, 1968081, 'Activo', 839, 1, 46, NULL);
INSERT INTO `tblestudiante` VALUES (840, 1968081, 'Activo', 840, 1, 46, NULL);
INSERT INTO `tblestudiante` VALUES (841, 1968081, 'Activo', 841, 1, 46, NULL);
INSERT INTO `tblestudiante` VALUES (842, 1968084, 'Activo', 842, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (843, 1968084, 'Activo', 843, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (844, 1968084, 'Activo', 844, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (845, 1968084, 'Activo', 845, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (846, 1968084, 'Activo', 846, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (847, 1968084, 'Activo', 847, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (848, 1968084, 'Activo', 848, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (849, 1968084, 'Activo', 849, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (850, 1968084, 'Activo', 850, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (851, 1968084, 'Activo', 851, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (852, 1968084, 'Activo', 852, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (853, 1968084, 'Activo', 853, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (854, 1968084, 'Activo', 854, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (855, 1968084, 'Activo', 855, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (856, 1968084, 'Activo', 856, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (857, 1968084, 'Activo', 857, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (858, 1968084, 'Activo', 858, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (859, 1968084, 'Activo', 859, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (860, 1968084, 'Activo', 860, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (861, 1968084, 'Activo', 861, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (862, 1968084, 'Activo', 862, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (863, 1968084, 'Activo', 863, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (864, 1968084, 'Activo', 864, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (865, 1968084, 'Activo', 865, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (866, 1968084, 'Activo', 866, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (867, 1968084, 'Activo', 867, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (868, 1968084, 'Activo', 868, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (869, 1968084, 'Activo', 869, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (870, 1968084, 'Activo', 870, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (871, 1968084, 'Activo', 871, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (872, 1968084, 'Activo', 872, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (873, 1968084, 'Activo', 873, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (874, 1968084, 'Activo', 874, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (875, 1968084, 'Activo', 875, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (876, 1968097, 'Activo', 876, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (877, 1968097, 'Activo', 877, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (878, 1968097, 'Activo', 878, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (879, 1968097, 'Activo', 879, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (880, 1968097, 'Activo', 880, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (881, 1968097, 'Activo', 881, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (882, 1968097, 'Activo', 882, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (883, 1968097, 'Activo', 883, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (884, 1968097, 'Activo', 884, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (885, 1968097, 'Activo', 885, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (886, 1968097, 'Activo', 886, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (887, 1968097, 'Activo', 887, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (888, 1968097, 'Activo', 888, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (889, 1968097, 'Activo', 889, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (890, 1968097, 'Activo', 890, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (891, 1968097, 'Activo', 891, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (892, 1968097, 'Activo', 892, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (893, 1968097, 'Activo', 893, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (894, 1968097, 'Activo', 894, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (895, 1968097, 'Activo', 895, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (896, 1968097, 'Activo', 896, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (897, 1968097, 'Activo', 897, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (898, 1968097, 'Activo', 898, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (899, 1968097, 'Activo', 899, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (900, 1968097, 'Activo', 900, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (901, 1968097, 'Activo', 901, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (902, 1968139, 'Activo', 902, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (903, 1968139, 'Activo', 903, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (904, 1968139, 'Activo', 904, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (905, 1968139, 'Activo', 905, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (906, 1968139, 'Activo', 906, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (907, 1968139, 'Activo', 907, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (908, 1968139, 'Activo', 908, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (909, 1968139, 'Activo', 909, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (910, 1968139, 'Activo', 910, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (911, 1968139, 'Activo', 911, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (912, 1968139, 'Activo', 912, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (913, 1968139, 'Activo', 913, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (914, 1968139, 'Activo', 914, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (915, 1968139, 'Activo', 915, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (916, 1968139, 'Activo', 916, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (917, 1968139, 'Activo', 917, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (918, 1968139, 'Activo', 918, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (919, 1968139, 'Activo', 919, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (920, 1968139, 'Activo', 920, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (921, 1968139, 'Activo', 921, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (922, 1968139, 'Activo', 922, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (923, 1968139, 'Activo', 923, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (924, 1968139, 'Activo', 924, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (925, 1968139, 'Activo', 925, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (926, 1968139, 'Activo', 926, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (927, 1968139, 'Activo', 927, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (928, 1968139, 'Activo', 928, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (929, 1968139, 'Activo', 929, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (930, 1968139, 'Activo', 930, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (931, 1968139, 'Activo', 931, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (932, 1968139, 'Activo', 932, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (933, 1968139, 'Activo', 933, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (934, 1968164, 'Activo', 934, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (935, 1968164, 'Activo', 935, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (936, 1968164, 'Activo', 936, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (937, 1968164, 'Activo', 937, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (938, 1968164, 'Activo', 938, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (939, 1968164, 'Activo', 939, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (940, 1968164, 'Activo', 940, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (941, 1968164, 'Activo', 941, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (942, 1968164, 'Activo', 942, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (943, 1968164, 'Activo', 943, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (944, 1968164, 'Activo', 944, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (945, 1968164, 'Activo', 945, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (946, 1968164, 'Activo', 946, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (947, 1968164, 'Activo', 947, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (948, 1968164, 'Activo', 948, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (949, 1968164, 'Activo', 949, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (950, 1968164, 'Activo', 950, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (951, 1968164, 'Activo', 951, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (952, 1968164, 'Activo', 952, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (953, 1968164, 'Activo', 953, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (954, 1968172, 'Activo', 954, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (955, 1968172, 'Activo', 955, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (956, 1968172, 'Activo', 956, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (957, 1968172, 'Activo', 957, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (958, 1968172, 'Activo', 958, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (959, 1968172, 'Activo', 959, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (960, 1968172, 'Activo', 960, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (961, 1968172, 'Activo', 961, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (962, 1968172, 'Activo', 962, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (963, 1968172, 'Activo', 963, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (964, 1968172, 'Activo', 964, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (965, 1968172, 'Activo', 965, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (966, 1968172, 'Activo', 966, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (967, 1968172, 'Activo', 967, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (968, 1968172, 'Activo', 968, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (969, 1968172, 'Activo', 969, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (970, 1968172, 'Activo', 970, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (971, 1968172, 'Activo', 971, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (972, 1968172, 'Activo', 972, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (973, 1968172, 'Activo', 973, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (974, 1968172, 'Activo', 974, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (975, 1968172, 'Activo', 975, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (976, 1968172, 'Activo', 976, 2, 45, NULL);
INSERT INTO `tblestudiante` VALUES (977, 1968178, 'Activo', 977, 2, 18, NULL);
INSERT INTO `tblestudiante` VALUES (978, 1968178, 'Activo', 978, 2, 18, NULL);
INSERT INTO `tblestudiante` VALUES (979, 1968178, 'Activo', 979, 2, 18, NULL);
INSERT INTO `tblestudiante` VALUES (980, 1968178, 'Activo', 980, 2, 18, NULL);
INSERT INTO `tblestudiante` VALUES (981, 1968178, 'Activo', 981, 2, 18, NULL);
INSERT INTO `tblestudiante` VALUES (982, 1968178, 'Activo', 982, 2, 18, NULL);
INSERT INTO `tblestudiante` VALUES (983, 1968178, 'Activo', 983, 2, 18, NULL);
INSERT INTO `tblestudiante` VALUES (984, 1968178, 'Activo', 984, 2, 18, NULL);
INSERT INTO `tblestudiante` VALUES (985, 1968178, 'Activo', 985, 2, 18, NULL);
INSERT INTO `tblestudiante` VALUES (986, 1968178, 'Activo', 986, 2, 18, NULL);
INSERT INTO `tblestudiante` VALUES (987, 1968178, 'Activo', 987, 2, 18, NULL);
INSERT INTO `tblestudiante` VALUES (988, 1968178, 'Activo', 988, 2, 18, NULL);
INSERT INTO `tblestudiante` VALUES (989, 1968178, 'Activo', 989, 2, 18, NULL);
INSERT INTO `tblestudiante` VALUES (990, 1968178, 'Activo', 990, 2, 18, NULL);
INSERT INTO `tblestudiante` VALUES (991, 1968178, 'Activo', 991, 2, 18, NULL);
INSERT INTO `tblestudiante` VALUES (992, 1968220, 'Activo', 992, 2, 27, NULL);
INSERT INTO `tblestudiante` VALUES (993, 1968220, 'Activo', 993, 2, 27, NULL);
INSERT INTO `tblestudiante` VALUES (994, 1968220, 'Activo', 994, 2, 27, NULL);
INSERT INTO `tblestudiante` VALUES (995, 1968220, 'Activo', 995, 2, 27, NULL);
INSERT INTO `tblestudiante` VALUES (996, 1968220, 'Activo', 996, 2, 27, NULL);
INSERT INTO `tblestudiante` VALUES (997, 1968220, 'Activo', 997, 2, 27, NULL);
INSERT INTO `tblestudiante` VALUES (998, 1968220, 'Activo', 998, 2, 27, NULL);
INSERT INTO `tblestudiante` VALUES (999, 1968220, 'Activo', 999, 2, 27, NULL);
INSERT INTO `tblestudiante` VALUES (1000, 1968220, 'Activo', 1000, 2, 27, NULL);
INSERT INTO `tblestudiante` VALUES (1001, 1968220, 'Activo', 1001, 2, 27, NULL);
INSERT INTO `tblestudiante` VALUES (1002, 1968220, 'Activo', 1002, 2, 27, NULL);
INSERT INTO `tblestudiante` VALUES (1003, 1968220, 'Activo', 1003, 2, 27, NULL);
INSERT INTO `tblestudiante` VALUES (1004, 1968220, 'Activo', 1004, 2, 27, NULL);
INSERT INTO `tblestudiante` VALUES (1005, 1968245, 'Activo', 1005, 1, 24, NULL);
INSERT INTO `tblestudiante` VALUES (1006, 1968245, 'Activo', 1006, 1, 24, NULL);
INSERT INTO `tblestudiante` VALUES (1007, 1968245, 'Activo', 1007, 1, 24, NULL);
INSERT INTO `tblestudiante` VALUES (1008, 1968245, 'Activo', 1008, 1, 24, NULL);
INSERT INTO `tblestudiante` VALUES (1009, 1968245, 'Activo', 1009, 1, 24, NULL);
INSERT INTO `tblestudiante` VALUES (1010, 1968245, 'Activo', 1010, 1, 24, NULL);
INSERT INTO `tblestudiante` VALUES (1011, 1968245, 'Activo', 1011, 1, 24, NULL);
INSERT INTO `tblestudiante` VALUES (1012, 1968245, 'Activo', 1012, 1, 24, NULL);
INSERT INTO `tblestudiante` VALUES (1013, 1968245, 'Activo', 1013, 1, 24, NULL);
INSERT INTO `tblestudiante` VALUES (1014, 1968245, 'Activo', 1014, 1, 4, NULL);
INSERT INTO `tblestudiante` VALUES (1015, 1968245, 'Activo', 1015, 1, 24, NULL);
INSERT INTO `tblestudiante` VALUES (1016, 1968245, 'Activo', 1016, 1, 24, NULL);
INSERT INTO `tblestudiante` VALUES (1017, 1968245, 'Activo', 1017, 1, 24, NULL);
INSERT INTO `tblestudiante` VALUES (1018, 1968245, 'Activo', 1018, 1, 24, NULL);
INSERT INTO `tblestudiante` VALUES (1019, 1968245, 'Activo', 1019, 1, 24, NULL);
INSERT INTO `tblestudiante` VALUES (1020, 1968245, 'Activo', 1020, 1, 24, NULL);
INSERT INTO `tblestudiante` VALUES (1021, 1968245, 'Activo', 1021, 1, 24, NULL);
INSERT INTO `tblestudiante` VALUES (1022, 1968245, 'Activo', 1022, 1, 24, NULL);
INSERT INTO `tblestudiante` VALUES (1023, 1968245, 'Activo', 1023, 1, 24, NULL);
INSERT INTO `tblestudiante` VALUES (1024, 1968245, 'Activo', 1024, 1, 24, NULL);
INSERT INTO `tblestudiante` VALUES (1025, 1968245, 'Activo', 1025, 1, 24, NULL);
INSERT INTO `tblestudiante` VALUES (1026, 1968245, 'Activo', 1026, 1, 24, NULL);
INSERT INTO `tblestudiante` VALUES (1027, 1968245, 'Activo', 1027, 1, 24, NULL);
INSERT INTO `tblestudiante` VALUES (1028, 1968652, 'Activo', 1028, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1029, 1968652, 'Activo', 1029, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1030, 1968652, 'Activo', 1030, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1031, 1968652, 'Activo', 1031, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1032, 1968652, 'Activo', 1032, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1033, 1968652, 'Activo', 1033, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1034, 1968652, 'Activo', 1034, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1035, 1968652, 'Activo', 1035, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1036, 1968652, 'Activo', 1036, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1037, 1968652, 'Activo', 1037, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1038, 1968652, 'Activo', 1038, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1039, 1968652, 'Activo', 1039, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1040, 1968652, 'Activo', 1040, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1041, 1968652, 'Activo', 1041, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1042, 1968652, 'Activo', 1042, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1043, 1968652, 'Activo', 1043, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1044, 1968652, 'Activo', 1044, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1045, 1968652, 'Activo', 1045, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1046, 1968652, 'Activo', 1046, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1047, 1968652, 'Activo', 1047, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1048, 1968652, 'Activo', 1048, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1049, 1968652, 'Activo', 1049, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1050, 1968652, 'Activo', 1050, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1051, 1968652, 'Activo', 1051, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1052, 1968652, 'Activo', 1052, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1053, 1968652, 'Activo', 1053, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1054, 1968652, 'Activo', 1054, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1055, 1968652, 'Activo', 1055, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1056, 1968652, 'Activo', 1056, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1057, 1968652, 'Activo', 1057, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1058, 1968652, 'Activo', 1058, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1059, 1968652, 'Activo', 1059, 2, 13, NULL);
INSERT INTO `tblestudiante` VALUES (1060, 1968664, 'Activo', 1060, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1061, 1968664, 'Activo', 1061, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1062, 1968664, 'Activo', 1062, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1063, 1968664, 'Activo', 1063, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1064, 1968664, 'Activo', 1064, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1065, 1968664, 'Activo', 1065, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1066, 1968664, 'Activo', 1066, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1067, 1968664, 'Activo', 1067, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1068, 1968664, 'Activo', 1068, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1069, 1968664, 'Activo', 1069, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1070, 1968664, 'Activo', 1070, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1071, 1968664, 'Activo', 1071, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1072, 1968664, 'Activo', 1072, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1073, 1968664, 'Activo', 1073, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1074, 1968664, 'Activo', 1074, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1075, 1968664, 'Activo', 1075, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1076, 1968664, 'Activo', 1076, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1077, 1968664, 'Activo', 1077, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1078, 1968664, 'Activo', 1078, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1079, 1968664, 'Activo', 1079, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1080, 1968664, 'Activo', 1080, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1081, 1968664, 'Activo', 1081, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1082, 1968664, 'Activo', 1082, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1083, 1968664, 'Activo', 1083, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1084, 1968664, 'Activo', 1084, 2, 40, NULL);
INSERT INTO `tblestudiante` VALUES (1085, 1968684, 'Activo', 1085, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1086, 1968684, 'Activo', 1086, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1087, 1968684, 'Activo', 1087, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1088, 1968684, 'Activo', 1088, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1089, 1968684, 'Activo', 1089, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1090, 1968684, 'Activo', 1090, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1091, 1968684, 'Activo', 1091, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1092, 1968684, 'Activo', 1092, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1093, 1968684, 'Activo', 1093, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1094, 1968684, 'Activo', 1094, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1095, 1968684, 'Activo', 1095, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1096, 1968684, 'Activo', 1096, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1097, 1968684, 'Activo', 1097, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1098, 1968684, 'Activo', 1098, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1099, 1968684, 'Activo', 1099, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1100, 1968684, 'Activo', 1100, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1101, 1968684, 'Activo', 1101, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1102, 1968684, 'Activo', 1102, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1103, 1968684, 'Activo', 1103, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1104, 1968684, 'Activo', 1104, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1105, 1968684, 'Activo', 1105, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1106, 1968687, 'Activo', 1106, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1107, 1968687, 'Activo', 1107, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1108, 1968687, 'Activo', 1108, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1109, 1968687, 'Activo', 1109, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1110, 1968687, 'Activo', 1110, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1111, 1968687, 'Activo', 1111, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1112, 1968687, 'Activo', 1112, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1113, 1968687, 'Activo', 1113, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1114, 1968687, 'Activo', 1114, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1115, 1968687, 'Activo', 1115, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1116, 1968687, 'Activo', 1116, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1117, 1968687, 'Activo', 1117, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1118, 1968687, 'Activo', 1118, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1119, 1968687, 'Activo', 1119, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1120, 1968687, 'Activo', 1120, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1121, 1968687, 'Activo', 1121, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1122, 1968696, 'Activo', 1122, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1123, 1968696, 'Activo', 1123, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1124, 1968696, 'Activo', 1124, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1125, 1968696, 'Activo', 1125, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1126, 1968696, 'Activo', 1126, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1127, 1968696, 'Activo', 1127, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1128, 1968696, 'Activo', 1128, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1129, 1968696, 'Activo', 1129, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1130, 1968696, 'Activo', 1130, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1131, 1968696, 'Activo', 1131, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1132, 1968696, 'Activo', 1132, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1133, 1968696, 'Activo', 1133, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1134, 1968696, 'Activo', 1134, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1135, 1968696, 'Activo', 1135, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1136, 1968696, 'Activo', 1136, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1137, 1968696, 'Activo', 1137, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1138, 1968696, 'Activo', 1138, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1139, 1968696, 'Activo', 1139, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1140, 1968696, 'Activo', 1140, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1141, 1968696, 'Activo', 1141, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1142, 1968696, 'Activo', 1142, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1143, 1968696, 'Activo', 1143, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1144, 1968696, 'Activo', 1144, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1145, 1968696, 'Activo', 1145, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1146, 1968696, 'Activo', 1146, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1147, 1968696, 'Activo', 1147, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1148, 1968696, 'Activo', 1148, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1149, 1968696, 'Activo', 1149, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1150, 1968696, 'Activo', 1150, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1151, 1968696, 'Activo', 1151, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1152, 1968696, 'Activo', 1152, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1153, 1968696, 'Activo', 1153, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1154, 1968696, 'Activo', 1154, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1155, 1968699, 'Activo', 1155, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1156, 1968699, 'Activo', 1156, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1157, 1968699, 'Activo', 1157, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1158, 1968699, 'Activo', 1158, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1159, 1968699, 'Activo', 1159, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1160, 1968699, 'Activo', 1160, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1161, 1968699, 'Activo', 1161, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1162, 1968699, 'Activo', 1162, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1163, 1968699, 'Activo', 1163, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1164, 1968699, 'Activo', 1164, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1165, 1968699, 'Activo', 1165, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1166, 1968699, 'Activo', 1166, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1167, 1968699, 'Activo', 1167, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1168, 1968699, 'Activo', 1168, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1169, 1968699, 'Activo', 1169, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1170, 1968699, 'Activo', 1170, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1171, 1968699, 'Activo', 1171, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1172, 1968699, 'Activo', 1172, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1173, 1968699, 'Activo', 1173, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1174, 1968699, 'Activo', 1174, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1175, 1968699, 'Activo', 1175, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1176, 1968699, 'Activo', 1176, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1177, 1968699, 'Activo', 1177, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1178, 1968699, 'Activo', 1178, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1179, 1968699, 'Activo', 1179, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1180, 1968699, 'Activo', 1180, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1181, 1968699, 'Activo', 1181, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1182, 1968699, 'Activo', 1182, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1183, 1968756, 'Activo', 1183, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1184, 1968756, 'Activo', 1184, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1185, 1968756, 'Activo', 1185, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1186, 1968756, 'Activo', 1186, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1187, 1968756, 'Activo', 1187, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1188, 1968756, 'Activo', 1188, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1189, 1968756, 'Activo', 1189, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1190, 1968756, 'Activo', 1190, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1191, 1968756, 'Activo', 1191, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1192, 1968756, 'Activo', 1192, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1193, 1968756, 'Activo', 1193, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1194, 1968756, 'Activo', 1194, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1195, 1968756, 'Activo', 1195, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1196, 1968756, 'Activo', 1196, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1197, 1968756, 'Activo', 1197, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1198, 1968756, 'Activo', 1198, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1199, 1968756, 'Activo', 1199, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1200, 1968756, 'Activo', 1200, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1201, 1968756, 'Activo', 1201, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1202, 1968756, 'Activo', 1202, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1203, 1968756, 'Activo', 1203, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1204, 1968756, 'Activo', 1204, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1205, 1968756, 'Activo', 1205, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1206, 1968756, 'Activo', 1206, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1207, 1968756, 'Activo', 1207, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1208, 1968756, 'Activo', 1208, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1209, 1968756, 'Activo', 1209, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1210, 1968756, 'Activo', 1210, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1211, 1968756, 'Activo', 1211, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1212, 1968756, 'Activo', 1212, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1213, 1968756, 'Activo', 1213, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1214, 1968756, 'Activo', 1214, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1215, 1968756, 'Activo', 1215, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1216, 1968756, 'Activo', 1216, 2, 15, NULL);
INSERT INTO `tblestudiante` VALUES (1217, 1968945, 'Activo', 1217, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1218, 1968945, 'Activo', 1218, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1219, 1968945, 'Activo', 1219, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1220, 1968945, 'Activo', 1220, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1221, 1968945, 'Activo', 1221, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1222, 1968945, 'Activo', 1222, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1223, 1968945, 'Activo', 1223, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1224, 1968945, 'Activo', 1224, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1225, 1968945, 'Activo', 1225, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1226, 1968945, 'Activo', 1226, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1227, 1968950, 'Activo', 1227, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1228, 1968950, 'Activo', 1228, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1229, 1968950, 'Activo', 1229, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1230, 1968950, 'Activo', 1230, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1231, 1968950, 'Activo', 1231, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1232, 1968950, 'Activo', 1232, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1233, 1968950, 'Activo', 1233, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1234, 1968950, 'Activo', 1234, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1235, 1968950, 'Activo', 1235, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1236, 1968950, 'Activo', 1236, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1237, 1968950, 'Activo', 1237, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1238, 1968950, 'Activo', 1238, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1239, 1968950, 'Activo', 1239, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1240, 1968950, 'Activo', 1240, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1241, 1968950, 'Activo', 1241, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1242, 1968950, 'Activo', 1242, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1243, 1968950, 'Activo', 1243, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1244, 1968950, 'Activo', 1244, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1245, 1968950, 'Activo', 1245, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1246, 1968950, 'Activo', 1246, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1247, 1968950, 'Activo', 1247, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1248, 1968950, 'Activo', 1248, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1249, 1968950, 'Activo', 1249, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1250, 1968950, 'Activo', 1250, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1251, 1968950, 'Activo', 1251, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1252, 1968950, 'Activo', 1252, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1253, 1968950, 'Activo', 1253, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1254, 1968950, 'Activo', 1254, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1255, 1968950, 'Activo', 1255, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1256, 1968950, 'Activo', 1256, 2, 37, NULL);
INSERT INTO `tblestudiante` VALUES (1257, 1970549, 'Activo', 1257, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1258, 1970549, 'Activo', 1258, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1259, 1970549, 'Activo', 1259, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1260, 1970549, 'Activo', 1260, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1261, 1970549, 'Activo', 1261, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1262, 1970549, 'Activo', 1262, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1263, 1970549, 'Activo', 1263, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1264, 1970549, 'Activo', 1264, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1265, 1970549, 'Activo', 1265, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1266, 1970549, 'Activo', 1266, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1267, 1970549, 'Activo', 1267, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1268, 1970549, 'Activo', 1268, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1269, 1970549, 'Activo', 1269, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1270, 1970549, 'Activo', 1270, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1271, 1970549, 'Activo', 1271, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1272, 1970549, 'Activo', 1272, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1273, 1970549, 'Activo', 1273, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1274, 1970549, 'Activo', 1274, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1275, 1970549, 'Activo', 1275, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1276, 2010176, 'Activo', 1276, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1277, 2010176, 'Activo', 1277, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1278, 2010176, 'Activo', 1278, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1279, 2010176, 'Activo', 1279, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1280, 2010176, 'Activo', 1280, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1281, 2010176, 'Activo', 1281, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1282, 2010176, 'Activo', 1282, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1283, 2010176, 'Activo', 1283, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1284, 2010176, 'Activo', 1284, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1285, 2010176, 'Activo', 1285, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1286, 2010176, 'Activo', 1286, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1287, 2010176, 'Activo', 1287, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1288, 2010176, 'Activo', 1288, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1289, 2010176, 'Activo', 1289, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1290, 2010176, 'Activo', 1290, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1291, 2010176, 'Activo', 1291, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1292, 2010176, 'Activo', 1292, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1293, 2010176, 'Activo', 1293, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1294, 2010176, 'Activo', 1294, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1295, 2010176, 'Activo', 1295, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1296, 2010176, 'Activo', 1296, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1297, 2010176, 'Activo', 1297, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1298, 2010176, 'Activo', 1298, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1299, 2010176, 'Activo', 1299, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1300, 2010176, 'Activo', 1300, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1301, 2010176, 'Activo', 1301, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1302, 2010176, 'Activo', 1302, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1303, 2010176, 'Activo', 1303, 2, 23, NULL);
INSERT INTO `tblestudiante` VALUES (1304, 2010207, 'Activo', 1304, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1305, 2010207, 'Activo', 1305, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1306, 2010207, 'Activo', 1306, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1307, 2010207, 'Activo', 1307, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1308, 2010207, 'Activo', 1308, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1309, 2010207, 'Activo', 1309, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1310, 2010207, 'Activo', 1310, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1311, 2010207, 'Activo', 1311, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1312, 2010207, 'Activo', 1312, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1313, 2010207, 'Activo', 1313, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1314, 2010207, 'Activo', 1314, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1315, 2010207, 'Activo', 1315, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1316, 2010207, 'Activo', 1316, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1317, 2010207, 'Activo', 1317, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1318, 2010207, 'Activo', 1318, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1319, 2010207, 'Activo', 1319, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1320, 2010207, 'Activo', 1320, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1321, 2010207, 'Activo', 1321, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1322, 2010207, 'Activo', 1322, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1323, 2010207, 'Activo', 1323, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1324, 2010207, 'Activo', 1324, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1325, 2010207, 'Activo', 1325, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1326, 2010207, 'Activo', 1326, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1327, 2010207, 'Activo', 1327, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1328, 2010207, 'Activo', 1328, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1329, 2010207, 'Activo', 1329, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1330, 2010207, 'Activo', 1330, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1331, 2010207, 'Activo', 1331, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1332, 2010207, 'Activo', 1332, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1333, 2010207, 'Activo', 1333, 2, 39, NULL);
INSERT INTO `tblestudiante` VALUES (1334, 2011416, 'Activo', 1334, 1, 27, NULL);
INSERT INTO `tblestudiante` VALUES (1335, 2011416, 'Activo', 1335, 1, 27, NULL);
INSERT INTO `tblestudiante` VALUES (1336, 2011416, 'Activo', 1336, 1, 27, NULL);
INSERT INTO `tblestudiante` VALUES (1337, 2011416, 'Activo', 1337, 1, 27, NULL);
INSERT INTO `tblestudiante` VALUES (1338, 2011416, 'Activo', 1338, 1, 27, NULL);
INSERT INTO `tblestudiante` VALUES (1339, 2011416, 'Activo', 1339, 1, 27, NULL);
INSERT INTO `tblestudiante` VALUES (1340, 2011416, 'Activo', 1340, 1, 27, NULL);
INSERT INTO `tblestudiante` VALUES (1341, 2011416, 'Activo', 1341, 1, 27, NULL);
INSERT INTO `tblestudiante` VALUES (1342, 2011416, 'Activo', 1342, 1, 27, NULL);
INSERT INTO `tblestudiante` VALUES (1343, 2011416, 'Activo', 1343, 1, 27, NULL);
INSERT INTO `tblestudiante` VALUES (1344, 2011416, 'Activo', 1344, 1, 27, NULL);
INSERT INTO `tblestudiante` VALUES (1345, 2011416, 'Activo', 1345, 1, 27, NULL);
INSERT INTO `tblestudiante` VALUES (1346, 2011416, 'Activo', 1346, 1, 27, NULL);
INSERT INTO `tblestudiante` VALUES (1347, 2011416, 'Activo', 1347, 1, 27, NULL);
INSERT INTO `tblestudiante` VALUES (1348, 2011416, 'Activo', 1348, 1, 27, NULL);
INSERT INTO `tblestudiante` VALUES (1349, 2023719, 'Activo', 1349, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1350, 2023719, 'Activo', 1350, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1351, 2023719, 'Activo', 1351, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1352, 2023719, 'Activo', 1352, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1353, 2023719, 'Activo', 1353, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1354, 2023719, 'Activo', 1354, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1355, 2023719, 'Activo', 1355, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1356, 2023719, 'Activo', 1356, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1357, 2023719, 'Activo', 1357, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1358, 2023719, 'Activo', 1358, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1359, 2023719, 'Activo', 1359, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1360, 2023719, 'Activo', 1360, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1361, 2023719, 'Activo', 1361, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1362, 2023719, 'Activo', 1362, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1363, 2023719, 'Activo', 1363, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1364, 2023719, 'Activo', 1364, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1365, 2023719, 'Activo', 1365, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1366, 2023719, 'Activo', 1366, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1367, 2023719, 'Activo', 1367, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1368, 2023719, 'Activo', 1368, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1369, 2023719, 'Activo', 1369, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1370, 2023719, 'Activo', 1370, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1371, 2023719, 'Activo', 1371, 2, 36, NULL);
INSERT INTO `tblestudiante` VALUES (1372, 2024188, 'Activo', 1372, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1373, 2024188, 'Activo', 1373, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1374, 2024188, 'Activo', 1374, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1375, 2024188, 'Activo', 1375, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1376, 2024188, 'Activo', 1376, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1377, 2024188, 'Activo', 1377, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1378, 2024188, 'Activo', 1378, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1379, 2024188, 'Activo', 1379, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1380, 2024188, 'Activo', 1380, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1381, 2024188, 'Activo', 1381, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1382, 2024188, 'Activo', 1382, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1383, 2024188, 'Activo', 1383, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1384, 2024188, 'Activo', 1384, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1385, 2024188, 'Activo', 1385, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1386, 2024188, 'Activo', 1386, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1387, 2024188, 'Activo', 1387, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1388, 2024188, 'Activo', 1388, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1389, 2024188, 'Activo', 1389, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1390, 2024188, 'Activo', 1390, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1391, 2024188, 'Activo', 1391, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1392, 2024188, 'Activo', 1392, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1393, 2024188, 'Activo', 1393, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1394, 2024188, 'Activo', 1394, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1395, 2024188, 'Activo', 1395, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1396, 2024188, 'Activo', 1396, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1397, 2024188, 'Activo', 1397, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1398, 2024188, 'Activo', 1398, 2, 6, NULL);
INSERT INTO `tblestudiante` VALUES (1399, 2024224, 'Activo', 1399, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1400, 2024224, 'Activo', 1400, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1401, 2024224, 'Activo', 1401, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1402, 2024224, 'Activo', 1402, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1403, 2024224, 'Activo', 1403, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1404, 2024224, 'Activo', 1404, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1405, 2024224, 'Activo', 1405, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1406, 2024224, 'Activo', 1406, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1407, 2024224, 'Activo', 1407, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1408, 2024224, 'Activo', 1408, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1409, 2024224, 'Activo', 1409, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1410, 2024224, 'Activo', 1410, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1411, 2024224, 'Activo', 1411, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1412, 2024224, 'Activo', 1412, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1413, 2024224, 'Activo', 1413, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1414, 2024224, 'Activo', 1414, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1415, 2024224, 'Activo', 1415, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1416, 2024224, 'Activo', 1416, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1417, 2024224, 'Activo', 1417, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1418, 2024224, 'Activo', 1418, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1419, 2024224, 'Activo', 1419, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1420, 2024224, 'Activo', 1420, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1421, 2024224, 'Activo', 1421, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1422, 2024224, 'Activo', 1422, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1423, 2024224, 'Activo', 1423, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1424, 2024224, 'Activo', 1424, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1425, 2024224, 'Activo', 1425, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1426, 2024224, 'Activo', 1426, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1427, 2024224, 'Activo', 1427, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1428, 2024224, 'Activo', 1428, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1429, 2024224, 'Activo', 1429, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1430, 2024224, 'Activo', 1430, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1431, 2024224, 'Activo', 1431, 2, 14, NULL);
INSERT INTO `tblestudiante` VALUES (1432, 2024240, 'Activo', 1432, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1433, 2024240, 'Activo', 1433, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1434, 2024240, 'Activo', 1434, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1435, 2024240, 'Activo', 1435, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1436, 2024240, 'Activo', 1436, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1437, 2024240, 'Activo', 1437, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1438, 2024240, 'Activo', 1438, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1439, 2024240, 'Activo', 1439, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1440, 2024240, 'Activo', 1440, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1441, 2024240, 'Activo', 1441, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1442, 2024240, 'Activo', 1442, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1443, 2024240, 'Activo', 1443, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1444, 2024240, 'Activo', 1444, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1445, 2024240, 'Activo', 1445, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1446, 2024240, 'Activo', 1446, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1447, 2024240, 'Activo', 1447, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1448, 2024240, 'Activo', 1448, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1449, 2024240, 'Activo', 1449, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1450, 2024240, 'Activo', 1450, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1451, 2024240, 'Activo', 1451, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1452, 2024240, 'Activo', 1452, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1453, 2024240, 'Activo', 1453, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1454, 2024240, 'Activo', 1454, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1455, 2024240, 'Activo', 1455, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1456, 2024240, 'Activo', 1456, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1457, 2024240, 'Activo', 1457, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1458, 2024240, 'Activo', 1458, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1459, 2024240, 'Activo', 1459, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1460, 2024240, 'Activo', 1460, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1461, 2024240, 'Activo', 1461, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1462, 2024240, 'Activo', 1462, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1463, 2024270, 'Activo', 1463, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1464, 1812457, 'Activo', 1464, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1465, 2024270, 'Activo', 1465, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1466, 2024270, 'Activo', 1466, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1467, 2024270, 'Activo', 1467, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1468, 2024270, 'Activo', 1468, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1469, 2024270, 'Activo', 1469, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1470, 2024270, 'Activo', 1470, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1471, 2024270, 'Activo', 1471, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1472, 2024270, 'Activo', 1472, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1473, 2024270, 'Activo', 1473, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1474, 2024270, 'Activo', 1474, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1475, 2024270, 'Activo', 1475, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1476, 2024270, 'Activo', 1476, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1477, 2024270, 'Activo', 1477, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1478, 2024270, 'Activo', 1478, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1479, 2024270, 'Activo', 1479, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1480, 2024270, 'Activo', 1480, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1481, 2024270, 'Activo', 1481, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1482, 2024270, 'Activo', 1482, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1483, 2024270, 'Activo', 1483, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1484, 2024270, 'Activo', 1484, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1485, 2024270, 'Activo', 1485, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1486, 2024270, 'Activo', 1486, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1487, 2024270, 'Activo', 1487, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1488, 2024270, 'Activo', 1488, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1489, 2024270, 'Activo', 1489, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1490, 2024270, 'Activo', 1490, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1491, 2024270, 'Activo', 1491, 2, 19, NULL);
INSERT INTO `tblestudiante` VALUES (1492, 2024318, 'Activo', 1492, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1493, 2024318, 'Activo', 1493, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1494, 2024318, 'Activo', 1494, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1495, 2024318, 'Activo', 1495, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1496, 2024318, 'Activo', 1496, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1497, 2024318, 'Activo', 1497, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1498, 2024318, 'Activo', 1498, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1499, 2024318, 'Activo', 1499, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1500, 2024318, 'Activo', 1500, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1501, 2024318, 'Activo', 1501, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1502, 2024318, 'Activo', 1502, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1503, 2024318, 'Activo', 1503, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1504, 2024318, 'Activo', 1504, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1505, 2024318, 'Activo', 1505, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1506, 2024318, 'Activo', 1506, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1507, 2024318, 'Activo', 1507, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1508, 2024318, 'Activo', 1508, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1509, 2024318, 'Activo', 1509, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1510, 2024318, 'Activo', 1510, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1511, 2024318, 'Activo', 1511, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1512, 2024318, 'Activo', 1512, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1513, 2024318, 'Activo', 1513, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1514, 2024318, 'Activo', 1514, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1515, 2024318, 'Activo', 1515, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1516, 2024318, 'Activo', 1516, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1517, 2024318, 'Activo', 1517, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1518, 2024318, 'Activo', 1518, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1519, 2024318, 'Activo', 1519, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1520, 2024318, 'Activo', 1520, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1521, 2024318, 'Activo', 1521, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1522, 2024318, 'Activo', 1522, 2, 25, NULL);
INSERT INTO `tblestudiante` VALUES (1523, 2027435, 'Activo', 1523, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1524, 2027435, 'Activo', 1524, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1525, 2027435, 'Activo', 1525, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1526, 2027435, 'Activo', 1526, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1527, 2027435, 'Activo', 1527, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1528, 2027435, 'Activo', 1528, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1529, 2027435, 'Activo', 1529, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1530, 2027435, 'Activo', 1530, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1531, 2027435, 'Activo', 1531, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1532, 2027435, 'Activo', 1532, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1533, 2027435, 'Activo', 1533, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1534, 2027435, 'Activo', 1534, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1535, 2027435, 'Activo', 1535, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1536, 2027435, 'Activo', 1536, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1537, 2027435, 'Activo', 1537, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1538, 2027435, 'Activo', 1538, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1539, 2027435, 'Activo', 1539, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1540, 2027435, 'Activo', 1540, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1541, 2027435, 'Activo', 1541, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1542, 2027435, 'Activo', 1542, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1543, 2027435, 'Activo', 1543, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1544, 2027435, 'Activo', 1544, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1545, 2027435, 'Activo', 1545, 2, 41, NULL);
INSERT INTO `tblestudiante` VALUES (1546, 2027539, 'Activo', 1546, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (1547, 2027539, 'Activo', 1547, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (1548, 2027539, 'Activo', 1548, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (1549, 2027539, 'Activo', 1549, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (1550, 2027539, 'Activo', 1550, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (1551, 2027539, 'Activo', 1551, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (1552, 2027539, 'Activo', 1552, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (1553, 2027539, 'Activo', 1553, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (1554, 2027539, 'Activo', 1554, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (1555, 2027539, 'Activo', 1555, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (1556, 2027539, 'Activo', 1556, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (1557, 2027539, 'Activo', 1557, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (1558, 2027539, 'Activo', 1558, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (1559, 2027539, 'Activo', 1559, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (1560, 2027539, 'Activo', 1560, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (1561, 2027539, 'Activo', 1561, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (1562, 2027539, 'Activo', 1562, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (1563, 2027539, 'Activo', 1563, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (1564, 2027539, 'Activo', 1564, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (1565, 2027539, 'Activo', 1565, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (1566, 2027539, 'Activo', 1566, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (1567, 2027539, 'Activo', 1567, 1, 10, NULL);
INSERT INTO `tblestudiante` VALUES (1568, 2028492, 'Activo', 1568, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1569, 2028492, 'Activo', 1569, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1570, 2028492, 'Activo', 1570, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1571, 2028492, 'Activo', 1571, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1572, 2028492, 'Activo', 1572, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1573, 2028492, 'Activo', 1573, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1574, 2028492, 'Activo', 1574, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1575, 2028492, 'Activo', 1575, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1576, 2028492, 'Activo', 1576, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1577, 2028492, 'Activo', 1577, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1578, 2028492, 'Activo', 1578, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1579, 2028492, 'Activo', 1579, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1580, 2028492, 'Activo', 1580, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1581, 2028492, 'Activo', 1581, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1582, 2028492, 'Activo', 1582, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1583, 2028492, 'Activo', 1583, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1584, 2028492, 'Activo', 1584, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1585, 2028492, 'Activo', 1585, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1586, 2028492, 'Activo', 1586, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1587, 2028492, 'Activo', 1587, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1588, 2028492, 'Activo', 1588, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1589, 2028492, 'Activo', 1589, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1590, 2028492, 'Activo', 1590, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1591, 2028492, 'Activo', 1591, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1592, 2028492, 'Activo', 1592, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1593, 2028492, 'Activo', 1593, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1594, 2028492, 'Activo', 1594, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1595, 2028492, 'Activo', 1595, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1596, 2028492, 'Activo', 1596, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1597, 2028492, 'Activo', 1597, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1598, 2028492, 'Activo', 1598, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1599, 2028492, 'Activo', 1599, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1600, 2028492, 'Activo', 1600, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1601, 2028492, 'Activo', 1601, 2, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1602, 2028493, 'Activo', 1602, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1603, 2028493, 'Activo', 1603, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1604, 2028493, 'Activo', 1604, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1605, 2028493, 'Activo', 1605, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1606, 2028493, 'Activo', 1606, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1607, 2028493, 'Activo', 1607, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1608, 2028493, 'Activo', 1608, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1609, 2028493, 'Activo', 1609, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1610, 2028493, 'Activo', 1610, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1611, 2028493, 'Activo', 1611, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1612, 2028493, 'Activo', 1612, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1613, 2028493, 'Activo', 1613, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1614, 2028493, 'Activo', 1614, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1615, 2028493, 'Activo', 1615, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1616, 2028493, 'Activo', 1616, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1617, 2028493, 'Activo', 1617, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1618, 2028493, 'Activo', 1618, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1619, 2028493, 'Activo', 1619, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1620, 2028493, 'Activo', 1620, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1621, 2028493, 'Activo', 1621, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1622, 2028493, 'Activo', 1622, 1, 5, NULL);
INSERT INTO `tblestudiante` VALUES (1623, 2028494, 'Activo', 1623, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1624, 2028494, 'Activo', 1624, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1625, 2028494, 'Activo', 1625, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1626, 2028494, 'Activo', 1626, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1627, 2028494, 'Activo', 1627, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1628, 2028494, 'Activo', 1628, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1629, 2028494, 'Activo', 1629, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1630, 2028494, 'Activo', 1630, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1631, 2028494, 'Activo', 1631, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1632, 2028494, 'Activo', 1632, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1633, 2028494, 'Activo', 1633, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1634, 2028494, 'Activo', 1634, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1635, 2028494, 'Activo', 1635, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1636, 2028494, 'Activo', 1636, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1637, 2028494, 'Activo', 1637, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1638, 2028494, 'Activo', 1638, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1639, 2028494, 'Activo', 1639, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1640, 2028494, 'Activo', 1640, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1641, 2028494, 'Activo', 1641, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1642, 2028494, 'Activo', 1642, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1643, 2028494, 'Activo', 1643, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1644, 2028494, 'Activo', 1644, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1645, 2028494, 'Activo', 1645, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1646, 2028494, 'Activo', 1646, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1647, 2028494, 'Activo', 1647, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1648, 2028494, 'Activo', 1648, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1649, 2028494, 'Activo', 1649, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1650, 2028494, 'Activo', 1650, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1651, 2028494, 'Activo', 1651, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1652, 2028494, 'Activo', 1652, 2, 11, NULL);
INSERT INTO `tblestudiante` VALUES (1653, 2032091, 'Activo', 1653, 2, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1654, 2032091, 'Activo', 1654, 2, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1655, 2032091, 'Activo', 1655, 2, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1656, 2032091, 'Activo', 1656, 2, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1657, 2032091, 'Activo', 1657, 2, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1658, 2032091, 'Activo', 1658, 2, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1659, 2032091, 'Activo', 1659, 2, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1660, 2032091, 'Activo', 1660, 2, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1661, 2032091, 'Activo', 1661, 2, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1662, 2032091, 'Activo', 1662, 2, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1663, 2032091, 'Activo', 1663, 2, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1664, 2032091, 'Activo', 1664, 2, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1665, 2032091, 'Activo', 1665, 2, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1666, 2032091, 'Activo', 1666, 2, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1667, 2032091, 'Activo', 1667, 2, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1668, 2032091, 'Activo', 1668, 2, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1669, 2032091, 'Activo', 1669, 2, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1670, 2041350, 'Activo', 1670, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1671, 2041350, 'Activo', 1671, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1672, 2041350, 'Activo', 1672, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1673, 2041350, 'Activo', 1673, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1674, 2041350, 'Activo', 1674, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1675, 2041350, 'Activo', 1675, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1676, 2041350, 'Activo', 1676, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1677, 2041350, 'Activo', 1677, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1678, 2041350, 'Activo', 1678, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1679, 2041350, 'Activo', 1679, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1680, 2041350, 'Activo', 1680, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1681, 2041350, 'Activo', 1681, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1682, 2041350, 'Activo', 1682, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1683, 2041350, 'Activo', 1683, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1684, 2041350, 'Activo', 1684, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1685, 2041350, 'Activo', 1685, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1686, 2041350, 'Activo', 1686, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1687, 2041350, 'Activo', 1687, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1688, 2041350, 'Activo', 1688, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1689, 2041350, 'Activo', 1689, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1690, 2041350, 'Activo', 1690, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1691, 2041350, 'Activo', 1691, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1692, 2041350, 'Activo', 1692, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1693, 2041350, 'Activo', 1693, 1, 12, NULL);
INSERT INTO `tblestudiante` VALUES (1694, 2062626, 'Activo', 1694, 2, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1695, 2062626, 'Activo', 1695, 2, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1696, 2062626, 'Activo', 1696, 2, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1697, 2062626, 'Activo', 1697, 2, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1698, 2062626, 'Activo', 1698, 2, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1699, 2062626, 'Activo', 1699, 2, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1700, 2062626, 'Activo', 1700, 2, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1701, 2062626, 'Activo', 1701, 2, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1702, 2062626, 'Activo', 1702, 2, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1703, 2062626, 'Activo', 1703, 2, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1704, 2062626, 'Activo', 1704, 2, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1705, 2062626, 'Activo', 1705, 2, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1706, 2062626, 'Activo', 1706, 2, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1707, 2062626, 'Activo', 1707, 2, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1708, 2062626, 'Activo', 1708, 2, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1709, 2062626, 'Activo', 1709, 2, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1710, 2062627, 'Activo', 1710, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1711, 2062627, 'Activo', 1711, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1712, 2062627, 'Activo', 1712, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1713, 2062627, 'Activo', 1713, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1714, 2062627, 'Activo', 1714, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1715, 2062627, 'Activo', 1715, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1716, 2062627, 'Activo', 1716, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1717, 2062627, 'Activo', 1717, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1718, 2062627, 'Activo', 1718, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1719, 2062627, 'Activo', 1719, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1720, 2062627, 'Activo', 1720, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1721, 2062627, 'Activo', 1721, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1722, 2062627, 'Activo', 1722, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1723, 2062627, 'Activo', 1723, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1724, 2062627, 'Activo', 1724, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1725, 2062627, 'Activo', 1725, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1726, 2062627, 'Activo', 1726, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1727, 2062627, 'Activo', 1727, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1728, 2062627, 'Activo', 1728, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1729, 2062627, 'Activo', 1729, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1730, 2062627, 'Activo', 1730, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1731, 2062627, 'Activo', 1731, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1732, 2062627, 'Activo', 1732, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1733, 2062627, 'Activo', 1733, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1734, 2062627, 'Activo', 1734, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1735, 2062627, 'Activo', 1735, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1736, 2062627, 'Activo', 1736, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1737, 2062627, 'Activo', 1737, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1738, 2062627, 'Activo', 1738, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1739, 2062627, 'Activo', 1739, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1740, 2062627, 'Activo', 1740, 2, 38, NULL);
INSERT INTO `tblestudiante` VALUES (1741, 2062629, 'Activo', 1741, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1742, 2062629, 'Activo', 1742, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1743, 2062629, 'Activo', 1743, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1744, 2062629, 'Activo', 1744, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1745, 2062629, 'Activo', 1745, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1746, 2062629, 'Activo', 1746, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1747, 2062629, 'Activo', 1747, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1748, 2062629, 'Activo', 1748, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1749, 2062629, 'Activo', 1749, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1750, 2062629, 'Activo', 1750, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1751, 2062629, 'Activo', 1751, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1752, 2062629, 'Activo', 1752, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1753, 2062629, 'Activo', 1753, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1754, 2062629, 'Activo', 1754, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1755, 2062629, 'Activo', 1755, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1756, 2062629, 'Activo', 1756, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1757, 2062629, 'Activo', 1757, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1758, 2062629, 'Activo', 1758, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1759, 2062629, 'Activo', 1759, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1760, 2062629, 'Activo', 1760, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1761, 2062629, 'Activo', 1761, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1762, 2062629, 'Activo', 1762, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1763, 2062629, 'Activo', 1763, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1764, 2062629, 'Activo', 1764, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1765, 2062629, 'Activo', 1765, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1766, 2062629, 'Activo', 1766, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1767, 2062629, 'Activo', 1767, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1768, 2062629, 'Activo', 1768, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1769, 2062629, 'Activo', 1769, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1770, 2062629, 'Activo', 1770, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1771, 2062629, 'Activo', 1771, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1772, 2062629, 'Activo', 1772, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1773, 2062629, 'Activo', 1773, 1, 32, NULL);
INSERT INTO `tblestudiante` VALUES (1774, 2062630, 'Activo', 1774, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1775, 2062630, 'Activo', 1775, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1776, 2062630, 'Activo', 1776, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1777, 2062630, 'Activo', 1777, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1778, 2062630, 'Activo', 1778, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1779, 2062630, 'Activo', 1779, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1780, 2062630, 'Activo', 1780, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1781, 2062630, 'Activo', 1781, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1782, 2062630, 'Activo', 1782, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1783, 2062630, 'Activo', 1783, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1784, 2062630, 'Activo', 1784, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1785, 2062630, 'Activo', 1785, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1786, 2062630, 'Activo', 1786, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1787, 2062630, 'Activo', 1787, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1788, 2062630, 'Activo', 1788, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1789, 2062630, 'Activo', 1789, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1790, 2062630, 'Activo', 1790, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1791, 2062630, 'Activo', 1791, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1792, 2062630, 'Activo', 1792, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1793, 2062630, 'Activo', 1793, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1794, 2062630, 'Activo', 1794, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1795, 2062630, 'Activo', 1795, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1796, 2062630, 'Activo', 1796, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1797, 2062630, 'Activo', 1797, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1798, 2062630, 'Activo', 1798, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1799, 2062630, 'Activo', 1799, 1, 35, NULL);
INSERT INTO `tblestudiante` VALUES (1800, 1, 'Activo', 1800, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1801, 1, 'Activo', 1801, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1802, 1, 'Activo', 1802, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1803, 1, 'Activo', 1803, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1804, 1, 'Activo', 1804, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1805, 1, 'Activo', 1805, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1806, 1, 'Activo', 1806, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1807, 1, 'Activo', 1807, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1808, 1, 'Activo', 1808, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1809, 1, 'Activo', 1809, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1810, 1, 'Activo', 1810, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1811, 1, 'Activo', 1811, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1812, 1, 'Activo', 1812, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1813, 1, 'Activo', 1813, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1814, 1, 'Activo', 1814, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1815, 1, 'Activo', 1815, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1816, 1, 'Activo', 1816, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1817, 1, 'Activo', 1817, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1818, 1, 'Activo', 1818, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1819, 1, 'Activo', 1819, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1820, 1, 'Activo', 1820, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1821, 1, 'Activo', 1821, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1822, 1, 'Activo', 1822, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1823, 1, 'Activo', 1823, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1824, 1, 'Activo', 1824, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1825, 1, 'Activo', 1825, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1826, 1, 'Activo', 1826, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1827, 1, 'Activo', 1827, 1, 34, NULL);
INSERT INTO `tblestudiante` VALUES (1828, 1, 'Activo', 1828, 1, 34, NULL);

-- ----------------------------
-- Table structure for tblfuncion
-- ----------------------------
DROP TABLE IF EXISTS `tblfuncion`;
CREATE TABLE `tblfuncion`  (
  `FunCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `FunNombre` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FunEstado` enum('Activo','Inactivo') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`FunCodigo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tblfuncion
-- ----------------------------
INSERT INTO `tblfuncion` VALUES (1, 'Admin', 'Activo');

-- ----------------------------
-- Table structure for tblhuella
-- ----------------------------
DROP TABLE IF EXISTS `tblhuella`;
CREATE TABLE `tblhuella`  (
  `HueCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `HueCaracter1` longblob NOT NULL,
  `HueCaracter2` longblob NOT NULL,
  `HueCaracter3` longblob NOT NULL,
  `HueCaracter4` longblob NOT NULL,
  `HueCaracter5` longblob NOT NULL,
  `HueEstado` enum('Activo','Inactivo') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`HueCodigo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tblinscripcion
-- ----------------------------
DROP TABLE IF EXISTS `tblinscripcion`;
CREATE TABLE `tblinscripcion`  (
  `InsCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `InsFecha` date NOT NULL,
  `InsEstado` enum('Activo','Inactivo') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `InsProVotCodigo` bigint(20) NOT NULL,
  `InsAspCodigo` bigint(20) NOT NULL,
  PRIMARY KEY (`InsCodigo`) USING BTREE,
  INDEX `Inscripcion_fk_Aspirante`(`InsAspCodigo`) USING BTREE,
  INDEX `Inscripcion_fk_Proceso`(`InsProVotCodigo`) USING BTREE,
  INDEX `Incripcion_fk_Votante`(`InsFecha`) USING BTREE,
  CONSTRAINT `Inscripcion_fk_Aspirante` FOREIGN KEY (`InsAspCodigo`) REFERENCES `tblaspirante` (`AspCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Inscripcion_fk_Proceso` FOREIGN KEY (`InsProVotCodigo`) REFERENCES `tblprocesovotacion` (`ProVotCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbljornada
-- ----------------------------
DROP TABLE IF EXISTS `tbljornada`;
CREATE TABLE `tbljornada`  (
  `JorCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `JorNombre` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JorEstado` enum('Activo','Inactivo') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`JorCodigo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbljornada
-- ----------------------------
INSERT INTO `tbljornada` VALUES (1, 'DIURNA', 'Activo');
INSERT INTO `tbljornada` VALUES (2, 'MIXTA', 'Activo');
INSERT INTO `tbljornada` VALUES (3, 'NOCTURNA', 'Activo');

-- ----------------------------
-- Table structure for tblpersona
-- ----------------------------
DROP TABLE IF EXISTS `tblpersona`;
CREATE TABLE `tblpersona`  (
  `PerCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `PerDocumento` decimal(12, 0) NOT NULL,
  `PerNombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PerApellido` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PerEstado` enum('Activo','Inactivo') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PerSexCodigo` bigint(20) NOT NULL,
  `PerTipdocCodigo` bigint(20) NOT NULL,
  PRIMARY KEY (`PerCodigo`) USING BTREE,
  INDEX `Persona_fk_tipdoc`(`PerTipdocCodigo`) USING BTREE,
  INDEX `Persona_fk_sexo`(`PerSexCodigo`) USING BTREE,
  CONSTRAINT `Persona_fk_sexo` FOREIGN KEY (`PerSexCodigo`) REFERENCES `tblsexo` (`SexCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Persona_fk_tipdoc` FOREIGN KEY (`PerTipdocCodigo`) REFERENCES `tbltipodocumento` (`TipdocCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1829 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tblpersona
-- ----------------------------
INSERT INTO `tblpersona` VALUES (1, 123, 'BIENESTAR', 'AL APRENDIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (2, 1, 'VOTO', 'EN BLANCO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (3, 1006503308, 'MARCELA', 'URBINA ARTUNDUAGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (4, 1006503632, 'YEIMER JULIAN', 'CERQUERA CAICEDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (5, 1006505799, 'SANTIAGO ANDRES', 'ORTIZ VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (6, 1006513537, 'YURANI', 'OTAYA SOTO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (7, 1006530380, 'KEVIN DAVID', 'MUÑOZ PALACIOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (8, 1007312594, 'LEIDY MARCELA', 'PEREZ SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (9, 1007721470, 'ANGIE YINETH', 'BELTRAN ROJAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (10, 1010013300, 'CARLOS ALBERTO', 'GUTIERREZ GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (11, 1075294500, 'TATIANA KAROLINA', 'BORRAY VARON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (12, 1116922477, 'YARLEDY', 'MORALES GUAPACHA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (13, 1117501951, 'LIDA XIOMARA', 'MUÑOZ SUAREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (14, 1117509023, 'ANGIE LIZETH', 'TRUJILLO ROJAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (15, 1117516792, 'LILLEY ANDREA', 'CASTAÑO CHALARCA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (16, 1117517651, 'ANYURY LIZETH', 'ROJAS CASTAÑEDA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (17, 1117526417, 'WILMER', 'MUÑOZ CORREA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (18, 1117533691, 'DEIVY FABIAN', 'CHILITO SANDOVAL', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (19, 1117541423, 'JONATHAN ARLEY', 'CALDERON HOYOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (20, 1117548236, 'LIDA CRISTINA', 'QUINTANA GUZMAN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (21, 1117548239, 'NEVIS LORENA', 'CESPEDES VILLABON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (22, 1117549586, 'MARIA ALEJANDRA', 'QUEZADA SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (23, 1117550088, 'ALEJANDRA', 'HERNANDEZ MURILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (24, 1117553723, 'JOSE STIVEN', 'GUTIERREZ TOLEDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (25, 1117554212, 'YULI DANIELA', 'ANDRADE PUENTES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (26, 1117885880, 'DIANA SORAYA', 'CHAVEZ PARADA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (27, 1118072100, 'DANIS NAYIBE', 'CARDENAS VILLABON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (28, 40076663, 'YADDY MILENA', 'VARGAS ARTUNDUAGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (29, 1006526232, 'ERIK ALEXIS', 'ESCOBAR VIDAL', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (30, 1006506070, 'ADRIANA LUCIA', 'CORREA CHILITO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (31, 1006506350, 'KEVIN STIVEN', 'QUIZABONI OROZCO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (32, 1006513810, 'DANNA YULISA', 'ANDRADE SOTO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (33, 1006515408, 'ANYIRLETH', 'LOPEZ PEREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (34, 1006515683, 'MARIA PAULA', 'LOPEZ SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (35, 1006549935, 'ARBEY', 'VICTORIA OSORIO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (36, 1067945731, 'JHON JAIRO', 'RUZ CASTRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (37, 1081700385, 'LEIDY ZULEIMA', 'CASTELLANOS PORTELA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (38, 1082068239, 'JUAN', 'IRIARTE QUIROS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (39, 1083928017, 'NEVIS LICEDHT', 'RONDON SOTO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (40, 1116209554, 'ANDERSON JAVIER', 'MORALES CORDOBA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (41, 1116923289, 'JESSICA LILIANA', 'TRUJILLO CEFERINO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (42, 1117502954, 'JAIME MARINO', 'MUÑOZ ARBOLEDA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (43, 1117517289, 'CARLOS SANTIAGO', 'LOZANO GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (44, 1117523917, 'JOHAN CAMILO', 'BLANCO ESPINOSA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (45, 1117529162, 'YEINY', 'HOYOS PALOMARES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (46, 1117533805, 'YEISON FABIAN', 'RAMOS VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (47, 1117541148, 'EDNA MAGALY', 'COBO CAMPOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (48, 1117541504, 'CARLOS ALFREDO', 'DIAZ MANRIQUE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (49, 1117549002, 'INGRI YULIETH', 'TORRES PEÑA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (50, 1117550673, 'BRALLAN STIVEN', 'MARIN CARDEÑO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (51, 1117550799, 'MILTON EDUARDO', 'BETANCOURTH LOSADA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (52, 1118072753, 'DIEGO', 'ARDILA CALDERON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (53, 1119218092, 'ANA LIZETH', 'MARTINEZ CUELLAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (54, 17653206, 'NELSON', 'ARCOS MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (55, 1117809317, 'OSCAR MAURICIO', 'DIAZ PUENTES', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (56, 1117525237, 'YENNY ANDREA', 'OVALLE GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (57, 1117526901, 'MIGUEL ANGEL', 'MORALES CABRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (58, 1117551436, 'LUIS ESTEBAN', 'TELLEZ VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (59, 1117969145, 'LUIS MIGUEL', 'MURCIA DIAZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (60, 1118469908, 'HEIDY ROCIO', 'OLIVEROS PARRA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (61, 1119586472, 'VICTOR MANUEL', 'MORA ARTUNDUAGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (62, 1121873278, 'ANGIE KATERINE', 'CASTAÑO AGUIRRE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (63, 12190071, 'RUBEN DARIO', 'POLO SIERRA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (64, 17652432, 'JHON JAIME', 'ROMERO RAMIREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (65, 17656960, 'JUAN CARLOS', 'REINA CAICEDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (66, 30506798, 'NANCY', 'GUTIERREZ VELASQUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (67, 34601859, 'CRISTIAN EDILMA', 'PAREDES GONZALEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (68, 40086196, 'LUZ STELLA', 'SOGAMOSO SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (69, 40670701, 'DIANA MARCELA', 'MORALES RIAÑO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (70, 4888429, 'JORGE ARLED', 'PARRA PEREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (71, 52267011, 'IRIALED', 'MURCIA OCACIONES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (72, 52461730, 'MARTHA PATRICIA', 'GUEVARA VELASQUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (73, 55173287, 'LINA MARIA', 'DUSSAN QUIROGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (74, 80791442, 'JOVANNY', 'RODRIGUEZ MALTEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (75, 94326445, 'GUILLERMO', 'VARGAS MARULANDA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (76, 94417155, 'ALEXANDER', 'VELASQUEZ VALENCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (77, 96340568, 'JOSE ALFONSO', 'OVALLE ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (78, 1007650574, 'RONALD ALEJANDRO', 'ROMERO GALEANO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (79, 1006502224, 'SAMUEL', 'SILVA GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (80, 1006514642, 'EDWIN ARLEY', 'MOSQUERA ALBORNOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (81, 1006531289, 'JUAN DANIEL', 'SANCHEZ CUPITRE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (82, 1007428263, 'DUVERNEY', 'SANCHEZ CUPITRE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (83, 1007430976, 'JEFERSON', 'IQUINA FLOREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (84, 1117527671, 'FABIO ANDRES', 'RODRIGUEZ BERMUDEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (85, 1117529377, 'ROSA ANGELICA', 'VALENZUELA RUANO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (86, 1117533311, 'JUAN CARLOS', 'MOSQUERA ROJAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (87, 1117540560, 'BRENDA PATRICIA', 'PALACIOS AGUALIMPIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (88, 1117543997, 'DUVAN', 'ROJAS OSPINA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (89, 1117549899, 'HECTOR ILLAN', 'CELIS RAMIREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (90, 1117551220, 'ALEJANDRO', 'MORENO PELAEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (91, 1117554791, 'RONALDO', 'RIVERA YONDA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (92, 1119218480, 'YEISON STIVENS', 'ROMERO ANGARITA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (93, 1119581649, 'YUBERLY', 'BENAVIDEZ TAFUR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (94, 1192919742, 'YERSON ANDRES', 'MORALES GIRALDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (95, 1006512075, 'JHOINER ESNEIDER', 'SAPUY CALDERON', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (96, 1006419324, 'JEFFERSON MAURICIO', 'ARBOLEDA MURILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (97, 1006431143, 'LUIS ANDRES', 'AYALA SCARPETTA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (98, 1006503826, 'LAURA LIZETH', 'GARCIA ORTEGOSA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (99, 1006505664, 'LORENA', 'TRUJILLO SILVESTRE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (100, 1006512214, 'KELLY JOHANNA', 'GONZALEZ ROJAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (101, 1006514233, 'LEIDY TATIANA', 'VARGAS BERMEO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (102, 1006514489, 'JHON GEINER', 'GUALTERO GAVIRIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (103, 1006515193, 'YESICA LORENA', 'CLAROS PERDOMO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (104, 1006518098, 'YULIZA FERNANDA', 'YAIMA FRANCO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (105, 1007451370, 'ERIKA JULIETH', 'PARRA ARIAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (106, 1012433097, 'MIGUEL ANGEL', 'SANCHEZ MANQUILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (107, 1117514263, 'MARLON ANDRES', 'MURCIA PLAZA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (108, 1117533970, 'CRISTY MELISSA', 'ESTRELLA FORERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (109, 1117541352, 'JOSE ALEJANDRO', 'JARA SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (110, 1117541854, 'MARIA ANGELICA', 'TRUJILLO ORTIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (111, 1117541931, 'DANIA ALEXANDRA', 'CAMILO GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (112, 1117542860, 'ALVARO FERNANDO', 'OVIEDO PORTILLA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (113, 1117542877, 'YEIFERSON FABIAN', 'TOVAR PEREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (114, 1117543850, 'ANDREA YISETH', 'CORTES RAMIREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (115, 1117544969, 'GERMAN', 'PERDOMO VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (116, 1117548562, 'NINI YOHANA', 'CLAROS TOBON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (117, 1117549338, 'KAREN ALEJANDRA', 'GALINDO VERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (118, 1117551291, 'MARIA ALEJANDRA', 'FRANCO GUZMAN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (119, 1117552032, 'SIRLEY DAYANA', 'CAMACHO AGUILAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (120, 1117553570, 'LIDA MARLEDI', 'BUSTOS LLANOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (121, 1117555087, 'ELIZABETH', 'BELTRAN CORRALES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (122, 1117886024, 'MARTHA LUCIA', 'MEDINA PEREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (123, 1120355522, 'DIANA LORENA', 'CRUZ MONSALVE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (124, 1122730403, 'MARYURI', 'CASANOVA GODOY', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (125, 1006483942, 'YEIMY MARCELA', 'CARDONA QUIMBAYA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (126, 1006512434, 'KAREN JULIETH', 'ROJAS CHAVARRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (127, 1006513672, 'CARLOS STIVEN', 'DIMEY PARRA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (128, 1006523328, 'ANDRES FELIPE', 'BUSTOS PAREDES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (129, 1010151512, 'KELLY JOHANA', 'DIAZ SALINAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (130, 1083929542, 'SARA VICTORIA', 'DIAZ FACUNDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (131, 1117236294, 'CRISTIAN DANIEL', 'SALAZAR RIVERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (132, 1117507239, 'JAVIER ESTEBAN', 'GONZALEZ HERNANDEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (133, 1117543610, 'INGRID SORAYA', 'ANGEL GAVIRIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (134, 1117545884, 'DIANA YISETH', 'SANCHEZ VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (135, 1117549175, 'DANIEL RICARDO', 'PEREZ PENAGOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (136, 1117552050, 'RICHARD OSWALDO', 'LIZCANO SUAREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (137, 1117552472, 'YEISON DANIEL', 'ALVIS CUELLAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (138, 1117554495, 'ELKIN ANDRES', 'CHIPATECUA TAMARA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (139, 1117837907, 'EVI ALEXANDER', 'CAVIEDES GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (140, 1118070656, 'WILKIN ANDRES', 'CAICEDO VERGARA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (141, 96343626, 'FAIBER ANDRES', 'ROMERO TOVAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (142, 1004791236, 'ADRIANA MILENA', 'TREJOS MEJIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (143, 1006484380, 'JULISSA VANESSA', 'RIVERA TRUJILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (144, 1006514544, 'KERLY VIVIANA', 'CERQUERA BURBANO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (145, 1006521731, 'CARLOS ANDRES', 'CASANOVA BAZTIDAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (146, 1010147593, 'YESLY LICETH', 'DELGADO CORTES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (147, 1116208364, 'YEVILER', 'PLAZAS RIVAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (148, 1117505812, 'DANNA YULIZA', 'VIDAL VAQUIRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (149, 1117527161, 'SEBASTIAN DARIO', 'OSORIO TORRES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (150, 1117527181, 'MARILCE', 'VELASQUEZ CASTRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (151, 1117541449, 'LEIDY JOHANA', 'VASQUEZ LOSADA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (152, 1117549790, 'YESENIA', 'HINCAPIE MORENO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (153, 1117551537, 'DEIBY STEVEN', 'BEJARANO SUAREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (154, 1117553922, 'CAROLINA', 'MURILLO RAMIREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (155, 1119581653, 'MARYURI', 'BENAVIDEZ TAFUR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (156, 91299175, 'LUDWING', 'PINZON FONSECA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (157, 1006484381, 'ZULY MAIDE', 'SANCHEZ TEQUIN', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (158, 1193096226, 'YEFERSON ALEJANDRO', 'GIRON GOMEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (159, 1006459182, 'MANUELA', 'QUIÑONES PALACIOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (160, 1006501349, 'JENNDRY', 'CANO LOPEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (161, 1006513679, 'KAREN DAYANA', 'VELASQUEZ OCHOA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (162, 1006515139, 'DAYANA JIMENA', 'CENON DURAN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (163, 1104700773, 'MARYURI', 'AGUILAR OSORIO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (164, 1117511747, 'EDITH', 'MORENO HERNANDEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (165, 1117528137, 'CLARA INES', 'CORDOBA RAMIREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (166, 1117528963, 'YERALDIN', 'GALLO LOZADA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (167, 1117544793, 'YEHINY YOHANA', 'CANO CABRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (168, 1117548193, 'JHON WILLIAM', 'ABELLO CHAGUALA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (169, 1117548472, 'YULEIDY', 'PEÑA ROJAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (170, 1117549464, 'ADRIANA', 'OSORIO RAMIREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (171, 1117550742, 'LEIDY MARCELA', 'ZORIA GARCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (172, 1117554963, 'ANGELICA JAIDITH', 'SILVA CASTRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (173, 1144125411, 'DUVIER', 'ARROYAVE GAVIRIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (174, 40731635, 'DORANY', 'VARGAS CASTAÑO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (175, 40784160, 'MONICA MARCELA', 'MONTEALEGRE CUELLAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (176, 1006501364, 'MARIA FERNANDA', 'GONZALEZ CASTRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (177, 1007357056, 'EDUARD FABIO', 'PALOMARES CASTRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (178, 1065839581, 'ALEXANDRA MAIRETH', 'VILLA GUERRA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (179, 1116912414, 'CRISTIAN', 'RINCON VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (180, 1117234885, 'NICOLAS', 'PRADA LOZANO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (181, 1117493076, 'YURANY', 'PEREZ VITOPIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (182, 1117544203, 'ANYERSSON SMITH', 'ORTIZ ROSAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (183, 1117551262, 'JHON JAIRO', 'VARGAS MANRIQUE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (184, 1117554263, 'ALEJANDRA', 'BLANCO PADILLA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (185, 1119580197, 'PAULA ANDREA', 'VILLEGAS MONTENEGRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (186, 1005663129, 'CHRISTIAN DE JESUS', 'ARROYO TAMARA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (187, 1006501752, 'ADRIAN', 'ACOSTA FAJARDO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (188, 1006503917, 'WILFRETHD ANDRES', 'SUAREZ TRUJILLO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (189, 1010104231, 'YAYLER', 'MENA CUESTA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (190, 1006537560, 'WILLIAM FELIPE', 'WILCHES CAICEDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (191, 1019104929, 'DANIELA VANESSA', 'CHAPARRO MARIN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (192, 10308302, 'WILFRAN FABIAN', 'ORTEGA BRAVO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (193, 1053862047, 'MARY LUZ', 'VELASQUEZ GORDILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (194, 1056613580, 'LUIS CARLOS', 'PEDREROS SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (195, 1117518835, 'YUDY MILENA', 'GUTIERREZ CUPITRA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (196, 1117522923, 'KARLA', 'CABRERA NOVOA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (197, 1117529345, 'ZAIRA YUMARI', 'CUERO PARRA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (198, 1117540261, 'BRAYAN ANDRES', 'MURILLO TRUJILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (199, 1117546520, 'LUIS EDUARDO', 'MOLANO LOZANO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (200, 1117550224, 'DENNY LORENA', 'MOLANO LOZANO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (201, 16186444, 'IVAN YESID', 'SALAZAR PENNA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (202, 17642214, 'YOUBRY ALBERTO', 'CUELLAR SIERRA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (203, 17646934, 'JOHN JAIRO', 'OLAYA MARIN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (204, 17788695, 'URIEL', 'SAENZ CAMACHO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (205, 28555960, 'FERLEY', 'ROJAS GUZMAN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (206, 31434144, 'LINA MARCELA', 'COMETA MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (207, 31585841, 'MAGNOLIA CELESTINA', 'QUIÑONES CORTES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (208, 40671013, 'BEATRIZ', 'ROJAS PEDRERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (209, 40776288, 'SANDRA ELIANA', 'VARELA CERQUERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (210, 6803851, 'HERLY', 'MURCIA OCASIONES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (211, 79731554, 'JOSE EDWIN', 'HERNANDEZ SARMIENTO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (212, 80310001, 'HILARIO LEOPOLDO', 'SOCHE ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (213, 1006503611, 'JOSE DAVID', 'BOHORQUEZ LIZARAZO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (214, 1001947011, 'KRISLY ALEJANDRA', 'RANGEL TORRADO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (215, 1006419758, 'HEINER', 'REYES GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (216, 1006503083, 'PAULA DANIELA', 'VAQUIRO ALVIRA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (217, 1006504389, 'ANGIE VALENTINA', 'SUAREZ CULMA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (218, 1006505236, 'MARY', 'QUIROZ MAVESOY', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (219, 1006516357, 'ANGELA VALENTINA', 'GUTIERREZ CARABALI', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (220, 1006813415, 'MARIA PATRICIA', 'VALDERRAMA CARDONA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (221, 1006813416, 'MARIA CLAUDIA', 'VALDERRAMA CARDONA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (222, 1006956582, 'KAREN DAYANA', 'VALLEJOS PAJOY', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (223, 1007620560, 'RUMALDO', 'TRUJILLO PEÑA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (224, 1007761551, 'YORDANY', 'TRUJILLO BARRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (225, 1115795500, 'JAIRO', 'VELA TORRES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (226, 1116553169, 'LUIS DAVID', 'BLANDON GONZALEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (227, 1117235918, 'MARBELL', 'MORA ANDELA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (228, 1117528912, 'DIANA PAOLA', 'SAABEDRA CASTRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (229, 1117532698, 'ELIZABETH', 'NAVEROS TRUJILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (230, 1117539252, 'ALEX SNEIDER', 'BOCANEGRA CAMACHO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (231, 1117542330, 'LINA MARIA', 'AROCA HENAO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (232, 1117546443, 'HEVER ESNEYDER', 'CASTRO RIVERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (233, 1117551316, 'SANTIAGO STIVEIN', 'CICERY HURTATIS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (234, 1117551503, 'JUAN CAMILO', 'TRUJILLO BASTIDAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (235, 1117551771, 'ANGELA ALEXANDRA', 'MORENO POLANIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (236, 1117552682, 'CRISTIAN MAURICIO', 'ROJAS CANO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (237, 1117554757, 'ESTEFANIA', 'ARREDONDO ARREDONDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (238, 1119217758, 'LINA MARCELA', 'MAYA LOPEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (239, 1119217841, 'JUAN ESTEBAN', 'NARANJO GUARNIZO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (240, 1119218597, 'MARIA ISABEL', 'CHAUX CHIVARA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (241, 1193372983, 'MARIA NATALIA', 'ROJAS ARREDONDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (242, 1006458886, 'KEVIN MAURICIO', 'CAMARGO GOMEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (243, 1006504604, 'YULIANA', 'LOPEZ ALAPE', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (244, 1006508352, 'NEIDER FABRICIO', 'ORTIZ MUÑOZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (245, 1006509167, 'FREEMAN STEVEN', 'GUARNIZO LOSADA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (246, 1006538775, 'RONALD STIVENT', 'CHACON CALDERON', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (247, 1000954322, 'DILLAN SEBASTIAN', 'NUÑEZ PEÑA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (248, 1006458846, 'JAVIER CAMILO', 'MORALES ALDANA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (249, 1006500949, 'ANDRES FELIPE', 'RAMIREZ CHAVEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (250, 1006501577, 'MARIAN YULIETH', 'RAMIREZ MADRIGAL', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (251, 1006513847, 'KAROL MICHELL', 'VALENCIANO PASTRANA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (252, 1007156360, 'VICTOR SLEIDER', 'DE ORO FLORES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (253, 1007227865, 'SHIRLEY ANDREA', 'SILVA ESTRELLA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (254, 1007851711, 'PAULA ANDREA', 'MOPAN OBREGON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (255, 1117530410, 'PABLO ANDRES', 'HERRERA GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (256, 1117535584, 'MARLON', 'HERNANDEZ BEDOYA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (257, 1117546193, 'FRANKLIN', 'ESCOBAR SILVESTRE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (258, 1117547583, 'DAVID', 'SILVA ESTRELLA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (259, 1117549232, 'GINA MILDRETH', 'MARTINEZ BARRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (260, 1117551725, 'JEAN CARLOS', 'CAMPOS SALAZAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (261, 1121209112, 'JHONBARI', 'GONZALEZ VASQUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (262, 7713350, 'CRISTIAN', 'SILVA LLOYD', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (263, 1006501923, 'DIVER ESTIVEN', 'RODRIGUEZ CABRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (264, 1006506462, 'BRAYAN', 'HERRERA TRUJILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (265, 1192893495, 'YEISON ANDRES', 'RAMIREZ VARELA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (266, 1193316968, 'JUAN DIEGO', 'SAENZ ZUÑIGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (267, 1003814189, 'BRAYAN ANDRES', 'MARIN ACOSTA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (268, 1006419564, 'FABIAN', 'ALONSO MARTINEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (269, 1006484256, 'CARLOS MARIO', 'ROJAS ACOSTA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (270, 1006502828, 'NAYDELIN', 'ROMERO SOTO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (271, 1006514169, 'RAMON ELIAS', 'CARDENAS BERMUDEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (272, 1006530365, 'JHON KENNED', 'PARRA CARDOZO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (273, 1006597122, 'HAROLD FABIAN', 'CONDE CABRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (274, 1026302874, 'ALVARO JAVIER', 'MOTTA CARDOZO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (275, 1040803210, 'KEYN GHICELL', 'MARTINEZ MADRID', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (276, 1077876765, 'INGRID TATIANA', 'CABRERA JOVEN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (277, 1115792331, 'JEISON ANDRES', 'GONZALEZ CABRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (278, 1117518456, 'DUVERNEY', 'OSPINA CALDERON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (279, 1117534392, 'JHON FREDY', 'PEÑA CHAUX', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (280, 1117543585, 'BRAYAN LEANDRO', 'REYES MACIAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (281, 1117550289, 'ERICA ALEJANDRA', 'DIAZ REYES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (282, 1117553210, 'YULY ALEJANDRA', 'HUACA MALAVER', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (283, 1118473590, 'DUVAN', 'ROMERO GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (284, 1192894982, 'YONIER', 'TREJOS BEDOYA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (285, 12168626, 'DUMER EFREN', 'ROSERO IMBACHY', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (286, 1117785081, 'RONALD STIWAR', 'AUDOR GRISALES', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (287, 1004269559, 'JHONATAN ESLEIDER', 'MENESES PIAMBA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (288, 1006410097, 'ANGHELLA CAMILA', 'LOZANO GONZALEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (289, 1006431465, 'JHON EIDER', 'YUCUMA CANACUE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (290, 1006501144, 'ANGIE YARLEDY', 'URREA OCAÑA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (291, 1006504594, 'STIVEN', 'SCARPETA PARRA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (292, 1006504768, 'JONIER ANDRES', 'CASTRO CLAROS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (293, 1006506199, 'ANGIE DAYANNA', 'BUSTOS MORALES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (294, 1006513911, 'CRISTIAN DAVID', 'VARGAS GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (295, 1006514629, 'FABIAN ANDRES', 'BURITICA DIAZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (296, 1006550248, 'INGRI KATHERINE', 'HUACA CARVAJAL', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (297, 1007761187, 'ANDREA LIZETH', 'RIVERA MORENO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (298, 1117494965, 'OLGA PATRICIA', 'CHICA CARDONA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (299, 1117526228, 'ECCEHOMO', 'MONTENEGRO MONTEALEGRE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (300, 1117532053, 'JONATHAN ALEXANDER', 'ROJAS SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (301, 1117546400, 'BRAYAN CAMILO', 'GARZON PAREJA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (302, 1117548210, 'LINA MARCELA', 'RAMOS RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (303, 1117550851, 'GLORIA STEFANY', 'MENESES PIAMBA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (304, 1117554245, 'LAUREN DANIELA', 'SUAREZ GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (305, 1117554672, 'LAURA CAMILA', 'LIZCANO VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (306, 1125178803, 'MONICA ALEJANDRA', 'MOSQUERA RIOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (307, 30508148, 'LIDA PATRICIA', 'MOLINA ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (308, 1006431112, 'ANA MARIA', 'ROA HERNANDEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (309, 1006503710, 'JHON ALEXANDER', 'MENDOZA SANCHEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (310, 1006505400, 'JUAN PABLO', 'MENDEZ BALLESTEROS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (311, 1006506423, 'DEICY LIZETH', 'ARTUNDUAGA BENITEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (312, 1006507052, 'ERIKA VIVIANA', 'PEÑA BALLESTEROS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (313, 1006507208, 'INGRID SOFIA', 'CASTRO CALDERON', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (314, 1006537816, 'DEICY KARINA', 'RAMOS DELGADO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (315, 1006538426, 'YULLY VANESSA', 'GOMEZ GONZALEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (316, 1117806166, 'GIRA ALEJANDRA', 'VERU SARRIA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (317, 1006503743, 'RUBEN DARIO', 'RAMIREZ OCHOA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (318, 1006513645, 'JHON EDWARD', 'VELASQUEZ ROJAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (319, 1007320301, 'YENNI ALEJANDRA', 'ORTIZ ORTIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (320, 1115949324, 'CONSUELO', 'PEÑA PEREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (321, 1116922807, 'DAIMAR', 'GARCIA RAMOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (322, 1117514243, 'ONEIDA', 'PEÑA PEREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (323, 1117515471, 'DIEGO ALEJANDRO', 'DIAZ RESTREPO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (324, 1117530158, 'JENIFER ANDREA', 'NUÑEZ CABRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (325, 1117546401, 'ANGIE LICETH', 'CORREA GALLEGO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (326, 1117548337, 'DANIELA', 'VALBUENA GALINDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (327, 1117552022, 'INDIRA DANIELA', 'PENA SUAREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (328, 1117554466, 'ANA MARIA', 'PADILLA ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (329, 1117815171, 'JOHN JAIRO', 'GOMEZ TORRES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (330, 40614651, 'KELLY JHOANA', 'QUINTERO GARZON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (331, 1003895601, 'RICARDO', 'AMAYA CORONADO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (332, 1004208352, 'LAURA ESTEFANIA', 'SALAS MEDINA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (333, 1006502841, 'ZULLY BRIYETH', 'VILLEGAS QUINTERO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (334, 1006503031, 'MAIRA LIZETH', 'GUERRERO CABRERA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (335, 1006505617, 'ZORY DANITZA', 'FAJARDO CARVAJAL', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (336, 1006507287, 'DILIA MARIA', 'CUELLAR CALDERON', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (337, 1006537990, 'YUMBREYNER', 'MURCIA RIVERA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (338, 1007356002, 'DIANA KATERIN', 'OSPINA GARCES', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (339, 1006502031, 'CRISTIAN CAMILO', 'PAREDES OME', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (340, 1006503532, 'EDWIN MAURICIO', 'ESCOBAR LIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (341, 1006514239, 'ANDREA CAROLINA', 'ALMARIO TRUJILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (342, 1006515194, 'ANA MARIA', 'DUERO ALARCON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (343, 1006530542, 'DIANA', 'CUELLAR JIMENEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (344, 1006549896, 'ALVARO ALEJANDRO', 'ROJAS VILLANUEVA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (345, 1006731878, 'FARID SANTIAGO', 'SALCEDO PERDOMO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (346, 1017230078, 'ANGIE ALEJANDRA', 'REYES ASTUDILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (347, 1053805746, 'YUDY YANETH', 'SAMBONY BEDOYA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (348, 1077876719, 'JHECCIKA ALEJANDRA', 'MARTINEZ CORTES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (349, 1080365918, 'CESAR AUGUSTO', 'PERDOMO ZULUAGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (350, 1098772138, 'DIANA ALEXANDRA', 'CORTES MAZZO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (351, 1110585645, 'ANGIE LORENA', 'ROJAS MARIN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (352, 1117489713, 'DAYANA', 'MORENO ALDANA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (353, 1117500109, 'YUDY ANDREA', 'VELASQUEZ BELTRAN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (354, 1117507606, 'PAOLA ANDREA', 'VELASQUEZ LATORRE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (355, 1117511018, 'ELENA JOHANA', 'BLANDON CUELLAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (356, 1117515112, 'DINA ERMELINA', 'TRUJILLO BEDOYA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (357, 1117528392, 'JHON HEDER BLAYDER', 'CUELLAR CRUZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (358, 1117546247, 'MARLY YOANA', 'CORDOBA RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (359, 1117547096, 'MARIA GLORIA', 'ORDOÑEZ ACOSTA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (360, 1117547886, 'GERALDINE', 'HERNANDEZ TORRES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (361, 1117549599, 'JUAN FELIPE', 'LOZANO FLOREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (362, 1117554092, 'LINA MARCELA', 'QUINTERO ANTURI', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (363, 1117554954, 'INGRID TATIANA', 'SANCHEZ GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (364, 1117960152, 'NEFER YIRLEY', 'SUAREZ LOPEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (365, 1192781946, 'YESSICA CAROLINA', 'ARAGONEZ DIAZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (366, 1193145320, 'MAICOL STIVENS', 'PEREZ ROJAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (367, 1003811754, 'ANGIE TATIANA', 'RAMOS CUELLAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (368, 1006505355, 'DIANA CAROLINA', 'VARGAS OROZCO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (369, 1006513965, 'YESSICA ALEJANDRA', 'CASTRO VALBUENA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (370, 1006526560, 'DANNY JASMIN', 'GOMEZ HURTADO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (371, 1006956356, 'MONICA', 'VARGAS POLANIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (372, 1006961313, 'JONATAN LEANDRO', 'MUÑOZ BENAVIDES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (373, 10286199, 'JOHN JAIRO', 'ESPITIA ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (374, 1107073483, 'JINNEY JOHANNA', 'HERRERA RAMOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (375, 1117487790, 'GENER FERNANDO', 'ZULETA APRAEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (376, 1117507738, 'DIDYER OSMANY', 'CALDERON AGUIRRE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (377, 1117508144, 'LUZ MAYEINER', 'ASTUDILLO RONCANCIO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (378, 1117518738, 'NIYIRED', 'CASTILLO PEÑA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (379, 1117524330, 'MARIA CRISTINA', 'PEÑA ARTUNDUAGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (380, 1117524506, 'YEIDI', 'FIGUEROA CABRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (381, 1117527029, 'MARYEL YOMARA', 'FIERRO GONZALEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (382, 1117533283, 'ANGIE MAYERLY', 'GONZALEZ ZAMBRANO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (383, 1117543565, 'SANDRA MILENA', 'VALDERRAMA CORDOBA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (384, 1117544466, 'MARBELL', 'SOLORZANO LUGO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (385, 1117548073, 'JUNIOR ALEXANDER', 'SUAREZ RONCANCIO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (386, 1117549315, 'XILENA PATRICIA', 'CARDENAS MONTES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (387, 1117804191, 'ZULLY', 'FIERRO ROMERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (388, 1119210592, 'MIRALBA', 'AMAYA BOCANEGRA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (389, 17645799, 'HAMILTON', 'VARGAS PAVA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (390, 40771400, 'MARIBEL', 'MARTINEZ ZULUAGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (391, 41170723, 'PAOLA XIMENA', 'ANTURI ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (392, 6805131, 'JORGE ALBERTO', 'ARIZA CABALLERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (393, 1006459128, 'MAYERLY', 'PAREDES RUIZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (394, 1006503935, 'LIBNNY TATIANA', 'HENAO CASTRO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (395, 1000970852, 'SERGIO STEVENS', 'REYES BENAVIDES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (396, 1006631779, 'YURI VIVIANA', 'ZAMBRANO HERNANDEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (397, 1006632553, 'CHARON TATIANA', 'MENDOZA ORTEGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (398, 1115942862, 'DIDIER', 'BRIÑEZ RIVAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (399, 1117235595, 'ANDREA VIVIANA', 'DELGADO MENDEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (400, 1117965401, 'JAMES ANDREI', 'BAUTISTA MEJIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (401, 1119585463, 'JOSE GUILLERMO', 'ARCINIEGAS QUINTANA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (402, 1119586547, 'LUZ MARIELLI', 'VELASQUEZ GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (403, 1119586718, 'JUAN DIEGO', 'VASQUEZ LOPEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (404, 1119587100, 'EIBER YESID', 'SANABRIA LEYTON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (405, 1122723389, 'DAVEIBA CECILIA', 'MOLINA PAZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (406, 16185522, 'CARLOS', 'GARAY MARTINEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (407, 17655644, 'ARMANDO', 'BARRAGAN NASAYO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (408, 40660355, 'MARTHA LILIANA', 'OINO FRANCO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (409, 40660410, 'MARIA DEL CARMEN', 'MENDEZ VALENCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (410, 80802399, 'EDINSON', 'TASCON RUBIO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (411, 1003806960, 'DAYANA LICETH', 'PAREDES MEDINA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (412, 1006247783, 'ESTEBAN', 'JIMENEZ MORALES', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (413, 1006509679, 'ALEXANDRA', 'TOLEDO GARZON', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (414, 1006537739, 'YESSICA YULIANA', 'LLANTEN ARCINIEGAS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (415, 1006631942, 'JHON JANER', 'PANCHO PIRANGA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (416, 1007751037, 'JULIANA', 'SOLANO ANTURY', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (417, 1115949756, 'YULIANA ANDREA', 'TIERRADENTRO ORTIZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (418, 1119580043, 'WILFRAN', 'PIRANGA GUTIERREZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (419, 1119580103, 'MAIRA ALEJANDRA', 'MAHECHA CASTILLO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (420, 1119580596, 'AMANDA', 'VARGAS COSIO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (421, 98051869940, 'NESTOR FABIAN', 'SAENZ RUBIO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (422, 1006513630, 'YEIMI MARLOVI', 'BURGOS OVIEDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (423, 1006514476, 'LAURA FERNANDA', 'GOMEZ JARAMILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (424, 1006537626, 'KAREN YESSENIA', 'CRIOLLO GUACHO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (425, 1006814221, 'NIXON FABIAN', 'ARTUNDUAGA CONTA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (426, 1012442298, 'LEIDY LORENA', 'LLANOS GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (427, 1027942138, 'EYDA MARYURI', 'BAUTISTA MURCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (428, 1097405983, 'INGRID ALEJANDRA', 'PENA DIAZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (429, 1115794349, 'SINDY LORENA', 'CUELLAR HUACA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (430, 1116912028, 'YULIANA YARLEDY', 'ZAPATA CUELLAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (431, 1117523954, 'YENIFER ANDREA', 'ALARCON VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (432, 1117531201, 'JOHN ANDERSON', 'FLORIDO CARDONA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (433, 1117541230, 'YOINER', 'VARGAS BUSTOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (434, 1117543844, 'HILDA', 'SIERRA GRISALES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (435, 1117544809, 'YEIMY ALEJANDRA', 'MURCIA TIQUE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (436, 1117546065, 'MANUEL ALEJANDRO', 'SILVA TRUJILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (437, 1117552859, 'CLAUDIA ELENA', 'RESTREPO PINTO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (438, 1006505655, 'ALEXIS', 'OSPINA HERNANDEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (439, 1006410967, 'BRAYAN ESTIVEN', 'MENESES ALAPE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (440, 1006459954, 'FABIAN', 'CARDONA CASTAÑO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (441, 1006503191, 'CESAR AUGUSTO', 'MARMOLEJO CASTAÑO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (442, 1006514671, 'JEFFERSON', 'NEIRA GONZALEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (443, 1115795946, 'QUEVIN YORMAN', 'MENESES ALAPE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (444, 1115953592, 'KENNEDY SNEIDER', 'OSPITIA APACHE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (445, 1116202887, 'DURFAIN', 'TAPIERO CABRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (446, 1116208468, 'WENN', 'HENAO CASANOVA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (447, 1116209310, 'EDUAR ALEXIS', 'JIMENEZ ENCIZO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (448, 1117534464, 'DAVINZON', 'ESCARPETA ENCIZO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (449, 1117540553, 'YESICA FERNANDA', 'LOPEZ TOVAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (450, 1117542392, 'YIMMY ALEXANDER', 'TOVAR RAMIREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (451, 1117543322, 'DIEGO FERNANDO', 'AGUDELO ORTIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (452, 1117549581, 'SEBASTIAN', 'NUÑEZ CABRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (453, 1117552095, 'LAURA CRISTINA', 'DURAN GORDILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (454, 1117554295, 'CARLOS STEVEN', 'PERDOMO FIGUEROA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (455, 1117554710, 'CAMILA', 'GARCIA PINEDA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (456, 1117964450, 'YULEIDY', 'TAPIERO CARDONA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (457, 17783822, 'ANCIZAR', 'MARIN MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (458, 96352326, 'HECTOR HORACIO', 'GOMEZ ZANABRIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (459, 1006417375, 'CHRISTHIAN CAMILO', 'GARCIA PERDOMO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (460, 1006507138, 'KAREN DAYANNA', 'VARGAS PEÑUELA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (461, 1007443399, 'LUISA FERNANDA', 'CRUZ ESPAÑA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (462, 1007524887, 'YULY PAOLA', 'PERDOMO GARCIA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (463, 1117488355, 'MARYING LIZETH', 'SILVESTRE QUINTERO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (464, 1004266357, 'OSCAR JULIAN', 'SARMIENTO LOZANO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (465, 1006500986, 'LAURA FERNANDA', 'PIMENTEL SUAREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (466, 1006504248, 'LAURA DANIELA', 'SOTO CASTRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (467, 1006504970, 'MARIA CAMILA', 'QUIMBAYA SUAREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (468, 1006505564, 'LIZETH DAYANA', 'LOSADA TOLEDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (469, 1006505565, 'ANGIE TATIANA', 'LOSADA TOLEDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (470, 1006512760, 'RAMON ANDRES', 'SANCHEZ GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (471, 1006514334, 'ALEJANDRA', 'MUÑOZ SUAREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (472, 1006514599, 'LIZETH DANIELA', 'VASQUEZ PEÑA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (473, 1006515710, 'ANGELA VIVIANA', 'FAJARDO CARVAJAL', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (474, 1006516576, 'YURI ANDREA', 'VARGAS SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (475, 1007761147, 'VALENTINA', 'ORTIZ RAMIREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (476, 1077867520, 'JAINER ANDRES', 'URUEÑA PASTRANA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (477, 1117532859, 'YESSICA ANDREA', 'SANCHEZ GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (478, 1117542532, 'DANELIA STHEFANY', 'BUSTAMANTE ARRIGUI', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (479, 1117549968, 'RICHARD', 'GIRALDO SOTO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (480, 1117550181, 'ESNEIDER', 'MONTAÑO SIERRA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (481, 1117554488, 'DIANA CAROLINA', 'PERDOMO VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (482, 1124864830, 'PAOLA ANDREA', 'ZUÑIGA GUZMAN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (483, 40770297, 'GLEIDEN NUR', 'BARRERO CONDE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (484, 1001176123, 'YUDI NATHALY', 'SANCHEZ TOBON', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (485, 1006504103, 'MARIA PAULA', 'ROMERO CASTRILLON', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (486, 1006507141, 'JUAN GABRIEL', 'RAMON MARIN', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (487, 1006537908, 'SERGIO DAVID', 'JIMENEZ CARDOZO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (488, 1007547827, 'KELLY JASMIN', 'MONTAÑO ORDOÑEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (489, 1007575944, 'KIMBERLY', 'PERDOMO PERALTA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (490, 1004730175, 'LEIDY MIREYA', 'MAVISOY GUERRERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (491, 1006410926, 'YIDNERLY', 'BARRERA FAJARDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (492, 1006549996, 'LUIS ARMIN', 'POLANIA ARTUNDUAGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (493, 1018452434, 'ANGIE VANESSA', 'RINCON HURTATIS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (494, 1030573687, 'FABER CLEYDERMMAN', 'MAHECHA MEDINA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (495, 1063296492, 'JONATHAN STEVEN', 'BELTRAN ZABALA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (496, 1076661258, 'YENNI CAROLINA', 'MALAVER NOCUA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (497, 1116922764, 'LUZ MARINA', 'SAENZ RAMIREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (498, 1117488659, 'YEINI CAROLINA', 'CUELLAR CASTRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (499, 1117492262, 'ALEXANDER', 'COLLAZOS RAMOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (500, 1117502057, 'JENNIFER', 'GUEVARA PUENTES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (501, 1117504626, 'NORIDA MARCELA', 'RESTREPO SERRATO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (502, 1117517718, 'YULY ANDREA', 'BECERRA LOPEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (503, 1117535215, 'YENNIFER', 'ARTUNDUAGA DIAZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (504, 1117538960, 'STEPHANIA', 'PERDOMO GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (505, 1117542553, 'SEBASTIAN GEOVANNI', 'CARDONA CHICA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (506, 1117551020, 'ADRIANA PATRICIA', 'LONDOÑO SANTOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (507, 1117551462, 'LAURA CAMILA', 'ESGUERRA POLANIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (508, 1117553286, 'VERONICA', 'ARIAS VEGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (509, 1117554825, 'DERLY DAYANA', 'CAICEDO MUÑETON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (510, 40613276, 'PAOLA ANDREA', 'GUEVARA PUENTES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (511, 40670550, 'CLARA PIEDAD', 'VAQUIRO ORTIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (512, 94269667, 'HOOVER', 'RIVERA CASTRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (513, 1005087735, 'JENNIFER CRISTINA', 'CARDONA CHICA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (514, 1004679646, 'ANGIE MELISSA', 'PEREZ CASTAÑO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (515, 1006417678, 'LINA LICETH', 'ESPAÑA BRIÑEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (516, 1006460238, 'JEISON', 'AGUDELO CRUZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (517, 1006484342, 'YULITZA DAYANA', 'OSPINA SILVA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (518, 1006504188, 'DANIELA ANDREA', 'CASTRO VALBUENA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (519, 1006504455, 'MARIA ANGELICA', 'GUTIERREZ CLAROS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (520, 1006505505, 'JULIETH FERNANDA', 'ROJAS ANGEL', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (521, 1006511274, 'YENY ISABEL', 'GUILLEN BARREIRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (522, 1006513798, 'JHON EDINSON', 'GRANOBLE CRIOLLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (523, 1006514365, 'GERALDINE', 'RUIZ ALMARIO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (524, 1006514591, 'HARISZEN', 'VILLAN ARROYO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (525, 1006523558, 'OSWALDO', 'VARGAS PRIETO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (526, 1006526451, 'MARCOS TULIO', 'MUÑOZ RIOBO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (527, 1006550209, 'ERICA', 'VARON RAMOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (528, 1006596206, 'DIANA ALEJANDRA', 'JOVEN CHAMBO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (529, 1007097224, 'MARIA ISAVEL', 'CORTES BELTRAN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (530, 1007726199, 'MAYRA ALEJANDRA', 'LOZANO LEON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (531, 1007761152, 'MAIKOLL STIVEN', 'DIAZ PLAZAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (532, 1064803857, 'GABRIELA', 'ARIZA GALLEGO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (533, 1117545260, 'BERNARDO MAXIMILIANO', 'TOVAR CUELLAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (534, 1117546354, 'YENI LILIANA', 'ZUÑIGA QUIÑONES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (535, 1117549102, 'MONICA ANDREA', 'CAMPOS SUAREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (536, 1117550413, 'HEIDY VANESSA', 'DIOSA REINA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (537, 1117550787, 'DANNY MARCELA', 'GARCIA LONDOÑO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (538, 1117553045, 'THALIA ISABEL', 'ULLOA OSUNA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (539, 1117553244, 'FARITH CAMILO MONDRAGON', 'LLANOS CARDOZO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (540, 1117839515, 'ADELA', 'RICO LOSADA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (541, 1118020109, 'LUISA FERNANDA', 'QUITUMBO LANDIO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (542, 1118366811, 'YULY ANDREA', 'QUINAYA AUDOR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (543, 1118474243, 'YULIED', 'VARON RAMOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (544, 1123315024, 'WILMER', 'CORTEZ LAZO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (545, 1125178248, 'JHURANY', 'MARTINEZ MARROQUIN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (546, 1006505820, 'ANGELA PAOLA', 'MORA PAJOY', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (547, 1006506357, 'YARLEDY ESTEFANY', 'PAREDES LEAL', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (548, 1006508375, 'ALEJANDRO', 'SOTO CAVICHE', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (549, 1006537590, 'LUCELIDA MATILDE', 'RIAÑOS SANDOVAL', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (550, 1006538110, 'YENCY LORENA', 'SUAZA CUELLAR', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (551, 1006538610, 'JUAN DAVID', 'LOPEZ SANCHEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (552, 1006504071, 'YEISON STIVEN', 'DIAZ MONTEALEGRE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (553, 1006512513, 'JHON EDWAR', 'ARCILA MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (554, 1006513064, 'JONATHAN STIVEN', 'CLAROS PERDOMO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (555, 1022424605, 'FAYBER', 'FRANCO MARTINEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (556, 1092362706, 'DANIEL ALEJANDRO', 'TOVAR LLANOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (557, 1111810553, 'DAYANA SOLANDY', 'SORIANO FERNANDEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (558, 1117519850, 'YEISON GERMAN', 'OSORIO MORENO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (559, 1117523231, 'JHON JAIRO', 'BETANCOURT GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (560, 1117531879, 'ERIKA ALEJANDRA', 'SUAREZ ALVAREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (561, 1117543650, 'EDWAR', 'AGUDELO VALDERRAMA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (562, 1117548089, 'RUBEN DARIO', 'HENAO BERNAL', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (563, 1117553680, 'JHONATAN FELIPE', 'RENTERIA MARTINEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (564, 1117553980, 'SEBASTIAN', 'AVILA MARTINEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (565, 1117554609, 'MAY STUAR', 'RAMOS COLLAZOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (566, 1118029529, 'MARIO ALEXANDER', 'CONDE HOME', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (567, 1118070978, 'JORGE LUIS', 'MUÑOZ PARRA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (568, 1193476828, 'DAYANA', 'RODRIGUEZ MONTERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (569, 6803095, 'EDINSON', 'OROZCO TRUJILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (570, 83252580, 'FABIO NELSON', 'VICTORIA SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (571, 1006418049, 'JOJAN ADRIAN', 'RONCANCIO RAMIREZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (572, 1006632212, 'ERBIN', 'ROJAS VALENZUELA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (573, 1007897661, 'JOANZAIR', 'CUELLAR MORENO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (574, 1006488146, 'DAVIAN SMITH', 'VILLAMIZAR GOMEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (575, 1006501578, 'VIVIANA MARCELA', 'RAMIREZ MADRIGAL', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (576, 1006502553, 'MARIA CAMILA', 'MUÑOZ PEREZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (577, 1006527981, 'DAYHANA', 'URREA CRUZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (578, 1006537753, 'GEIBY NATHALIA', 'PARRA RODRIGUEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (579, 1007444790, 'EVA SANDRY', 'GARCIA MERCADO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (580, 1007620624, 'DEICY LORENA', 'CUPITRA CARDONA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (581, 1010006196, 'DIANA ISUARA', 'VALENCIA OMEN', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (582, 1105685297, 'ANYI KATERIN', 'CALDERON ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (583, 1117522472, 'YINA PAOLA', 'MEDINA ESPAÑA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (584, 1117535745, 'YENNY CONSTANZA', 'OME CORTEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (585, 1117540896, 'CRISTIAN CAMILO', 'LIZCANO GUTIERREZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (586, 1117544088, 'YUBERLY', 'VALDERRAMA PADILLA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (587, 1117546549, 'ANGIE LORENA', 'LOPEZ MAJE', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (588, 1117547785, 'JUAN CAMILO', 'VALENCIA HUETIO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (589, 1117547971, 'DIANA CAROLINA', 'PERDOMO OLAYA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (590, 1117555166, 'CRISTIAN CAMILO', 'BUSTAMANTE SANCHEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (591, 1120382244, 'ANDREA ALEXANDRA', 'RAMIREZ CASTRO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (592, 1122784556, 'JESICA FERNANDA', 'OMEN JIMENEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (593, 1006459055, 'DENCY DANIELA', 'SANCHEZ VALENCIA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (594, 1006509609, 'DANY ALEJANDRA', 'RINCON MUÑOZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (595, 1010143016, 'ORLANDO JOSE', 'MANJARRES MARTINEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (596, 1118023109, 'YILBER ADRIAN', 'DIAZ ACUÑA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (597, 1006512681, 'SEBASTIAN', 'LOZANO ROJAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (598, 1006528502, 'EDGAR ALBERTO', 'PEÑA MESTIZO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (599, 1006528807, 'DINA IRENE', 'LOSADA CAVIEDES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (600, 1007383860, 'EIDY YISETH', 'DUCUARA TAPIERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (601, 1110504014, 'YERLI', 'MEJIA AMAYA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (602, 1116924240, 'SEBASTIAN', 'REPIZO PERDOMO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (603, 1117530485, 'CRISTIAN ORLANDO', 'SERRANO VASQUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (604, 1117552179, 'ANGIE LIZETH', 'TRIANA GAITAN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (605, 1118021073, 'NATALIA', 'OSPINA BUSTOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (606, 1118023311, 'ROBERT FRANCISCO', 'CARVAJAL URREGO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (607, 1118026845, 'LORENA', 'GIRALDO MORENO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (608, 1118028751, 'LINA MARIA', 'GIRALDO MORENO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (609, 1118028920, 'JARRINSON ARBEY', 'QUIROGA NARVAEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (610, 1118029029, 'GERARDO', 'RONDON SILVA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (611, 1118029181, 'LAURA CAMILA', 'RUIZ ROJAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (612, 1118029369, 'YAZMIN YURANI', 'SILVA HUERTAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (613, 14281484, 'OBED ALBERTO', 'HORTA TABORDA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (614, 40729364, 'ELIZABETH', 'CASTAÑO CARDOZO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (615, 40730282, 'LUZ MERY', 'VELASQUEZ OLAYA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (616, 40777936, 'LIDA YANNETH', 'GALLEGO MURCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (617, 66952544, 'MARIA LEONOR', 'ALIPIO VANEGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (618, 1003805818, 'MARIANA GISELL', 'ROJAS MONTEALEGRE', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (619, 1006528349, 'ERIKA TATIANA', 'LOPEZ SILVA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (620, 1006528441, 'ALEJANDRO', 'ARCILA GALEANO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (621, 1006528576, 'LINA FERNANDA', 'VALDERRAMA OSPINA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (622, 1005958659, 'CAMILA', 'YEPES ARISTIZABAL', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (623, 1006460043, 'EDILBER', 'CUELLAR GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (624, 1006501129, 'YUDY MIRLEY', 'ORTIZ VEGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (625, 1006502523, 'DANIELA', 'VARGAS MARTINEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (626, 1006513218, 'JEFFERSON ANDRES', 'RAMIREZ CHILITO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (627, 1006514732, 'BRAYAN STIVEN', 'HURTADO AGUALIMPIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (628, 1012426926, 'LIANY MARCELA', 'MANRIQUE POVEDA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (629, 1022374329, 'RAFAEL HUMBERTO', 'DORADO VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (630, 1081593999, 'EDUAR ARBEY', 'ARGOTY MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (631, 1117519369, 'YESSIKA', 'VELASQUEZ CASTRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (632, 1117524864, 'ANGEL JAVIER', 'VILLA LAMILLA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (633, 1117539037, 'ADRIAN', 'CALDERON LARA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (634, 1117546117, 'JUAN DAVID', 'SANABRIA PERDOMO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (635, 40626089, 'MARIA EDITH', 'POLANIA PEREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (636, 40729256, 'MARIA INES', 'OLMOS RUBIO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (637, 40778713, 'MONICA', 'MARTINEZ ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (638, 40782045, 'DIANA ESLENA', 'RUIZ RUIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (639, 7725450, 'VICTOR RAUL', 'BARRETO PEREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (640, 91350913, 'JONATHAN', 'FIGUEROA BUITRAGO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (641, 1006530760, 'YEISON ADRIAN', 'MUÑOZ SOTO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (642, 1117498207, 'KAROL YISELL', 'CHAUX LARA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (643, 1006418436, 'YEIMER', 'DAZA MOLINA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (644, 1006484562, 'KATERINE', 'VANEGAS ARAUJO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (645, 1006515676, 'KIARA MILETH', 'MARTINEZ BAMBAGUE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (646, 1006518814, 'SARA DANIELA', 'OSORIO POLANIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (647, 1006519961, 'EDIER ANDRES', 'SANCHEZ VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (648, 1006520103, 'CARLOS MANUEL', 'VERU GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (649, 1006520296, 'MAIRA ALEJANDRA', 'CAMPOS DIAZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (650, 1007620466, 'LEIDY YURANY', 'MUÑOZ MORALES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (651, 1007761635, 'ANGIE PAOLA', 'MONTILLA VACA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (652, 1019151188, 'ESTEFANY', 'MONTOYA LOPEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (653, 1075310580, 'ANA YIRIAM', 'GOMEZ LOPEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (654, 1106365011, 'JANESSA DAYANA', 'TOVAR QUIROGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (655, 1115940939, 'SANDRA', 'ARTUNDUAGA FLOR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (656, 1117525300, 'PAOLA', 'ROJAS MORENO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (657, 1117804583, 'ANGIE LORENA', 'ROJAS LOPEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (658, 1117817751, 'SULENY', 'OSORIO RIOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (659, 1117826062, 'YEIMI PAOLA', 'HERRERA CORTES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (660, 1117838115, 'NOHELIA', 'LOSADA JOVEN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (661, 1117839785, 'ANYI DANIELA', 'ARTUNDUAGA ARANGO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (662, 40691244, 'NANCY', 'ESPINOSA VERU', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (663, 40692102, 'YORLENY', 'OLAYA MORALES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (664, 1006519160, 'YEIMY XIOMARA', 'RIVERA ASTUDILLO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (665, 1006520403, 'ANGIE VANESSA', 'GARCIA GARCIA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (666, 1115940882, 'YURIANA', 'ROJAS MORENO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (667, 1118363764, 'YIRLETH YULITZA', 'RUMIQUE TAPIERO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (668, 1193077599, 'JHANER ANTONIO', 'RODRIGUEZ HERNANDEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (669, 1006432189, 'SULY TATIANA', 'VELASCO MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (670, 1006549938, 'YESSICA YULIETH', 'CORTES ROJAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (671, 1007069357, 'YENI FABIOLA', 'ORJUELA TIQUE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (672, 1007320312, 'CARMELO', 'CARLOSAMA TAPIERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (673, 1116204646, 'ARLEY', 'DURAN VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (674, 1116205328, 'MAXIMILIANO', 'CUPITRA LOAIZA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (675, 1116205671, 'AMALIA', 'MEDINA DIAZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (676, 1116206413, 'ELCY KARINA', 'MONTIEL GUZMAN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (677, 1116206729, 'PATRICIA', 'CHARRES RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (678, 1116206980, 'MILADY YULIANA', 'BURBANO GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (679, 1116208193, 'ANDERSON ARLETH', 'VALENCIA MURCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (680, 1116208553, 'YESID', 'HURTADO CARO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (681, 1116208588, 'ANGIE PAOLA', 'VARGAS APRAEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (682, 1116208659, 'ELSA MAYERLY', 'LEAL GASCA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (683, 40611320, 'DEYSI MAGALI', 'ORTIZ GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (684, 40782593, 'LIGIA', 'MURCIA TRUJILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (685, 1116203676, 'KELLY YULIANA', 'QUINTERO HOYOS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (686, 95041523191, 'YOLIMA', 'JOVEN VARGAS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (687, 1006516326, 'JULIETH FERNANDA', 'BENAVIDEZ RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (688, 1007720112, 'MARIA DEL PILAR', 'ORTIZ DE HOYOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (689, 1023975431, 'GERALDINE', 'OLAYA ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (690, 1116206544, 'MAYERLI', 'CALDERON REYES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (691, 1117785682, 'JASMIN', 'CANO GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (692, 1117786111, 'MERCY', 'CANO GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (693, 1144144501, 'ANGELA TATIANA', 'DURAN ESPAÑA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (694, 26632339, 'IRMA TULIA', 'RODRIGUEZ GARCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (695, 32564814, 'DIANA LORENA', 'MEDINA CORRALES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (696, 40075673, 'ELCIRA', 'ORTIZ RENDON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (697, 55207549, 'ONEIDA ROCIO', 'MARTINEZ SOLARTE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (698, 1006527329, 'JHONATAN ANDRES', 'DIAZ SABI', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (699, 1006486800, 'GLORIA STEFANY', 'CASTAÑEDA PULECIO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (700, 1006487221, 'YULEIDY', 'GOMEZ MEDINA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (701, 1006487224, 'JOSUE', 'HOYOS MORENO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (702, 1006487377, 'EVERSON SEBASTIAN', 'URCUE VALENCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (703, 1006501456, 'JEFERSON ANDRES', 'TRUJILLO ORTEGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (704, 1006504307, 'EWGERDY DAYANNA', 'LEIVA CORTES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (705, 1006512191, 'ERIKA MARCELA', 'ROJAS LOPEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (706, 1007312698, 'ANYELA YALEXA', 'CANACUE ORTIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (707, 1044922452, 'DARLING NATALIA', 'SERRANO RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (708, 1077869016, 'ERIKA PAOLA', 'RAMOS ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (709, 1116913807, 'YURANY ANDREA', 'BERMUDEZ TRUJILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (710, 1117262891, 'ANA MARIA', 'CORTES AGREDA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (711, 1117262906, 'KERLY JOHANA', 'OCAMPO ORTIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (712, 1117263862, 'ALEXANDER', 'VASQUEZ JOJOA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (713, 1117265107, 'LYDA FAIZULY', 'CAMPOS GARCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (714, 1117266152, 'LICETH', 'HINCAPIE SILVA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (715, 1117266436, 'MABEL YULIETH', 'GIRALDO CARVAJAL', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (716, 1117267117, 'ANDERSON', 'ROSERO ROSERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (717, 1117267903, 'DIEGO FERNANDO', 'YANGUAS MENESES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (718, 40079034, 'LIBIA', 'RAMOS BASTIDAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (719, 40595626, 'MARIA ADVENIS', 'SCARPETTA QUINAYAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (720, 40614428, 'YURY ANDREA', 'MARIN LOPEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (721, 1006486823, 'BRAYAN ESTIVEN', 'GASCA MALAMBO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (722, 1006487553, 'JOSE EVER', 'SOTTO BECERRA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (723, 1006487665, 'RUBEN DARIO', 'POLANIA ERAZO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (724, 1006487730, 'JHON JAIVER', 'GOMEZ CHAGUALA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (725, 1006487782, 'YORLADI', 'CORDOBA BENAVIDES', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (726, 1006509765, 'DAHIANA MICHEL', 'CUERVO ESPAÑA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (727, 1117492580, 'SARA JIMENA', 'MARTINEZ RAMOS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (728, 1001815065, 'LEYDI JOHANA', 'VERGARA JARAMILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (729, 1004247748, 'CHELSY NALLELY', 'MEDINA COLLAZOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (730, 1006514875, 'JHORMAN', 'FIGUEROA LEYTON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (731, 1006528595, 'LINA DANIELA', 'CAMPOS ROJAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (732, 1007361349, 'JULIAN', 'LOMELIN VALDERRAMA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (733, 1007447799, 'KEVIN ANDRES', 'FIGUEROA CAPERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (734, 1010142719, 'LUZ ESTHER', 'SANTOS SILVA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (735, 1059606415, 'ANDRI ZOBEYDA', 'SUAREZ VELASCO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (736, 1063151700, 'RICHARD ANDERSON', 'PALOMO BENITEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (737, 1083900482, 'FRANK JULIAN', 'CADAVID ANTURI', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (738, 1094905113, 'JUAN PABLO', 'JARAMILLO JARAMILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (739, 1113786957, 'JHONATAN FERNANDO', 'RAMIREZ NUÑEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (740, 1117504281, 'LILIANA', 'BOCANEGRA PULIDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (741, 1117556694, 'VALENTINA', 'GOMEZ TOBON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (742, 1117971189, 'JUAN CAMILO', 'HENAO ARIAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (743, 1117971342, 'KERLY MILDREDI', 'GARCIA TAFUR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (744, 1117971792, 'ZULLY DALLANA', 'OSORIO GARZON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (745, 1117974219, 'CARLOS EDWIN', 'MEDINA MOSQUERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (746, 1117974292, 'JOSE ARLINSON', 'PARRA MARTINEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (747, 1117975577, 'YULISSA', 'MANRIQUE BERRIO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (748, 1119216825, 'FRANCENITH', 'ARROYABE GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (749, 1120578933, 'BRIGETTE STEFFANY', 'MARTINEZ BERRIOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (750, 40627729, 'KERLY LORENA', 'MONTANO GARZON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (751, 94193240, 'JOSE JHOAN', 'CARO FLOREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (752, 1006526550, 'FRANKLY STIVEN', 'MOSQUERA SIERRA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (753, 1007161251, 'CAROLINA MARIA', 'AREVALO TAPIAS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (754, 1022340738, 'JESSICA PRISCILLA', 'GARCIA QUINTERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (755, 1115944548, 'ANA DELY', 'SANCHEZ VALENCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (756, 1115948330, 'ERIKA YULIETH', 'MENESES RENDON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (757, 1115952998, 'JENNY ROCIO', 'TOVAR GARZON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (758, 26624837, 'NORMA TULIA', 'MONAITYAMA FUSIAMENA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (759, 30516807, 'BERTALIA', 'VERGARA DIAZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (760, 30516985, 'MARINA', 'ALVAREZ YUNDA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (761, 30517461, 'ELIZABETH', 'CASTIBLANCO ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (762, 30519688, 'ROSANA', 'ALVAREZ YUNDA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (763, 30519912, 'SANDRA MILENA', 'SANTAMARIA GONZALEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (764, 30520339, 'ODILIA', 'PERDOMO CELIS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (765, 30520416, 'NELLY', 'GARZON MAHECHA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (766, 30521188, 'MARIA LUZ DELIS', 'RENDON SERRATO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (767, 31178488, 'ALBA LUCIA', 'PARRA AGUIRRE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (768, 38641767, 'LUZ MERY', 'ZAMBRANO ESPINOSA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (769, 40671197, 'JUDY FANORY', 'CAVIEDES ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (770, 40772113, 'CONSUELO', 'BELTRAN MONTOYA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (771, 79534639, 'GILDARDO', 'MARTINEZ HURTADO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (772, 1193337872, 'SILVIA PATRICIA', 'MANRIQUE NOA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (773, 1003803528, 'DUVAN EDUARDO', 'PARDO RIOS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (774, 1003807227, 'JOSE DAVID', 'GAMBOA AROCA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (775, 1003807271, 'PAULA ANDREA', 'QUESADA GAITAN', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (776, 1003809444, 'PAOLA ANDREA', 'REYES POLANIA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (777, 1003809603, 'LUIS DAVID', 'SERRANO CULMA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (778, 1006519281, 'JHORMAN DANIEL', 'PERDOMO OME', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (779, 1006520110, 'VANESSA', 'DIAZ DELGADO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (780, 1024465885, 'JOHN FREDDY', 'SALAZAR LOPEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (781, 1073715166, 'JHON FREDY', 'JOVEL TOVAR', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (782, 1075317911, 'LEIDY TATIANA', 'TRUJILLO NARVAEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (783, 1077878196, 'KEVIN MAURICIO', 'FIGUEROA BUSTOS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (784, 1080182719, 'ELIZABET', 'PARDO RIOS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (785, 1110531060, 'YAMILETH', 'GARZON LOPEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (786, 1117807148, 'LEIDY VIVIANA', 'CHARRY PERDOMO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (787, 1117810995, 'URNODES', 'VITONAS ILLO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (788, 1117820376, 'EDNA MILEY', 'VAQUIRO GONZALEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (789, 1117822813, 'YULI ANDREA', 'OINO VITONAS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (790, 1117839869, 'HAMINTON', 'MONTOYA MEDINA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (791, 1151452966, 'NORBEY', 'LOPEZ ARCOS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (792, 17671810, 'URBANO', 'SUAZA MEDINA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (793, 17774628, 'FRELLIN ALBERTO', 'NOREÑA OCHOA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (794, 39536451, 'MARIA DE LOS ANGELES', 'VARGAS BORRAY', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (795, 9161843, 'FIDEL ANTONIO', 'SANABRIA SIERRA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (796, 1003802694, 'YURI ALEJANDRA', 'SANABRIA NINCO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (797, 1004773739, 'YENNIFER MARIZA', 'TORO ALBEAR', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (798, 1192713350, 'NATALIA', 'SOLANO AMAYA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (799, 1193227747, 'LISETH DAYANA', 'LEMUS PERDOMO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (800, 1005335325, 'ANDRES', 'LEAL FERNANDEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (801, 1006517777, 'CESAR AUGUSTO', 'RAMIREZ HERNANDEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (802, 1007512400, 'YUDERLY', 'OSORIO GARCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (803, 1010142708, 'LAURA ALEXANDRA', 'RESTREPO MEJIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (804, 1116921027, 'SERGIO ESTEBAN', 'GUEVARA LONDOÑO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (805, 1117487375, 'CARLOS ANDRES', 'ROBAYO CORREA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (806, 1117532041, 'NANCY', 'ORTIZ CATAÑO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (807, 1117535217, 'ERIKA LORENA', 'FLOREZ GORDILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (808, 1117960630, 'ANGEE', 'ZABALA ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (809, 1117961898, 'MARTHA YULIANA', 'MUÑOZ CALLE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (810, 1117963588, 'ARLY MELISSA', 'TORO MOSQUERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (811, 1117969067, 'INGRID ALEJANDRA', 'ALVAREZ HERRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (812, 1117972081, 'YEIMER ARLEY', 'ROCHA CAMPOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (813, 17640213, 'LIBARDO', 'QUINTERO ZAPATA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (814, 17709631, 'EDILSON', 'RAMIREZ HERNANDEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (815, 96353827, 'WILSON', 'EUDOR GONZALEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (816, 1003965350, 'ADRIAN STIVEN', 'BARRERA MURCIA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (817, 1025522710, 'VICTOR ALFOSO', 'DURAN CANO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (818, 1083868870, 'WISLEY', 'FIGUROA PALOMAR', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (819, 1115947987, 'BREISON DARYAN', 'RAMIREZ SANCHEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (820, 1117487578, 'ANA YULICZA', 'LEAL FERNANDEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (821, 1117960635, 'JHONNY JULIAN', 'ZORRO ALVARADO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (822, 1117961576, 'YURLENY', 'PEÑAFIEL MUTUMBAJOY', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (823, 1117963663, 'DAYANA FERNANDA', 'INCHIMA ACOSTA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (824, 1118363212, 'KAREN YULITZA', 'ARAGONEZ DUQUE', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (825, 1077843413, 'NANCY LORENA', 'PARRA CALDERON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (826, 1117488847, 'MANUEL', 'AGUDELO PACHON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (827, 1117499124, 'ANDRES MAURICIO', 'CHICA SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (828, 1117518298, 'NELSON ENRIQUE', 'RAYO OROZCO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (829, 1117521981, 'ALEXANDER', 'SARRIA REPISO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (830, 1117527625, 'ANGY DANEYRA', 'AGUIRRE LARA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (831, 1117529568, 'WILMER', 'GUZMAN CABRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (832, 1117534054, 'HERLY JOHANA', 'RAMOS TORRES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (833, 1117535754, 'EDWIN RICARDO', 'RODRIGUEZ RIVERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (834, 1117541767, 'YISETH KATHERINE', 'MENDEZ PASTRANA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (835, 1117549272, 'ANGY TATIANA', 'CORDOBA GUAÑARITA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (836, 1117549770, 'DEISON ARLEY', 'YUCUMA CANACUE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (837, 1117550324, 'KAREN ALEXA', 'ZABALA CEBALLOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (838, 1118029175, 'JHOAN ESNEIDER', 'ZARTHA GARCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (839, 30506271, 'DIANA PAOLA', 'SANCHEZ ALZATE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (840, 40612901, 'MARTHA CECILIA', 'CALDERON VILLALOBOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (841, 40612925, 'YENSI', 'ACOSTA GUZMAN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (842, 1006430957, 'JASBLEIDI', 'JAVELA GALINDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (843, 1006501625, 'CRISTIAN FERNANDO', 'CASTRO LESMES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (844, 1006502315, 'LAURA DAYANA', 'SALDAÑA SOGAMOSO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (845, 1006504600, 'CAMILA ANDREA', 'ISANOA SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (846, 1006504869, 'DANIELA', 'SANCHEZ FORERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (847, 1006518095, 'YEIMY LORENA', 'PINZON NARVAEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (848, 1006519837, 'HAROL ANDRES', 'ARCINIEGAS SAENZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (849, 1006814374, 'JEINER FABIAN', 'RIOS VALDERRAMA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (850, 1065609008, 'ALBERTO', 'PLAZAS GUARIN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (851, 1080366177, 'YEILA', 'PLAZA RENGIFO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (852, 1117490295, 'ANGELA', 'ESQUIVEL RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (853, 1117540103, 'ANDERSON EDUARDO', 'LEMUS CASTRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (854, 1117540994, 'YEISON DUBAN', 'CHAVARRO STERLING', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (855, 1117542346, 'YEINY ANDREA', 'JARAMILLO MOLINA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (856, 1117547280, 'MARLY', 'VARGAS ORTIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (857, 1117547381, 'OSCAR MAURICIO', 'GAZCA MENDOZA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (858, 1117548935, 'LEIDY LORENA', 'TOLEDO TRUJILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (859, 1117549900, 'LUIS EDUARDO', 'CARVAJAL LOZADA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (860, 1117550162, 'SERGIO DANIEL', 'CALDERON RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (861, 1117552118, 'ANGIE LORENA', 'ORTIZ VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (862, 1117553838, 'LEIDY SUSANA', 'ARTUNDUAGA ROJAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (863, 28869405, 'XIMENA', 'RAYO JIMENEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (864, 36306569, 'OLGA LUCIA', 'RAMIREZ RIVAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (865, 52868945, 'SANDRA MILENA', 'TELLES CARDONA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (866, 6801500, 'OSCAR IVAN', 'ORTIZ VASQUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (867, 1000731042, 'PAULA STEFANNY', 'FERIA ESCALA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (868, 1006431116, 'YAMILETH', 'CUPITRA CARDONA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (869, 1006506373, 'TATIANA PAOLA', 'PERDOMO TRUJILLO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (870, 1006506476, 'INGRI VALENTINA', 'ELIZALDE PERDOMO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (871, 1006515955, 'MARIA SIRLEY', 'RIOS PABON', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (872, 1006538436, 'MARLON FABIAN', 'VASCO MARTINEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (873, 1114952196, 'LUISA FERNANDA', 'SUAREZ ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (874, 1117514199, 'YULIANA', 'BELTRAN MEDINA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (875, 1193556041, 'MARIA SOLANYY', 'CUELLAR PACHON', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (876, 1004916463, 'CARLINA', 'ESTRADA VALENCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (877, 1006410227, 'ESNEIDER', 'SUAREZ VILLANUEVA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (878, 1006502917, 'JACKSON ALEXIS', 'PALACIOS PERDOMO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (879, 1006513472, 'MARIELA', 'SALAS MENDEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (880, 1006513493, 'DANIELA ALEJANDRA', 'GALLO CLAROS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (881, 1006513892, 'ERIKA LORENA', 'VALERO NEUTA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (882, 1006537681, 'LUISA FERNANDA', 'LANCHEROS RICARDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (883, 1006632045, 'JOHANA LIZETH', 'NUÑEZ OCAÑA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (884, 1007359167, 'DAYANA LICETH', 'MARIN FIGUEROA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (885, 1007443615, 'KEVIN ANDRES', 'CERON MEJIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (886, 1010151508, 'LEONOR FAISURI', 'GALLEGO RAGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (887, 1098686013, 'ALEIDA', 'MONJE SOTO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (888, 1115953243, 'CRISTIAN ELIECER', 'CORDOBA USECHE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (889, 1117497100, 'YEIMI PAOLA', 'CORTES HERNANDEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (890, 1117498786, 'MARTHA LILIANA', 'ESGUERRA GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (891, 1117533981, 'EDNA YULIETH', 'GONZALEZ VASQUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (892, 1117541094, 'KEVIN ANTONIO', 'TRUJILLO VILLAMIZAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (893, 1117547258, 'ESMERALDA', 'ALMARIO GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (894, 1117550340, 'ANGELA YULIETH', 'ARTUNDUAGA YAGUARA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (895, 1117551682, 'DISNEY', 'CASTRO MORENO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (896, 1117552934, 'YESSICA PAOLA', 'BELTRAN PAZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (897, 1117885558, 'YENIFER ANDREA', 'PARRA LAGUNA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (898, 40773635, 'DAMARIS', 'LEYVA LARA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (899, 48575633, 'BIBIANA', 'CANTERO GRUESO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (900, 1006528324, 'ANA SOFIA', 'MAYA YATE', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (901, 1006631755, 'DEISY JOHANA', 'CERQUERA DUCUARA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (902, 1004440117, 'VANESSA TATIANA', 'MUÑOZ CAICEDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (903, 1006501527, 'DHYLAN SLATER', 'URIBE CORONADO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (904, 1006502067, 'DAIRON FERNANDO', 'ROSAS ARDILA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (905, 1006502526, 'BRAYAN GABRIEL', 'CUADROS CERQUERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (906, 1006502816, 'YOHAN ESTIBEN', 'TRUJILLO REYES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (907, 1006503870, 'SERGIO DAVID', 'CASTRO URIBE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (908, 1006505237, 'DIANA MICHEL', 'PACHON VEGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (909, 1006512810, 'YEISON DANIEL', 'PALACIO RANGEL', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (910, 1006512996, 'DIEGO ALEJANDRO', 'BERMUDEZ CHITIVA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (911, 1006513860, 'ALEXA MILENA', 'CUELLAR VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (912, 1006515486, 'LUIS FELIPE', 'MURCIA SILVA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (913, 1006538523, 'JANIER', 'PLAZAS ROJAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (914, 1007512397, 'MONICA MARIA', 'MENDOZA HURTADO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (915, 1033732898, 'DERLY JOHANNA', 'ORDOÑEZ VELEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (916, 1082130016, 'PAOLA ANDREA', 'GAMEZ CAPIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (917, 1083928101, 'JUAN JOSE', 'RAMON SARMIENTO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (918, 1113039273, 'CRISTIAN LEONARDO', 'VARGAS CORTES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (919, 1117547431, 'HECTOR FAVIAN', 'SALAZAR VERGARA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (920, 1117552427, 'LUIS FERNANDO', 'MARROQUIN RESTREPO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (921, 1117553425, 'BRIAN FELIPE', 'PENHA ORTIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (922, 1119218671, 'EDINSON CAMILO', 'LUGO GASCA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (923, 1006483958, 'ANGIE YULIANA', 'GONZALEZ LUGO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (924, 1006509626, 'ANGIE VANESA', 'ESPAÑA ALAPE', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (925, 1006513532, 'JULIAN CAMILO', 'PLAZAS CHAVARRO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (926, 1006523779, 'CRISTIAN ESTIVEN', 'GOMEZ ROJAS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (927, 1006524400, 'JULIAN', 'CUBILLOS CABRERA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (928, 1006528246, 'CARLOS ANDRES', 'GIRALDO DIAZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (929, 1006530807, 'ANDERSON', 'GOMEZ BACCA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (930, 1007451384, 'DISNEY', 'CARDONA MONTOYA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (931, 1041630185, 'KARLA MARIU', 'MORENO CERQUERA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (932, 1116912543, 'PEDRO MARIO', 'CASTAÑO MORENO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (933, 1117484511, 'MARIA CAMILA', 'JOJOA GOMEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (934, 1006504563, 'HEIDY YIRLESA', 'MUÑOZ CRUZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (935, 1117533788, 'ANGIE TATIANA', 'QUINTERO ALMARIO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (936, 1117785980, 'TATIANA', 'LOPEZ CUBIDES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (937, 1118070026, 'INDIRA ESMERALDA', 'FIERRO LOAIZA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (938, 1118071392, 'PAOLA ANDREA', 'MAHECHA ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (939, 1118072204, 'ALEJANDRO', 'SEPULVEDA FERIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (940, 1118072297, 'JESSIKA LORENA', 'VERGARA PARRA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (941, 1118072301, 'HERNEY', 'AGUDELO RAMIREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (942, 1118072701, 'YURI MARCELA', 'LONDOÑO VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (943, 1118072745, 'SANDRA MILENA', 'GONZALEZ MURCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (944, 1118073010, 'ROSANA', 'ARANGO LUGO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (945, 1118073056, 'PAOLA', 'JARAMILLO PARRA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (946, 1118073530, 'MONICA', 'NUÑEZ HERRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (947, 1118073550, 'YENNY VICTORIA', 'BRAVO LUGO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (948, 1119583623, 'JHONY ESTIWAR', 'GAMBOA ORDOÑEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (949, 16191467, 'HERNAN', 'LONDOÑO DIAZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (950, 30508140, 'DOLLY', 'PIMIENTO CALDERON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (951, 40081994, 'LOURDES', 'NUÑEZ BONILLA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (952, 40611460, 'MERCY', 'CRUZ CRUZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (953, 1006506362, 'YULIANA ANDREA', 'ORTEGA NUÑEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (954, 1001094396, 'ANDRES ORLANDO', 'COY BRAVO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (955, 1006460077, 'CRISTIAN ANDRES', 'ICO GALLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (956, 1006503896, 'DIANA MIREYA', 'OBREGON CUELLAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (957, 1006813371, 'MIGUEL ANGEL', 'VARGAS FIAGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (958, 1006814620, 'DANIELA', 'MENDOZA BUSTOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (959, 1039625563, 'YUCCID ALEJANDRA', 'BARRERA CALDERON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (960, 1053823282, 'JHON EDUARD', 'ESPITIA GOEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (961, 1069924304, 'VIVIANA ANDREA', 'VELA NUÑEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (962, 1117236039, 'JAN CARLOS', 'BRIÑEZ LOZADA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (963, 1117505300, 'EVER EDUARDO', 'LOAIZA CASTAÑEDA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (964, 1117541852, 'HARLY DAVINSON', 'TAPIERO ROJAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (965, 1117550242, 'LIZHET KATHERINE', 'MARIN ORTIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (966, 1117554200, 'JORGE SANTIAGO', 'VEGA TRUJILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (967, 1117554676, 'NOHEMI', 'CRUZ MONTEALEGRE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (968, 1118472035, 'KARLA FERNANDA', 'COLLAZOS LONDOÑO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (969, 17773883, 'ROBERT', 'GRAJALES PIEDRAHITA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (970, 26616781, 'AMPARO', 'QUINTERO ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (971, 26620594, 'CLARA BERNARDA', 'ARCILA MEDRANO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (972, 30505441, 'CLARA', 'CHAUX MANJARREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (973, 31793959, 'SILVIA LUCIA', 'BARRERA BARRETO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (974, 40077942, 'PIEDAD', 'PABON PEÑA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (975, 1006122510, 'OMAIRA YULIETH', 'FLOREZ SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (976, 1012327063, 'JORSHUA STIVEN', 'DIAZ SANTOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (977, 1006514434, 'ANGIE DANIELA', 'RODRIGUEZ MOTTA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (978, 1099374207, 'YENIFER XIOMARA', 'PERDOMO GARCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (979, 1117514036, 'KATERYNE ALEJANDRA', 'TIQUE SOLER', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (980, 1117525389, 'LEIDY', 'OROZCO SUAREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (981, 1117531377, 'YEIMY JULIETH', 'GIRALDO CASTRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (982, 1117540150, 'VIVIANA JANETH', 'CONDA CUNDA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (983, 1117549401, 'DAVINSON ANDRES', 'LOZADA GALVIS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (984, 1117550878, 'YURANI MARCELA', 'CASTAÑEDA BEDOYA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (985, 1117553208, 'ANA YOVANNA', 'MENDOZA CHICO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (986, 1117553684, 'YERALDINE', 'CONDE SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (987, 1129424115, 'DANIELA JULIZA', 'MUÑOZ ROMERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (988, 40611785, 'JOHANNA MARCELA', 'CUELLAR GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (989, 52763851, 'LILIANA', 'CARVAJAL MARIN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (990, 1006507158, 'JHON JAIRO', 'MONROY MUR', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (991, 1006596275, 'YULIANA KATHERINE', 'TABORDA CUELLAR', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (992, 1003815661, 'ELIANA MARIA', 'GONZALEZ TRILLERAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (993, 1006515703, 'CRHISTIAN SNEYDER', 'MORENO BASTO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (994, 1097407767, 'MARIA ALEJANDRA', 'BELTRAN AVENDAÑO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (995, 1117488814, 'MAYRA YULY', 'SILVA GARCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (996, 1117494427, 'WILFRED', 'VIDAL GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (997, 1117495794, 'LUZ NELLY', 'PERDOMO SILVA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (998, 1117535176, 'HECTOR HERNAN', 'CICERI CHAVEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (999, 1117545692, 'VERONICA VALENTINA', 'LOFIEGO GIL', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1000, 1117546882, 'EDGAR ANDRES', 'NARANJO CERQUERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1001, 1121924801, 'ELKIN FARID', 'ROZO RIVEROS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1002, 1127623858, 'JESUS DANIEL', 'JARAMILLO VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1003, 17658533, 'ROBERT JOSE', 'MENDOZA MOLINA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1004, 4888737, 'ISRAEL FERNANDO', 'ALMARIO MARTINEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1005, 1006512228, 'DIEGO ALEJANDRO', 'ROMERO FERLA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1006, 1006528538, 'DIANY SAYURY', 'SOGAMOSO VERU', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1007, 1006529020, 'BERONICA', 'GRISALES ALVAREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1008, 1006596192, 'YISNEDY', 'SAENZ DIAZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1009, 1006597318, 'ROSA ISELA', 'GUARACA OTAVO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1010, 1006597409, 'DISNEY DAYANA', 'IMBACHI MORALES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1011, 1007359224, 'DERLY TATIANA', 'RODRIGUEZ ORTIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1012, 1007359241, 'DANNIA', 'URBINA GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1013, 1007383916, 'ANDRY YULIANA', 'TIMOTE MARTINEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1014, 1082774507, 'MILEIDY', 'PLAZAS CRIOLLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1015, 1118021586, 'CRISTIAN FERNANDO', 'GIRALDO SABOGAL', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1016, 1118026605, 'PATRICIA LORENA', 'PRADA PRADA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1017, 1118027160, 'SANDRA MARITZA', 'RONDON ESCOBAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1018, 1118027296, 'DIANA MARCELA', 'CLAROS MARTINEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1019, 1118028119, 'JAMIR ALEXIS', 'CUELLAR BENAVIDES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1020, 1118028132, 'YESICA ANDREA', 'RONDON ESCOBAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1021, 1118028259, 'LEIDY CAROLINA', 'MONTOYA RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1022, 1118029387, 'FERNANDO', 'OLIVERA PEREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1023, 1118029518, 'RIBALDO', 'VILLALBA BOLAÑOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1024, 1121892554, 'MARTHA XIMENA', 'LOZANO GRIZALEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1025, 40076381, 'ANGELA MARIA', 'TOVAR ALZATE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1026, 40773166, 'VIANEY', 'JOVEN CUELLAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1027, 96333477, 'GERSON WALTER', 'DIAZ HERNANDEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1028, 1006503795, 'EIDY JISELL', 'MURCIA CHARRY', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1029, 1006512970, 'HESLEY CAROLINA', 'ESPAÑA YAGUARA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1030, 1006813654, 'CAMILA ANDREA', 'ACOSTA FIGUEROA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1031, 1006957072, 'ALEXANDRA', 'GUTIERREZ GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1032, 1012333252, 'MARIA MARGARITA', 'COMETA VASQUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1033, 1012429854, 'MIRYAN DEL PILAR', 'PEREZ ARAQUE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1034, 1013586406, 'LUCENY', 'MURCIA MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1035, 1088350756, 'INDIRA PATRICIA', 'TIQUE MONTIEL', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1036, 1115953646, 'VIVIANA', 'LUGO REYES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1037, 1116924356, 'YESSIKA', 'RODRIGUEZ PARRA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1038, 1117485519, 'SANDRA MILENA', 'GOMEZ QUICENO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1039, 1117505562, 'LEIDY SUSANA', 'MARTINEZ OSPINA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1040, 1117516203, 'ANA JISETH', 'GONZALEZ BERRIO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1041, 1117521638, 'YESSICA', 'YATE DIAZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1042, 1117524705, 'SANDRA JULIETH', 'LARA MOLINA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1043, 1117526697, 'ANDERSON', 'OTAVO VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1044, 1117530093, 'MERCEDES', 'VELASQUEZ LEON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1045, 1117539345, 'CARLOS ENRIQUE', 'PITO CASTRILLON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1046, 1117549814, 'ANGIE TATIANA', 'TRUJILLO VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1047, 1117550785, 'ADRIANA LUCIA', 'PARRA ROJAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1048, 1117552836, 'SANTIAGO', 'PEREZ FACUNDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1049, 1117552932, 'AURA DANIELA', 'SALAZAR CALDERON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1050, 1117553017, 'JHON JAIRO', 'SALAMANCA MORENO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1051, 1117553898, 'CAMILA ANDREA', 'SANCHEZ CASTRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1052, 1117554378, 'RUTH DERY', 'HEREDIA PEÑUELA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1053, 1117886018, 'GERALDINE', 'GUTIERREZ GAITAN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1054, 1117972270, 'HARRISON FABIAN', 'GUACA MARTINEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1055, 30516624, 'MIYERLATH', 'ROMERO DUQUE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1056, 40614238, 'DIANA MILENA', 'LOZADA CUELLAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1057, 40614417, 'SANDRA PATRICIA', 'COLLAZOS SAMBONI', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1058, 1006631725, 'DAIRA YINETH', 'FACUNDO NUÑEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1059, 1007865972, 'CAROL JILIANA', 'BECERRA GARCIA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1060, 1006487142, 'DUVAN JAVIER', 'SARRIAS CLEVES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1061, 1006502558, 'GIORDAN', 'CORDOBA DELGADO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1062, 1006503652, 'DIEGO MAURICIO', 'VARGAS SUAREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1063, 1006503958, 'ARLEX JOHANES', 'TOTENA RIVERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1064, 1006505404, 'JESUS DAVID', 'IMBACHI LUGO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1065, 1006507009, 'CRISTIAN DUVAN', 'SERRATO PAREDES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1066, 1006549789, 'HAROLD', 'CUBILLOS VALENCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1067, 1117531375, 'CRISTIAN FERNANDO', 'BELTRAN SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1068, 1117535800, 'ANDREA DEL PILAR', 'MUÑOZ TORRES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1069, 1117547119, 'JEISSON DAVID', 'AGUIRRE CASTAÑO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1070, 1117550117, 'JOSE ALEJANDRO', 'BRAFFI PALOMA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1071, 1117550811, 'ADRIAN', 'VARGAS PERDOMO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1072, 1117552772, 'JONATHAN FERNANDO', 'GONZALEZ MARTINEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1073, 1117886120, 'JESUS HERNANDO', 'GUZMAN JARAMILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1074, 1118071955, 'MOISES', 'CRUZ MORALES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1075, 1119218448, 'YESID', 'FLOREZ GUZMAN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1076, 16187572, 'DARIO', 'MORALES GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1077, 16188640, 'LIBARDO', 'VASQUEZ RAMIREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1078, 17656831, 'JUAN CARLOS', 'PAI CASTRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1079, 6804920, 'ARLEY', 'CARDOZO TOPAL', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1080, 83212474, 'YECID', 'TRUJILLO ROJAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1081, 1000372743, 'JONATHAN DAVID', 'DAZA FORERO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1082, 1006505638, 'JOSE GUILLERMO', 'MERCHAN ARTUNDUAGA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1083, 1006538359, 'NICOLAS ALEJANDRO', 'OBREGON FLORIANO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1084, 1006631986, 'DIEGO ARMANDO', 'GUTIERREZ JOVEN', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1085, 1006512539, 'KATY SAY', 'PARRA MEDINA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1086, 1006514451, 'LUISA FERNANDA', 'GUTIERREZ GAITAN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1087, 1006521687, 'YESSICA PAOLA', 'COTACIO OTAYA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1088, 1006521761, 'DEILY FANLLANY', 'AGUDELO VERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1089, 1006521771, 'WILLIAM', 'BUITRAGO HURTADO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1090, 1006521841, 'YEICI YAISURY', 'GAVIRIA CORREDOR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1091, 1082155141, 'ANGELICA', 'VALENCIA RUBIO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1092, 1117489268, 'ANDRES MAURICIO', 'CAVICHE ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1093, 1117498898, 'SINDY LORENA', 'ARIAS PEÑA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1094, 1117885177, 'ISNEYI YULIETH', 'PARRA LAGUNA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1095, 1117885280, 'MARGARITA', 'RODRIGUEZ VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1096, 1117885332, 'YORLEDY', 'GUZMAN JARAMILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1097, 1117885421, 'HELMAR ANDRES', 'BEJARANO PARRA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1098, 1117885536, 'DALY', 'ITAZ JURADO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1099, 1117885613, 'JAIME ENRIQUE', 'QUIMBAYO CELIS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1100, 1117885848, 'LINA MARCELA', 'RIVERA ALVIS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1101, 1133159009, 'KELLY', 'PERDOMO YOHANA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1102, 26634627, 'FLOR ALBA', 'PARRA TOLEDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1103, 26634837, 'ROSALBA', 'RODRIGUEZ LOPEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1104, 1006521525, 'NATALIA', 'AREVALO RODRIGUEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1105, 1117884015, 'YOJAN', 'ANGULO CELIS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1106, 1006483840, 'RUTH', 'ANACONA CARDENAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1107, 1007761529, 'RICHAR STIVEN', 'VALDERRAMA CRIOLLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1108, 1016060057, 'KERLY YULIETH', 'PANTOJA MORENO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1109, 1081416333, 'LAURA ISABEL', 'ALDANA ANGEL', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1110, 1117232358, 'KAREN SULDERY MARITZA', 'VILLANUEVA MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1111, 1117233092, 'VICTOR', 'IBAÑEZ GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1112, 1117235326, 'MILEIDY', 'GARCIA CORDOBA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1113, 1117529893, 'YEFFERSON ANDRES', 'VALDERRAMA CRIOLLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1114, 1117541430, 'YORLENY', 'VALDERRAMA BARRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1115, 1117543342, 'INGRID TATIANA', 'BAÑOL COLLAZOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1116, 1119585841, 'YENY PAHOLA', 'CARRANZA LUGO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1117, 26625225, 'MERY', 'BUITRAGO ZAMORA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1118, 36290092, 'ANA ISABEL', 'RAMIREZ VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1119, 40670612, 'YINA PAOLA', 'ROJAS MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1120, 1006484702, 'MARITZA', 'NARVAEZ GALVIS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1121, 1117233808, 'YAIMY ALEXANDRA', 'TABARES MUÑOZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1122, 1003950406, 'JOSE EDWAR', 'MONTERO JOVEN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1123, 1004766700, 'MANUELA', 'RAIGOZA JARAMILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1124, 1006514723, 'ANYI THATIANA', 'BONILLA CABRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1125, 1006515414, 'MARIA DE LOS ANGELES', 'PASTRANA CABRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1126, 1006516468, 'ANYI', 'RINCON VANEGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1127, 1006518297, 'DIEGO', 'MONTANO RIOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1128, 1006518499, 'WILSON', 'CARDOZO LAVERDE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1129, 1006518587, 'JULIAN DAVID', 'NARVAEZ ALVIS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1130, 1006520274, 'ANGGIE PAOLA', 'FIERRO FIERRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1131, 1070023670, 'KAROL MELISSA', 'GONZALEZ RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1132, 1104697770, 'ERIKA', 'RODRIGUEZ OCAMPO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1133, 1110599015, 'JHON SEBASTIAN', 'GOMEZ BARRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1134, 1117804665, 'LINDA VERONICA', 'MORALES OLAYA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1135, 1117810024, 'YULI ANDREA', 'ARIAS BARREIRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1136, 1117811566, 'ANGIE LORENA', 'CAICEDO ORTIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1137, 1117816249, 'YANA MILETH', 'CHAVARRO QUIMBAYA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1138, 1117819451, 'BELGICA', 'BUSTOS RAMIREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1139, 1117821292, 'LUIS MIGUEL', 'MENDOZA HERNANDEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1140, 1117822258, 'BELLANID', 'CAMARGO CASTAÑEDA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1141, 1117822849, 'OSCAR EDUARDO', 'PUENTES BASTIDAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1142, 1117823829, 'CONZUELO', 'ROMERO MUNAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1143, 1117824346, 'MARIA MAYI', 'MONROY NOGUERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1144, 1117824589, 'MARIA CRISTINA', 'MURCIA MELENDEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1145, 1117826569, 'MARIA HELENA', 'HOLGUIN PELAEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1146, 1117838873, 'JINNETH PAOLA', 'RAMIREZ VASQUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1147, 1117839258, 'EDUAR', 'PEREZ MOLINA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1148, 1117839598, 'CARLOS HERNAN', 'ROJAS ARRIGUI', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1149, 1117967378, 'MAYERLY', 'PEÑA MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1150, 40693043, 'LUCERO', 'TUMBO LOPEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1151, 1006459873, 'STEICY LORENA', 'URRIAGO MONDRAGON', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1152, 1006518753, 'PEDRO JOSE', 'QUINTERO LIZARAZO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1153, 1007750923, 'DORIS DAYANA', 'MARTINEZ CALDERON', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1154, 1117805108, 'BRAYAN STEVEN', 'ROJAS MORENO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1155, 1006488130, 'YURANY', 'FORERO VASQUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1156, 1006596906, 'LINA MARCELA', 'LOAIZA CAMACHO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1157, 1014203366, 'ADIPATRICIA', 'BUSTOS SAAVEDRA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1158, 1077861648, 'ADRIANA LIZETH', 'MAYA DUARTE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1159, 1083918677, 'KIANA ASHLEY', 'ANDRADE CARABALI', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1160, 1118029437, 'ISABRO', 'DUCUARA PEREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1161, 1119210273, 'LUZ DELLY', 'CRUZ RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1162, 1119210315, 'MICHELLE DAYANA', 'GOMEZ SANTANA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1163, 1119211481, 'YASMIN', 'DUCUARA MORENO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1164, 1119212982, 'MIRDA BLEIDY', 'PRADA GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1165, 1119215280, 'SOLVEIRA', 'SUAREZ TRUJILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1166, 1119215819, 'MARIA ODILIA', 'PRADA GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1167, 1119215859, 'ESLY MICHELLE', 'MENDEZ ORTIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1168, 1119216251, 'SUSAN LIZETH', 'SOGAMOSO TRUJILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1169, 1119216878, 'MARLA KARINE', 'RENZA RAMIREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1170, 1119217435, 'DIANA PATRICIA', 'ARTUNDUAGA LIZCANO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1171, 26620922, 'AMPARO', 'MUÑOZ ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1172, 30508518, 'MARLENY', 'MENDEZ ROJAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1173, 40087636, 'ANA MARIA', 'LIZCANO GAITAN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1174, 40087737, 'DORA ALPIDIA', 'CORREA MEJIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1175, 40088087, 'AMANDA', 'LOZADA CABRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1176, 40088287, 'YASMIN', 'GUARNIZO SILVA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1177, 52230661, 'SANDRA MILENA', 'ANDRADE MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1178, 6801476, 'HECTOR', 'TRUJILLO ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1179, 76317582, 'JHON CARLOS', 'ROSERO TRUJILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1180, 96340141, 'HECTOR', 'SANCHEZ ROMERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1181, 96341407, 'FABIO', 'LIZCANO GAITAN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1182, 1193626656, 'SOHELY ALEXANDRA', 'JIMENEZ BAUTISTA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1183, 1001173077, 'JOSE ALEJANDRO', 'PRIETO LOZANO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1184, 1005867980, 'JULIETH', 'CASTAÑEDA SARRIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1185, 1006500823, 'ZULEYMA', 'TORRES CORTES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1186, 1006501020, 'ERICK CAMILO', 'FAJARDO CRUZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1187, 1006512641, 'DANIEL EDUARDO', 'SANTA GONZALEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1188, 1007146945, 'STEPHANI PAOLA', 'CAMPO LOPEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1189, 1007394378, 'SHELSE ALEXANDRA', 'GONZALEZ HERNANDEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1190, 1024587544, 'BRAYAN HERNAN', 'HENAO PEREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1191, 1049643490, 'JUAN SEBASTIAN', 'PALOMINO RINCON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1192, 1075307566, 'MARIA DEL CARMEN', 'MENDEZ SOTO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1193, 1117266157, 'MARLON ANDRES', 'LOPEZ ACHURY', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1194, 1117514386, 'OSCAR', 'GARCIA RIVERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1195, 1117516362, 'MONICA ANDREA', 'TRUJILLO ORDOÑEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1196, 1117542539, 'DAISSY', 'MORALES CALDERON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1197, 1117545708, 'BRAYAN STEVEN', 'GUTIERREZ VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1198, 1117547442, 'ANGY PAOLA', 'LEAL JARAMILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1199, 1117548397, 'DIEGO ISMAEL', 'CULMA CHAGUALA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1200, 1117549506, 'DANIELA', 'LOSADA CALDERON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1201, 1117550445, 'ELISABEL', 'VASQUEZ MAZABEL', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1202, 1117550993, 'SEBASTIAN ALEJANDRO', 'GARZON TOVAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1203, 1117551039, 'LINA MARCELA', 'CALDERON RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1204, 1117551813, 'MERCY YULIETH', 'HERRERA CALDERON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1205, 1117552832, 'JOAN ANDRES', 'VERANO MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1206, 1117553261, 'ALEJANDRA', 'TORRES ARTUNDUAGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1207, 1119216899, 'YEIBER', 'MORENO MORENO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1208, 1193582460, 'DIEGO ANDRES', 'BARRERA MANIOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1209, 1006431238, 'WILIAN ALEXIS', 'ZAPATA GUTIERREZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1210, 1006505073, 'NICOLAS', 'AUDOR RIVERA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1211, 1006505728, 'LUISA FERNANDA', 'MARLES MARTINEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1212, 1006506781, 'LUISA FERNANDA', 'SALINAS RAMON', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1213, 1006509017, 'LUIS MIGUEL', 'TRUJILLO MELO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1214, 1006597184, 'JHOINER ALEXIS', 'VASCO GAVIRIA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1215, 1010119404, 'DAHIANA', 'DIAZ PICO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1216, 1193136297, 'DERLY MILECCI', 'RESTREPO RESTREPO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1217, 1006514167, 'FABIAN STEVEN', 'BERMEO MARTINEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1218, 1007621378, 'EIDER', 'PANCHO DELGADO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1219, 1117235415, 'HANDERSSON VIDAL', 'OROZCO GUILLERMO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1220, 1117263242, 'YAKSON LEANDRO', 'MURCIA COLLAZOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1221, 1119582741, 'YIRMY DAVINSON', 'PIRANGA MORENO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1222, 1119586628, 'MILLER', 'RAMIREZ ORTIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1223, 1119586873, 'JEISON ALEXANDER', 'MACIAS CORREA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1224, 16192031, 'JAIRO', 'AGUDELO PRIETO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1225, 4896263, 'JOSE RICARDO', 'RAMOS HERNANDEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1226, 6805386, 'PAULO ANTONIO', 'CENDALES ORTIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1227, 1006512282, 'JAIDER DUBAN', 'CABRERA SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1228, 1019056677, 'JHON WILDER', 'SAMBONI CARDENAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1229, 1061748775, 'YEIZON', 'GUEVARA PERDOMO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1230, 1075210478, 'FABIAN ERNESTO', 'MARIN ACOSTA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1231, 1083915922, 'JUAN SEBASTIAN', 'CABRERA RUIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1232, 1116921570, 'JUAN MANUEL', 'MAZABEL VASCO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1233, 1117497066, 'JOHN ALVARO', 'QUIROZ GONZALEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1234, 1117504753, 'YAIR FABIAN', 'OSORIO CASTRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1235, 1117507122, 'CRISTIAN DANILO', 'TORRES SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1236, 1117512827, 'JHON ANDERSON', 'TRUJILLO OSORIO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1237, 1117517124, 'SANDRA LORENA', 'CORDOBA LOZANO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1238, 1117522005, 'WILLIAM CAMILO', 'HURTADO CABRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1239, 1117525636, 'YEISON HAWER', 'SALCEDO CABRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1240, 1117528965, 'JORGE LUIS', 'SOGAMOSO LOPEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1241, 1117534782, 'JULIO CESAR', 'CHARRY FINSCUE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1242, 1117547056, 'BRAYAN HERNANDO', 'CELIS LOSADA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1243, 1117547613, 'ARNOLD FERNANDO', 'CARO CAÑON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1244, 1117548449, 'JESUS ALDAIR', 'VARON OSPINA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1245, 1117549223, 'HENRY FABIAN', 'LIZARAZO ALMARIO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1246, 1118027881, 'HERMES ORLANDO', 'DIAZ GARCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1247, 1119586917, 'ADRES FELIPE', 'MOLANO ORTIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1248, 12240603, 'GUISDALDO', 'VALENCIA HUETIO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1249, 12262479, 'ALEXANDER', 'SILVA SILVA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1250, 17634467, 'FERNANDO', 'SANCHEZ ZAMBRANO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1251, 17659366, 'ROBINSON', 'RAMOS MENDEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1252, 6803798, 'JORGE ELIECER', 'CORREA CHILITO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1253, 6805134, 'HITLER', 'MARIN LONDOÑO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1254, 86073540, 'HENRY FERNANDO', 'MACUALO PEREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1255, 1006507756, 'YOINER IVAN', 'CABRERA SANCHEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1256, 1117233398, 'CARLOS ANDRES', 'CULMA TIQUE', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1257, 1006483867, 'ELIAS', 'PIRANGA CRUZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1258, 1117232823, 'EDILSA ADRIANA', 'ILES GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1259, 1117233173, 'RUFO ALBERTO', 'MURCIA PIZARRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1260, 1117234278, 'MARGELIS', 'VARGAS MORENO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1261, 1117234279, 'GORLADY', 'ILES GASCA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1262, 1117234284, 'NICOLAS', 'GAZCA PIRANGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1263, 1117234295, 'MELARDO', 'ILES PIRANGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1264, 1117235265, 'JOSE MARTIN', 'BOLAÑOS FIGUEROA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1265, 1117235266, 'JAIR', 'VARGAS MORENO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1266, 1117235378, 'ALEXIS', 'BOLAÑOS PIRANGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1267, 1117235513, 'SANDRO ARCESIO', 'ILES GASCA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1268, 1117235672, 'LINA MARIA', 'GUTIERREZ GASCA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1269, 1117235972, 'JUAN CARLOS', 'ILES GASCA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1270, 1117236105, 'EDGAR', 'ILES PIRANGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1271, 1117489896, 'JAVIER', 'BOLAÑOS FIGUEROA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1272, 1117502758, 'RUBI NOJATH', 'GASCA PIRANGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1273, 1119585860, 'DIANA PAOLA', 'CABRERA RUIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1274, 17654558, 'FREDI OBANDO', 'PIRANGA CAMACHO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1275, 1117234357, 'EYDA MILENA', 'ILES GASCA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1276, 1007359219, 'DANIA', 'ARANGO MARTINEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1277, 10493732, 'RODOLFO', 'ZAPATA SALAZAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1278, 1069432603, 'CARLOS ANDRES', 'VARGAS VERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1279, 1117494382, 'GEOVANNY', 'TRIANA FLOREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1280, 1117504043, 'OSCAR JAVIER', 'ARIAS NORIEGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1281, 1117507511, 'JHONAN ANDRES', 'SALDAÑA BERMEO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1282, 1117509966, 'JIMMY FABIAN', 'GIL CASTRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1283, 1117511624, 'MARIANA', 'CORREA REYES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1284, 1117532129, 'TANIA ALEJANDRA', 'GIRALDO MORENO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1285, 1117532359, 'MAURICIO', 'CARDOSO GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1286, 1117544337, 'CRISTHIAN DAVID', 'MARIN ORTIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1287, 1117547035, 'ELIZABETH', 'TAFURT MOSQUERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1288, 1117548057, 'ESNEIDER', 'LOPEZ TAPIERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1289, 1117548610, 'BRAYAN ALBERTO', 'VICTORIA MONTOYA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1290, 1117551441, 'ADRIANA LUCIA', 'ORTEGA RINCON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1291, 17634491, 'WILLIAM', 'ALVAREZ LOZADA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1292, 17644018, 'WALTER', 'ROCHA SOLORZANO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1293, 17645159, 'JESUS ALFONSO', 'BASTO JARAMILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1294, 17652438, 'NILSON JOHNNY', 'YELA APRAEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1295, 17658684, 'OSCAR HOMERO', 'HERNANDEZ CATAÑO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1296, 17704298, 'HUMBERTO', 'ALTURO TABORDA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1297, 17773230, 'NELSON', 'LOZADA CORDOBA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1298, 30506758, 'MYRIAM ANDREA', 'GALLEGO MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1299, 40075517, 'NELLY', 'TRUJILLO MACUACE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1300, 40766622, 'LUZ MARINA', 'OSSA FIGUEROA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1301, 40782399, 'MARLENE ADRIANA', 'ZAMUDIO ÑUSTES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1302, 40782973, 'NANCY', 'NUÑEZ RENDON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1303, 88218009, 'MARIO FERNANDO', 'GIRALDO RAMIREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1304, 1006501430, 'WILLIAM JOAN', 'COLORADO SARMIENTO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1305, 1014297967, 'MICHAEL STEVEN', 'BARBOSA ARANZA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1306, 1015410128, 'JEAN PAUL', 'MUÑOZ QUINTERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1307, 1023868026, 'PEDRO ALEJO', 'ORTIZ RIAÑO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1308, 1033730156, 'BRAYAN JAVIER', 'TORRES GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1309, 1036603433, 'DIDIER JOHAN', 'CANO SALDARRIAGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1310, 1039084936, 'GINER DAHISON', 'SIERRA BELTRAN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1311, 1044503260, 'DUBIAN ESTEBAN', 'JARAMILLO LOPERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1312, 1070730399, 'CRISTIAN ALEXANDER', 'VILLALOBOS DIAZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1313, 10773491, 'DEIVIS', 'CHAPARRO VELANDIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1314, 1096216385, 'JEISSON MARTIN', 'PEDRAZA OSORIO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1315, 1105612424, 'WILMER ANDRES', 'LOPEZ SERNA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1316, 1115184611, 'DUBERNEY', 'PEÑA MOLINA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1317, 1115793767, 'JAVIER', 'GAVIRIA VELEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1318, 11229847, 'FREDY ALEJANDRO', 'SIERRA GUAYARA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1319, 11258619, 'QUERLIN ARBEY', 'QUILINDO GONZALEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1320, 13571097, 'JAIR ROBERTO', 'RIBERO ANAYA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1321, 16188459, 'UBAN', 'TOVAR VALENCIANO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1322, 16834089, 'ORBEY', 'QUISOBONY PEREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1323, 17775161, 'DIEGO FELIPE', 'DUQUE ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1324, 3133928, 'OSCAR ANDRES', 'HURTADO GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1325, 4520226, 'JOSE CENON', 'HENAO CARMONA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1326, 71264344, 'JUAN DIEGO', 'MENESES CAICEDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1327, 71266441, 'WILLIAM DARIO', 'BETANCUR MORALES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1328, 71984289, 'VICTOR MANUEL', 'PALENCIA RIVERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1329, 78028267, 'ATANASIO MANUEL', 'TORDECILLA MONTALVO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1330, 80011750, 'RODRIGO ALFONSO', 'URREGO RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1331, 80241195, 'KENDRIX AUGUSTO', 'QUIÑONEZ BARBOSA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1332, 80424851, 'LUIS ALEJANDRO', 'ROJAS ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1333, 9600407, 'OSCAR BERNARDO', 'BELTRAN GILON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1334, 1006420046, 'DUBERNEY', 'GARZON ALONSO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1335, 1006526831, 'FABIAN ANDRES', 'VARGAS ORTEGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1336, 1075259163, 'LEIDY ANDREA', 'BARRETO VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1337, 1077872864, 'DANIEL', 'BERMEO MENDEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1338, 1079179170, 'JEISSON ANDRES', 'RAMIREZ DIAZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1339, 1117502494, 'GENIBER', 'PLAZAS MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1340, 1117540826, 'JEFERSON ANTONIO', 'MONTEALEGRE GASCA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1341, 1117550202, 'JUAN SEBASTIAN', 'GUTIERREZ CALCETO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1342, 1117551745, 'DANIEL ESTEBAN', 'ESCOBAR TIERRADENTRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1343, 1117969891, 'CRISTIAN DAVID', 'PAEZ CORTES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1344, 1117973892, 'ABLEY', 'CAMACHO ORTIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1345, 1117974561, 'JIBER', 'BARCENA BARRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1346, 1117974577, 'JHONNATAN', 'PERDOMO HURTADO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1347, 16189927, 'NESTOR ENRIQUE', 'CAJAMARCA GIL', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1348, 1006487579, 'CHRISTIAN MAURICIO', 'MONTEALEGRE GASCA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1349, 1006506030, 'MARIA CRISTINA', 'CABRERA GASCA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1350, 1006528187, 'LAURA CAMILA', 'ARIAS POLANIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1351, 1007621477, 'NELLY', 'PIRANGA VALENCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1352, 1032429848, 'YEISON ALEXANDER', 'TRUJILLO ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1353, 1074576956, 'DIEGO ANDRES', 'ANAYA PANTEVEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1354, 1117491570, 'JUAN CARLOS', 'BONILLA GIL', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1355, 1117498518, 'MAYERLY', 'TRUJILLO BERMEO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1356, 1117499676, 'VICTOR ALFONSO', 'TRUJILLO GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1357, 1117540049, 'CECILIA', 'PEREZ CORREDOR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1358, 1117542940, 'VICTOR HUGO', 'GUZMAN ORDOÑEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1359, 1117545887, 'EDUIN JARLINSON', 'GALINDO PENAGOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1360, 1117546721, 'AURORA', 'PEREZ CORREDOR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1361, 1117551018, 'NEIDER YECID', 'CASTRO ANACONA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1362, 1117555098, 'CAMILO ANDRES', 'CALDERON MORALES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1363, 1118073553, 'JUAN CAMILO', 'CHAVEZ PARRA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1364, 1118474537, 'MARGIE LORENA', 'UNI ENDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1365, 17647529, 'JAVIER', 'TRUJILLO ALVARADO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1366, 17659311, 'HARRINSON', 'MAVESOY MARTINEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1367, 30506372, 'LUZ ENITH', 'RUIZ RIAÑO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1368, 40671158, 'LEIDY LAURA', 'CEDEÑO CABRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1369, 40776258, 'NINFA', 'QUINAYAS COAGY', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1370, 6805297, 'JOHN JAIR', 'DAZA ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1371, 7726604, 'EDINSON JEINER', 'CANO DIAZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1372, 1006504870, 'VALENTINA', 'SANCHEZ FORERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1373, 1006505138, 'JONATHAN', 'CARDONA CERRATO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1374, 1006505281, 'NIKOOLL', 'JARAMILLO CHICUE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1375, 1006524439, 'JORDAN ANDRES', 'HOYOS VASQUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1376, 1007453606, 'ERIKA TATIANA', 'HERNANDEZ QUINTERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1377, 1117523453, 'DELIO', 'PASTRANA LOZADA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1378, 1117544830, 'HENRY', 'BRAND ARBOLEDA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1379, 1117554170, 'JOSE ALEJANDRO', 'CUELLAR GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1380, 1117554255, 'YENNY FERNANDA', 'OSORIO GIRALDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1381, 1117960154, 'YEIMY JULIETH', 'SUAREZ LOPEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1382, 14605268, 'OSCAR FERNANDO', 'CARDONA RICO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1383, 16188487, 'JULIAN DANIEL', 'RODRIGUEZ DIAFARA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1384, 17691315, 'EDWAR SHNEVIER', 'GONZALEZ FLORIANO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1385, 1006410262, 'YESIKA ALEJANDRA', 'PARRA ARIAS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1386, 1006504964, 'DANNY YULIANA', 'AGUILAR SOTO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1387, 1006506472, 'DINA SHIRLEY', 'HERNANDEZ CRUZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1388, 1006506594, 'JESUS ALBERTO', 'COLLAZOS MORALES', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1389, 1006509163, 'JAIDER MAURICIO', 'RODRIGUEZ CABRERA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1390, 1006517167, 'SOFIA', 'RICO LOSADA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1391, 1006538180, 'CAMILO ANDRES', 'LOSADA BECERRA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1392, 1006538661, 'SEBASTIAN', 'CANO RAMIREZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1393, 1006631984, 'LUIS CARLOS', 'FERNANDEZ GUZMAN', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1394, 1006665684, 'JOSE GABRIEL', 'SANCHEZ CALQUIN', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1395, 1117784007, 'KARLA DAYANA', 'CORDOBA MOLANO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1396, 1118362759, 'KHADIR ALEXIS', 'ASCENCIO VALDERRAMA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1397, 1118364268, 'MICHAEL MACK', 'MORENO RAMIREZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1398, 1125178804, 'MAIDA ALEXANDRA', 'VARGAS MOSQUERA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1399, 1000722048, 'YURANY ANDREA', 'GONZALEZ TOLEDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1400, 1006502601, 'SANTIAGO', 'ROA ARTUNDUAGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1401, 1006504448, 'CHERLI JULIETH', 'AMAYA SOTO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1402, 1006513663, 'SEBASTIAN', 'CASTRO CALDERON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1403, 1006527055, 'DEIRY YULIANA', 'VALENCIA SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1404, 1006530649, 'DAYANA LICETH', 'PULIDO GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1405, 1006537961, 'MARIA ALEJANDRA', 'DIAZ RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1406, 1010130246, 'SEBASTIAN', 'FIGUEROA ARANGO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1407, 1026299369, 'DIANA CAROLINA', 'DIAZ PALENCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1408, 1115794129, 'SAMUEL IGNACIO', 'LOPEZ RINCON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1409, 1117487343, 'BEATRIZ', 'TIRADO LUGO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1410, 1117492614, 'ANA FELISA', 'ECHEVERRY CRUZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1411, 1117501105, 'LINA MARCELA', 'MONTOYA ZAMBRANO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1412, 1117514556, 'YINA MARCELA', 'HOYOS VALDERRAMA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1413, 1117518984, 'FABIAN ANDRES', 'SILVA IBAÑEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1414, 1117527589, 'CAROL YULIETH', 'CARABALI CABRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1415, 1117540485, 'JHON ALEXANDER', 'RAMIREZ PEREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1416, 1117540916, 'EDIER ANDRES', 'DORADO SAPUY', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1417, 1117543643, 'ANGIE KATHERINE', 'SANCHEZ BONILLA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1418, 1117545498, 'YULY VANESSA', 'RAMIREZ QUINTERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1419, 1117551799, 'JUAN DAVID', 'DIAZ ALVARADO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1420, 1117804846, 'MARLUBY', 'DIAZ VERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1421, 1118028769, 'YENY MARCELA', 'GOMEZ ALVIS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1422, 1193523500, 'YENCY CAROLINA', 'VAQUERO ESCOBAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1423, 17646724, 'MARIO ALEXANDER', 'BASTIDAS ORTIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1424, 1004252203, 'GABRIELA', 'VALDERAMA TOVAR', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1425, 1004728600, 'YERALDINE', 'AGUDELO SILVA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1426, 1006119627, 'JORGE ANDRES', 'CELIS NUÑEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1427, 1006508010, 'PAULA DAYANA', 'SANCHEZ VELEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1428, 1006508168, 'NELLIS CAROLINA', 'GUTIERREZ MORENO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1429, 1006514002, 'NELSON GEOVANNY', 'PINILLA CABRERA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1430, 1006516027, 'YUDI VANESA', 'RODRIGUEZ RODRIGUEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1431, 1006526723, 'KEVIN STIVEN', 'MORENO RODRIGUEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1432, 1006507768, 'KAREN JULIETH', 'ARTUNDUAGA SUAREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1433, 1006528550, 'JOSE JAIRO', 'GARCIA PANTEVES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1434, 1006529410, 'JEINY ANDREA', 'CALDERON ROJAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1435, 1007359225, 'NINI JOHANA', 'COTACIO TIMOTE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1436, 1007383817, 'XIOMARA HASLEIDY', 'BETANCOURTH OLAYA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1437, 1075290393, 'LUISA FERNANDA', 'VILLANUEVA GARCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1438, 1083909408, 'SERGIO FARITH', 'CALDERON LOSADA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1439, 1116922447, 'YURLEIDY MILENA', 'REYES TAPASCO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1440, 1117807368, 'YIRLENIS', 'TRUJILLO ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1441, 1118020377, 'ELIANA FERNANDA', 'CAMACHO GUERRERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1442, 1118023388, 'MARLLIVY', 'VALDERRAMA OSPINA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1443, 1118027250, 'KAREN LORENA', 'DIAZ CAVIEDES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1444, 1118027720, 'MONICA ALEJANDRA', 'RODRIGUEZ GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1445, 1118028189, 'ISLENA', 'PEREZ BERNAL', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1446, 1118028271, 'MARY LUZ', 'LOPEZ VELEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1447, 1118028975, 'NATALIA', 'SANCHEZ RONDON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1448, 1118029628, 'KAROL ANDREA', 'MENDEZ ANACONA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1449, 40091625, 'ELENA', 'MARTINEZ CORTES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1450, 40092428, 'LIS ADRIANA', 'ROA CARRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1451, 40092912, 'SULNEY', 'SUAREZ BERMUDEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1452, 40692677, 'MARYI LORENA', 'MEDINA RAMIREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1453, 40740751, 'SEFORA', 'FERNANDEZ CALDERON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1454, 40778354, 'MARIA EDILIA', 'VARON VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1455, 40783647, 'ANDREA LILIANA', 'GUERRERO SOLER', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1456, 51952065, 'MARIA ESNEDY', 'CRIOLLO RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1457, 52707230, 'EDNA MIREYA', 'PINTO RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1458, 94454956, 'MAIKE ROBERT', 'MENDOZA CUELLAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1459, 1006527589, 'JENNYFER', 'HURTADO MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1460, 1006528679, 'CRISTIAN DAMIAN', 'POSADA TIMOTE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1461, 1006529311, 'YUREIDI PAOLA', 'LUGO COTACIO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1462, 1118020176, 'DIANA PATRICIA', 'TAPIERO ALVAREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1463, 1006484115, 'DANIELA', 'VARGAS GIRALDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1464, 1006484270, 'DANIELA', 'SUAREZ NARANJO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1465, 1006484481, 'KERLY MARYURI', 'MONRROY GUERRERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1466, 1006502351, 'YENNIFER', 'CATUCHE SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1467, 1006502478, 'JUAN SEBASTIAN', 'MANRIQUE RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1468, 1006503106, 'DINA ANDREA', 'CORTES GONZALEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1469, 1006511799, 'YISLEHIDY', 'MEDINA YUCUMA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1470, 1006526466, 'LUISA FERNANDA', 'VARGAS BUSTOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1471, 1084260853, 'CLAUDIA FERNANDA', 'DIAZ PEREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1472, 1097612846, 'DEIVIS CAROLINA', 'ROVIS GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1473, 1117502985, 'YADIRA', 'ORDOÑEZ YAGUARA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1474, 1117526331, 'VICTOR ANDRES', 'AULLON GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1475, 1117526368, 'BIBIANA ANDREA', 'NUÑEZ LOZADA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1476, 1117545478, 'JERSON STIVEN', 'RODRIGUEZ SAPUY', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1477, 1117552282, 'MARLY ANDREA', 'CAMACHO ALVAREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1478, 1122724328, 'JEIMMY PAOLA', 'PAY MOLANO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1479, 1127217203, 'KELLY KATHERINE', 'CORTES BERMEO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1480, 30509967, 'YENSY PATRICIA', 'GOMEZ ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1481, 40613959, 'YINI ESMITH', 'CHARO SOTTO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1482, 7717556, 'FARITH', 'CHILA CARDENAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1483, 1004208853, 'DANIELA', 'SERRATO CABRERA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1484, 1006321751, 'FRANCISCO JAVIER', 'SABOGAL OLMOS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1485, 1006506247, 'PAULA YULIANA', 'IDARRAGA VARGAS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1486, 1006512037, 'SHIRLY VANESSA', 'CARVAJAL RIVERA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1487, 1117488745, 'JHON SEBASTIAN', 'PIEDRAHITA CELIS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1488, 1119581321, 'MARLEN YICELA', 'MALAGON MORENO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1489, 1133149204, 'KARLA YULIANA', 'RICON NARVAEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1490, 1193321155, 'YEIMY MARCELA', 'GUERRERO CUARTAS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1491, 1193572793, 'LEIDY JULIETH', 'ALMARIO RAMIREZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1492, 1006458602, 'ANYI LIZETH', 'ARBOLEDA MURILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1493, 1006487209, 'JALINSON SAMIR', 'CORTES ENDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1494, 1006501626, 'BRAYAN ARLEY', 'CASTRO LESMES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1495, 1006514894, 'ANDERSON ESTEBAN', 'ROJAS SANTOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1496, 1006530540, 'YULIANA', 'LARA CUELLAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1497, 1006879638, 'HANDERSON ESTEWAR', 'RODRIGUEZ VELASQUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1498, 1054990530, 'DIEGO', 'ALZATE RAMON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1499, 1060268798, 'LEONARDO', 'VALENCIA CORDOBA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1500, 1081517971, 'LUIS JAVIER', 'BUSTOS OCHOA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1501, 1117489894, 'MARLON', 'HURTADO ROJAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1502, 1117513349, 'MARLY LORENA', 'MUÑOZ PRADA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1503, 1117530221, 'DANIEL FERNANDO', 'ORTIZ GARZON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1504, 1117531732, 'OSCAR MAURICIO', 'TRUJILLO ROSAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1505, 1117550682, 'YEISON', 'CABRERA RIVERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1506, 1117551194, 'JONATHAN STIVENSON', 'SANTOS DIAZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1507, 17640849, 'PEDRO', 'RODRIGUEZ CANTILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1508, 40762405, 'FLOR DAICY', 'CASTRO LOZANO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1509, 6804687, 'NAHIN ANTONIO', 'ACEVEDO LONDOÑO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1510, 1006417690, 'JAMINTON ADRIAN', 'PRADA QUICENO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1511, 1006503260, 'YESICA ALEJANDRA', 'LLANOS TORRIJO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1512, 1006504558, 'DAGO MAURICIO', 'QUIROZ HOYOS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1513, 1006506510, 'LUIS JOSE', 'FRANCO MORENO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1514, 1006507665, 'PAULA ALEJANDRA', 'ROMERO CAMACHO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1515, 1006507733, 'JUAN DAVID', 'GARCIA ROJAS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1516, 1006507962, 'SEBASTIAN DAVID', 'PRIETO RAMIREZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1517, 1006509570, 'SANTIAGO', 'RIOS RODRIGUEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1518, 1006512700, 'EDWAR', 'GUTIERREZ ROMERO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1519, 1006537991, 'YEINER', 'MURCIA RIVERA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1520, 1006538542, 'LINA KATHERINE', 'CERQUERA BURBANO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1521, 1006596259, 'JHON MARIO', 'TORRES ANDRADE', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1522, 1118468246, 'MARY GISELLA', 'HUACA AROCA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1523, 1003904534, 'ARNOLD FABIAN', 'SUAZA ANACONA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1524, 1007383791, 'ALVARO', 'MONTOYA RESTREPO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1525, 1070628302, 'JUAN CARLOS', 'MIRQUE RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1526, 1083906655, 'WERNER FRANCISCO', 'ACOSTA QUIROGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1527, 1117506492, 'EDIER ANDRES', 'ROSO ROBLES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1528, 1117552204, 'JEFFERSON ANDRES', 'CHAPAL BUENO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1529, 1117553470, 'DAVID', 'GAVIRIA ARCE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1530, 11257281, 'JESUS ANTONIO', 'RODRIGUEZ GONZALEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1531, 1143939292, 'CHRISTIAN CAMILO', 'ARROYAVE GAVIRIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1532, 13543534, 'OSCAR JAVIER', 'MARCIALES RUEDA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1533, 17642988, 'RAMIRO', 'MONROY HERMIDA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1534, 17659235, 'ALBER', 'RINTA LUGO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1535, 17684758, 'ANIBAL', 'ESQUIVEL RAMIREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1536, 80154013, 'DAVID UBALDO', 'RAMIREZ MORA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1537, 80387917, 'DANI', 'GARCIA BUITRAGO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1538, 83040176, 'HERBYN', 'BURGOS CUELLAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1539, 93477645, 'JYMI', 'ANDRADE PIMENTEL', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1540, 1006410562, 'JHON EIDER', 'CANTILLO LUGO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1541, 1006511950, 'BRAYAN ALEXIS', 'HERNANDEZ SILVA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1542, 1006512039, 'JUAN DIEGO', 'RIVAS BARRERA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1543, 1006514066, 'LUIS FERNANDO', 'GUTIERREZ GUTIERREZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1544, 1007524995, 'HEBERTH ALFONSO', 'ROMERO LOPEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1545, 1117497812, 'DAVID', 'ARDILA JAMIOY', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1546, 1006417148, 'JHONIER', 'NIETO QUICENO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1547, 1006417223, 'OSCAR DANIEL', 'REYES QUINCHER', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1548, 1026294821, 'YURI ALEJANDRA', 'HURTADO ARANGO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1549, 1060208190, 'JHON ANDRESON', 'ALMARIO VASQUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1550, 1082851585, 'BREINER ALFONSO', 'CHARRIS OTERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1551, 1083924294, 'MARIA ISABEL', 'MONTAÑA VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1552, 1110558394, 'DARCY GISELA', 'ALDANA SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1553, 1115940086, 'SUSNEI', 'NUNCIRA CAICEDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1554, 1115943454, 'DEIBY JASMANNY', 'PALACIO RAMIREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1555, 1115945476, 'DIANA PATRICIA', 'ARTUNDUAGA BERMEO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1556, 1115947443, 'WILBER', 'BARREIRO GAVIRIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1557, 1115949960, 'KAREN ROCIO', 'POSADA RIVAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1558, 1115950029, 'ERLINSON', 'PERDOMO PEREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1559, 1115950534, 'KAREN LIBETH', 'GARCIA RAMIREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1560, 1115950780, 'YESICA', 'TORRES PALOMA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1561, 1116924273, 'ALEJANDRO', 'SANCHEZ PEREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1562, 1117543745, 'NATALIE STEPHANIA', 'GARAVIZ PEREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1563, 1117811601, 'PLACIDO AUGUSTO', 'BARRIOS MEJIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1564, 1117963161, 'ANGIE LORENA', 'CRUZ BARRETO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1565, 30509569, 'ROCIO', 'PEREZ SALINAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1566, 40078408, 'JENNY', 'BAHAMON MUÑETON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1567, 7711138, 'JOSE JOBAN', 'ADAMES RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1568, 1006419425, 'DIEGO', 'CUERVO POLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1569, 1006501181, 'YULISSA', 'TORRES CORTES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1570, 1006502515, 'ARBEY', 'GONZALEZ MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1571, 1006504984, 'YEISON DAVID', 'CEBALLOS SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1572, 1006513279, 'YEFFERSON', 'ALTURO CERQUERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1573, 1006513531, 'ALEJANDRA', 'BENJUMEA PINTO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1574, 1006596861, 'YURLEDY', 'ACOSTA TOTENA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1575, 1006813040, 'EDWIN', 'AROCA PARRA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1576, 1007394362, 'ALEXISFABIAN', 'SILVA POLANIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1577, 1007442860, 'YUDERLY', 'PEREZ DEVIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1578, 1007761181, 'YUBER ULISES', 'PASTRANA MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1579, 1089482268, 'SIGIFREDO', 'VASQUEZ MORA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1580, 1117486995, 'ISABEL', 'PERDOMO ROJAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1581, 1117535298, 'ANGIE KARIME', 'ZUÑIGA BARRIOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1582, 1117542331, 'JEFFERSON ANDRES', 'AROCA HENAO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1583, 1117542715, 'CESAR ADRIAN', 'ALVARAN MORENO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1584, 1117544826, 'BRAHIAM STIBENT', 'CHILITO GUALTERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1585, 1117553499, 'NADIA FERNANDA', 'BERMEO SILVA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1586, 1117553982, 'JUAN DIEGO', 'SANCHEZ MEJIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1587, 1117885967, 'ALEJANDRO', 'CARDONA CORTES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1588, 1119581929, 'NORBERTO', 'CONDA SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1589, 1119585163, 'JOHANA MARCELA', 'DIAZ RIVAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1590, 1214464431, 'JUAN CAMILO', 'LOPEZ SUAREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1591, 3875821, 'CARLOS ANTONIO', 'BALDOVINO ALCENDRA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1592, 1003808343, 'NAIRO STEVEN', 'FAJARDO CALDERON', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1593, 1006417453, 'LUIS DANIEL', 'CABRERA HENAO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1594, 1006507335, 'YEISON', 'SAENZ CASTRO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1595, 1006509386, 'KAREN DAYANNA', 'CALDERON PORTILLA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1596, 1006523008, 'DIEGO ALEJANDRO', 'TOVAR REYES', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1597, 1006531040, 'DERLY MARGARITA', 'BACCA LARA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1598, 1006538080, 'JULIAN', 'TOVAR PULECIO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1599, 1010131147, 'BRAYAN STIVEN', 'BONILLA CORDOBA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1600, 1116202116, 'YULI ANDREA', 'ROMERO RAMIREZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1601, 1193130786, 'SEBASTIAN STEVENS', 'GUERRERO MONTEALEGRE', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1602, 1006410168, 'AZUCENA', 'DUQUE RIVERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1603, 1006419875, 'ADRIANA', 'MORENO PARRADO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1604, 1006516681, 'GERSON', 'SILVA TORRES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1605, 1006517072, 'ANYELA MARCELA', 'PEREZ ROJAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1606, 1006517861, 'LUZ MILENA', 'REYES MANCHOLA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1607, 1006518252, 'OSCAR JULIAN', 'VILLEGAS GUTIEEREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1608, 1006518657, 'HECTOR JULIAN', 'OYOLA MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1609, 1006519874, 'JAIME LISANDER', 'CHAVARRO FALLA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1610, 1007383823, 'DERLY JOHANA', 'FERLA SILVA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1611, 1079173811, 'GLADYS', 'ULTEGON SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1612, 1117808332, 'TANIA MILENA', 'PARRA CASTRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1613, 1117813504, 'YOLANDA', 'NARVAEZ LOZADA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1614, 1117839338, 'KELLY YOHANA', 'BARON PRADA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1615, 1117839444, 'ANDRES FELIPE', 'ORTIZ VALLEJO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1616, 1000520088, 'KENER ESIVER', 'CARDENAS GUEPENDO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1617, 1006509206, 'JOSE MANUEL', 'TOVAR CASTAÑO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1618, 1006528585, 'TATIANA LIZETH', 'FERLA SILVA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1619, 1010091106, 'KELLY JOHANNA', 'CAMARGO CASTAÑEDA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1620, 1117804229, 'YEFFRY', 'MONTENEGRO CORREA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1621, 1117806247, 'KEIDY MACOLY', 'YANGUMA POLANIA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1622, 1133149286, 'OLVEINER', 'BALLESTEROS HERNANDEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1623, 1004063760, 'VIVIAN LORENA', 'ALVAREZ TAPIERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1624, 1006503719, 'KAREN JULIETH', 'FARFAN SCARPETTA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1625, 1006514974, 'KAREN YULIETH', 'SANCHEZ MONJE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1626, 1006515031, 'JHORMAN', 'LARA LONDOÑO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1627, 1006523636, 'YULIANA', 'CERQUERA ORTEGA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1628, 1006813981, 'SELENY', 'SERRATO CARRILLO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1629, 1083918762, 'TATIANA ANDREA', 'GIRALDO CASTRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1630, 1115736180, 'YENNY ESPERANZA', 'ACUÑA ROA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1631, 1117494591, 'JOHANNA', 'ALBA BASTOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1632, 1117501215, 'EDNA YULIETH', 'VARGAS VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1633, 1117512901, 'CINTIA MICHELLY', 'FLOREZ CABRERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1634, 1117523255, 'ANDREA', 'CABRERA CASTRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1635, 1117531550, 'PAULA ANDREA', 'YOSA ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1636, 1117531766, 'ANGELICA ALEJANDRA', 'CLAROS ORTIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1637, 1117542381, 'LIDA MAYERLY', 'MANRIQUE CORDOBA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1638, 1117546078, 'ANGIE DANIELA', 'ARAUJO DIAZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1639, 1117547293, 'GISSELA GEORGINA', 'OME ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1640, 1117548231, 'LINA MARCELA', 'TOVAR GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1641, 1117549360, 'NYDIA YULITZA', 'ESPINOSA BERMEO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1642, 1117550837, 'ANGIE VANESSA', 'ALMARIO CHAUX', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1643, 1117551657, 'YURY TATIANA', 'RUIZ VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1644, 1117554681, 'LIZETH JURANNY', 'AROCA BECERRA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1645, 1117554705, 'ANGELA YULIETH', 'ANGULO VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1646, 1117807361, 'NORMA ANGELICA', 'MUÑOZ ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1647, 26429922, 'CATHERINE', 'POSADA MORA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1648, 26632157, 'REINELIA', 'PATIÑO BUITRAGO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1649, 1006483782, 'ADRIANA', 'LOPEZ CABRERA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1650, 1006507740, 'ROSA EMILIA', 'NAVEROS VANEGAS', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1651, 1115944543, 'ANGIE CAROLINA', 'SALAS RUBIO', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1652, 1117805455, 'JEREMY JULIAN', 'NUÑEZ MORA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1653, 1006503681, 'LAURA ALEJANDRA', 'SANCHEZ ALAVREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1654, 1006504201, 'DAYANA YULIETH', 'ZUÑIGA SANTACRUZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1655, 1007851623, 'DUVAN STIVEN', 'RODRIGUEZ VARELA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1656, 1097396352, 'JEFERSON', 'SANCHEZ OLMOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1657, 1105677151, 'DIANA PAOLA', 'CORTES RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1658, 1117498059, 'NOLBER', 'JOVEN ARAUJO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1659, 1117506456, 'YAZMIN', 'PINCHAO LOPEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1660, 1117551012, 'DIEGO FERNANDO', 'SANCHEZ OLMOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1661, 1117554142, 'CARLOS ANDRES', 'VERA SALAMANCA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1662, 1117962818, 'FREDY ALEJANDRO', 'MEDINA SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1663, 1147686841, 'JESSICA LORENA', 'GONZALES MONTEALEGRE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1664, 40076169, 'FIDELIA', 'BARRETO PERILLA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1665, 80926014, 'HERNAN ALBERTO', 'CABRERA CORREA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1666, 1006524021, 'LAURA CRISTINA', 'CRIOLLO ARTUNDUAGA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1667, 1006538764, 'PAULA MAYERLY', 'MARIN YANDI', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1668, 1116917453, 'MARYOLI', 'GARCIA GARCIA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1669, 1193228901, 'YURY CAMILA', 'FAJARDO ECHEVERRI', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1670, 1006550128, 'YAN CARLOS', 'BURGOS MUTUMBAJOY', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1671, 1006550485, 'YAQUELINE', 'HUACA MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1672, 1026584591, 'LERYI LORENA', 'DIAZ ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1673, 1060208196, 'FREYNER', 'MUTUMBAJOY HUACA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1674, 1114839471, 'YENSI NATALIA', 'DE JESUS GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1675, 1117263463, 'LUZ DELLY', 'TORRES JOJOA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1676, 1117485553, 'JAYVER MAURICIO', 'JACANAMEJOY ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1677, 1118471221, 'FLORIDELLIN', 'VIUCHE GUEVARA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1678, 1118472162, 'FABER', 'HUACA MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1679, 1118472445, 'SANDRA MINEYI', 'RIVERA SALAZAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1680, 1124849056, 'ALEXANDER', 'BECERRA JACANAMEJOY', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1681, 1124852385, 'LUZ DARY', 'TISOY HURTADO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1682, 1147687127, 'BENJAMIN', 'GARCIA FIGUEROA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1683, 1193550205, 'YURLEIDY', 'GONZALEZ SALAZAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1684, 17676478, 'CARLOS ENRRIQUE', 'CORTEZ JAMIOY', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1685, 26482893, 'LIDIA YIVITH', 'DORADO MOTTA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1686, 40601819, 'SANDRA MILENA', 'MARIN MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1687, 40779332, 'DORIS', 'JACANAMIJOY MUTUMBAJOY', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1688, 76150260, 'EDWIN ALEXANDER', 'RODRIGUES ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1689, 265719, 'MARIA FLORA', 'MACAS ZHIGUE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1690, 1006510791, 'LUISA YASSIRA', 'DIOSA IBAÑEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1691, 1118468022, 'LUIS DAVID', 'BECERRA MAVISOY', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1692, 1118468916, 'PAULA YISNEY', 'BECERRA ZALASAR', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1693, 1130384028, 'MARIA BELEN', 'JACANAMIJOY MUTUMBAJOY', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1694, 1117515004, 'CRISTIAN MAURICIO', 'LAVAO CARDONA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1695, 11811731, 'JAMEL BAY', 'PEREA MOSQUERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1696, 16188043, 'EDWIN RICAURTE', 'ARTUNDUAGA PEÑA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1697, 17684298, 'LUIS ANGEL', 'ARANDA RENDON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1698, 17705481, 'NILSON', 'CLAROS OVIEDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1699, 17783156, 'JESUS EDILBERTO', 'ESPINOSA PEREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1700, 18146241, 'ANDRES LEONARDO', 'CORRAL SIMANCA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1701, 5994893, 'ISAAC', 'SOTO GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1702, 7707102, 'DIEGO FERNELY', 'RAMOS PERDOMO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1703, 80034416, 'JOSE JAVIER', 'FLOREZ RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1704, 80059123, 'LUIS CARLOS', 'MARTINEZ ALVAREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1705, 80170170, 'GABRIEL FRANCISCO', 'AGUILAR VALENZUELA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1706, 82393101, 'CARLOS ARTURO', 'MANCILLA TOVAR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1707, 94442888, 'HAMILTHON', 'BAÑOL MOLINA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1708, 94463004, 'GERMAN ALBERTO', 'VALDIVIA TORRES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1709, 96333084, 'JOSE RIGELMER', 'GONZALES MURCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1710, 10290264, 'DELIO GENTIL', 'ROBLEDO HOYOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1711, 14395175, 'ARNOVIS', 'LOPEZ CAVIEDES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1712, 14836456, 'CARLOS ALBERTO', 'BOTINA MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1713, 15923600, 'HELIO FABER', 'DIAZ ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1714, 16185313, 'BLADIMIR', 'MURCIA HOME', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1715, 16185781, 'HUGO ALIRIO', 'VACA GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1716, 16186793, 'JOSE ALEJO', 'ESPAÑA ALAPE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1717, 16187966, 'JHON ELVER', 'CUCHIMBA ACHIPIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1718, 16188014, 'GUILLERMO AUGUSTO', 'VELASQUEZ VALENCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1719, 16188172, 'JAIDER', 'LOSADA SOLORZANO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1720, 16188571, 'NELSON', 'ROJAS ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1721, 16189459, 'WILSON', 'CORONADO CHITO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1722, 17616171, 'CARLOS', 'MUÑOZ ROMERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1723, 17655736, 'FELIX MARIA', 'MENDEZ MEDINA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1724, 17656519, 'JENRRY', 'MENDEZ HERNANDEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1725, 17658477, 'ANIBAL', 'CARDOZO SILVA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1726, 17659133, 'JOSE DUBAN', 'PORTELA GONZALEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1727, 17676281, 'ALDEMAR', 'CASTRO MOTA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1728, 17773942, 'OSCAR JAVIER', 'MIRANDA MOLINA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1729, 18189407, 'HECTOR RUBEN', 'BASTIDAS MONTERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1730, 3087242, 'OMAR', 'MORENO RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1731, 6567409, 'ASCENCIO', 'CUELLAR CACHAYA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1732, 6802036, 'ROBINSON', 'GUZMAN BONILLA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1733, 6802218, 'LINO ALEJANDRO', 'VALDERRAMA ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1734, 6803076, 'JAIRO', 'VARGAS SANCHEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1735, 70435644, 'JOSE ANIBAL', 'HIGUITA DUARTE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1736, 79220752, 'JHON JAIRO', 'SANDOVAL CASADIEGO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1737, 80449187, 'JESUS ORLANDO', 'TORRES ANDRADE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1738, 82395309, 'VICTOR MANUEL', 'OSORIO ROJO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1739, 94421580, 'ISRAEL', 'OCHOA NAVIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1740, 96355117, 'JOSE FERLEY', 'ACEVEDO ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1741, 1006505032, 'CLAUDIA MILENA', 'FARFAN ESCARPETA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1742, 1070706063, 'YAMILE', 'URUEÑA MONTIEL', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1743, 1117485964, 'TANIA EDITH', 'VALDERRAMA HOYOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1744, 1117487728, 'LINA VANESSA', 'MEDINA GARCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1745, 1117505630, 'RONAL ALIRIO', 'ROMERO GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1746, 1117507666, 'DEYMER FRANCISCO', 'CALDERON GARCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1747, 1117510786, 'JORGE ARMANDO', 'RAMIREZ TORRES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1748, 1117526612, 'YESSICA BANESSA', 'MUÑOZ ANDRADE', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1749, 1117543095, 'DORIS YULIED', 'REINA GUARACA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1750, 1118024127, 'YAQUELINE', 'BUITRAGO FONSECA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1751, 1119580788, 'MARTHA', 'CASALLAS GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1752, 1119581845, 'LEDHER CELIANO', 'MUÑOZ RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1753, 1119583165, 'QUERLY ANDREA', 'PATIÑO CHAVARRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1754, 1119583257, 'YULIANA ALEXANDRA', 'BELTRAN GARCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1755, 1119584946, 'RODI', 'BUITRAGO DIAZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1756, 1119585718, 'MARIA CIELO', 'HENAO CARRANZA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1757, 26641201, 'MARIA FANNY', 'GARCIA SILVA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1758, 30507904, 'YEZMIN', 'IPUZ AVILA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1759, 30509063, 'NUBYA', 'CASALLAS GUTIERREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1760, 30509189, 'NANCY', 'ZAPATA LOPEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1761, 40085711, 'MARIA AURORA', 'GUZMAN ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1762, 40601400, 'MARGELY', 'CANO ANTURI', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1763, 40614008, 'JOHANNA', 'GONZALEZ IPUS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1764, 40614494, 'MAYADIRA', 'MUÑOZ MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1765, 40740291, 'ARGENIS', 'URBINA MORALES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1766, 40740756, 'MARTHA CECILIA', 'DIAZ RAMIREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1767, 40768897, 'MIRIAM', 'RODRIGUEZ MURIEL', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1768, 40777069, 'DOLLY', 'TORRES SILVA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1769, 40781817, 'MARIA BERTILDA', 'MARIN LONDOÑO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1770, 4933803, 'JOSE MANUEL', 'BELTRAN MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1771, 65799154, 'MARIA NIRZA', 'PADILLA ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1772, 96332169, 'JOANY', 'RODRIGUEZ AVILA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1773, 96352262, 'ALADINO', 'BELTRAN PEREZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1774, 1006516879, 'ROBINSON FERNANDO', 'TEJADA CUASPA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1775, 1006517073, 'ADOLFO', 'LOPEZ LOPEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1776, 1022421907, 'DANIELA DEL PILAR', 'TORRES CUBILLOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1777, 1070593204, 'ALEXEI', 'RODRIGUEZ MONTENEGRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1778, 1075290946, 'JAVIER ALEXIS', 'MONJE RODRIGUEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1779, 1115949833, 'YISELA', 'PIMENTEL GARCIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1780, 1115953984, 'LUZ ADRIANA', 'ROJAS QUEZADA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1781, 1116918281, 'ALBENIS', 'QUINTERO SEGURA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1782, 1116923510, 'PABLO ENRIQUE', 'QUINTERO SEGURA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1783, 1117535530, 'JOSE OMAR', 'MARIN VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1784, 1117805091, 'LUZ MERY', 'CRUZ RIVERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1785, 1117806038, 'YILBER', 'GUIETO RIVERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1786, 1117838933, 'JOSE ALEJANDRO', 'OLAYA BUSTOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1787, 1192731323, 'GERALDY', 'VARGAS PENAGOS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1788, 1192746441, 'BELDY JOHANA', 'BUSTOS LIMA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1789, 12116068, 'AYMER', 'MORALES ONATRA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1790, 17774601, 'JHON WILBER', 'TOBAR ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1791, 1004492361, 'MAIRA YULIANA', 'GONGORA CRUZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1792, 1006415710, 'JHOAN DAVID', 'RODRIGUEZ HERNANDEZ', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1793, 1116913578, 'YESICA TATIANA', 'NUNCIRA RIVERA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1794, 1117805793, 'YEIMY', 'MEDINA SARRIA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1795, 1117812475, 'MARIA DANIELA', 'CAMPO BOLIVAR', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1796, 1117814813, 'CARLOS ANDRES', 'LUGO SARRIA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1797, 1118364770, 'DANIELA', 'TRUJILLO SARRIA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1798, 1193396813, 'DAYRA YULIANA', 'TRUJILLO SARRIA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1799, 1193576979, 'ISLENA VALENTINA', 'PANTEVEZ MORENA', 'Activo', 1, 2);
INSERT INTO `tblpersona` VALUES (1800, 1003813492, 'VICTOR ANDRES', 'MENDEZ ANACONA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1801, 1006460224, 'FABIAN', 'MORALES RIVERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1802, 1006502747, 'CAMILO ANDRES', 'TRUJILLO MUÑOZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1803, 1006502839, 'JAMY ALEXANDER', 'TOLE MORALES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1804, 1006513320, 'MARIA CAMILA', 'HORTA CHAMORRO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1805, 1006513587, 'KEVIN RODOLFO', 'MOSQUERA CERQUERA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1806, 1006513870, 'NATHALIA', 'ORDOÑEZ YAGUARA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1807, 1006513950, 'YEIDY ALEJANDRA', 'GONALEZ BERRIO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1808, 1006515361, 'SERGIO ADRIAN', 'AGREDA GOMEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1809, 1006538229, 'DAYANNA ALEXANDRA', 'AMEZQUITA TANIMUCA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1810, 1007320451, 'ANGIE MILED', 'OSORIO OVIEDO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1811, 1007359260, 'FRANCISCO JAVIER', 'TOVAR VILLARREAL', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1812, 1007688401, 'DAINYS LIZETH', 'ZAPATA ORTIZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1813, 1010148896, 'NELSON DANIEL', 'ANDRADE OROZCO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1814, 1023905678, 'JENNY PAOLA', 'FLOREZ FORERO', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1815, 1075232140, 'CINDY TATIANA', 'TELAG AUDOR', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1816, 1117525207, 'JHON JAIRO', 'MORENO DUSSAN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1817, 1117804419, 'ALIETH XILENA', 'CERTUCHE SANABRIA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1818, 1118073114, 'INDIRA', 'PARRA SON', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1819, 1118470266, 'DIANA PATRICIA', 'MONTOYA VILLA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1820, 1119210061, 'DIANA PATRICIA', 'CUBILLOS CORTEZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1821, 1119585090, 'LORENA', 'TOVAR MOLINA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1822, 1119585091, 'YOHANA', 'TOVAR MOLINA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1823, 1193209782, 'MARTHA JOHANA', 'RODRIGUEZ DIAZ', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1824, 40783502, 'DAMARYS ENAYS', 'TORRES VARGAS', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1825, 1003951491, 'INGRITH VANESSA', 'MORENO MARIN', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1826, 1006508657, 'JULIAN ANDRES', 'PATIÑO CAVIEDES', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1827, 1006510419, 'JEYSON', 'ANTURY MEDINA', 'Activo', 1, 1);
INSERT INTO `tblpersona` VALUES (1828, 1006527150, 'DARWIN ISAAC', 'PEREZ DIAZ', 'Activo', 1, 1);

-- ----------------------------
-- Table structure for tblprocesovotacion
-- ----------------------------
DROP TABLE IF EXISTS `tblprocesovotacion`;
CREATE TABLE `tblprocesovotacion`  (
  `ProVotCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProVotInicio` date NOT NULL,
  `ProVotFin` date NOT NULL,
  `ProVotRegEstInicio` date NOT NULL,
  `ProVotRegEstFin` date NOT NULL,
  `ProVotValAspInicio` date NOT NULL,
  `ProVotValAspFin` date NOT NULL,
  `ProVotRegPropInicio` date NOT NULL,
  `ProVotRegPropFin` date NOT NULL,
  `ProVotFechaJornada` date NOT NULL,
  `ProVotEstado` enum('Activo','Inactivo','Finalizado') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ProVotAdmCodigo` bigint(20) NOT NULL,
  PRIMARY KEY (`ProVotCodigo`) USING BTREE,
  INDEX `Proceso_fk_Administrador`(`ProVotAdmCodigo`) USING BTREE,
  CONSTRAINT `Proceso_fk_Administrador` FOREIGN KEY (`ProVotAdmCodigo`) REFERENCES `tbladministrador` (`AdmCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tblprogramaformacion
-- ----------------------------
DROP TABLE IF EXISTS `tblprogramaformacion`;
CREATE TABLE `tblprogramaformacion`  (
  `ProforCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProforNombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ProforEstado` enum('Activo','Inactivo') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ProforCodigo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tblprogramaformacion
-- ----------------------------
INSERT INTO `tblprogramaformacion` VALUES (1, 'BIENESTAR AL APRENDIZ', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (2, 'MANTENIMIENTO DE EQUIPOS DE COMPUTO, DISENO E INSTALACION DE CABLEADO ESTRUCTURADO', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (3, 'GESTION DE REDES DE DATOS', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (4, 'ANIMACION 3D', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (5, 'SISTEMAS', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (6, 'ANALISIS Y DESARROLLO DE SISTEMAS DE INFORMACION', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (7, 'CONTABILIDAD Y FINANZAS', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (8, 'GESTION ADMINISTRATIVA', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (9, 'GESTION DOCUMENTAL', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (10, 'CONTABILIZACION DE OPERACIONES COMERCIALES Y FINANCIERAS', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (11, 'ASISTENCIA EN ORGANIZACION DE ARCHIVOS', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (12, 'ASISTENCIA ADMINISTRATIVA', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (13, 'GESTION TALENTO HUMANO', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (14, 'GESTION EMPRESARIAL', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (15, 'ASEORIA COMERCIIAL Y OPERACIONES DE ENTIDADES FINANCIERAS', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (16, 'INFORMACION Y SERVICIO AL CLIENTE', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (17, 'DISENO Y DESARROLLO DE MERCADOS', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (18, 'VENTA DE PRODUCTOS Y SERVICIO', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (19, 'OPERACIONES DE CAJA Y SERVICIOS EN ALMACENES DE CADENA', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (20, 'ENFERMERIA', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (21, 'APOYO ADMINISTRATIVO EN SALUD', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (22, 'SERVICIOS FARMACEUTICOS', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (23, 'ATENCION DE INCENDIOS Y EMERGENCIAS', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (24, 'RECREACION COMUNITARIA', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (25, 'ENTRENAMIENTO DEPORTIVO', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (26, 'PATRONAJE INDUSTRIAL DE PRENDAS DE VESTIR', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (27, 'EJECUCION MUSICAL CON INSTRUMENTOS FUNCIONALES', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (28, 'EJECUCION DE LA DANZA', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (29, 'PRODUCCION GANADERA', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (30, 'GESTION DE EMPRESAS AGROPECUARIAS', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (31, 'PRODUCCION PECUARIA', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (32, 'PROCESAMIENTO DE LACTEOS', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (33, 'CONTROL AMBIENTAL', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (34, 'MANEJO AMBIENTAL', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (35, 'CULTIVOS AGRICOLAS', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (36, 'PANIFICACION', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (37, 'CONSTRUCCION Y MONTAJE DE INSTALACIONES ELECTRICAS', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (38, 'INSTALACIONES ELECTRICAS RESIDENCIALES', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (39, 'FABRICACION DE MUEBLES CONTEMPORANEOS Y MODULARES (INPEC )', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (40, 'MANTENIMIENTO DE LAS MOTOCICLETAS', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (41, 'MANTENIMIENTO DE MOTORES DIESEL', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (42, 'GUIANZA TURISTICA', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (43, 'GUIANZA TURISTICA 2', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (44, 'OPERACION TURISTICA LOCAL', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (45, 'COCINA', 'Activo');
INSERT INTO `tblprogramaformacion` VALUES (46, 'DISENO Y DESARROLLO DE INVESTIGACIONES DE MERCADO', 'Activo');

-- ----------------------------
-- Table structure for tblpropuesta
-- ----------------------------
DROP TABLE IF EXISTS `tblpropuesta`;
CREATE TABLE `tblpropuesta`  (
  `ProCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProNombre` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ProDescripcion` varchar(21000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ProEstado` enum('Activo','Inactivo') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ProCanCodigo` bigint(20) NOT NULL,
  PRIMARY KEY (`ProCodigo`) USING BTREE,
  INDEX `Propuesta_fk_Candidato`(`ProCanCodigo`) USING BTREE,
  CONSTRAINT `Propuesta_fk_Candidato` FOREIGN KEY (`ProCanCodigo`) REFERENCES `tblcandidato` (`CanCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tblrol
-- ----------------------------
DROP TABLE IF EXISTS `tblrol`;
CREATE TABLE `tblrol`  (
  `RolCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `RolNombre` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RolEstado` enum('Activo','Inactivo') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`RolCodigo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tblrol
-- ----------------------------
INSERT INTO `tblrol` VALUES (1, 'Administrador', 'Activo');
INSERT INTO `tblrol` VALUES (2, 'Estudiante', 'Activo');
INSERT INTO `tblrol` VALUES (3, 'Aspirante', 'Activo');
INSERT INTO `tblrol` VALUES (4, 'Candidato', 'Activo');
INSERT INTO `tblrol` VALUES (5, 'Invitado', 'Activo');

-- ----------------------------
-- Table structure for tblrolusuario
-- ----------------------------
DROP TABLE IF EXISTS `tblrolusuario`;
CREATE TABLE `tblrolusuario`  (
  `RolUsuCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `RolUsuRolCodigo` bigint(20) NOT NULL,
  `RolUsuUsuCodigo` bigint(20) NOT NULL,
  `RolUsuRolEstado` enum('Activo','Inactivo') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`RolUsuCodigo`) USING BTREE,
  INDEX `Usuario_fk_Rol1`(`RolUsuRolCodigo`) USING BTREE,
  INDEX `Usuario_fk_Rol2`(`RolUsuUsuCodigo`) USING BTREE,
  CONSTRAINT `Usuario_fk_Rol1` FOREIGN KEY (`RolUsuRolCodigo`) REFERENCES `tblrol` (`RolCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Usuario_fk_Rol2` FOREIGN KEY (`RolUsuUsuCodigo`) REFERENCES `tblusuario` (`UsuCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tblrolusuario
-- ----------------------------
INSERT INTO `tblrolusuario` VALUES (1, 2, 1, 'Activo');
INSERT INTO `tblrolusuario` VALUES (2, 1, 1, 'Activo');

-- ----------------------------
-- Table structure for tblsexo
-- ----------------------------
DROP TABLE IF EXISTS `tblsexo`;
CREATE TABLE `tblsexo`  (
  `SexCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `SexNombre` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SexEstado` enum('Activo','Inactivo') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SexCodigo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tblsexo
-- ----------------------------
INSERT INTO `tblsexo` VALUES (1, 'Masculino', 'Activo');
INSERT INTO `tblsexo` VALUES (2, 'Femenino', 'Activo');

-- ----------------------------
-- Table structure for tblsubvistas
-- ----------------------------
DROP TABLE IF EXISTS `tblsubvistas`;
CREATE TABLE `tblsubvistas`  (
  `SubCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `SubUrl` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SubTitulo` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SubEstado` enum('Activo','Inactivo') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SubVisCodigo` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`SubCodigo`) USING BTREE,
  INDEX `vista_fk_subvista`(`SubVisCodigo`) USING BTREE,
  CONSTRAINT `vista_fk_subvista` FOREIGN KEY (`SubVisCodigo`) REFERENCES `tblvistas` (`VisCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbltipodocumento
-- ----------------------------
DROP TABLE IF EXISTS `tbltipodocumento`;
CREATE TABLE `tbltipodocumento`  (
  `TipdocCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `TipdocNombre` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TipdocEstado` enum('Activo','Inactivo') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`TipdocCodigo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbltipodocumento
-- ----------------------------
INSERT INTO `tbltipodocumento` VALUES (1, 'Cedula de Ciudadania', 'Activo');
INSERT INTO `tbltipodocumento` VALUES (2, 'Tarjeta de identidad', 'Activo');

-- ----------------------------
-- Table structure for tblusuario
-- ----------------------------
DROP TABLE IF EXISTS `tblusuario`;
CREATE TABLE `tblusuario`  (
  `UsuCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `UsuNombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `UsuContraseña` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `UsuEstado` enum('Activo','Inactivo') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `UsuEstCodigo` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`UsuCodigo`) USING BTREE,
  INDEX `UsuEstCodigo`(`UsuEstCodigo`) USING BTREE,
  CONSTRAINT `UsuEstCodigo` FOREIGN KEY (`UsuEstCodigo`) REFERENCES `tblestudiante` (`EstCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tblusuario
-- ----------------------------
INSERT INTO `tblusuario` VALUES (1, 'carlos', '81dc9bdb52d04dc20036dbd8313ed055', 'Activo', 1);

-- ----------------------------
-- Table structure for tblvistas
-- ----------------------------
DROP TABLE IF EXISTS `tblvistas`;
CREATE TABLE `tblvistas`  (
  `VisCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `VisUrl` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VisIcono` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VisTitulo` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VisEstado` enum('Activo','Inactivo') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`VisCodigo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tblvistasroles
-- ----------------------------
DROP TABLE IF EXISTS `tblvistasroles`;
CREATE TABLE `tblvistasroles`  (
  `VisRolEstado` enum('Activo','Inactivo') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VisRolSubCodigo` bigint(20) NOT NULL,
  `VisRolRolCodigo` bigint(20) NOT NULL,
  INDEX `rol_fk_vistaroles`(`VisRolRolCodigo`) USING BTREE,
  INDEX `subvista_fk_vistaroles`(`VisRolSubCodigo`) USING BTREE,
  CONSTRAINT `rol_fk_vistaroles` FOREIGN KEY (`VisRolRolCodigo`) REFERENCES `tblrol` (`RolCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `subvista_fk_vistaroles` FOREIGN KEY (`VisRolSubCodigo`) REFERENCES `tblsubvistas` (`SubCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tblvotaciongeneral
-- ----------------------------
DROP TABLE IF EXISTS `tblvotaciongeneral`;
CREATE TABLE `tblvotaciongeneral`  (
  `VotGenCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `VotGenPeriodo` date NOT NULL,
  `VotGenVotBlanco` int(11) NULL DEFAULT NULL,
  `VotGenTotal` int(11) NULL DEFAULT NULL,
  `VotGenEstado` enum('Activo','Inactivo') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VotGenProVotCodigo` bigint(20) NOT NULL,
  PRIMARY KEY (`VotGenCodigo`) USING BTREE,
  INDEX `votgen_fk_procvot`(`VotGenProVotCodigo`) USING BTREE,
  CONSTRAINT `votgen_fk_procvot` FOREIGN KEY (`VotGenProVotCodigo`) REFERENCES `tblprocesovotacion` (`ProVotCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tblvoto
-- ----------------------------
DROP TABLE IF EXISTS `tblvoto`;
CREATE TABLE `tblvoto`  (
  `VotCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `VotFecha` date NOT NULL,
  `VotEstado` enum('Activo','Inactivo') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VotEstCodigo` bigint(20) NOT NULL,
  `VotCanCodigo` bigint(20) NOT NULL,
  PRIMARY KEY (`VotCodigo`) USING BTREE,
  INDEX `Cand_fk_Voto`(`VotCanCodigo`) USING BTREE,
  INDEX `Est_fk_Voto`(`VotEstCodigo`) USING BTREE,
  CONSTRAINT `Cand_fk_Voto` FOREIGN KEY (`VotCanCodigo`) REFERENCES `tblcandidato` (`CanCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Est_fk_Voto` FOREIGN KEY (`VotEstCodigo`) REFERENCES `tblestudiante` (`EstCodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Procedure structure for Actualizar_Estudiante_persona
-- ----------------------------
DROP PROCEDURE IF EXISTS `Actualizar_Estudiante_persona`;
delimiter ;;
CREATE PROCEDURE `Actualizar_Estudiante_persona`(in codigo int,
in documento int, 
in nombre varchar(100),
in apellido varchar(100),
in Ficha int,
in Jornada VARCHAR(20),
in programa VARCHAR(50),
in sexo VARCHAR(20),
in tip_doc VARCHAR(20),
in estado VARCHAR(20))
BEGIN


DECLARE llaveSexo INT;
DECLARE llaveTipo_doc INT;
DECLARE llaveJornada INT;
DECLARE llavePrograma INT;
DECLARE llavePer INT;
SET llaveSexo =(SELECT SexCodigo FROM tblsexo WHERE SexNombre = sexo);
SET llaveTipo_doc =(SELECT TipdocCodigo FROM tbltipodocumento WHERE TipdocNombre = tip_doc);
SET llaveJornada =(SELECT JorCodigo FROM tbljornada WHERE JorNombre = Jornada);
SET llavePrograma =(SELECT ProforCodigo FROM tblprogramaformacion WHERE ProforNombre = programa);

UPDATE tblpersona SET PerNombre=nombre,PerApellido=apellido,PerDocumento=documento,PerSexCodigo=llaveSexo,PerTipdocCodigo=llaveTipo_doc WHERE PerCodigo=codigo;
UPDATE tblestudiante SET EstFicha=Ficha,EstJorCodigo=llaveJornada,EstProforCodigo=llavePrograma, EstEstado=estado WHERE EstPerCodigo=codigo;
End
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Agrear_Estudiante_persona
-- ----------------------------
DROP PROCEDURE IF EXISTS `Agrear_Estudiante_persona`;
delimiter ;;
CREATE PROCEDURE `Agrear_Estudiante_persona`(in documento int, 
in nombre varchar(20),
in apellido varchar(20),
in Ficha int,
in Jornada VARCHAR(20),
in programa VARCHAR(50),
in sexo VARCHAR(20),
in tip_doc VARCHAR(20))
BEGIN

DECLARE llavePersona INT;
DECLARE llaveSexo INT;
DECLARE llaveTipo_doc INT;
DECLARE llaveJornada INT;
DECLARE llavePrograma INT;
SET llaveSexo =(SELECT SexCodigo FROM tblsexo WHERE SexNombre = sexo);
SET llaveTipo_doc =(SELECT TipdocCodigo FROM tbltipodocumento WHERE TipdocNombre = tip_doc);
SET llaveJornada =(SELECT JorCodigo FROM tbljornada WHERE JorNombre = Jornada);
SET llavePrograma =(SELECT ProforCodigo FROM tblprogramaformacion WHERE ProforNombre = programa);

INSERT INTO tblpersona VALUES (null,documento,nombre,apellido,'Activo',llaveSexo,llaveTipo_doc);
SET llavePersona =(SELECT PerCodigo FROM tblpersona WHERE PerDocumento=documento);
INSERT INTO tblestudiante VALUES (null,Ficha,'Activo',llavePersona,llaveJornada,llavePrograma,null);
End
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Agregar_aspirante
-- ----------------------------
DROP PROCEDURE IF EXISTS `Agregar_aspirante`;
delimiter ;;
CREATE PROCEDURE `Agregar_aspirante`(IN `Documento` VARCHAR ( 20 ))
BEGIN
DECLARE Pro_v INT DEFAULT(SELECT ProVotCodigo FROM tblprocesovotacion WHERE NOW() BETWEEN ProVotInicio AND ProVotFin AND ProVotEstado='Activo' AND CURRENT_DATE() BETWEEN ProVotRegEstInicio AND ProVotRegEstFin);

IF(Pro_v IS NOT NULL) THEN
SELECT @llaveest:= EstCodigo FROM tblestudiante WHERE EstPerCodigo=`Documento`;
INSERT into tblaspirante (AspEstado,AspEstCodigo) VALUES('Activo',@llaveest);
SELECT @llaveasp:= AspCodigo FROM tblaspirante WHERE AspEstCodigo= @llaveest;
INSERT INTO tblinscripcion (InsFecha,InsEstado,InsProVotCodigo,InsAspCodigo) VALUES (CURRENT_DATE(),'Activo',Pro_v,@llaveAsp);
SELECT @llaveusuario:= UsuCodigo FROM tblusuario WHERE UsuEstCodigo= @llaveest;
INSERT INTO tblrolusuario VALUES(null,'3',@llaveusuario,'Activo');

END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Agregar_Proceso
-- ----------------------------
DROP PROCEDURE IF EXISTS `Agregar_Proceso`;
delimiter ;;
CREATE PROCEDURE `Agregar_Proceso`(`Inicio` DATE,
  `Fin` DATE,
  `ProVotRegEstInicio`DATE,
  `ProVotRegEstFin` DATE,
  `ProVotValAspInicio` DATE,
  `ProVotValAspFin` DATE,
  `ProVotRegPropInicio`DATE,
  `ProVotRegPropFin`DATE,
  `ProVotFechaJornada`DATE,
  `codigoPer` INT)
BEGIN
  DECLARE llave1 INT ;
  DECLARE cod_admin INT;
  DECLARE existe INT; 
  SET existe=(SELECT COUNT(ProVotCodigo) FROM tblprocesovotacion WHERE ProVotInicio = `Inicio` OR ProVotFin = `Fin`);
  
  
  IF(existe = 0)THEN
    SET cod_admin=(SELECT AdmCodigo FROM tbladministrador INNER JOIN tblpersona ON ( AdmPerCodigo = PerCodigo ) WHERE PerCodigo = codigoPer);
    INSERT INTO tblprocesovotacion VALUES(null, `Inicio`,`Fin`,`ProVotRegEstInicio`,`ProVotRegEstFin`,  `ProVotValAspInicio`,`ProVotValAspFin`,`ProVotRegPropInicio`,`ProVotRegPropFin`,`ProVotFechaJornada`,'Activo',cod_admin);
    SET llave1=(SELECT ProVotCodigo FROM tblprocesovotacion WHERE ProVotInicio=`Inicio` and ProVotFin=`Fin`);
    INSERT INTO tblvotaciongeneral VALUES (null,`ProVotFechaJornada`,0,0,'Activo',llave1);
  ELSE
    SELECT 'Ya existe un proceso de votacion con esa fecha';
  END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for agregar_propuestas
-- ----------------------------
DROP PROCEDURE IF EXISTS `agregar_propuestas`;
delimiter ;;
CREATE PROCEDURE `agregar_propuestas`(IN codigo INT, 
IN nom_propuestas VARCHAR(15),
IN propuestas VARCHAR(21000))
BEGIN 

DECLARE llaveCan INT;
SET llaveCan = (SELECT CanCodigo FROM tblcandidato INNER JOIN tblestudiante ON tblcandidato.CanEstCodigo = tblestudiante.EstCodigo INNER JOIN tblpersona ON tblestudiante.EstPerCodigo = tblpersona.PerCodigo WHERE PerCodigo = codigo);

INSERT INTO tblpropuesta VALUES(null,nom_propuestas,propuestas,'Activo',llaveCan);

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for crear_usuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `crear_usuario`;
delimiter ;;
CREATE PROCEDURE `crear_usuario`(IN `Usuario` VARCHAR ( 50 ),
  IN `Contraseña` VARCHAR ( 20 ),
  IN `Documento` VARCHAR ( 20 ))
BEGIN

declare existe INT DEFAULT(SELECT count(*) FROM tblpersona WHERE tblpersona.PerDocumento=`Documento`);
declare existe2 INT DEFAULT(SELECT UsuCodigo FROM tblusuario WHERE UsuNombre=`Usuario`);
declare llaveU INT;
IF(existe2 is null)THEN
  IF (existe=1)THEN
    SET llaveU= (SELECT EstCodigo FROM tblestudiante INNER JOIN tblpersona ON tblestudiante.EstPerCodigo = PerCodigo WHERE PerDocumento=Documento);
    SELECT 'Usuario creado satisfacotriamente' as Mensaje;
    INSERT INTO tblusuario (UsuNombre,UsuContraseña,UsuEstado,UsuEstCodigo) VALUES (`Usuario`,MD5( `contraseña` ),'Activo',llaveU);
    SELECT @llaveusuario:= UsuCodigo FROM tblusuario WHERE UsuEstCodigo= llaveU;
    INSERT INTO tblrolusuario VALUES(null,'2',@llaveusuario,'Activo');
  ELSE
    SELECT 'No existe Aprendiz con ese Documento' as Mensaje;
  END IF;
ELSE
  SELECT 'Ya existe una persona con ese usuario' as Mensaje;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Eliminar_Estudiante_persona
-- ----------------------------
DROP PROCEDURE IF EXISTS `Eliminar_Estudiante_persona`;
delimiter ;;
CREATE PROCEDURE `Eliminar_Estudiante_persona`(IN codigoPer INT)
BEGIN
DECLARE llaveEst INT;
DECLARE llaveAsp INT;
SET llaveEst=(SELECT EstCodigo FROM tblestudiante WHERE EstPerCodigo = codigoPer);
SET llaveAsp=(SELECT AspCodigo FROM tblaspirante WHERE AspEstCodigo = llaveEst);
DELETE FROM tblaspirante WHERE AspCodigo = llaveAsp;
DELETE FROM tblestudiante WHERE EstCodigo = llaveEst;
DELETE FROM tblpersona WHERE PerCodigo = codigoPer; 

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Generar_voto
-- ----------------------------
DROP PROCEDURE IF EXISTS `Generar_voto`;
delimiter ;;
CREATE PROCEDURE `Generar_voto`(IN `Cod_cand` INT,
IN `Doc` INT,
IN `Tipo_voto` VARCHAR ( 20 ))
BEGIN
DECLARE Cod_vot_gen INT DEFAULT(SELECT VotGenCodigo FROM tblvotaciongeneral WHERE VotGenPeriodo= CURRENT_DATE());
DECLARE total INT DEFAULT(SELECT VotGenTotal FROM tblvotaciongeneral WHERE VotGenPeriodo= CURRENT_DATE());
DECLARE Blanco INT DEFAULT(SELECT VotGenVotBlanco FROM tblvotaciongeneral WHERE VotGenPeriodo= CURRENT_DATE());
DECLARE estCod INT DEFAULT(SELECT EstCodigo FROM tblestudiante INNER JOIN tblpersona ON (PerCodigo=EstPerCodigo) WHERE PerDocumento = Doc);
DECLARE estado VARCHAR(20) DEFAULT(SELECT EstEstado FROM tblestudiante WHERE EstCodigo = estCod);
IF(estado='Activo')THEN
IF(Cod_vot_gen IS NOT NULL) THEN
INSERT INTO tblvoto VALUES (null, NOW(),'Activo',estCod,Cod_cand);
UPDATE tblestudiante SET EstEstado ='Inactivo' WHERE EstCodigo = estCod;
SET total=total+1;
IF(`Tipo_voto`='Normal')THEN
UPDATE tblvotaciongeneral SET VotGenTotal=total;
ELSE
SET Blanco = Blanco+1;
UPDATE tblvotaciongeneral SET VotGenTotal=total, VotGenVotBlanco=Blanco;
END IF;
END IF;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for logintemp
-- ----------------------------
DROP PROCEDURE IF EXISTS `logintemp`;
delimiter ;;
CREATE PROCEDURE `logintemp`(IN `usuario` VARCHAR ( 320 ),
  IN `contra` VARCHAR ( 300 ))
BEGIN
  SELECT
    p.PerCodigo,
    p.`PerNombre`,
    p.`PerApellido`,
    u.`UsuNombre` 
  FROM
    `tblusuario` AS u
    INNER JOIN `tblestudiante` AS e ON u.`UsuEstCodigo` = e.`EstCodigo` 
    INNER JOIN `tblpersona` AS p ON e.`EstPerCodigo` = p.`PerCodigo`
  WHERE
    ( u.`UsuNombre` = `Usuario` AND u.`UsuContraseña` = MD5( `contra` ) AND u.`UsuEstado` = 'Activo' AND p.`PerEstado` = 'Activo' );

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Validar_candidato
-- ----------------------------
DROP PROCEDURE IF EXISTS `Validar_candidato`;
delimiter ;;
CREATE PROCEDURE `Validar_candidato`(IN `N_Tarjeon` INT,
  IN `Documento` VARCHAR ( 20 ))
BEGIN
DECLARE Pro_v INT; 
DECLARE llave INT; 
DECLARE llaveEst INT; 
DECLARE llaveUsu INT;
DECLARE llaveAsp INT;
SET Pro_v=(SELECT ProVotCodigo FROM tblprocesovotacion WHERE NOW() BETWEEN ProVotInicio AND ProVotFin);
SET llaveEst=(SELECT EstCodigo FROM tblestudiante INNER JOIN tblpersona ON (PerCodigo = EstPerCodigo) WHERE PerDocumento=Documento); 
SET llaveAsp=(SELECT AspCodigo FROM tblaspirante INNER JOIN tblestudiante ON tblaspirante.AspEstCodigo = tblestudiante.EstCodigo INNER JOIN tblpersona ON tblestudiante.EstPerCodigo = tblpersona.PerCodigo WHERE PerDocumento = Documento);
IF(Pro_v IS NOT NULL) THEN

INSERT INTO tblcandidato VALUES(null,`N_Tarjeon`,null,'Activo',Pro_v,llaveEst,null);

SET llaveUsu=(SELECT UsuCodigo FROM tblusuario INNER JOIN tblestudiante ON tblusuario.UsuEstCodigo = tblestudiante.EstCodigo
INNER JOIN tblpersona ON tblestudiante.EstPerCodigo = tblpersona.PerCodigo WHERE PerDocumento=Documento);
INSERT INTO tblrolusuario VALUES(null,'4',llaveUsu,'Activo');
UPDATE tblaspirante SET AspEstado='Inactivo' WHERE AspCodigo = llaveAsp;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for verificarsivoto
-- ----------------------------
DROP PROCEDURE IF EXISTS `verificarsivoto`;
delimiter ;;
CREATE PROCEDURE `verificarsivoto`(in doc int)
BEGIN

DECLARE llavePer INT;
DECLARE Votar VARCHAR(10);
SET llavePer=(SELECT PerCodigo FROM tblpersona WHERE PerDocumento = doc);
SET Votar=(SELECT EstEstado from tblestudiante INNER JOIN tblpersona ON tblestudiante.EstPerCodigo = tblpersona.PerCodigo WHERE EstPerCodigo = llavePer);

IF(Votar IS NULL) THEN
SELECT 'Este documento no coincide con ningun aprendiz registrado' AS mensaje;
END IF;
IF  Votar = 'Activo' THEN
    SELECT 'Puede votar' AS mensaje;
  ELSE
    SELECT 'Este aprendiz ya realizó su respectivo su voto' AS mensaje;
  END IF; 
  
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
