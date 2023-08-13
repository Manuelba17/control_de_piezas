-- Borramos las tablas si existen
drop table if exists cantidades_x_pieza;
drop table if exists proveedores;
drop table if exists piezas;
drop table if exists categorias;


-- Creando tabla de proveedores

create table proveedores (
	codigo_proveedor serial primary key,
	nombre varchar(30) not null,
	direccion varchar(30) not null,
	ciudad varchar(15) not null,
	provincia varchar(15) not null
);

-- Creando tabla de categorias

create table categorias (
	categoria_id serial primary key,
	nombre varchar(30) not null
);


-- Creando tabla de piezas

create table piezas (
	pieza_id serial primary key,
	nombre varchar(30) not null,
	color varchar(15) not null,
	precio float not null,
	categoria_id INT not null,
	foreign key (categoria_id) references categorias(categoria_id)
	
);

-- Creando tabla de cantidades por pieza

create table cantidades_x_pieza (
	number_id serial primary key,
	codigo_proveedor int not null,
	pieza_id int not null,
	cantidad int not null,	
	fecha timestamp not null,
	foreign key (codigo_proveedor) references proveedores(codigo_proveedor),
	foreign key (pieza_id) references piezas(pieza_id)	
	);
	

	
	
	
-- insertando data a la tabla proveedores

insert into proveedores (codigo_proveedor, nombre, direccion, ciudad, provincia) values (1, 'Sheet Metal Worker', '3046 Moulton Junction', 'Montgomery', 'Alabama'),
(2, 'Brickmason', '946 Mayer Lane', 'Montgomery', 'Alabama'),
(3, 'Equipment Operator', '00 Reindahl Terrace', 'Lexington', 'Kentucky'),
(4, 'Plumber', '196 Lerdahl Terrace', 'Tuscaloosa', 'Alabama'),
(5, 'Tile Setter', '0692 Stoughton Center', 'London', 'Kentucky');

-- insertando data a la tabla categorias

insert into categorias values (1, 'metal'),
(2, 'hierro'),
(3, 'cobre'),
(4, 'madera'),
(5, 'oro');


-- insertando data a la tabla piezas

insert into piezas (pieza_id, nombre, color, precio, categoria_id) values (1, 'FINASTERIDE', 'Purple', 91, 1),
(2, 'Antibacterial Hand Towelettes', 'Blue', 88, 2),
(3, 'GILTUSS PEDIATRIC', 'Red', 40, 3),
(4, 'Thyroid Rhythm', 'Fuscia', 86, 4),
(5, 'Childrens Ibuprofen', 'Pink', 27, 5);


-- insertando dara a la tabla cantidades_x_pieza

insert into cantidades_x_pieza values (1, 1, 1, 20, '13/08/2023 18:10:00'),
(2, 2, 1, 10, '13/08/2023 18:10:00'),
(3, 1, 1, 5, '10/07/2023 6:10:30'),
(4, 5, 5, 1, '05/08/2023 17:10:00'),
(5, 3, 3, 8, '01/08/2023 18:00:00'),
(6, 4, 2, 50, '13/06/2023 18:10:00'),
(7, 2, 4, 100, '08/08/2023 18:10:00'),
(8, 1, 4, 200, '13/08/2023 18:29:00')


select * from proveedores
select * from categorias
select * from piezas

-- Realizando una consulta de ejemplo

select pr.nombre, cp.fecha, cp.cantidad, pi.nombre, pi.color, pi.precio, ct.nombre from cantidades_x_pieza cp join proveedores as pr on cp.codigo_proveedor = pr.codigo_proveedor
join piezas as pi on cp.pieza_id = pi.pieza_id
join categorias as ct on pi.categoria_id = ct.categoria_id
order by cp.cantidad desc;



