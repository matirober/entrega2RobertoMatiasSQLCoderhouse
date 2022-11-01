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
-- Table `mydb`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Producto` (
  `idProducto` VARCHAR(50) NOT NULL,
  `nombreProducto` VARCHAR(45) NOT NULL,
  `precioProductoVenta` FLOAT NOT NULL,
  PRIMARY KEY (`idProducto`, `nombreProducto`, `precioProductoVenta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleados` (
  `idEmpleados` INT NOT NULL AUTO_INCREMENT,
  `nombreEmpleado` VARCHAR(45) NULL,
  `sueldoEmpleado` INT NULL,
  PRIMARY KEY (`idEmpleados`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Proveedores` (
  `idProveedores` VARCHAR(50) NOT NULL,
  `precioProductoCompra` FLOAT NOT NULL,
  `nombreProveedor` VARCHAR(45) NULL,
  PRIMARY KEY (`idProveedores`, `precioProductoCompra`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Compras` (
  `idCompras` INT NOT NULL AUTO_INCREMENT,
  `Producto_idProducto` VARCHAR(50) NOT NULL,
  `Producto_nombreProducto` VARCHAR(45) NOT NULL,
  `Proveedores_idProveedores` VARCHAR(50) NOT NULL,
  `Proveedores_precioProductoCompra` FLOAT NOT NULL,
  PRIMARY KEY (`idCompras`),
  INDEX `fk_Compras_Producto1_idx` (`Producto_idProducto` ASC, `Producto_nombreProducto` ASC) VISIBLE,
  INDEX `fk_Compras_Proveedores1_idx` (`Proveedores_idProveedores` ASC, `Proveedores_precioProductoCompra` ASC) VISIBLE,
  CONSTRAINT `fk_Compras_Producto1`
    FOREIGN KEY (`Producto_idProducto` , `Producto_nombreProducto`)
    REFERENCES `mydb`.`Producto` (`idProducto` , `nombreProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compras_Proveedores1`
    FOREIGN KEY (`Proveedores_idProveedores` , `Proveedores_precioProductoCompra`)
    REFERENCES `mydb`.`Proveedores` (`idProveedores` , `precioProductoCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sucursal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sucursal` (
  `idSucursal` INT NOT NULL AUTO_INCREMENT,
  `nombreSucursal` VARCHAR(45) NULL,
  `Empleados_idEmpleados` INT NOT NULL,
  `Compras_idCompras` INT NOT NULL,
  PRIMARY KEY (`idSucursal`),
  INDEX `fk_Sucursal_Empleados1_idx` (`Empleados_idEmpleados` ASC) VISIBLE,
  INDEX `fk_Sucursal_Compras1_idx` (`Compras_idCompras` ASC) VISIBLE,
  CONSTRAINT `fk_Sucursal_Empleados1`
    FOREIGN KEY (`Empleados_idEmpleados`)
    REFERENCES `mydb`.`Empleados` (`idEmpleados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sucursal_Compras1`
    FOREIGN KEY (`Compras_idCompras`)
    REFERENCES `mydb`.`Compras` (`idCompras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ventas` (
  `idVentas` INT NOT NULL AUTO_INCREMENT,
  `Producto_idProducto` VARCHAR(50) NOT NULL,
  `Producto_nombreProducto` VARCHAR(45) NOT NULL,
  `Producto_precioProducto` VARCHAR(45) NOT NULL,
  `Empleados_idEmpleados` INT NOT NULL,
  `Sucursal_idSucursal` INT NOT NULL,
  PRIMARY KEY (`idVentas`),
  INDEX `fk_Ventas_Producto1_idx` (`Producto_idProducto` ASC, `Producto_nombreProducto` ASC, `Producto_precioProducto` ASC) VISIBLE,
  INDEX `fk_Ventas_Empleados1_idx` (`Empleados_idEmpleados` ASC) VISIBLE,
  INDEX `fk_Ventas_Sucursal1_idx` (`Sucursal_idSucursal` ASC) VISIBLE,
  CONSTRAINT `fk_Ventas_Producto1`
    FOREIGN KEY (`Producto_idProducto` , `Producto_nombreProducto` , `Producto_precioProducto`)
    REFERENCES `mydb`.`Producto` (`idProducto` , `nombreProducto` , `precioProductoVenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ventas_Empleados1`
    FOREIGN KEY (`Empleados_idEmpleados`)
    REFERENCES `mydb`.`Empleados` (`idEmpleados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ventas_Sucursal1`
    FOREIGN KEY (`Sucursal_idSucursal`)
    REFERENCES `mydb`.`Sucursal` (`idSucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` VARCHAR(50) NOT NULL,
  `Consumo` FLOAT NOT NULL,
  `NombreCliente` VARCHAR(50) NULL,
  `TelefonoCliente` INT NULL,
  `MailCliente` VARCHAR(50) NULL,
  `DireccionCliente` VARCHAR(45) NULL,
  `Ventas_idVentas` INT NOT NULL,
  PRIMARY KEY (`idCliente`, `Consumo`),
  UNIQUE INDEX `MailCliente_UNIQUE` (`MailCliente` ASC) VISIBLE,
  INDEX `fk_Cliente_Ventas_idx` (`Ventas_idVentas` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Ventas`
    FOREIGN KEY (`Ventas_idVentas`)
    REFERENCES `mydb`.`Ventas` (`idVentas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Descuentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Descuentos` (
  `idDescuentos` INT NOT NULL AUTO_INCREMENT,
  `Producto_idProducto` VARCHAR(50) NOT NULL,
  `Producto_nombreProducto` VARCHAR(45) NOT NULL,
  `Producto_precioProductoVenta` FLOAT NOT NULL,
  PRIMARY KEY (`idDescuentos`),
  INDEX `fk_Descuentos_Producto1_idx` (`Producto_idProducto` ASC, `Producto_nombreProducto` ASC, `Producto_precioProductoVenta` ASC) VISIBLE,
  CONSTRAINT `fk_Descuentos_Producto1`
    FOREIGN KEY (`Producto_idProducto` , `Producto_nombreProducto` , `Producto_precioProductoVenta`)
    REFERENCES `mydb`.`Producto` (`idProducto` , `nombreProducto` , `precioProductoVenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `mydb`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`view1`;
USE `mydb`;
CREATE  OR REPLACE VIEW `view_ganancias` AS ganancias;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
