DROP TABLE IF EXISTS vehiculo CASCADE;
DROP TABLE IF EXISTS lineaventa CASCADE;
DROP TABLE IF EXISTS coche CASCADE;
DROP TABLE IF EXISTS motocicleta CASCADE;
DROP TABLE IF EXISTS venta CASCADE;
DROP TABLE IF EXISTS cliente CASCADE;

create table vehiculo (
numBastidor	numeric not null,
	fechaFabri	date,
	matrucula	varchar(7) not null,
constraint pk_vehiculo_numBast primary Key (numBastidor)
);
create table coche(
numBastidor	smallserial,
	constraint pk_coche primary Key (numBastidor)
);
create table motocicleta(
numBastidor	smallserial,
	constraint pk_motocicleta primary Key (numBastidor)
);
create table lineaventa(
lineacod text not null,
	codventa	text,
	numBastidor	smallserial,
	pvp	numeric not null,
	constraint pk_lineaventa primary key(lineacod,codVenta)
	
);
create table venta (
codventa	text not null,
	codCliente	smallserial,
	fecha date,
	constraint pk_venta primary key(codventa)
);
create table cliente(
codCliente	numeric not null,
	nombre text not null,
	constraint pk_cliente primary key (codCliente)
);
alter table coche
add constraint fk_coche foreign key(numBastidor)
references vehiculo on delete cascade;

alter table motocicleta
add constraint fk_moto foreign key(numBastidor)
references vehiculo on delete cascade;

alter table lineaventa
add constraint fk_linea foreign key(codventa)
references venta on delete cascade;

alter table lineaventa
add constraint fk_linventa foreign key(numBastidor)
references vehiculo on delete cascade;

alter table venta
add constraint fk_venta foreign key(codCliente)
references cliente on delete cascade;


