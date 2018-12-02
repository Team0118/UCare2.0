--tabla categoria
create table categoria(
idcategoria int identity(1,1) primary key,
nombre varchar(50) not null unique,
descripcion text null,
estado bit default(1)
);

--tabla articulo
create table  articulo(
idarticulo int identity primary key,
idcategoria int not null,
codigo varchar(50) null,
nombre varchar(100) not null unique,
precio_venta decimal(11,2) not null,
stock int not null,
descripcion text,
estado bit default(1),
foreign key(idcategoria) references categoria(idcategoria)
);

--tabla persona
create table persona(
idpersona int identity primary key,
tipo_persona varchar(20) not null,
nombre varchar(100) not null,
tipo_documento varchar(20) null,
num_docuemnto varchar(20) null,
direccion text null,
telefono varchar(12) null,
correo text null
);

--tabla rol
create table rol(
idrol int identity primary key,
nombre varchar(30)not null,
descripcion text null,
estado bit default(1)
);

--tala usuario
create table usuario(
idusuario int identity primary key,
idrol int not null,
nombre varchar(100) not null,
tipo_documento varchar(20) null,
num_documento varchar(20) null,
direccion text null,
telefono varchar(12) null,
email varchar(70) not null,
password_hash varbinary not null,
password_salt varbinary not null,
estado bit default(1),
foreign key(idrol) references rol(idrol)
);

--table ingreso
create table ingreso(
idingreso int identity primary key,
idproveedor int not null,
idusuario int not null,
tipo_comprobante varchar(20) not null,
serie_comprobante varchar(7) null,
num_comprobante varchar(10) not null,
fecha_hora datetime not null,
impuesto decimal (4,2) not null,
total decimal(11,2) not null,
estado varchar(20) not null,
foreign key(idproveedor) references persona(idpersona),
foreign key(idusuario) references usuario(idusuario)
);

--tabla detalle_ingreso
create table detalle_ingreso(
iddetalle_ingreso int identity primary key,
idingreso int not null,
idarticulo int not null,
cantidad int not null,
precio decimal(11,2) not null,
foreign key (idingreso) references ingreso(idingreso) ON DELETE CASCADE, 
foreign key(idarticulo) references articulo(idarticulo)	
);

--tabla venta
create table venta(
idventa int identity primary key,
idcliente int not null,
idusuario int not null,
tipo_comprobante varchar(20) not null,
serie_comprobante varchar(7) null,
num_comprabante varchar(10) not null,
fecha_hora datetime not null,
impuesto decimal(4,2) not null,
total decimal(11,2) not null,
estado varchar(20) not null,
foreign key(idcliente) references persona(idpersona),
foreign key(idusuario) references usuario(idusuario)

);

--tabla detalle_venta
create table detalle_venta(
iddetalle_venta int identity primary key,
idventa int not null,
idarticulo int not  null,
cantidad int not null,
precio decimal(11,2) not null,
descuento decimal(11,2) not null
foreign key (idventa) references venta(idventa) ON DELETE CASCADE,
foreign key (idarticulo) references articulo(idarticulo)

);
