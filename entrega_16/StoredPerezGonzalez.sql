use vuelos_comerciales;	
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

/*call vuelos_comerciales.insertar_vuelo('10:55', 12, 1, 5, '2023-01-02', @mensaje);
select @mensaje;*/