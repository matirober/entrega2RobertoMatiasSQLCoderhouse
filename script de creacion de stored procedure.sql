DROP PROCEDURE IF EXISTS sp_ordenar_por_campo

DELIMITER $$
CREATE PROCEDURE sp_ordenar_por_campo (IN field VARCHAR(100))
BEGIN 
	IF field <> '' THEN 
		SET @precioproductos = CONCAT('ORDER BY ' , field);
	ELSE
		SET @precioproductos = '';
	END IF;
    SET @clausula = CONCAT('SELECT * FROM producto' , @precioproductos);
    
	PREPARE runSQL FROM @clausula;
	EXECUTE runSQL;
	DEALLOCATE PREPARE runSQL;
END $$
DELIMITER ;

CALL sp_ordenar_por_campo('nombreProducto');
select * from producto


