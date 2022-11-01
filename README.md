# entrega2RobertoMatiasSQLCoderhouse



INDICE

1) Objetivo del proyecto

2) Diagrana de entidad – relación

3) Listado de tablas de la base de datos

4) Script de creación de base de datos y tablas

5) Paso a paso de inserción de datos

6) Creación de vistas

7) Creación de Funciones

8)  Creación de Stored Procedure

9)  Creación de Triggers



-----------------------------------------------------------------------------------------------------------------------------------------------



1) Objetivo del proyecyo: Mi base de datos se basa en una cadena de supermercados, el objetivo es poder llevar una buena cuenta de la mercaderia, precios, ganancias, stock principalmente.


2) El modelo del diagrama de mi base de datos llamada ´mydb´

3) Tablas:
compras: se guardan todos los datos de compras del local a sus proveedores por ejemplo.
cliente: se guardan los datos de cada uno de los clientes.
recuperacion_de_datos_borrados: es una tabla para cuando se borra acidentalmente un dato, se guarde aqui para que no se pierda.
descuentos: se guardan los datos de descuentos para aplicar a los productos.
bitacora:
sucursal: se guardan los datos de cada sucursal por separado.
producto:se guardan los datos de los productos comprados y vendidos.
ventas: se guardan los datos de cada venta.
proveedores: se guardan los datos de cada proveedor.
empleados: se guardan los datos de cada empleado.
insercion_de_productos: una tabla para insercion de datos.


4) La creacion de la base de datos la hice a traves del diagrama con workbench y luego la fui modificando manualmente para que vaya funcionando, de todas maneras dejo arriba el script.


5)  Lo que hice para poder subir los datos a la base fue lo siguiente:

a) realice una copia exacta de la tabla en excel de google
b) realice el llenado de los datos en la tabla
c) descargue la tabla con un formato .csv
d) Ingrese a Workbench a mi tabla ´mydb´
e) elegi mi tabla(similar a la que copie en excel)
f) le di al boton importar datos dentro la respectiva tabla(ejemplo: producto)
g) luego exporte los datos con el boton de al lado
h) guarde la exportacion como archivo sql INSERT statement
i) abri el archivo sql con block de notas
j) reemplazo las comillas dobles por el campo que quiero insertar(ejemplo: producto) 
abro workbench y debajo de :use mydb; pego los datos a insertar.






