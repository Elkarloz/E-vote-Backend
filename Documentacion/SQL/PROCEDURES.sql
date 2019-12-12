-- ----------------------------
-- Procedure structure for Actualizar_Estudiante_persona
-- ----------------------------
DROP PROCEDURE IF EXISTS `Actualizar_Estudiante_persona`;
delimiter ;;
CREATE PROCEDURE `Actualizar_Estudiante_persona`(in codigo int,
in documento int,
in nombre varchar(20),
in apellido varchar(20),
in Ficha varchar(20),
in Jornada varchar(20),
in programa varchar(20),
in estado varchar(20))
BEGIN
UPDATE tblpersona SET PerNombre=nombre,PerApellido=apellido,PerDocumento=documento WHERE PerCodigo=codigo;
UPDATE tblestudiante SET EstFicha=ficha,EstJornada=jornada,EstProgForm=programa, EstEstado=estado WHERE EstPerCodigo=codigo;
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
in Ficha varchar(20),
in Jornada varchar(20),
in programa varchar(20))
BEGIN
declare llave1 int DEFAULT(SELECT COUNT(*)+1 FROM tblestudiante);
declare llave2 int DEFAULT(SELECT COUNT(*)+1 FROM tblpersona);
INSERT INTO tblpersona VALUES (llave2,documento,nombre,apellido,'M','Activo');
INSERT INTO tblestudiante VALUES (llave1,Ficha,Jornada,programa,'Activo',llave2);
End
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Agregar_aspirante
-- ----------------------------
DROP PROCEDURE IF EXISTS `Agregar_aspirante`;
delimiter ;;
CREATE PROCEDURE `Agregar_aspirante`(IN `Archivo1` LONGBLOB,
	IN `Archivo2` LONGBLOB,
	IN `Archivo3` LONGBLOB,
	IN `Documento` VARCHAR ( 20 ))
BEGIN
DECLARE Pro_v INT DEFAULT(SELECT ProVotCodigo FROM tblprocesovotacion WHERE NOW() BETWEEN ProVotInicio AND ProVotFin AND ProVotEstado='Activo' AND CURRENT_DATE() BETWEEN ProVotRegEstInicio AND ProVotRegEstFin);
DECLARE llave INT DEFAULT(SELECT count(*)+1 FROM tblaspirante);
DECLARE llavei INT DEFAULT(SELECT count(*)+1 FROM tblinscripcion);
DECLARE llaveU INT DEFAULT(SELECT PerCodigo FROM tblpersona WHERE PerDocumento=`Documento`);
IF(Pro_v IS NOT NULL) THEN

INSERT into tblaspirante VALUES(llave,`Archivo1`,`Archivo2`,`Archivo3`,'Activo',llaveU);
INSERT INTO tblinscripcion VALUES (llavei,CURRENT_DATE(),'Activo',Pro_v,llave);
UPDATE tblusuario set UsuRolCodigo =3  WHERE UsuPerCodigo=llaveU;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Agregar_Proceso
-- ----------------------------
DROP PROCEDURE IF EXISTS `Agregar_Proceso`;
delimiter ;;
CREATE PROCEDURE `Agregar_Proceso`(`ProVotInicio` DATE,
	`ProVotFin` DATE,
	`ProVotRegEstInicio`DATE,
	`ProVotRegEstFin` DATE,
	`ProVotValAspInicio` DATE,
	`ProVotValAspFin` DATE,
	`ProVotRegPropInicio`DATE,
	`ProVotRegPropFin`DATE,
	`ProVotFechaJornada`DATE,
	`ProVotAdmCodigo` INT)
BEGIN
	DECLARE llave1 INT DEFAULT(SELECT count(*)+1 FROM tblprocesovotacion);
	DECLARE llave2 INT DEFAULT(SELECT count(*)+1 FROM tblvotaciongeneral);
	DECLARE llave3 INT DEFAULT(SELECT count(*)+1 FROM tblcandidato);
	DECLARE fecha DATE DEFAULT(SELECT ProVotFechaJornada FROM tblprocesovotacion WHERE NOW() BETWEEN ProVotInicio AND 	ProVotFin);
	INSERT INTO tblprocesovotacion VALUES(llave1,	`ProVotInicio`,`ProVotFin`,`ProVotRegEstInicio`,`ProVotRegEstFin`,	`ProVotValAspInicio`,`ProVotValAspFin`,`ProVotRegPropInicio`,`ProVotRegPropFin`,`ProVotFechaJornada`,'Activo',	`ProVotAdmCodigo`);
	INSERT INTO tblvotaciongeneral VALUES (llave2,`ProVotFechaJornada`,0,0,'Activo');
	INSERT INTO tblcandidato VALUES (llave3,0,NULL,'Activo',llave1,1);
	END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for buscar_codigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `buscar_codigo`;
delimiter ;;
CREATE PROCEDURE `buscar_codigo`(In codigo_per INT)
BEGIN
DECLARE Rol INT DEFAULT(SELECT tblusuario.UsuRolCodigo FROM tblusuario INNER JOIN tblpersona ON (tblpersona.PerCodigo=tblusuario.UsuPerCodigo) WHERE tblpersona.PerCodigo=codigo_per);
IF(Rol=1)THEN
SELECT tbladministrador.AdmCodigo FROM tbladministrador WHERE tbladministrador.AdmPerCodigo=codigo_per;
END IF;
IF(Rol=2)THEN
SELECT tblestudiante.EstCodigo FROM tblestudiante WHERE tblestudiante.EstPerCodigo = codigo_per;
END IF;
IF(Rol=3)THEN
SELECT tblaspirante.AspCodigo FROM tblaspirante WHERE tblaspirante.AspPerCodigo= codigo_per;
END IF;
IF(Rol=4)THEN
SELECT tblcandidato.CanCodigo FROM tblcandidato WHERE tblcandidato.CanPerCodigo= codigo_per;
END IF;
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
declare llave INT DEFAULT(SELECT count(*)+1 FROM tblusuario);
declare existe INT DEFAULT(SELECT count(*) FROM tblpersona WHERE tblpersona.PerDocumento=`Documento`);
declare existe2 INT DEFAULT(SELECT UsuCodigo FROM tblusuario WHERE UsuNombre=`Usuario`);
#declare llaveU INT;
IF(existe2 is null)THEN
IF (existe=1)THEN
SELECT @llaveU:= PerCodigo FROM tblpersona WHERE PerDocumento=`Documento`;
INSERT INTO tblusuario VALUES (llave,`Usuario`,MD5( `contraseña` ),'Activo',@llaveU,2);
END IF;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Generar_voto
-- ----------------------------
DROP PROCEDURE IF EXISTS `Generar_voto`;
delimiter ;;
CREATE PROCEDURE `Generar_voto`(IN `Cod_cand` INT,
IN `Cod_est` INT,
IN `Tipo_voto` VARCHAR ( 20 ))
BEGIN
DECLARE Cod_vot_gen INT DEFAULT(SELECT VotGenCodigo FROM tblvotaciongeneral WHERE VotGenPeriodo= CURRENT_DATE());
DECLARE total INT DEFAULT(SELECT VotGenTotal FROM tblvotaciongeneral WHERE VotGenPeriodo= CURRENT_DATE());
DECLARE Blanco INT DEFAULT(SELECT VotGenVotBlanco FROM tblvotaciongeneral WHERE VotGenPeriodo= CURRENT_DATE());
DECLARE llave1 INT DEFAULT(SELECT count(*)+1 FROM tblvoto);
DECLARE cod_persona INT DEFAULT(SELECT EstPerCodigo FROM tblestudiante WHERE EstCodigo = `Cod_est`);
DECLARE estado VARCHAR(20) DEFAULT(SELECT PerEstado FROM tblpersona WHERE PerCodigo = cod_persona);
IF(estado='Activo')THEN
IF(Cod_vot_gen IS NOT NULL) THEN
 SET total=total+1;
INSERT INTO 	tblvoto VALUES (llave1, NOW(),'Activo',Cod_vot_gen,Cod_est,Cod_cand);
UPDATE tblpersona SET PerEstado ='Inactivo' WHERE PerCodigo = cod_persona;
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
		u.`UsuNombre`,
		r.`RolNombre`
		
	FROM 
		`tblpersona` AS p 
	INNER JOIN 
		`tblusuario` AS u 
	ON 
		p.`PerCodigo` = u.`UsuPerCodigo` 
	INNER JOIN
		`tblrol` AS r 
	ON
		r.`RolCodigo`= u.`UsuRolCodigo`
	WHERE
	(
		u.`UsuNombre` = `Usuario` 
		AND 
		u.`UsuContraseña`= MD5( `contra` )
		AND
		u.`UsuEstado` = 'Activo'
		AND
		p.`PerEstado` = 'Activo'
	);  

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Registrar_propuesta
-- ----------------------------
DROP PROCEDURE IF EXISTS `Registrar_propuesta`;
delimiter ;;
CREATE PROCEDURE `Registrar_propuesta`(in candidato int,
in Nombre varchar(300),
in Descripcion varchar(300))
BEGIN
DECLARE llave1 INT DEFAULT(SELECT count(*)+1 FROM tblpropuesta);
INSERT INTO tblpropuesta VALUES (llave1,Nombre,Descripcion,'Activo',candidato);
End
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
DECLARE Pro_v INT DEFAULT(SELECT ProVotCodigo FROM tblprocesovotacion WHERE NOW() BETWEEN ProVotInicio AND ProVotFin);
DECLARE llave INT DEFAULT(SELECT count(*)+1 FROM tblcandidato);
DECLARE llaveU INT DEFAULT(SELECT PerCodigo FROM tblpersona WHERE PerDocumento=`Documento`);
IF(Pro_v IS NOT NULL) THEN

INSERT into tblcandidato VALUES(llave,`N_Tarjeon`,null,'Activo',Pro_v,llaveU);
UPDATE tblusuario set UsuRolCodigo =4  WHERE UsuPerCodigo=llaveU;
END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
