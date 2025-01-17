-- MySQL Script generated by MySQL Workbench
-- Thu Aug 22 17:17:41 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `Nombre` VARCHAR(16) NOT NULL,
  `Apellido` VARCHAR(20) NOT NULL,
  `ID_Usuario` INT(6) NOT NULL,
  `Telefono` INT(10) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Contraseña` VARCHAR(16) NOT NULL,
  `CP` INT(5) NOT NULL,
  `Edad` INT(2) NOT NULL,
  `Direccion` VARCHAR(120) NOT NULL,
  `Correo` VARCHAR(20) NOT NULL,
  `Foto` BLOB(1) NOT NULL,
  `Calificacion` INT(1) NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE INDEX `correo_UNIQUE` (`Correo` ASC) VISIBLE,
  UNIQUE INDEX `ID_usuario_UNIQUE` (`ID_Usuario` ASC) VISIBLE);
  
  INSERT INTO `usuario` 
(`Nombre`,  `Apellido`,`Telefono`,`Contraseña`,`CP`,`Edad`,`Direccion`,`Correo`,`Foto`,`Calificacion`) 
VALUES 
('Edwin', 'Zamora Perez', '5512684265', 'cacahuate123', 06760, 35, 'Cuautitlan, Mexico', 'edwin_zamora@gmail.com', LOAD_FILE('../../public/assets/usuario1.jpg'),4),
('Martín', 'López', 5556894713, 'CablesCalibre8',06760, 35, 'Toluca, México','martin.lopezpaz@gmail.com',LOAD_FILE('../../public/assets/usuario33.jpg'),5),
('Juan', 'Perez Juarez', 5512682268, 'chicles293',97360, 35, 'Ciudad de Mexico','juan_perez@gmail.com',LOAD_FILE('../../public/assets/usuario9.jpg',3),
('Cielo Patricia', 'Constantine', 5536892767, 'LindaCielo82', 06760, 35, 'Xalapa', 'Veracruz', 'cielo.linda@gmail.com',LOAD_FILE('../../public/assets/usuario3.jpg'),4),
('Luis Enrique' , 'Gonzalez', 5512584274, 'quesadillasinqueso5020', 20228, 32, 'Iztapalapa, CDMX' ,'luis.plomeriamaster@gmail.com',LOAD_FILE('../../public/assets/usuario8.jpg'),5),
('Javier', 'Hernandez', '5513562256', 'inglesito24v',53424, 30, 'Naucalpan, Mexico','javier_ingles@gmail.com',LOAD_FILE('../../public/assets/usuario10.jpg'),4),
('Juan Jose', 'Jimenez', '5514847562', 'elamornoExiste14',54157, 32, 'Tlalpan, Ciudad de Mexico','jjj_hellokitty@outlook.com',LOAD_FILE('../../public/assets/usuario5.jpg'),4)

-- -----------------------------------------------------
-- Table `mydb`.`publicaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`publiecaciones` (
  `ID_Publicacion` INT(12) NOT NULL,
  `Proveedor/Cliente` TINYINT NULL DEFAULT 1,
  `Fecha_Hora` DATETIME NOT NULL,
  `Nombre` VARCHAR(16) NOT NULL,
  `Apellidos` VARCHAR(20) NOT NULL,
  `Descripcion` TINYTEXT NOT NULL,
  `Adjunto` BLOB(1) NULL DEFAULT NULL,
  `Ubicacion` VARCHAR(120) NOT NULL,
  `Tipo_Servicio` VARCHAR(45) NOT NULL,
  `Foto_Usuario` BLOB(1) NOT NULL,
  `ID_Usuario` INT(6) NOT NULL,
  PRIMARY KEY (`ID_Publicacion`),
  UNIQUE INDEX `ID_publicacion_UNIQUE` (`ID_Publicacion` ASC) VISIBLE,
  INDEX `fk_publicaciones_usuario_idx` (`ID_Usuario` ASC) VISIBLE,
  CONSTRAINT `fk_publicaciones_usuario`
    FOREIGN KEY (`ID_Usuario`)
    REFERENCES `mydb`.`usuario` (`ID_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
     INSERT INTO `publiecaciones` 
(`Proveedor/Cliente`,  `Fecha_Hora`,`Nombre`,`Apellidos`,`Descripcion`,`Adjunto`,`Direccion`,`Ubicacion`,`Tipo_Servicio`,`Foto_Usuario`,`ID_Usuario`) 
VALUES 
(1,'2024-08-23 14:30:00' ,'Edwin', 'Zamora Perez', 'Realizo el diseño e instalacion de closet con las medidas que tu necesites', LOAD_FILE('../../public/assets/closets.jpg'), 'Constitucion 45', 'Cuautitlan, Mexico', 'Carpintero', LOAD_FILE('../../public/assets/usuario1.jpg'),000001),
(1,'2024-08-22 11:30:20' ,'Martín', 'López Paz', 'Realizo instalaciones electricas en casas habitación', LOAD_FILE('../../public/assets/electricista.jpg'), 'del valle 200', 'Toluca, México', 'Electricista', LOAD_FILE('../../public/assets/usuario33.jpg'),000002),
(1,'2024-08-23 15:20:30', 'Juan', 'Perez Juarez', 'Ofrezco servicios de carpintería personalizados, incluyendo muebles a medida, reparaciones y restauraciones de madera', LOAD_FILE('../../public/assets/muebles.jpg'), 'Puebla #48', 'Ciudad de México', 'Carpintería', LOAD_FILE('../../public/assets/usuario9.jpg'),000009),
(1,'2024-08-18 13:30:00', 'Luis Enrique', 'Gonzalez', '¡Hola a todos! Miren el último trabajo que realicé. Mi cliente presentaba  severas fugas en su tubería. Las fugas de agua pueden causar grandes problemas si no se detectan a tiempo. Revisa regularmente las juntas y conexiones de tus grifos y tuberías. Si necesitas ayuda, contáctame.', LOAD_FILE('../../public/assets/fugas.jpg'), 'Las fuentes 852', 'Iztapalapa, Mexico', 'Plomero', LOAD_FILE('../../public/assets/usuario8.jpg'),000008),
(1,'2024-08-23 18:35:00' ,'Martín', 'López Paz', 'Realizo instalaciones de lamparas LED', LOAD_FILE('../../public/assets/enchufes.jpg'), 'Constitucion 45', 'Toluca, Mexico', 'Electricista', LOAD_FILE('../../public/assets/usuario33.jpg'),000002),
(1,'2024-09-11 19:02:00' 'Cielo Patricia', 'Costurera en diferentes tipos de prendas', LOAD_FILE('../../public/assets/closets.jpg'), 'Matamorros 21', 'Xalapa, Mexico', 'Veracruz', LOAD_FILE('../../public/assets/usuario3.jpg'),000007),
(1,'2024-08-23 14:35:00' ,'Javier', 'Hernandez', 'Quieres mejorar tu ingles de manera rapida y efectiva? Clases particulares individuales y en grupo  adaptadas a tu nivel. Ya sea que desees mejorar pronunciacion, aprender gramatica usar el ingles para tu trabajo o estudios. Flexibilidad de horarios y clases virtuales y presenciales disponibles.', LOAD_FILE('../../public/assets/ingles.jpg'), 'Los mexicas 21', 'Naucalpan, Mexico', 'Clases de inglés', LOAD_FILE('../../public/assets/usuario10.jpg'),000010),
(0,'2024-08-25 09:30:00' ,'Juan Jose', 'Jimenez', 'Busco quien pueda realizar servicio de instalacion para  enchufes en un cuarto nuevo' , LOAD_FILE('../../public/assets/foto_de_cuarto.jpg'), 'los olivos 21', 'Tlalpan, Ciudad de Mexico', 'Electricidad', LOAD_FILE('../../public/assets/usuario5.jpg'),000005);
-- -----------------------------------------------------
-- Table `mydb`.`chats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`chats` (
  `ID_Chat` INT(10) NOT NULL AUTO_INCREMENT,
  `ID_Destinatario` INT(6) NOT NULL,
  `ID_Remitente` INT(6) NOT NULL,
  PRIMARY KEY (`ID_Chat`),
  INDEX `fk_chats_usuario1_idx` (`ID_Usuario` ASC) VISIBLE,
  CONSTRAINT `fk_chats_usuario1`
    FOREIGN KEY (`ID_Usuario`)
    REFERENCES `mydb`.`usuario` (`ID_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
     INSERT INTO `chats` 
(`ID_Usuario`) 
VALUES 
(000002, 000005),
(000005, 000010),
(000007, 000005),
(000005, 000009),
(000008, 000005);

    
    
    


-- -----------------------------------------------------
-- Table `mydb`.`mensajes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`mensajes` (
  `ID_Mensaje` INT(10) NOT NULL AUTO_INCREMENT,
  `Nombre_Destinatario` VARCHAR(16) NOT NULL,
  `Nombre_Remitente` VARCHAR(16) NOT NULL,
  `ID_Destinatario` INT(6) NOT NULL,
  `ID_Remitente` INT(6) NOT NULL,
  `Foto_Destinatario` BLOB NOT NULL,
  `Foto_Remitente` BLOB NOT NULL,
  `Descripcion` TINYTEXT NOT NULL,
  `Fecha_Hora` DATETIME NOT NULL,
  `chats_ID_Chat` INT(10) NOT NULL,
  PRIMARY KEY (`ID_Mensaje`, `chats_ID_Chat`),
  UNIQUE INDEX `id_chat_UNIQUE` (`ID_Mensaje` ASC) VISIBLE,
  INDEX `fk_mensajes_chats1_idx` (`chats_ID_Chat` ASC) VISIBLE,
  CONSTRAINT `fk_mensajes_chats1`
    FOREIGN KEY (`chats_ID_Chat`)
    REFERENCES `mydb`.`chats` (`ID_Chat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
    INSERT INTO `mensajes` 
(`Nombre_Destinatario`, `Nombre_Remitente`, `ID_Destinatario`, `ID_Remitente`, `Foto_Destinatario`, `Foto_Remitente`,  `Descripcion`, `Fecha_Hora`, `chats_ID_Chat`  ) 
VALUES 
('Juan Jose', 'Martin', 000005, 000002, LOAD_FILE('../../public/assets/usuario5.jpg'), LOAD_FILE('../../public/assets/usuario33.jpg'),'hola como estas?, vi que necesitas contratar servicios de electricidad','2024-08-23 14:15:00', 00000000001),
( 'Martin','Juan Jose', 000002, 000005, LOAD_FILE('../../public/assets/usuario33.jpg'), LOAD_FILE('../../public/assets/usuario5.jpg'),'Muy bien gracias, asi es necesito instalar unos enchufes en un cuarto','2024-08-23 14:15:00', 00000000001),

( 'Javier','Juan Jose', 000010, 000005, LOAD_FILE('../../public/assets/usuario10.jpg'), LOAD_FILE('../../public/assets/usuario5.jpg'),'Hola javier  me gustaria tomar clases precenciales , me podrias decir en que calley numero te hubicas','2024-08-23 14:15:00', 00000000002),
('Juan Jose', 'Javir', 000005, 000010, LOAD_FILE('../../public/assets/usuario5.jpg'), LOAD_FILE('../../public/assets/usuario10.jpg'),'claro , me encuentro en la colonia doctores, tengo una muestra de clase totalmente gratis','2024-08-23 14:15:00', 00000000002),

('Juan Jose', 'Patricia', 000005, 000007, LOAD_FILE('../../public/assets/usuario5.jpg'), LOAD_FILE('../../public/assets/usuario7.jpg'),'hola realizo diferentes composturas en ropa, te puedo ayudar?','2024-08-25 12:15:00', 00000000003),
( 'Patricia','Juan Jose', 000007, 000005, LOAD_FILE('../../public/assets/usuario7.jpg'), LOAD_FILE('../../public/assets/usuario5.jpg'),'Si, puedes ajustar 5 pantalones y un saco para la proxima semana? Gracias de antemano','2024-08-25 14:15:00', 00000000003),

('Juan', 'Juan Jose', 000009, 000005, LOAD_FILE('../../public/assets/usuario9.jpg'), LOAD_FILE('../../public/assets/usuario9.jpg'),'Buenas tarde, me gustaria saber el costo de un comedor para 6 personas.','2024-08-23 09:45:50', 00000000004),
( 'Juan Jose','Juan', 000005, 000009, LOAD_FILE('../../public/assets/usuario5.jpg'), LOAD_FILE('../../public/assets/usuario5.jpg'),'Claro, pero primero necesito saber cual es tu idea, color, material, medidas, si va a ser redondo o rectangular','2024-08-23 10:15:20', 00000000004),

('Juan Jose', 'Luis Enrique', 000005, 000008, LOAD_FILE('../../public/assets/usuario5.jpg'), LOAD_FILE('../../public/assets/usuario8.jpg'),'Buenas tardes, me comentabas que te hicieron un mal trabajo al intentar arreglar el problema con la fuga de agua, quieres que agendemos una fecha para que vaya a hacer una evaluación?','2024-08-14 10:15:00', 00000000005),
( 'Luis Enrique','Juan Jose', 000008, 000005, LOAD_FILE('../../public/assets/usuario8.jpg'), LOAD_FILE('../../public/assets/usuario5.jpg'),'Buenas tardes, sí, me gustaría agendar una fecha porque se está desperdiciando mucha agua.','2024-08-14 10:25:28', 00000000005);
-- -----------------------------------------------------
-- Table `mydb`.`Comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Comentarios` (
  `ID_Comentario` INT NOT NULL AUTO_INCREMENT,
  `Comentario` VARCHAR(255) NULL,
  `ID_Publicacion` INT(12) NOT NULL,
  `ID_Usuario` INT(6) NOT NULL,
  PRIMARY KEY (`ID_Comentario`),
  UNIQUE INDEX `Id_interaccion_UNIQUE` (`ID_Comentario` ASC) VISIBLE,
  INDEX `fk_reacciones_publicaciones1_idx` (`ID_Publicacion` ASC) VISIBLE,
  INDEX `fk_reacciones_usuario1_idx` (`ID_Usuario` ASC) VISIBLE,
  CONSTRAINT `fk_reacciones_publicaciones1`
    FOREIGN KEY (`ID_Publicacion`)
    REFERENCES `mydb`.`publicaciones` (`ID_Publicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reacciones_usuario1`
    FOREIGN KEY (`ID_Usuario`)
    REFERENCES `mydb`.`usuario` (`ID_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
    INSERT INTO `Comentarios` 
(`Comentario`, `ID_Publicacion`, `ID_Usuario`  ) 
VALUES 
('Hola Edwin , estoy interesado en tu servicio de carpinteria, quisiera saber si haces instalaciones  hasta la ciudad de mexico',000000000001,000005),
('Hola ¿crees que podriamos hablar por privado para concretar un trabajo?',000000000002,000005),
('Hola Juan , estoy interesado en tu servicio de carpintería, quisiera saber el costo de un comedor de 3 x 2 m, sería en la Ciudad de Mexico',000000000003,000005),
('Hola luis , escribeme en privado me gustaria que me hicieras una cotización ',000000000004,000005),
('Tendrás disponibilidad para venir a solucionar una fuga de agua en mi baño? Contacté anteriormente con un plomero pero me dejó un mal trabajo.',000000000001,000005),
('Hola Cielo , estoy interesado en que me puedas arreglar unas camisas',000000000006,00007),
('Hola Javier , estoy interesado en tus clases de inglés solo me gustaria saber precios y horarios que manejas',000000000007,000010);


-- -----------------------------------------------------
-- Table `mydb`.`Reaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reaccion` (
  `ID_Ikonic` INT NOT NULL,
  `ID_Publicacion` INT(12) NOT NULL,
  `ID_Usuario` INT(6) NOT NULL,
  PRIMARY KEY (`ID_Ikonic`),
  UNIQUE INDEX `ID_Ikonic_UNIQUE` (`ID_Ikonic` ASC) VISIBLE,
  INDEX `fk_Reaccion_publicaciones1_idx` (`ID_Publicacion` ASC) VISIBLE,
  INDEX `fk_Reaccion_usuario1_idx` (`ID_Usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Reaccion_publicaciones1`
    FOREIGN KEY (`ID_Publicacion`)
    REFERENCES `mydb`.`publicaciones` (`ID_Publicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reaccion_usuario1`
    FOREIGN KEY (`ID_Usuario`)
    REFERENCES `mydb`.`usuario` (`ID_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
    
     INSERT INTO `Reaccion` 
(`ID_Publicacion`, `ID_Usuario`  ) 

VALUES
(000000000001, 000005),
(000000000002, 000005),
(000000000003, 000005),
(000000000004, 000005),
(000000000005, 000005);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
