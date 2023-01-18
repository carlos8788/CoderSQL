-- CREACIÓN DE TABLAS
##############################################################
DROP SCHEMA IF EXISTS vuelos_comerciales;
CREATE SCHEMA IF NOT EXISTS vuelos_comerciales;
use vuelos_comerciales;
CREATE TABLE IF NOT EXISTS pasajero (
    id_pasajero INT NOT NULL AUTO_INCREMENT,
    nombre_pasajero VARCHAR(45) NOT NULL,
    apellido_pasajero VARCHAR(45) NOT NULL,
    domicilio VARCHAR(60) NULL,
    PRIMARY KEY (id_pasajero)
);

CREATE TABLE IF NOT EXISTS piloto (
    id_piloto INT NOT NULL AUTO_INCREMENT,
    nombre_piloto VARCHAR(45) NOT NULL,
    apellido_piloto VARCHAR(45) NOT NULL,
    antiguedad INT NOT NULL,
    PRIMARY KEY (id_piloto)
);

CREATE TABLE IF NOT EXISTS avion (
    id_avion INT NOT NULL AUTO_INCREMENT,
    capacidad INT NOT NULL,
    modelo VARCHAR(150) NOT NULL,
    anio_creacion INT NOT NULL,
    PRIMARY KEY (id_avion)
);

CREATE TABLE IF NOT EXISTS ruta (
    id_ruta INT NOT NULL AUTO_INCREMENT,
    origen VARCHAR(45) NOT NULL,
    destino VARCHAR(45) NOT NULL,
    distancia DECIMAL(8,3) NOT NULL,
    PRIMARY KEY (id_ruta)
);

CREATE TABLE IF NOT EXISTS pasaje (
    id_pasaje INT NOT NULL AUTO_INCREMENT,
    asiento INT NOT NULL,
    id_pasajero INT NOT NULL,
    id_vuelo INT NOT NULL,
    PRIMARY KEY (id_pasaje),
    FOREIGN KEY (id_pasajero) 
    REFERENCES pasajero(id_pasajero)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS vuelo (
    id_vuelo INT NOT NULL AUTO_INCREMENT,
    horario_vuelo VARCHAR(100) NOT NULL,
    id_piloto INT NOT NULL,
    id_ruta INT NOT NULL,
    id_avion INT NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY (id_vuelo),
    FOREIGN KEY (id_piloto) 
    REFERENCES piloto(id_piloto)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (id_ruta) 
    REFERENCES ruta(id_ruta)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (id_avion) 
    REFERENCES avion(id_avion)
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

INSERT INTO pasajero (nombre_pasajero,apellido_pasajero,domicilio)
VALUES
('Chrissie','Burmaster','29842 Schmedeman Crossing'),
('Alister','Beazer','13 Harper Lane'),
('Osbourne','Fernao','20 Debs Street'),
('Francklin','Urien','2 Westridge Park'),
('Beret','Anderson','5744 Badeau Hill'),
('Zechariah','Keener','0206 Tennyson Park'),
('Derrik','Fynes','58355 Kim Center'),
('Lettie','Ord','9759 Westerfield Parkway'),
('Ediva','Twiggs','10459 American Ash Avenue'),
('Albertine','Pulster','4 Continental Drive'),
('Karilynn','Wibberley','5 Dunning Crossing'),
('Ketti','Hinrichsen','28 Sutherland Crossing'),
('Giacopo','Szymanek','34 Cambridge Junction'),
('Richard','Feehan','80683 Forest Dale Parkway'),
('Liuka','Refford','0824 Hanson Crossing'),
('Cher','Haylett','1087 Hermina Lane'),
('Niki','Pescud','271 Bunker Hill Hill'),
('Keith','Tooley','8 Sycamore Terrace'),
('Elia','Guynemer','827 Lotheville Center'),
('Millard','Dollard','62 Bonner Drive');

INSERT INTO piloto (nombre_piloto,apellido_piloto,antiguedad)
VALUES
('Odille','MacCafferky',25),
('Verney','Hug',27),
('Janeta','Matzl',14),
('Cammi','Dyzart',24),
('Florance','Beeson',19),
('Virgie','Lenoir',17),
('Richardo','Prantoni',21),
('Delcine','Siflet',16),
('Brit','Klossmann',30),
('Cookie','Filpo',10),
('Mellisa','Gatfield',3),
('Tanya','Iacovini',24),
('Jennie','McCaskill',3),
('Reinold','Bilsborrow',2),
('Gaylor','Stuther',10),
('Jonell','Gabbett',9),
('Richy','Shannon',17),
('Dorotea','Coneybeare',28),
('Karlis','Howgill',21),
('Kirbie','Duffin',18);

INSERT INTO ruta (origen,destino,distancia)
VALUES
('Zhoupu','Lampari',9875.8),
('Guarumal','Spokoynaya',7812.26),
('Nyrob','Pangligaran',9133.27),
('Devon','Duzhenwan',5406.98),
('Centro Habana','Puzi',6329.29),
('Szczerbice','Comapa',7556.25),
('Santo Amaro','Kota Bharu',4636.07),
('Moluo','Kuala Lumpur',7137.68),
('Pasinan Barat','Fonte da Aldeia',5675.82),
('Ipoh','Chutove',5921.37),
('Akita Shi','Hengshi',3405.24),
('El Corpus','Olonets',1035.13),
('Aguas Verdes','Stegna',5758.58),
('Criuleni','Karangnongko',7227.19),
('Asker','Ninghai',5822.49),
('Maddarulug Norte','Malaga',2259.94),
('Jingdu','Dicamay',4683.81),
('Huifa','Sarrazola',4845.76),
('Shenavan','Laylay',5748.84),
('Fubin','Nanmu',1012.16),
('Des Moines','Oenam',2490.7),
('Bruxelles','Vishow',6378.81),
('Luzern','Kuloy',4047.49),
('Lexington','Roriz',1904.8),
('Papeete','Boulaouane',8276.85),
('Annecy','Rettikhovka',1666.91),
('Xiongshan','Palca',2348.73),
('Lexington','Cheongpyeong',8233.8),
('Orichi','Franca',3743.96),
('Graksop','Armen',8968.89),
('Yeysk','Laoxialu',8192.31),
('Shibukawa','Arosbaya',3480.92);


INSERT INTO vuelo (horario_vuelo,id_piloto,id_ruta,id_avion,fecha)
VALUES
("15:06",20,1,16,"2023-01-01"),
("19:09",6,2,12,"2023-01-02"),
("12:39",9,3,11,"2023-01-03"),
("11:58",5,4,6,"2023-01-07"),
("13:22",15,8,1,"2023-01-08"),
("20:25",6,9,12,"2023-01-09"),
("17:48",3,10,7,"2023-01-10"),
("13:48",9,11,11,"2023-01-11"),
("13:02",18,12,7,"2023-01-12"),
("12:10",16,15,8,"2023-01-30");

INSERT INTO pasaje (asiento,id_pasajero,id_vuelo)
VALUES
(15,14,6),
(20,2,5),
(15,11,3),
(34,19,6),
(44,20,9),
(30,20,6),
(29,4,1),
(20,5,9),
(42,17,3),
(11,10,9);

-- CREACIÓN DE VISTAS
##############################################################

-- Vista que muestra que pilotos no tienen vuelos designados
CREATE OR REPLACE VIEW piloto_sin_vuelos AS
SELECT DISTINCT id_piloto, nombre_piloto, apellido_piloto 
FROM piloto
WHERE id_piloto NOT IN (SELECT id_piloto
							FROM vuelo);

-- Vista que muestra pasajeros con pasaje comprado
CREATE OR REPLACE VIEW pasajeros_pasaje AS
SELECT DISTINCT nombre_pasajero, apellido_pasajero 
FROM pasajero
INNER JOIN pasaje ON pasajero.id_pasajero IN(pasaje.id_pasajero);

-- Vista que muestra en detalle el vuelo programado
CREATE OR REPLACE VIEW detalle_vuelo AS
SELECT horario_vuelo, fecha, 
(SELECT origen
	FROM ruta
	WHERE vuelo.id_ruta = ruta.id_ruta) origen,
(SELECT destino
	FROM ruta
	WHERE vuelo.id_ruta = ruta.id_ruta) destino,
(SELECT concat(nombre_piloto, " " , apellido_piloto) 
	FROM piloto
    WHERE vuelo.id_piloto = piloto.id_piloto) piloto
FROM vuelo;

-- Vista que muestra el nombre de los pasajes que fueron comprados
CREATE OR REPLACE VIEW detalle_pasaje 
AS
SELECT 
asiento,
	(SELECT DISTINCT CONCAT(nombre_pasajero, " ", apellido_pasajero)
    FROM pasajero
    INNER JOIN vuelo ON pasaje.id_pasajero=pasajero.id_pasajero) pasajero,
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
SELECT count(*) FROM vuelos_comerciales.vuelo WHERE id_avion = id INTO vuelos;
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
RETURN (SELECT concat(nombre_piloto, ' ' ,apellido_piloto)
FROM piloto WHERE id_piloto = (SELECT id_piloto FROM vuelo WHERE id_vuelo=id));

END
$$
DELIMITER ;
-- select piloto_del_avion(9) as vuelo_asignado;

-- CREACIÓN DE STORED PROCEDURES
##############################################################

/*Esta Stored Procedure ordena la tabla pasajero según el campo que se pase, y tiene una restricción 
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
	SET @consulta = concat('SELECT * FROM pasajero ', @ordenamiento);
	PREPARE retorno FROM @consulta;
    EXECUTE retorno;
    DEALLOCATE PREPARE retorno;
END //
/*call vuelos_comerciales.ordenar('nombre_pasajero', 1, @ordenar);
select @ordenar;*/
	
DELIMITER ;

/*
Esta Stored Procedure inserta un registro siempre y cuando se le pase un horario sino devuelve solamente un mensaje de ERROR
*/

DROP PROCEDURE IF EXISTS insertar_vuelo;
DELIMITER //
CREATE PROCEDURE insertar_vuelo(IN h_vuelo VARCHAR(10), ide_piloto INT, ide_ruta INT, ide_avion INT, IN fecha_dada DATE, OUT mensaje VARCHAR(255))
BEGIN
IF h_vuelo <> '' THEN
	INSERT INTO vuelo (horario_vuelo, id_piloto, id_ruta, id_avion, fecha) values (h_vuelo, ide_piloto, ide_ruta, ide_avion, fecha_dada);
	SET mensaje = 'Se registró con éxito el vuelo';
ELSE
	set mensaje = 'ERROR al registrar';
END IF;
	SET @consulta = 'SELECT * FROM vuelo ORDER BY id_vuelo DESC';
	PREPARE retorno FROM @consulta;
    EXECUTE retorno;
    DEALLOCATE PREPARE retorno;
END //
DELIMITER ;

/*call vuelos_comerciales.insertar_vuelo('10:55', 12, 1, 5, '2023-01-02', @mensaje);
select @mensaje;*/

-- CREACIÓN DE TRIGGERS
##############################################################


# Creamos la tabla logs_pasajeros para ir guardando los registros de inserción
-- DROP TABLE IF NOT EXISTS IF EXISTS logs_pasajeros;
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
after INSERT ON pasajero
FOR EACH ROW
INSERT INTO logs_pasajeros VALUES (NEW.id_pasajero, 'nuevo_registro', NEW.nombre_pasajero, NEW.apellido_pasajero, USER(), current_time(), current_date());

-- INSERT INTO pasajero (nombre_pasajero, apellido_pasajero, domicilio) VALUES ("Luis Carlos", "Perez", "av siempre viva 321");


/*
Creamos un trigger que va tomando las actualizaciones de registros en la tabla pasajeros y los actualiza
en la tabla log_pasajeros
 */
DROP TRIGGER IF EXISTS actualizar_pasajero;
CREATE TRIGGER actualizar_pasajero
before UPDATE ON pasajero
FOR EACH ROW
UPDATE logs_pasajeros
SET condicion='actualizacion', nombre_pasajero = NEW.nombre_pasajero, usuario=USER(), hora=current_time(), fecha=current_date()
WHERE id_pasajero=OLD.id_pasajero;

-- UPDATE pasajero SET nombre_pasajero = 'Carlitos' WHERE id_pasajero=17;

-- select id_pasajero,nombre_pasajero from pasajero


DROP TABLE IF EXISTS logs_pilotos;
CREATE TABLE IF NOT EXISTS logs_pilotos (
id_piloto INT,
condicion varchar(100),
nombre_piloto varchar(200),
apellido_piloto varchar(200),
usuario varchar(200),
hora varchar(10),
fecha varchar(10)
);


/*
 Creamos un trigger que va tomando los nuevos registros en la tabla piloto y los almacena
 en la tabla logs_pilotos
*/

DROP TRIGGER IF EXISTS nuevo_piloto;
CREATE TRIGGER nuevo_piloto
after INSERT ON piloto
FOR EACH ROW
INSERT INTO logs_pilotos VALUES (NEW.id_piloto, 'nuevo_registro', NEW.nombre_piloto, NEW.apellido_piloto, USER(), current_time(), current_date());

-- INSERT INTO piloto (nombre_piloto, apellido_piloto, antiguedad) VALUES ("Luis Carlos", "Perez", 3);


/*
Creamos un trigger que va tomando las actualizaciones de registros en la tabla piloto y los actualiza
en la tabla logs_pilotos
 */
DROP TRIGGER IF EXISTS actualizar_piloto;
CREATE TRIGGER actualizar_piloto
before UPDATE ON piloto
FOR EACH ROW
UPDATE logs_pilotos
SET condicion='actualizacion', nombre_piloto = NEW.nombre_piloto, usuario=USER(), hora=current_time(), fecha=current_date()
WHERE id_piloto=OLD.id_piloto;

-- UPDATE piloto SET nombre_piloto = 'Carlitos' WHERE id_piloto=21;

-- select id_pasajero,nombre_pasajero from pasajero