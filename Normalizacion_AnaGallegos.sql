-- primero creamos un esquema de trabajo
create schema car_database authorization axnxrifz;


-- creamos la tabla de aseguradoras

create table car_database.aseguradoras(
	id_aseguradora varchar(20) not null, --PK
	nombre_aseguradora varchar(50) not null,
	comentario varchar(200)
);

alter table car_database.aseguradoras
add constraint id_aseguradora_PK primary key (id_aseguradora);

insert into car_database.aseguradoras (id_aseguradora, nombre_aseguradora) values('MAPFRE','MAPFRE');
insert into car_database.aseguradoras (id_aseguradora, nombre_aseguradora) values('MUTUA MADRILEÑA','MUTUA MADRILEÑA');
insert into car_database.aseguradoras (id_aseguradora, nombre_aseguradora) values('LINEA DIRECTA','LÍNEA DIRECTA');

-- Ahora creamos la tabla de pólizas y la unimos a la de aseguradoras

create table car_database.poliza(
	id_poliza varchar(20) not null, --PK
	f_inicio date not null,
	f_fin date default '01-01-1400',
	id_aseguradora varchar(50) not null,--FK > aseguradoras > id_aseguradora
	comentario varchar(200) 
);

alter table car_database.poliza
add constraint id_poliza_PK primary key (id_poliza);

alter table car_database.poliza
add constraint id_aseguradora_FK foreign key (id_aseguradora)
references car_database.aseguradoras(id_aseguradora);

insert into car_database.poliza (id_poliza, f_inicio, f_fin, id_aseguradora) values('11111','01-02-2022','01-02-2023','MAPFRE');
insert into car_database.poliza (id_poliza, f_inicio, f_fin, id_aseguradora) values('22222','01-03-2022','01-03-2023','MUTUA MADRILEÑA');
insert into car_database.poliza (id_poliza, f_inicio, f_fin, id_aseguradora) values('33333','01-04-2022','01-04-2023','LINEA DIRECTA');
insert into car_database.poliza (id_poliza, f_inicio, f_fin, id_aseguradora) values('44444','01-05-2022','01-05-2023','MAPFRE');
insert into car_database.poliza (id_poliza, f_inicio, f_fin, id_aseguradora) values('55555','01-06-2022','01-06-2023','MUTUA MADRILEÑA');
insert into car_database.poliza (id_poliza, f_inicio, f_fin, id_aseguradora) values('66666','01-07-2022','01-07-2023','MUTUA MADRILEÑA');
insert into car_database.poliza (id_poliza, f_inicio, f_fin, id_aseguradora) values('77777','01-07-2022','01-07-2023','MUTUA MADRILEÑA');
insert into car_database.poliza (id_poliza, f_inicio, f_fin, id_aseguradora) values('88888','01-07-2022','01-07-2023','MUTUA MADRILEÑA');
insert into car_database.poliza (id_poliza, f_inicio, f_fin, id_aseguradora) values('99999','01-05-2022','01-05-2023','MAPFRE');
insert into car_database.poliza (id_poliza, f_inicio, f_fin, id_aseguradora) values('10100','01-04-2022','01-04-2023','LINEA DIRECTA');
insert into car_database.poliza (id_poliza, f_inicio, f_fin, id_aseguradora) values('11011','01-04-2022','01-04-2023','LINEA DIRECTA');




-- Ahora, empezamos con COCHES 
-- tipo de color

create table car_database.colors(
	id_color varchar(20) not null, --PK
	color_name varchar(50) not null,
	comentario varchar(200)
);


alter table car_database.colors
add constraint id_color_PK primary key (id_color);

insert into car_database.colors (id_color, color_name) values('ROJO','ROJO');
insert into car_database.colors (id_color, color_name) values('AZUL','AZUL');
insert into car_database.colors (id_color, color_name) values('VERDE','VERDE');
insert into car_database.colors (id_color, color_name) values('AMARILLO','AMARILLO');


-- tipo de modelo
create table car_database.grupo(
	id_grupo varchar(20) not null primary key, --PK
	grupo varchar(20) not null,
	comentario varchar(200)
);

insert into car_database.grupo (id_grupo, grupo) values('PSA','PSA');
insert into car_database.grupo (id_grupo, grupo, comentario) values('VW','VOLKSWAGEN', 'CONVENIO 10% DE DESCUENTO');

create table car_database.marca(
	id_marca varchar(4) not null primary key, --PK
	marca varchar(20) not null,
	id_grupo varchar(20) not null, --> FK > grupo > id_grupo
	comentario varchar(200)
);


alter table car_database.marca
add constraint id_grupo_FK foreign key (id_grupo)
references car_database.grupo(id_grupo);

insert into car_database.marca (id_marca, marca, id_grupo) values('CITR','CITROEN','PSA');
insert into car_database.marca (id_marca, marca, id_grupo) values('PEUG','PEUGEOT','PSA');
insert into car_database.marca (id_marca, marca, id_grupo) values('AUDI','AUDI','VW');
insert into car_database.marca (id_marca, marca, id_grupo) values('VOLW','VOLKS WAGEN','VW');


create table car_database.modelos(
	id_modelo varchar(20) not null primary key , --PK
	id_marca varchar(20) not null, --FK > marca > id_marca
	modelo varchar(100) not null,
	comentario varchar(200)
	
);


alter table car_database.modelos
add constraint id_marca_FK foreign key (id_marca)
references car_database.marca(id_marca);


insert into car_database.modelos (id_modelo, id_marca, modelo) values('PSA_C_C3','CITR','C3');
insert into car_database.modelos (id_modelo, id_marca, modelo) values('PSA_P_208','PEUG','208');
insert into car_database.modelos (id_modelo, id_marca, modelo) values('PSA_P_EXP','PEUG','EXPERT');
insert into car_database.modelos (id_modelo, id_marca, modelo) values('VW_V_GOLF','VOLW','GOLF');
insert into car_database.modelos (id_modelo, id_marca, modelo) values('VW_A_TT','AUDI','TT');

-- hacemos la tabla COCHES
create table car_database.coches(
	id_coche SERIAL PRIMARY KEY, -- PK
	id_modelo varchar(20) not null, --PK, FK
	matricula varchar(100) not null,
	id_color varchar(100) not null, -- colors > id_color
	f_compra date not null,
	kilometros varchar(10) not null,
	id_poliza varchar(100) not null, -- poliza > id_poliza
	comentario varchar(200)
	
);


alter table car_database.coches
add constraint id_modelo_FK foreign key (id_modelo)
references car_database.modelos(id_modelo);

alter table car_database.coches
add constraint id_color_FK foreign key (id_color)
references car_database.colors(id_color);

alter table car_database.coches
add constraint id_poliza_FK foreign key (id_poliza)
references car_database.poliza(id_poliza);

insert into car_database.coches (id_modelo, matricula,id_color,f_compra,kilometros,id_poliza) values('PSA_C_C3','0000XXX','ROJO','01-01-2020','50000','11111');
insert into car_database.coches (id_modelo, matricula,id_color,f_compra,kilometros,id_poliza) values('PSA_P_208','1111BBB','AZUL','01-01-2020','40000','22222');
insert into car_database.coches (id_modelo, matricula,id_color,f_compra,kilometros,id_poliza) values('VW_V_GOLF','2222CCC','ROJO','01-01-2020','100000','33333');
insert into car_database.coches (id_modelo, matricula,id_color,f_compra,kilometros,id_poliza) values('VW_A_TT','3333DDD','ROJO','01-01-2020','2000','44444');
insert into car_database.coches (id_modelo, matricula,id_color,f_compra,kilometros,id_poliza) values('PSA_P_EXP','4444DDD','ROJO','01-01-2020','2000','66666');
insert into car_database.coches (id_modelo, matricula,id_color,f_compra,kilometros,id_poliza) values('PSA_P_EXP','5555CFD','ROJO','01-01-2020','2000','77777');
insert into car_database.coches (id_modelo, matricula,id_color,f_compra,kilometros,id_poliza) values('PSA_C_C3','6666QRD','VERDE','01-01-2020','2000','88888');
insert into car_database.coches (id_modelo, matricula,id_color,f_compra,kilometros,id_poliza) values('PSA_C_C3','7777TGR','AMARILLO','01-01-2020','2000','99999');
insert into car_database.coches (id_modelo, matricula,id_color,f_compra,kilometros,id_poliza) values('PSA_C_C3','8888PLR','ROJO','01-01-2020','2000','10100');
insert into car_database.coches (id_modelo, matricula,id_color,f_compra,kilometros,id_poliza) values('PSA_P_208','9999LML','ROJO','01-01-2020','2000','11011');



-- Empezamos con REVISIONES -------------

-- Tipo de moneda
create table car_database.moneda(
	id_moneda varchar(20) not null, --PK
	moneda varchar(50) not null
);

alter table car_database.moneda
add constraint id_moneda_PK primary key (id_moneda);

insert into car_database.moneda (id_moneda, moneda) values('EUR','EURO');
insert into car_database.moneda (id_moneda, moneda) values('USD','DOLARES ESTADOUNIDENSES');

-- Creamos la tabla de revisiones

create table car_database.revisiones(
	id_revision SERIAL primary key, --PK
	id_coche SERIAL not null, -- FK > coches > id_coche
	f_revision date not null,
	kilometros_rev varchar(50) not null,
	importe varchar(50) not null,
	id_moneda varchar(50) not null default 'EUR', --FK > moneda > id_moneda
	comentario varchar(200)
);



alter table car_database.revisiones
add constraint id_moneda_FK foreign key (id_moneda)
references car_database.moneda(id_moneda);

alter table car_database.revisiones
add constraint id_coche_FK foreign key (id_coche)
references car_database.coches(id_coche);

insert into car_database.revisiones (id_coche, f_revision,kilometros_rev,importe,id_moneda) values('1','01-06-2020','2000','50','EUR');
insert into car_database.revisiones (id_coche, f_revision,kilometros_rev,importe,id_moneda) values('1','01-12-2020','50000','70','EUR');
insert into car_database.revisiones (id_coche, f_revision,kilometros_rev,importe,id_moneda) values('2','01-06-2020','30000','50','EUR');
insert into car_database.revisiones (id_coche, f_revision,kilometros_rev,importe,id_moneda) values('2','01-12-2020','40000','60','USD');
insert into car_database.revisiones (id_coche, f_revision,kilometros_rev,importe,id_moneda) values('3','01-06-2020','50000','80','USD');
insert into car_database.revisiones (id_coche, f_revision,kilometros_rev,importe,id_moneda) values('3','01-12-2020','100000','40','EUR');
insert into car_database.revisiones (id_coche, f_revision,kilometros_rev,importe,id_moneda) values('4','01-06-2020','2000','50','EUR');
insert into car_database.revisiones (id_coche, f_revision,kilometros_rev,importe,id_moneda) values('5','01-06-2020','2000','50','EUR');
insert into car_database.revisiones (id_coche, f_revision,kilometros_rev,importe,id_moneda) values('6','01-12-2020','50000','70','EUR');
insert into car_database.revisiones (id_coche, f_revision,kilometros_rev,importe,id_moneda) values('7','01-06-2020','30000','50','EUR');
insert into car_database.revisiones (id_coche, f_revision,kilometros_rev,importe,id_moneda) values('8','01-12-2020','40000','60','USD');
insert into car_database.revisiones (id_coche, f_revision,kilometros_rev,importe,id_moneda) values('9','01-06-2020','50000','80','USD');
insert into car_database.revisiones (id_coche, f_revision,kilometros_rev,importe,id_moneda) values('9','01-12-2020','100000','40','EUR');
insert into car_database.revisiones (id_coche, f_revision,kilometros_rev,importe,id_moneda) values('10','01-06-2020','2000','50','EUR');
