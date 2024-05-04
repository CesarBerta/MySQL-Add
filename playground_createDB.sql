-- MySQL Script generated by MySQL Workbench
-- Mon Apr 29 22:17:37 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema playground
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema playground
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `playground`;
CREATE SCHEMA IF NOT EXISTS `playground` DEFAULT CHARACTER SET utf8mb4 ;
USE `playground` ;

-- -----------------------------------------------------
-- Table `playground`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playground`.`categorias` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `categorias` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `playground`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playground`.`cursos` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(250) NOT NULL,
  `descripcion` VARCHAR(250) NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_finalizacion` DATE NOT NULL,
  `cupo_maximo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `playground`.`unidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playground`.`unidades` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(250) NOT NULL,
  `descripcion` VARCHAR(250) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `cursos_id` INT(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_unidades_cursos1_idx` (`cursos_id` ASC) ,
  CONSTRAINT `fk_unidades_cursos1`
    FOREIGN KEY (`cursos_id`)
    REFERENCES `playground`.`cursos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `playground`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playground`.`usuarios` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(250) NOT NULL,
  `apellido` VARCHAR(250) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `categorias_id` INT(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuarios_categorias1_idx` (`categorias_id` ASC) ,
  CONSTRAINT `fk_usuarios_categorias1`
    FOREIGN KEY (`categorias_id`)
    REFERENCES `playground`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `playground`.`cursos_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playground`.`cursos_usuarios` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `cursos_id` INT(10) NOT NULL,
  `usuarios_id` INT(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cursos_has_usuarios_usuarios1_idx` (`usuarios_id` ASC) ,
  INDEX `fk_cursos_has_usuarios_cursos1_idx` (`cursos_id` ASC) ,
  CONSTRAINT `fk_cursos_has_usuarios_cursos1`
    FOREIGN KEY (`cursos_id`)
    REFERENCES `playground`.`cursos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cursos_has_usuarios_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `playground`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `playground`.`clases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playground`.`clases` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(250) NOT NULL,
  `descripcion` VARCHAR(250) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `marca_visibilidad` BOOLEAN NOT NULL,
  `unidades_id` INT(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_clases_unidades1_idx` (`unidades_id` ASC) ,
  CONSTRAINT `fk_clases_unidades1`
    FOREIGN KEY (`unidades_id`)
    REFERENCES `playground`.`unidades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `playground`.`bloques`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playground`.`bloques` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(250) NOT NULL,
  `tipo` VARCHAR(250) NOT NULL,
  `contenido` VARCHAR(250) NOT NULL,
  `clases_id` INT(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bloques_clases1_idx` (`clases_id` ASC) ,
  CONSTRAINT `fk_bloques_clases1`
    FOREIGN KEY (`clases_id`)
    REFERENCES `playground`.`clases` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;