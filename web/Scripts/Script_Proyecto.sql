create database sist_ctrl_inv

create table proveedor (
nitproveedor varchar(15),
nombre varchar(150),
direccion varchar(150),
telefono varchar(15),
estatus varchar(2),
constraint PK_nitproveedor primary key(nitproveedor)
)

create table unidaddmedida (
idunidaddemedida numeric(10) identity(1,1),
nombre varchar(150),
descripcion varchar(150),
status varchar(2),
constraint PK_idunidaddemedida primary key(idunidaddemedida)
)


create table cliente  (
nitcliente varchar(15),
nombre varchar(150),
email varchar(150),
estatus varchar(2),
constraint PK_nitcliente primary key(nitcliente)
)



create table puesto   (
idpuesto numeric(10) identity(1,1),
nombre varchar(150),
email varchar(150),
sueldo numeric(8,2),
estatus varchar(2),
constraint PK_idpuesto primary key(idpuesto)
)

create table articulo    (
idarticulo numeric(10) identity(1,1),
idunidaddemedida numeric(10),
nombre varchar(150), 
descripcion varchar(150), 
stock numeric(8,0),
costo numeric(8,2),
estatus varchar(2),
constraint PK_idarticulo primary key(idarticulo),
constraint FK_idunidaddemedida foreign key(idunidaddemedida) references unidaddmedida(idunidaddemedida)
)

create table empleado     (
idempleado numeric(10) identity(1,1),
idpuesto numeric(10) ,
nombre varchar(150), 
direccion varchar(150), 
telefono varchar(15),
estatus varchar(2),
constraint PK_idempleado primary key(idempleado),
constraint FK_idpuesto foreign key(idpuesto) references puesto(idpuesto)
)



create table pedido (
idpedido numeric(10) identity(1,1),
idempleado numeric(10) ,
nitproveedor varchar(15),
fecha datetime,
total numeric(8,2),
constraint PK_idpedido primary key(idpedido),
constraint FK_pidempleado foreign key(idempleado) references empleado(idempleado),
constraint FK_pnitproveedor foreign key(nitproveedor) references proveedor(nitproveedor)
)




create table detllpedido   (
idpedido numeric(10),
idarticulo numeric(10) ,
cantidad numeric(8,0),
estatus varchar(2),
constraint FK_dpidpedido foreign key(idpedido) references pedido(idpedido),
constraint FK_dpidarticulo foreign key(idarticulo) references articulo(idarticulo)
)


create table venta   (
nofactura numeric(10) identity(1,1),
idempleado numeric(10) ,
nitcliente varchar(15),
fecha datetime,
total numeric(8,0),
constraint PK_vnofactura primary key(nofactura),
constraint FK_vidempleado foreign key(idempleado) references empleado(idempleado),
constraint FK_vnitcliente foreign key(nitcliente) references cliente(nitcliente)
)







create table detllventa (
nofactura numeric(10),
idarticulo numeric(10),
cantidad numeric(8,0),
estatus varchar(2),
constraint FK_dvnofactura foreign key(nofactura) references venta(nofactura),
constraint FK_dvidarticulo foreign key(idarticulo) references articulo(idarticulo)
)




create table kardex (
idkardex numeric(10) identity(1,1),
nofactura numeric(10),
idpedido numeric(10) ,
idarticulo numeric(10) ,
entrada numeric(2,0),
salida numeric(2,0),
existencia numeric(8,0),
fechaoperacion datetime,
estatus varchar(2),
constraint PK_kidkardex primary key(idkardex),
constraint FK_knofactura foreign key(nofactura) references venta(nofactura),
constraint FK_kidpedido foreign key(idpedido) references pedido(idpedido),
constraint FK_kidarticulo foreign key(idarticulo) references articulo(idarticulo)
)



create table usuario(
idusuario numeric(8,0) identity(1,1),
nombre varchar(150),
usuario varchar(20),
contraseña varchar(20),
estatus varchar(02),
constraint PK_usuario primary key(usuario),
)


create table sfacturas(
idfacturashab numeric(10) identity(1,1),
seriefactu varchar (5),
numerodefactuini numeric(10),
numerodefactufin numeric(10), 
fecha_habilitacion varchar (8),
estatus varchar(02),
constraint PK_sfidfacturashab primary key(idfacturashab),
)







************************************************************´pruebas **************************************


create table cliente_otra  (
nitcliente varchar(15),
nombre varchar(150),
email varchar(150),
estatus varchar(02),
constraint PK_nitcliente primary key(nitcliente)
)











