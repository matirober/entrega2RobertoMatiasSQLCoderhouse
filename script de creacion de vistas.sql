create view vw_productos as
select nombreProducto,sum(precioProductoVenta) cantidad from producto group by nombreProducto;

create view vw_ventas as
select idVentas,sum(empleados_idEmpleados)  totalventasempleado from ventas group by Empleados_idEmpleados;

create view vw_compras as
select * from compras T1
left join(select PrecioProductoCompra from proveedores)T2
on T1.idCompras=T2.PrecioProductoCompra;

create view vw_descuentos as
select * from producto t1
inner join(select * from descuentos)t2
on t1.idProducto=t2.idDescuentos;

create view vw_sucursalcompra as
select * from sucursal t1
left join(select idCompras from compras) t2
on t1.idSucursal=t2.idCompras;


