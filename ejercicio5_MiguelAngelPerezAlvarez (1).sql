 DROP TABLE IF EXISTS empresas CASCADE;
DROP TABLE IF EXISTS alumno CASCADE;
DROP TABLE IF EXISTS alumno_asisten CASCADE;
DROP TABLE IF EXISTS curso CASCADE;
DROP TABLE IF EXISTS profesor CASCADE;
DROP TABLE IF EXISTS tipo_curso CASCADE;

CREATE TABLE empresas(
	cif		text,
	nombre	text,
	direccion	text,
	telefono	text,

	CONSTRAINT pk_empresa PRIMARY KEY (cif)
);




CREATE TABLE alumno(
	dni 			text,
	nombre	text,
	direccion	text,
	telefono	text,
	edad 		numeric,
	empresa	text,
	
	CONSTRAINT pk_alumno PRIMARY KEY (dni)
);


CREATE TABLE alumno_asisten(
	dni 			text,
	n_concreto		int,
	
	CONSTRAINT pk_alumnoasiten PRIMARY KEY (dni,n_concreto)
	
);
CREATE TABLE curso(
	n_concreto	int,
	fecha_inicio	date,
	fecha_fin	date,
	dni_profesor	text,
	tipo_curso	int,
	constraint pk_curso	primary key(n_concreto)
);
CREATE TABLE profesor(
	dni		text,
	nombre	text,
	apellido	text,
	telefono	text,
	direccion	text,
	constraint pk_profesor primary key (dni)
);

insert into profesor(dni,nombre,apellido,telefono,direccion)VALUES
('12123b','luis','perez','12354667','madrid');
CREATE TABLE tipo_curso(
	cod_curso	int,
	duracion	int,
	programa	text,
	titulo		int,
	constraint pk_tipocurso primary key (cod_curso)
);
alter table alumno
add constraint fk_empresa foreign key (empresa)
references empresas;

alter table alumno_asisten
add constraint fk_dnni foreign key(dni)
references alumno;

alter table alumno_asisten
add constraint fk_nconcreto foreign key(n_concreto)
references curso;

alter table curso
add constraint fk_dniprofe foreign key (dni_profesor)
references profesor;

alter table curso 
add constraint fk_codcurso foreign key (tipo_curso)
references tipo_curso;
 
 select *
 from empresas;
 
 
 select * 
 from profesor;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 