


DROP TABLE IF EXISTS `tbltipodocumento`;
CREATE TABLE `tbltipodocumento`  (
  `TipdocCodigo`  bigint NOT NULL AUTO_INCREMENT,
  `TipdocNombre` varchar(25)  NOT NULL,
  `TipdocEstado` enum('Activo','Inactivo')  NOT NULL,
  PRIMARY KEY (`TipdocCodigo`) USING BTREE
);

DROP TABLE IF EXISTS `tblsexo`;
CREATE TABLE `tblsexo`  (
  `SexCodigo`  bigint NOT NULL AUTO_INCREMENT,
  `SexNombre` varchar(25)  NOT NULL,
  `SexEstado` enum('Activo','Inactivo')  NOT NULL,
  PRIMARY KEY (`SexCodigo`) USING BTREE
);




DROP TABLE IF EXISTS `tblpersona`;
CREATE TABLE `tblpersona`  (
  `PerCodigo`  bigint NOT NULL AUTO_INCREMENT,
  `PerDocumento` decimal(12, 0) NOT NULL,
  `PerNombre` varchar(25)  NOT NULL,
  `PerApellido` varchar(25)  NOT NULL,
  `PerEstado` enum('Activo','Inactivo')  NOT NULL,
  `PerSexCodigo` bigint	 NOT NULL,
  `PerTipdocCodigo` bigint NOT NULL,
  PRIMARY KEY (`PerCodigo`) USING BTREE, 
  CONSTRAINT `Persona_fk_tipdoc` FOREIGN KEY (`PerTipdocCodigo`) REFERENCES `tbltipodocumento` (`TipdocCodigo`), 
  CONSTRAINT `Persona_fk_sexo` FOREIGN KEY (`PerSexCodigo`) REFERENCES `tblsexo` (`SexCodigo`) 
);


DROP TABLE IF EXISTS `tblrol`;
CREATE TABLE `tblrol`  (
  `RolCodigo` bigint NOT NULL AUTO_INCREMENT,
  `RolNombre` varchar(20) NOT NULL,
  `RolEstado` enum('Activo','Inactivo')  NOT NULL,
  PRIMARY KEY (`RolCodigo`) USING BTREE
);

DROP TABLE IF EXISTS `tblusuario`;
CREATE TABLE `tblusuario`  (
  `UsuCodigo` bigint NOT NULL AUTO_INCREMENT,
  `UsuNombre` varchar(100) NOT NULL,
  `UsuContraseña` varchar(60)  NOT NULL,
  `UsuEstado` enum('Activo','Inactivo')  NOT NULL,
  `UsuPerCodigo` bigint NOT NULL,
  `UsuRolCodigo` bigint NOT NULL,
  PRIMARY KEY (`UsuCodigo`) USING BTREE,
  CONSTRAINT `Usuario_fk_Rol` FOREIGN KEY (`UsuRolCodigo`) REFERENCES `tblrol` (`RolCodigo`),
  CONSTRAINT `Persona_fk_Usuario` FOREIGN KEY (`UsuPerCodigo`) REFERENCES `tblpersona` (`PerCodigo`) 
  );



DROP TABLE IF EXISTS `tbljornada`;
CREATE TABLE `tbljornada`  (
  `JorCodigo`  bigint NOT NULL AUTO_INCREMENT,
  `JorNombre` varchar(25)  NOT NULL,
  `JorEstado` enum('Activo','Inactivo')  NOT NULL,
  PRIMARY KEY (`JorCodigo`) USING BTREE
);

DROP TABLE IF EXISTS `tblprogramaformacion`;
CREATE TABLE `tblprogramaformacion`  (
  `ProforCodigo`  bigint NOT NULL AUTO_INCREMENT,
  `ProforNombre` varchar(25)  NOT NULL,
  `ProforEstado` enum('Activo','Inactivo')  NOT NULL,
  PRIMARY KEY (`ProforCodigo`) USING BTREE
);


DROP TABLE IF EXISTS `tblhuella`;
CREATE TABLE `tblhuella`  (
  `HueCodigo`  bigint NOT NULL AUTO_INCREMENT,
  `HueCaracter1` longblob NOT NULL,
  `HueCaracter2` longblob NOT NULL,
  `HueCaracter3` longblob NOT NULL,
  `HueCaracter4` longblob NOT NULL,
  `HueCaracter5` longblob NOT NULL,
  `HueEstado` enum('Activo','Inactivo')  NOT NULL,
  PRIMARY KEY (`HueCodigo`) USING BTREE
);


DROP TABLE IF EXISTS `tblestudiante`;
CREATE TABLE `tblestudiante`  (
  `EstCodigo` bigint NOT NULL AUTO_INCREMENT,
  `EstFicha` int(11) NOT NULL,
  `EstEstado` enum('Activo','Inactivo') NOT NULL,
  `EstPerCodigo` bigint NOT NULL,
  `EstJorCodigo` bigint NOT NULL,
  `EstProforCodigo` bigint NOT NULL,
  `EstHueCodigo` bigint  NULL,
  PRIMARY KEY (`EstCodigo`) USING BTREE,
  CONSTRAINT `Huella_fk_Estudiante` FOREIGN KEY (`EstHueCodigo`) REFERENCES `tblhuella` (`HueCodigo`),
  CONSTRAINT `Persona_fk_Estudiante` FOREIGN KEY (`EstPerCodigo`) REFERENCES `tblpersona` (`PerCodigo`),
  CONSTRAINT `Estudiante_fk_jornada` FOREIGN KEY (`EstJorCodigo`) REFERENCES `tbljornada` (`JorCodigo`),
  CONSTRAINT `Estudiante_fk_programaformacion` FOREIGN KEY (`EstProforCodigo`) REFERENCES `tblprogramaformacion` (`ProforCodigo`)
);


DROP TABLE IF EXISTS `tblfuncion`;
CREATE TABLE `tblfuncion`  (
  `FunCodigo`  bigint NOT NULL AUTO_INCREMENT,
  `FunNombre` varchar(25)  NOT NULL,
  `FunEstado` enum('Activo','Inactivo')  NOT NULL,
  PRIMARY KEY (`FunCodigo`) USING BTREE
);


DROP TABLE IF EXISTS `tbladministrador`;
CREATE TABLE `tbladministrador`  (
  `AdmCodigo` bigint NOT NULL AUTO_INCREMENT,
  `AdmEstado` enum('Activo','Inactivo') NOT NULL,
  `AdmPerCodigo` bigint  NOT NULL,
  `AdmFunCodigo` bigint  NOT NULL,
  PRIMARY KEY (`AdmCodigo`) USING BTREE,
  CONSTRAINT `Administrador_fk_funcion` FOREIGN KEY (`AdmFunCodigo`) REFERENCES `tblfuncion` (`FunCodigo`),
  CONSTRAINT `Persona_fk_Administrador` FOREIGN KEY (`AdmPerCodigo`) REFERENCES `tblpersona` (`PerCodigo`)
);


 DROP TABLE IF EXISTS `tblprocesovotacion`;
CREATE TABLE `tblprocesovotacion`  (
  `ProVotCodigo` bigint NOT NULL AUTO_INCREMENT,
  `ProVotInicio` date NOT NULL,
  `ProVotFin` date NOT NULL,
  `ProVotRegEstInicio` date NOT NULL,
  `ProVotRegEstFin` date NOT NULL,
  `ProVotValAspInicio` date NOT NULL,
  `ProVotValAspFin` date NOT NULL,
  `ProVotRegPropInicio` date NOT NULL,
  `ProVotRegPropFin` date NOT NULL,
  `ProVotFechaJornada` date NOT NULL,
  `ProVotEstado` enum('Activo','Inactivo','Finalizado') NOT NULL,
  `ProVotAdmCodigo` bigint NOT NULL,
  PRIMARY KEY (`ProVotCodigo`) USING BTREE,
  CONSTRAINT `Proceso_fk_Administrador` FOREIGN KEY (`ProVotAdmCodigo`) REFERENCES `tbladministrador` (`AdmCodigo`) 
);


DROP TABLE IF EXISTS `tblvotaciongeneral`;
CREATE TABLE `tblvotaciongeneral`  (
  `VotGenCodigo` bigint NOT NULL AUTO_INCREMENT,
  `VotGenPeriodo` date NOT NULL,
  `VotGenVotBlanco` int(11) NULL DEFAULT NULL,
  `VotGenTotal` int(11) NULL DEFAULT NULL,
  `VotGenEstado` enum('Activo','Inactivo') NOT NULL,
  `VotGenProVotCodigo` bigint NOT NULL,
  PRIMARY KEY (`VotGenCodigo`) USING BTREE,
  CONSTRAINT `votgen_fk_procvot` FOREIGN KEY (`VotGenProVotCodigo`) REFERENCES `tblprocesovotacion` (`ProVotCodigo`) 
);

DROP TABLE IF EXISTS `tblcandidato`;
CREATE TABLE `tblcandidato`  (
  `CanCodigo` bigint NOT NULL AUTO_INCREMENT,
  `CanNTarjerton` varchar(2) NOT NULL,
  `CanFoto` longblob NULL,
  `CanEstado` enum('Activo','Inactivo') NOT NULL,
  `CanProVotCodigo` bigint NOT NULL,
  `CanPerCodigo` bigint NOT NULL,
  PRIMARY KEY (`CanCodigo`) USING BTREE,
  CONSTRAINT `Candidato_fk_ProcVot` FOREIGN KEY (`CanProVotCodigo`) REFERENCES `tblprocesovotacion` (`ProVotCodigo`),
  CONSTRAINT `Persona_fk_candidato` FOREIGN KEY (`CanPerCodigo`) REFERENCES `tblpersona` (`PerCodigo`)
);

DROP TABLE IF EXISTS `tblpropuesta`;
CREATE TABLE `tblpropuesta`  (
  `ProCodigo` bigint NOT NULL AUTO_INCREMENT,
  `ProNombre` varchar(15)  NOT NULL,
  `ProDescripcion` varchar(300)  NOT NULL,
  `ProEstado` enum('Activo','Inactivo')  NOT NULL,
  `ProCanCodigo` bigint NOT NULL,
  PRIMARY KEY (`ProCodigo`) USING BTREE,
  CONSTRAINT `Propuesta_fk_Candidato` FOREIGN KEY (`ProCanCodigo`) REFERENCES `tblcandidato` (`CanCodigo`)
);

DROP TABLE IF EXISTS `tblaspirante`;
CREATE TABLE `tblaspirante`  (
  `AspCodigo` bigint NOT NULL AUTO_INCREMENT,
  `AspFormPost` longblob NULL,
  `AspDoc1` longblob NULL,
  `AspDoc2` longblob NULL,
  `AspEstado` enum('Activo','Inactivo')NOT NULL,
  `AspPerCodigo` bigint NOT NULL,
  PRIMARY KEY (`AspCodigo`) USING BTREE,
  CONSTRAINT `Persona_fk_Aspirante` FOREIGN KEY (`AspPerCodigo`) REFERENCES `tblpersona` (`PerCodigo`) 
);


DROP TABLE IF EXISTS `tblinscripcion`;
CREATE TABLE `tblinscripcion`  (
  `InsCodigo` bigint NOT NULL AUTO_INCREMENT,
  `InsFecha` date NOT NULL,
  `InsEstado` enum('Activo','Inactivo') NOT NULL,
  `InsProVotCodigo` bigint NOT NULL,
  `InsAspCodigo` bigint NOT NULL,
  PRIMARY KEY (`InsCodigo`) USING BTREE,
  CONSTRAINT `Inscripcion_fk_Aspirante` FOREIGN KEY (`InsAspCodigo`) REFERENCES `tblaspirante` (`AspCodigo`),
  CONSTRAINT `Inscripcion_fk_Proceso` FOREIGN KEY (`InsProVotCodigo`) REFERENCES `tblprocesovotacion` (`ProVotCodigo`) 
);

DROP TABLE IF EXISTS `tblvoto`;
CREATE TABLE `tblvoto`  (
  `VotCodigo` bigint NOT NULL AUTO_INCREMENT,
  `VotFecha` date NOT NULL,
  `VotEstado` enum('Activo','Inactivo') NOT NULL,
  `VotEstCodigo` bigint NOT NULL,
  `VotCanCodigo` bigint NOT NULL,
  PRIMARY KEY (`VotCodigo`) USING BTREE,
  CONSTRAINT `Cand_fk_Voto` FOREIGN KEY (`VotCanCodigo`) REFERENCES `tblcandidato` (`CanCodigo`) ,
  CONSTRAINT `Est_fk_Voto` FOREIGN KEY (`VotEstCodigo`) REFERENCES `tblestudiante` (`EstCodigo`)
);



DROP TABLE IF EXISTS `tblvistas`;
CREATE TABLE `tblvistas`  (
  `VisCodigo` bigint NOT NULL AUTO_INCREMENT,
  `VisUrl` varchar(400)  NOT NULL,
  `VisIcono` varchar(70)  NOT NULL,
  `VisTitulo` varchar(70)  NOT NULL,
  `VisEstado` enum('Activo','Inactivo')  NOT NULL,
  PRIMARY KEY (`VisCodigo`) USING BTREE
);



DROP TABLE IF EXISTS `tblsubvistas`;
CREATE TABLE `tblsubvistas`  (
  `SubCodigo` bigint NOT NULL AUTO_INCREMENT,
  `SubUrl` varchar(400) NOT NULL,
  `SubTitulo` varchar(70)  NOT NULL,
  `SubEstado` enum('Activo','Inactivo')  NOT NULL,
  `SubVisCodigo` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`SubCodigo`) USING BTREE,  
  CONSTRAINT `vista_fk_subvista` FOREIGN KEY (`SubVisCodigo`) REFERENCES `tblvistas` (`VisCodigo`) 
);

DROP TABLE IF EXISTS `tblvistasroles`;
CREATE TABLE `tblvistasroles`  (
  `VisRolEstado` enum('Activo','Inactivo')  NOT NULL,
  `VisRolSubCodigo` bigint NOT NULL,
  `VisRolRolCodigo` bigint NOT NULL,
  CONSTRAINT `rol_fk_vistaroles` FOREIGN KEY (`VisRolRolCodigo`) REFERENCES `tblrol` (`RolCodigo`),
  CONSTRAINT `subvista_fk_vistaroles` FOREIGN KEY (`VisRolSubCodigo`) REFERENCES `tblsubvistas` (`SubCodigo`) 
);
