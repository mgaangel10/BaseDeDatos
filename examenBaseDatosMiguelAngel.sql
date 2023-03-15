drop table if exists producto cascade;
drop table if exists categoria cascade;
drop table if exists trabajador cascade;
drop table if exists pedido cascade;
drop table if exists detallepedido cascade;
drop table if exists comprador cascade;

create table producto (
cod_producto	serial,
	nombre	text not null,
	descripcion	text,
	pvp	numeric,
	categoria text,
	constraint pk_producto PRIMARY key (cod_producto),
	constraint ck_producto check (pvp > 0)
	
);

create table categoria(
id_categoria	text,
	nomnre	text not null,
	descripcion	text,
	CONSTRAINT pk_categoria PRIMARY key (id_categoria)
	
);
create table trabajador(
num_trabajador	smallserial,
	nombre_completo	text not null,
	email	varchar(320),
	cuenta_corriente	varchar(24),
	pass	varchar(12),
	constraint pk_trabjador_numtrab primary key (num_trabajador),
	constraint ck_trabajadorpass check (pass != '%_&'),
	constraint ck_trabajadorcuenta check (cuenta_corriente = 'ES%'),
	CONSTRAINT ck_trabajador check (email = '%@%')
);

create table pedido(
cod_pedido	serial,
	fecha_pedido	date not null,
	num_trabajador	smallserial,
	dni_comprador	text not  null,
	constraint pk_pedido_codpedido PRIMARY key (cod_pedido),
	constraint ck_pedido check (num_trabajador > 0)
	
	
);
create table detallepedido(
cod_pedido	serial,
	num_detalle	smallserial,
	cantidad	numeric,
	cod_producto	serial,
	precio	numeric,
	descuento numeric default 0,
	constraint pk_detallepedido_codped primary key (cod_pedido,num_detalle),
	
	constraint ck_detallepedidio check (cantidad > 0),
	constraint ck_precio check (precio > 0),
	CONSTRAINT ck_descuento CHECK (descuento > 0)
);
create table comprador (
dni		text,
	nombre_completo	text not null,
	email VARCHAR(320),
	direccion 	varchar(100),
	fecha_alta	date,
	constraint pk_dni primary key (dni),
	CONSTRAINT ck_comprador check (email = '%@%')
	
	
);

alter table producto 
add constraint fk_producto foreign key (categoria)
references categoria;

alter table pedido
add constraint fk_pedido foreign key (num_trabajador)
references trabajador;

alter table pedido
add constraint fk_pedido_dni foreign key (dni_comprador)
references comprador;

alter table detallepedido
add constraint fk_detallepedido foreign key (cod_producto)
references producto;

insert into comprador (dni,nombre_completo,email,direccion,fecha_alta) values ('123b','Fernando Fanegas','Fernando.fanegas@yahoo.com','aa','2022-11-19');
insert into producto values (1,'Tv Lg 55','mando magic remote',799,'electronica');
insert into tarbajador (1,'miguel de la cuadra','mcuadra@mitienda.com','Es00000000012345678','hola');
update detallepedido descuento = 0 where descuento = 0.15;
