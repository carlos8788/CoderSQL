DROP SCHEMA IF EXISTS vuelos_comerciales;
CREATE SCHEMA IF NOT EXISTS vuelos_comerciales;
use vuelos_comerciales;

CREATE TABLE IF NOT EXISTS pasajeros (
    id_pasajero INT NOT NULL AUTO_INCREMENT,
    nombre_pasajero VARCHAR(45) NOT NULL,
    apellido_pasajero VARCHAR(45) NOT NULL,
    domicilio VARCHAR(60) NULL,
    telefono INT,
    PRIMARY KEY (id_pasajero)
);

CREATE TABLE IF NOT EXISTS pasajeros_frecuentes (
    id_pas_fre INT NOT NULL AUTO_INCREMENT,
    id_pasajero INT NOT NULL,
    cantidad_pasajes INT NOT NULL,
    PRIMARY KEY (id_pas_fre),
    FOREIGN KEY (id_pasajero) 
    REFERENCES pasajeros(id_pasajero)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS empleados (
    id_empleado VARCHAR(20) NOT NULL UNIQUE,
    posicion VARCHAR(45) NOT NULL,
    nombre_empleado VARCHAR(45) NOT NULL,
    apellido_empleado VARCHAR(45) NOT NULL,
    antiguedad INT NOT NULL,
    sueldo REAL NOT NULL,
    PRIMARY KEY (id_empleado)
);


CREATE TABLE IF NOT EXISTS avion (
    id_avion INT NOT NULL AUTO_INCREMENT,
    capacidad INT NOT NULL,
    modelo VARCHAR(150) NOT NULL,
    anio_creacion INT NOT NULL,
    PRIMARY KEY (id_avion)
);

CREATE TABLE IF NOT EXISTS punto (
    id_punto INT NOT NULL UNIQUE,
    nombre_ciudad VARCHAR(100),
    PRIMARY KEY (id_punto)
);

CREATE TABLE IF NOT EXISTS rutas (
    id_ruta INT NOT NULL AUTO_INCREMENT,
    origen INT NOT NULL,
    destino INT NOT NULL,
    distancia DECIMAL(8,3) NOT NULL,
    PRIMARY KEY (id_ruta),
    FOREIGN KEY (origen)
    REFERENCES punto(id_punto)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (destino)
    REFERENCES punto(id_punto)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS pasaje (
    id_pasaje INT NOT NULL AUTO_INCREMENT,
    id_pasajero INT NOT NULL,
    id_vuelo INT NOT NULL,
    pas_fre BOOLEAN NOT NULL,
    asiento INT NOT NULL,
    precio DECIMAL(8,3) NOT NULL,
    PRIMARY KEY (id_pasaje),
    FOREIGN KEY (id_pasajero) 
    REFERENCES pasajeros(id_pasajero)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS vuelo (
    id_vuelo INT NOT NULL AUTO_INCREMENT,
    id_azafata VARCHAR(20) NOT NULL,
    id_piloto VARCHAR(20) NOT NULL,
    id_ruta INT NOT NULL,
    id_avion INT NOT NULL,
    horario_vuelo VARCHAR(100) NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY (id_vuelo),
    FOREIGN KEY (id_piloto) 
    REFERENCES empleados(id_empleado)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (id_azafata) 
    REFERENCES empleados(id_empleado)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (id_ruta) 
    REFERENCES rutas(id_ruta)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (id_avion) 
    REFERENCES avion(id_avion)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);



CREATE TABLE IF NOT EXISTS taller (
    id_taller INT NOT NULL AUTO_INCREMENT,
    id_punto INT NOT NULL,
    id_empleado VARCHAR(20) NOT NULL,
    telefono INT NOT NULL,
    PRIMARY KEY (id_taller),
    FOREIGN KEY (id_punto) 
    REFERENCES punto(id_punto)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (id_empleado) 
    REFERENCES empleados(id_empleado)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS mantenimiento (
    id_mantenimiento INT NOT NULL AUTO_INCREMENT,
    id_avion INT NOT NULL,
    id_taller INT NOT NULL,
    motivo VARCHAR(255),
    fecha DATE,
    tipo varchar(100),
    PRIMARY KEY (id_mantenimiento),
    FOREIGN KEY (id_avion) 
    REFERENCES avion(id_avion)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (id_taller) 
    REFERENCES taller(id_taller)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS oficina (
    id_oficina INT NOT NULL AUTO_INCREMENT,
    id_punto INT NOT NULL,
    id_empleado VARCHAR(20) NOT NULL,
    horario_ap VARCHAR(50),
    horario_cie VARCHAR(50),
    direccion VARCHAR(100),
    PRIMARY KEY (id_oficina),
    FOREIGN KEY (id_punto) 
    REFERENCES punto(id_punto)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (id_empleado) 
    REFERENCES empleados(id_empleado)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS proveedores (
    id_proveedor INT NOT NULL AUTO_INCREMENT,
    id_punto INT NOT NULL,
    nombre VARCHAR(50),
    servicio VARCHAR(255),
    PRIMARY KEY (id_proveedor),
    FOREIGN KEY (id_punto) 
    REFERENCES punto(id_punto)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS destinos_frecuentes (
    id_dest_frec INT NOT NULL AUTO_INCREMENT,
    id_punto INT NOT NULL,
    cantidad_vuelos INT NOT NULL,
    PRIMARY KEY (id_dest_frec),
    FOREIGN KEY (id_punto) 
    REFERENCES punto(id_punto)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

ALTER TABLE pasaje 
ADD FOREIGN KEY (id_vuelo) 
REFERENCES vuelo(id_vuelo)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- INSERCIÓN DE DATOS
##############################################################


INSERT INTO avion (capacidad,modelo,anio_creacion)
VALUES
(58,"Airbus320",1980),
(54,"Boeing747",2007),
(50,"Airbus340",2000),
(76,"Boeing747-F-Freighter",1987),
(84,"Airbus300-600ST",2007),
(100,"Boeing737",2000),
(87,"Boeing747-400ERF",1985),
(70,"Airbus319",2014),
(73,"Boeing747-F-Freighter",2022),
(65,"Boeing777-200",1985),
(83,"Boeing747-400ERF",1999),
(62,"Airbus319",1984),
(60,"Boeing747",2003),
(50,"Boeing747-F-Freighter",1980),
(84,"Boeing737",2002),
(74,"Airbus321",1996),
(87,"Airbus319",2018),
(74,"Airbus320",1991),
(68,"Airbus321",2011),
(96,"Boeing747",1995);

INSERT INTO pasajeros (nombre_pasajero,apellido_pasajero,domicilio, telefono)
VALUES
('Chrissie', 'Burmaster', '29842 Schmedeman Crossing', 17606014),
('Alister', 'Beazer', '13 Harper Lane', 64976935),
('Osbourne', 'Fernao', '20 Debs Street', 79628857),
('Francklin', 'Urien', '2 Westridge Park', 63188940),
('Beret', 'Anderson', '5744 Badeau Hill', 16591969),
('Zechariah', 'Keener', '0206 Tennyson Park', 75552987),
('Derrik', 'Fynes', '58355 Kim Center', 95462894),
('Lettie', 'Ord', '9759 Westerfield Parkway', 70049196),
('Ediva', 'Twiggs', '10459 American Ash Avenue', 91133107),
('Albertine', 'Pulster', '4 Continental Drive', 84582631),
('Karilynn', 'Wibberley', '5 Dunning Crossing', 40998664),
('Ketti', 'Hinrichsen', '28 Sutherland Crossing', 11764477),
('Giacopo', 'Szymanek', '34 Cambridge Junction', 45883265),
('Richard', 'Feehan', '80683 Forest Dale Parkway', 66304315),
('Liuka', 'Refford', '0824 Hanson Crossing', 18848988),
('Cher', 'Haylett', '1087 Hermina Lane', 55442304),
('Niki', 'Pescud', '271 Bunker Hill Hill', 12243173),
('Keith', 'Tooley', '8 Sycamore Terrace', 85213217),
('Elia', 'Guynemer', '827 Lotheville Center', 20072711),
('Millard', 'Dollard', '62 Bonner Drive', 76229058);


INSERT INTO empleados (id_empleado, posicion, nombre_empleado, apellido_empleado, antiguedad, sueldo)
VALUES
('OF01', 'Administrativo', 'Odille', 'MacCafferky', 25, 9594),
('PI02', 'Piloto', 'Verney', 'Hug', 27, 2388),
('PI03', 'Piloto', 'Janeta', 'Matzl', 14, 5475),
('OF04', 'Administrativo', 'Cammi', 'Dyzart', 24, 5876),
('PI05', 'Piloto', 'Florance', 'Beeson', 19, 9140),
('ST06', 'Técnico', 'Virgie', 'Lenoir', 17, 6133),
('PI07', 'Piloto', 'Richardo', 'Prantoni', 21, 6013),
('ST08', 'Técnico', 'Delcine', 'Siflet', 16, 8777),
('OF09', 'Administrativo', 'Brit', 'Klossmann', 30, 6510),
('AZ010', 'Azafata', 'Cookie', 'Filpo', 10, 4118),
('OF011', 'Administrativo', 'Mellisa', 'Gatfield', 3, 8440),
('AZ012', 'Azafata', 'Tanya', 'Iacovini', 24, 1982),
('AZ013', 'Azafata', 'Jennie', 'McCaskill', 3, 5375),
('AZ014', 'Azafata', 'Reinold', 'Bilsborrow', 2, 9118),
('AZ015', 'Azafata', 'Gaylor', 'Stuther', 10, 7252),
('AZ016', 'Azafata', 'Jonell', 'Gabbett', 9, 7511),
('ST017', 'Técnico', 'Richy', 'Shannon', 17, 1345),
('ST018', 'Técnico', 'Dorotea', 'Coneybeare', 28, 5573),
('PI019', 'Piloto', 'Karlis', 'Howgill', 21, 9476),
('AZ020', 'Azafata', 'Kirbie', 'Duffin', 18, 8408);

INSERT INTO punto (id_punto, nombre_ciudad)
VALUES
( 1,"Buenos Aires"),
( 2,"Catamarca"),
( 3,"Chaco"),
( 4,"Chubut"),
( 5,"Córdoba"),
( 6,"Corrientes"),
( 7,"Entre Ríos"),
( 8,"Formosa"),
( 9,"Jujuy"),
( 10,"La Pampa"),
( 11,"La Rioja"),
( 12,"Mendoza"),
( 13,"Misiones"),
( 14,"Neuquén"),
( 15,"Río Negro"),
( 16,"Salta"),
( 17,"San Juan"),
( 18,"San Luis"),
( 19,"Santa Cruz"),
( 20,"Santa Fe"),
( 21,"Santiago del Estero"),
( 22,"Tierra del Fuego"),
( 23,"Tucumán"),
( 24,"Bolivia - Sucre"),
( 25,"Brasil - Brasilia"),
( 26,"Chile - Santiago de Chile"),
( 27,"Colombia - Bogotá"),
( 28,"Ecuador - Quito"),
( 29,"Paraguay - Asunción"),
( 30,"Perú - Lima"),
( 31,"Surinam - Parabarimo"),
( 32,"Trinidad y Tobago - Puerto España"),
( 33,"Uruguay - Montevideo"),
( 34,"Venezuela - Caracas");

INSERT INTO rutas (origen,destino,distancia)
VALUES
(16, 17, 1127.9),
(16, 28, 4227.5),
(25, 23, 2967.2),
(13, 1, 1142.1),
(25, 29, 1826.2),
(30, 1, 3156),
(14, 11, 1067),
(9, 13, 1081),
(34, 7, 7048.3),
(16, 17, 811),
(1, 11, 978),
(22, 9, 3708),
(3, 12, 1121.5),
(25, 12, 3519.7),
(7, 21, 723),
(23, 30, 2756),
(34, 27, 2149),
(1, 4, 1081),
(17, 8, 1169),
(32, 23, 4187.7);


INSERT INTO vuelo (id_azafata, id_piloto, id_ruta, id_avion, horario_vuelo, fecha)
VALUES
('AZ013', 'PI05', 4, 9, '15:06', '2023-01-01'),
('AZ013', 'PI03', 17, 9, '19:09', '2023-01-02'),
('AZ014', 'PI05', 14, 6, '12:39', '2023-01-03'),
('AZ015', 'PI05', 3, 2, '11:58', '2023-01-07'),
('AZ012', 'PI03', 18, 5, '13:22', '2023-01-08'),
('AZ014', 'PI019', 15, 14, '20:25', '2023-01-09'),
('AZ015', 'PI02', 11, 17, '17:48', '2023-01-10'),
('AZ010', 'PI05', 8, 16, '13:48', '2023-01-11'),
('AZ020', 'PI019', 18, 2, '13:02', '2023-01-12'),
('AZ013', 'PI07', 12, 19, '12:10', '2023-01-30');

INSERT INTO pasaje (id_pasajero, id_vuelo, pas_fre, asiento, precio)
VALUES
(10, 1, 1, 37, 893),
(8, 7, 1, 36, 268),
(11, 6, 0, 6, 658),
(6, 6, 1, 31, 264),
(8, 2, 1, 4, 696),
(7, 4, 1, 17, 712),
(20, 5, 0, 12, 271),
(12, 2, 0, 28, 601),
(6, 4, 1, 31, 924),
(3, 10, 0, 25, 439),
(1, 2, 0, 29, 409),
(14, 10, 1, 11, 862),
(10, 7, 1, 19, 639),
(7, 7, 0, 39, 285),
(19, 9, 1, 6, 640),
(1, 2, 1, 7, 541),
(7, 7, 0, 5, 574),
(7, 4, 0, 25, 957),
(3, 2, 0, 10, 999),
(4, 4, 0, 23, 571);

INSERT INTO taller (id_punto, id_empleado, telefono)
VALUES
(32, 'ST06', 98172567),
(23, 'ST018', 55631803),
(16, 'ST018', 81709608),
(19, 'ST018', 22673187),
(24, 'ST017', 24789875),
(12, 'ST06', 65874321),
(27, 'ST06', 62296993),
(22, 'ST06', 43545850),
(17, 'ST017', 72376679),
(13, 'ST017', 84409428);

INSERT INTO mantenimiento (id_avion, id_taller, motivo, fecha, tipo)
VALUES 
(16, 9, 'Estético', '2023-10-02', 'Correctivo'),
(19, 3, 'Combustión', '2023-03-26', 'Correctivo'),
(20, 10, 'Radar', '2023-07-16', 'Correctivo'),
(17, 7, 'Controles', '2023-05-08', 'Preventivo'),
(18, 1, 'Motores', '2023-09-24', 'Correctivo'),
(9, 4, 'Estético', '2023-01-23', 'Preventivo'),
(8, 2, 'Radar', '2023-06-22', 'Preventivo'),
(20, 10, 'Radar', '2023-03-20', 'Preventivo'),
(13, 2, 'Motores', '2023-08-06', 'Preventivo'),
(5, 10, 'Eléctrico', '2023-05-04', 'Correctivo');

INSERT INTO oficina (id_punto, id_empleado, horario_ap, horario_cie, direccion)
VALUES
(3, 'OF01', '09:00', '18:00', '1350 Magna. Street'),
(1, 'OF04', '10:00', '17:00', 'Ap #626-944 Diam Rd.'),
(6, 'OF09', '09:00', '17:00', 'P.O. Box 711, 3899 Risus. Rd.'),
(15, 'OF011', '10:00', '17:00', '354-1464 Auctor Street');

INSERT INTO proveedores (id_punto, nombre, servicio)
VALUES
(10, 'YPF', 'Combustible'),
(18, 'Shell', 'Combustible'),
(9, 'Arcor', 'Comestibles'),
(13, 'Pepsi', 'Comestibles'),
(4, 'Ledesma', 'Librería'),
(15, 'Dell', 'Computación'),
(10, 'Telas LD', 'Indumentaria'),
(14, 'Gativideo', 'Entretenimiento'),
(9, 'Grupo Queruclor', 'Limpieza');

-- CREACIÓN DE VISTAS
##############################################################

-- Vista que muestra los pilotos

CREATE OR REPLACE VIEW pilotos AS
SELECT DISTINCT id_empleado, nombre_empleado, apellido_empleado
FROM empleados
WHERE id_empleado like 'PI%';

-- Vista que muestra pasajeros con pasaje comprado
CREATE OR REPLACE VIEW pasajeros_pasaje AS
SELECT DISTINCT nombre_pasajero, apellido_pasajero 
FROM pasajeros
INNER JOIN pasaje ON pasajeros.id_pasajero IN(pasaje.id_pasajero);

-- Vista que muestra en detalle el vuelo programado
CREATE OR REPLACE VIEW detalle_vuelo AS
SELECT horario_vuelo, fecha, 
(SELECT nombre_ciudad 
FROM punto
WHERE id_punto = 
(SELECT origen
	FROM rutas
	WHERE vuelo.id_ruta = rutas.id_ruta)) origen,
(SELECT nombre_ciudad 
FROM punto
WHERE id_punto =
(SELECT destino
	FROM rutas
	WHERE vuelo.id_ruta = rutas.id_ruta)) destino,
(SELECT concat(nombre_empleado, " " , apellido_empleado) 
	FROM empleados
    WHERE vuelo.id_piloto = empleados.id_empleado) piloto
FROM vuelo;

-- Vista que muestra el nombre de los pasajes que fueron comprados
CREATE OR REPLACE VIEW detalle_pasaje 
AS
SELECT 
asiento,
	(SELECT DISTINCT CONCAT(nombre_pasajero, " ", apellido_pasajero)
    FROM pasajeros
    INNER JOIN vuelo ON pasaje.id_pasajero=pasajeros.id_pasajero) pasajero,
    id_vuelo
FROM pasaje;

-- Vista de aviones que no tienen vuelo programado

CREATE OR REPLACE VIEW aviones_sin_vuelo
AS
SELECT DISTINCT id_avion, modelo
FROM avion
WHERE id_avion NOT IN (SELECT id_avion
							FROM vuelo);


-- CREACIÓN DE FUNCIONES
##############################################################

DROP FUNCTION IF EXISTS vuelos_asignados;
DELIMITER $$
-- Funcion que recibe como parametro un ID y busca si el avion de ese ID tiene algún vuelo asignado
CREATE FUNCTION vuelos_asignados(id INT) RETURNS VARCHAR(100)
DETERMINISTIC
READS SQL DATA
BEGIN
DECLARE vuelos INT;
SELECT count(*) FROM vuelo WHERE id_avion = id INTO vuelos;
IF vuelos = 1 THEN
	RETURN concat('el avion tiene ', vuelos, ' vuelo asignado');
elseif vuelos = 0 THEN
	RETURN 'El avion no tiene vuelos asignados';
elseIF vuelos > 1 THEN
	RETURN concat('el avion tiene ', vuelos, ' vuelos asignados');
END IF;
END
$$
DELIMITER ;
-- select vuelos_asignados(7) as vuelo_asignado;


-- Funcion que recibe como parametro el ID del vuelo y devuelve el nombre completo del piloto que va a pilotar el avion
DROP FUNCTION IF EXISTS piloto_del_avion;
DELIMITER $$
CREATE FUNCTION piloto_del_avion(id INT) RETURNS VARCHAR(100)
DETERMINISTIC
READS SQL DATA
BEGIN
RETURN (SELECT concat(nombre_empleado, ' ' ,apellido_empleado)
FROM empleados WHERE id_empleado = (SELECT id_piloto FROM vuelo WHERE id_vuelo=id));

END
$$
DELIMITER ;
-- select piloto_del_avion(9) as vuelo_asignado;

-- CREACIÓN DE STORED PROCEDURES
##############################################################
/*
Esta Stored Procedure ordena la tabla pasajero según el campo que se pase, y tiene una restricción 
por si se pasa un número que no sea el 1 o 0 para ordenar de orden ascendente o descendente 
respectivamente y luego devuelve un mensaje según corresponda
*/
DROP PROCEDURE IF EXISTS ordenar;
DELIMITER //
CREATE PROCEDURE ordenar(IN nombre_campo VARCHAR(50), IN orden INT, out mensaje VARCHAR(255))
BEGIN
IF orden = 1  THEN
	SET @ordenamiento = concat('ORDER BY ', nombre_campo, ' ASC');
    SET mensaje = 'ordenamiento ascendente';
ELSEIF orden = 0 THEN
    SET @ordenamiento = concat('ORDER BY ', nombre_campo, ' DESC');
    SET mensaje = 'ordenamiento descendente';
ELSE
	SET @ordenamiento = '';
    SET mensaje = 'No indicó un número válido de ordenamiento';
END IF;
	SET @consulta = concat('SELECT * FROM pasajeros ', @ordenamiento);
	PREPARE retorno FROM @consulta;
    EXECUTE retorno;
    DEALLOCATE PREPARE retorno;
END //
-- call ordenar('nombre_pasajero', 1, @ordenar);
-- select @ordenar;
	
DELIMITER ;


-- Esta Stored Procedure inserta un registro siempre y cuando se le pase un horario sino devuelve solamente un mensaje de ERROR


DROP PROCEDURE IF EXISTS insertar_empleado;
DELIMITER //
CREATE PROCEDURE insertar_empleado(IN id INT, IN nombre VARCHAR(20), apellido VARCHAR(20), posicion_ VARCHAR(45), OUT mensaje VARCHAR(255))
BEGIN
IF nombre <> ''  AND apellido <> '' AND posicion_ <> ''THEN
	IF posicion_ = 'Azafata' THEN
		SET @ide = concat('AZ0',id);
		INSERT INTO empleados (id_empleado, posicion, nombre_empleado, apellido_empleado, antiguedad, sueldo) values (@ide, posicion_, nombre, apellido, 0, 1000);
		SET mensaje = 'Se registró con éxito al empleado';
	ELSEIF posicion_ = 'Administrativo' THEN
		SET @ide = concat('OF0',id);
		INSERT INTO empleados (id_empleado, posicion, nombre_empleado, apellido_empleado, antiguedad, sueldo) values (@ide, posicion_, nombre, apellido, 0, 1000);
		SET mensaje = 'Se registró con éxito al empleado';
    ELSEIF posicion_ = 'Piloto' THEN
		SET @ide = concat('PI0',id);
		INSERT INTO empleados (id_empleado, posicion, nombre_empleado, apellido_empleado, antiguedad, sueldo) values (@ide, posicion_, nombre, apellido, 0, 1000);
		SET mensaje = 'Se registró con éxito al empleado';
    ELSEIF posicion_ = 'Técnico' THEN
		SET @ide = concat('ST0',id);
		INSERT INTO empleados (id_empleado, posicion, nombre_empleado, apellido_empleado, antiguedad, sueldo) values (@ide, posicion_, nombre, apellido, 0, 1000);
		SET mensaje = 'Se registró con éxito al empleado';
	ELSE
		SET mensaje = 'ERROR al registrar recuerde pasar Azafata, Administrativo, Piloto, Técnico como posición';
	END IF;
ELSE
	set mensaje = 'ERROR al registrar';
END IF;
	SET @consulta = 'SELECT * FROM empleados ORDER BY id_empleado DESC';
	PREPARE retorno FROM @consulta;
    EXECUTE retorno;
    DEALLOCATE PREPARE retorno;
END //
DELIMITER ;

-- call insertar_empleado(26, 'anita', 'vargo', 'Azafata', @mensaje);
-- select @mensaje;


-- CREACIÓN DE TRIGGERS
##############################################################


# Creamos la tabla logs_pasajeros para ir guardando los registros de inserción
DROP TABLE IF EXISTS logs_pasajeros;
CREATE TABLE IF NOT EXISTS logs_pasajeros (
id_pasajero INT,
condicion varchar(100),
nombre_pasajero varchar(200),
apellido_pasajero varchar(200),
usuario varchar(200),
hora varchar(10),
fecha varchar(10)
);

/*
 Creamos un trigger que va tomando los nuevos registros en la tabla pasajeros y los almacena
 en la tabla log_pasajeros
*/
DROP TRIGGER IF EXISTS nuevo_pasajero;
CREATE TRIGGER nuevo_pasajero
after INSERT ON pasajeros
FOR EACH ROW
INSERT INTO logs_pasajeros VALUES (NEW.id_pasajero, 'nuevo_registro', NEW.nombre_pasajero, NEW.apellido_pasajero, USER(), current_time(), current_date());

-- INSERT INTO pasajeros (nombre_pasajero, apellido_pasajero, domicilio) VALUES ("Luis Carlos", "Perez", "av siempre viva 321");


/*
Creamos un trigger que va tomando las actualizaciones de registros en la tabla pasajeros y los actualiza
en la tabla log_pasajeros
*/
DROP TRIGGER IF EXISTS actualizar_pasajero;
CREATE TRIGGER actualizar_pasajero
before UPDATE ON pasajeros
FOR EACH ROW
UPDATE logs_pasajeros
SET condicion='actualizacion', nombre_pasajero = NEW.nombre_pasajero, usuario=USER(), hora=current_time(), fecha=current_date()
WHERE id_pasajero=OLD.id_pasajero;

-- UPDATE pasajeros SET nombre_pasajero = 'Carlitos' WHERE id_pasajero=17;

-- select id_pasajero,nombre_pasajero from pasajeros


DROP TABLE IF EXISTS logs_empleados;
CREATE TABLE IF NOT EXISTS logs_empleados (
id_empleado VARCHAR(20),
condicion varchar(100),
nombre_empleado varchar(200),
apellido_empleado varchar(200),
sueldo DOUBLE,
usuario varchar(200),
hora varchar(10),
fecha varchar(10)
);


/*
 Creamos un trigger que va tomando los nuevos registros en la tabla piloto y los almacena
 en la tabla logs_pilotos
*/

DROP TRIGGER IF EXISTS nuevo_empleado;
CREATE TRIGGER nuevo_empleado
after INSERT ON empleados
FOR EACH ROW
INSERT INTO logs_empleados VALUES (NEW.id_empleado, 'nuevo_registro', NEW.nombre_empleado, NEW.apellido_empleado, NEW.sueldo, USER(), current_time(), current_date());

-- 
-- call insertar_empleado(23, 'Luis', 'Perez', 'Técnico', @mensaje);
-- select @mensaje;


/*
Creamos un trigger que va tomando las actualizaciones de registros en la tabla piloto y los actualiza
en la tabla logs_pilotos
*/
DROP TRIGGER IF EXISTS actualizar_sueldo;
CREATE TRIGGER actualizar_sueldo
before UPDATE ON empleados
FOR EACH ROW
UPDATE logs_empleados
SET condicion='actualizacion de sueldo', sueldo = NEW.sueldo, usuario=USER(), hora=current_time(), fecha=current_date()
WHERE id_empleado=OLD.id_empleado;

-- UPDATE empleados SET sueldo = 2010 WHERE id_empleado='ST023';

-- select * from empleados
