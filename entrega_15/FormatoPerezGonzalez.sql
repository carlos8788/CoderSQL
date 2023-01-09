use vuelos_comerciales;
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