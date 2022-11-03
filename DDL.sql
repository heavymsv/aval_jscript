
DROP SCHEMA IF EXISTS `blog` ;
CREATE SCHEMA IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8 ;
USE `blog` ;

DROP TABLE IF EXISTS `blog`.`usuarios` ;

CREATE TABLE IF NOT EXISTS `blog`.`usuarios` (
	  `email` VARCHAR(50) NOT NULL,
	  `senha` VARCHAR(20) NOT NULL,
	  `nivel` INT DEFAULT 0,
	  `nome` VARCHAR(60) NOT NULL,
	  `apelido` VARCHAR(45) UNIQUE NOT NULL,
	  PRIMARY KEY (`email`)  
  );


-- -----------------------------------------------------
-- Table `blog`.`postagens`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog`.`postagens` ;

CREATE TABLE IF NOT EXISTS `blog`.`postagens` (
	  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	  `titulo` VARCHAR(45) NULL,
	  `texto` VARCHAR(1000) NULL,
	  `usuario_email` VARCHAR(50) NOT NULL REFERENCES `blog`.`usuarios`(`email`),
      `data` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );


-- -----------------------------------------------------
-- Table `blog`.`comentarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog`.`comentarios` ;

CREATE TABLE IF NOT EXISTS `blog`.`comentarios` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `texto` VARCHAR(150) NULL,
  `aprovado` INT DEFAULT 0,
  `postagem_id` INT NOT NULL REFERENCES `blog`.`postagens`(`id`),
  `usuario_email` VARCHAR(50) NOT NULL REFERENCES `blog`.`usuarios`(`email`),
  `data` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );