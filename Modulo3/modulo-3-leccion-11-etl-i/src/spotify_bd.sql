-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema spotify
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema spotify
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `spotify` DEFAULT CHARACTER SET utf8 ;
USE `spotify` ;

-- -----------------------------------------------------
-- Table `spotify`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`table1` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`canciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`canciones` (
  `idcanciones` VARCHAR(1024) NOT NULL,
  `nombre` VARCHAR(1024) NULL,
  PRIMARY KEY (`idcanciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`artista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`artista` (
  `idartista` VARCHAR(1024) NOT NULL,
  `nombre` VARCHAR(1024) NULL,
  PRIMARY KEY (`idartista`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`canciones_artistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`canciones_artistas` (
  `canciones_idcanciones` VARCHAR(1024) NOT NULL,
  `artista_idartista` VARCHAR(1024) NOT NULL,
  PRIMARY KEY (`canciones_idcanciones`, `artista_idartista`),
  INDEX `fk_canciones_artistas_artista1_idx` (`artista_idartista` ASC) VISIBLE,
  CONSTRAINT `fk_canciones_artistas_canciones`
    FOREIGN KEY (`canciones_idcanciones`)
    REFERENCES `spotify`.`canciones` (`idcanciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_canciones_artistas_artista1`
    FOREIGN KEY (`artista_idartista`)
    REFERENCES `spotify`.`artista` (`idartista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
