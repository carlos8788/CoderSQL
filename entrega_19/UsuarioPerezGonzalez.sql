CREATE USER usuario_1@localhost; -- Se crea al usuario_1 que tendrá permisos solo de consulta

GRANT SELECT ON vuelos_comerciales.avion TO usuario_1@localhost; -- Se otorga el permiso consulta en la tabla avion 
GRANT SELECT ON vuelos_comerciales.pasaje TO usuario_1@localhost; -- Se otorga el permiso consulta en la tabla pasaje 
GRANT SELECT ON vuelos_comerciales.pasajero TO usuario_1@localhost; -- Se otorga el permiso consulta en la tabla pasajero
GRANT SELECT ON vuelos_comerciales.piloto TO usuario_1@localhost; -- Se otorga el permiso consulta en la tabla piloto 
GRANT SELECT ON vuelos_comerciales.ruta TO usuario_1@localhost; -- Se otorga el permiso consulta en la tabla ruta 
GRANT SELECT ON vuelos_comerciales.vuelo TO usuario_1@localhost; -- Se otorga el permiso consulta en la tabla vuelo

CREATE USER usuario_2@localhost; -- Se crea al usuario_2 que tendrá permisos solamente de consulta, inserción y modificación

GRANT SELECT, INSERT, UPDATE ON vuelos_comerciales.avion TO usuario_2@localhost; -- Se otorga el permiso consulta, inserción y modificación en la tabla avion 
GRANT SELECT, INSERT, UPDATE ON vuelos_comerciales.pasaje TO usuario_2@localhost; -- Se otorga el permiso consulta, inserción y modificación en la tabla pasaje 
GRANT SELECT, INSERT, UPDATE ON vuelos_comerciales.pasajero TO usuario_2@localhost; -- Se otorga el permiso consulta, inserción y modificación en la tabla pasajero
GRANT SELECT, INSERT, UPDATE ON vuelos_comerciales.piloto TO usuario_2@localhost;  -- Se otorga el permiso consulta, inserción y modificación en la tabla piloto 
GRANT SELECT, INSERT, UPDATE ON vuelos_comerciales.ruta TO usuario_2@localhost; -- Se otorga el permiso consulta, inserción y modificación en la tabla ruta 
GRANT SELECT, INSERT, UPDATE ON vuelos_comerciales.vuelo TO usuario_2@localhost; -- Se otorga el permiso consulta, inserción y modificación en la tabla vuelo

SHOW GRANTS FOR usuario_1@localhost;

SHOW GRANTS FOR usuario_2@localhost;