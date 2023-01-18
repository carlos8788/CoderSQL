use vuelos_comerciales;

-- Alteramos en primera instancia la FK en la tabla pasaje
ALTER TABLE `vuelos_comerciales`.`pasaje` 
DROP FOREIGN KEY `pasaje_ibfk_1`;
ALTER TABLE `vuelos_comerciales`.`pasaje` 
ADD CONSTRAINT `pasaje_ibfk_1`
  FOREIGN KEY (`id_pasajero`)
  REFERENCES `vuelos_comerciales`.`pasajero` (`id_pasajero`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

# Creamos la tabla logs_pasajeros para ir guardando los registros de inserción
-- DROP TABLE IF EXISTS logs_pasajeros;
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

ALTER TABLE `vuelos_comerciales`.`vuelo` 
DROP FOREIGN KEY `vuelo_ibfk_1`;
ALTER TABLE `vuelos_comerciales`.`vuelo` 
ADD CONSTRAINT `vuelo_ibfk_1`
  FOREIGN KEY (`id_piloto`)
  REFERENCES `vuelos_comerciales`.`piloto` (`id_piloto`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

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
