DELIMITER $$
use mydb $$
create function calcular_vendido_menos_comprado(precioProductoVenta int, precioProductoCompra int)
returns float
NO SQL
BEGIN
	declare resultado float;
    set resultado = (precioProductoVenta - precioProductoCompra);
    return resultado;
    end$$
    
DELIMITER ;

DELIMITER $$
use mydb $$
create function calcular_total_cliente_comprado(consumo float, precioProductoVenta float)
returns float
NO SQL
BEGIN
	declare resultado float;
    set resultado = (consumo + precioProductoVenta);
    return resultado;
    end$$
    
DELIMITER ;