

create table if not exists insercion_de_productos(
id int not null auto_increment,
dato int not null,
primary key(id));

create trigger insercion_de_productos_nuevos
after insert on producto
for each row
insert into insercion_de_productos (idProducto,nombreProducto,precioProductoVenta)
values(new.idProducto, new.nombreProducto, new.precioProductoVenta);

create table if not exists recuperacion_de_datos_borrados(
id int not null auto_increment,
dato int not null,
primary key(id));

create trigger recuperacion_de_datos
before update on ventas
for each row
insert into recuperacion_de_datos_borrados (idVentas,Producto_idProducto,Producto_nombreProducto,Producto_precioProducto,Empleados_idEmpleados,Sucursal_idSucursal)
values(new.idVentas, new.Producto_idProducto, new.Producto_nombreProducto, new.Producto_precioProducto, new.Empleados_idEmpleados, new.Sucursal_idSucursal);

create table if not exists bitacora(
id int not null auto_increment,
fecha datetime not null,
usuario_id varchar(45),
old_dato int,
new_dato int,
tipo_operacion varchar(45),
primary key(id));

create trigger insertar_log
after insert on producto
for each row
insert into bitacora (fecha, usuario_id, new_dato, tipo_operacion)
values (now(), session_user(), new.idProducto,new.nombreProducto, new.precioProductoVenta)


