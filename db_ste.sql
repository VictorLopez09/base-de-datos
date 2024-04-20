CREATE SCHEMA IF NOT EXISTS `db_ste` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;

USE `db_ste`;

CREATE TABLE IF NOT EXISTS `feria` (
  `clave_feria` INT NOT NULL AUTO_INCREMENT,
  `nombre_evento` VARCHAR(100) NOT NULL,
  `fecha` DATE NOT NULL,
  `hora_inicio` TIME NOT NULL,
  `hora_fin` TIME NOT NULL,
  `ubicacion` VARCHAR(100) NOT NULL,
  `descripcion` TEXT NOT NULL,
  PRIMARY KEY (`clave_feria`)
);

CREATE TABLE IF NOT EXISTS `medio` (
  `clave_medio` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`clave_medio`)
);

CREATE TABLE IF NOT EXISTS `estado` (
  `clave_estado` INT NOT NULL AUTO_INCREMENT,
  `nombre_estado` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`clave_estado`)
);

CREATE TABLE IF NOT EXISTS `ciudad` (
  `clave_ciudad` INT NOT NULL AUTO_INCREMENT,
  `nombre_ciudad` VARCHAR(50) NOT NULL,
  `clave_estado` INT NOT NULL,
  PRIMARY KEY (`clave_ciudad`),
  FOREIGN KEY (`clave_estado`) REFERENCES `estado` (`clave_estado`)
);

CREATE TABLE IF NOT EXISTS `colonia` (
  `clave_colonia` INT NOT NULL AUTO_INCREMENT,
  `nombre_colonia` VARCHAR(50) NOT NULL,
  `clave_ciudad` INT NOT NULL,
  PRIMARY KEY (`clave_colonia`),
  FOREIGN KEY (`clave_ciudad`) REFERENCES `ciudad` (`clave_ciudad`)
);

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `curp` VARCHAR(18) NOT NULL,
  `rfc` VARCHAR(13) NOT NULL,
  `nombre` VARCHAR(20) NOT NULL,
  `paterno` VARCHAR(20) NOT NULL,
  `materno` VARCHAR(20) NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  `clave_estado` INT NOT NULL,
  `clave_ciudad` INT NOT NULL,
  `clave_colonia` INT NOT NULL,
  `calle` VARCHAR(100) NOT NULL,
  `telefono` INT NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `contrasena` VARCHAR(100) NOT NULL,
  `updated_at` TIMESTAMP NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  PRIMARY KEY (`curp`),
  UNIQUE INDEX `id_UNIQUE` (`id`),
  INDEX `clave_estado` (`clave_estado`),
  INDEX `clave_ciudad` (`clave_ciudad`),
  INDEX `clave_colonia` (`clave_colonia`),
  FOREIGN KEY (`clave_estado`) REFERENCES `estado` (`clave_estado`),
  FOREIGN KEY (`clave_ciudad`) REFERENCES `ciudad` (`clave_ciudad`),
  FOREIGN KEY (`clave_colonia`) REFERENCES `colonia` (`clave_colonia`)
);

CREATE TABLE IF NOT EXISTS `registraseferia` (
  `clave_registro` INT NOT NULL AUTO_INCREMENT,
  `clave_feria` INT NOT NULL,
  `curp` VARCHAR(18) NOT NULL,
  `fecha` DATE NOT NULL,
  `medio` INT NOT NULL,
  PRIMARY KEY (`clave_registro`),
  INDEX `clave_feria` (`clave_feria`),
  INDEX `curp` (`curp`),
  INDEX `medio` (`medio`),
  FOREIGN KEY (`clave_feria`) REFERENCES `feria` (`clave_feria`),
  FOREIGN KEY (`medio`) REFERENCES `medio` (`clave_medio`),
  FOREIGN KEY (`curp`) REFERENCES `usuario` (`curp`)
);

CREATE TABLE IF NOT EXISTS `asistencia` (
  `clave_asistencia` INT NOT NULL AUTO_INCREMENT,
  `clave_registro` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  PRIMARY KEY (`clave_asistencia`),
  INDEX `clave_registro` (`clave_registro`),
  FOREIGN KEY (`clave_registro`) REFERENCES `registraseferia` (`clave_registro`)
);
