#Script de creación de vistas
# Luis Carlos Pérez Gonzalez 

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

