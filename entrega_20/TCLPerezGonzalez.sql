SELECT @@AUTOCOMMIT;
SET AUTOCOMMIT = 0;

USE vuelos_comerciales;


/*
INSERT INTO vuelo (horario_vuelo,id_piloto,id_ruta,id_avion,fecha)
VALUES
("12:10",16, 15,8,"2023-01-30"), # 12:10	16	15	8	2023-01-30
("13:22",15,8,1,"2023-01-08"), # 13:22	15	8	1	2023-01-08
("15:06",20,1,16,"2023-01-01"); # 15:06	20	1	16	2023-01-01
*/
select * from vuelo order by id_vuelo desc;
START TRANSACTION;
DELETE FROM vuelo WHERE id_avion = 1;
DELETE FROM vuelo WHERE id_avion = 16;
DELETE FROM vuelo WHERE id_avion = 8;
SELECT * FROM vuelos_comerciales.vuelo ORDER BY id_vuelo DESC;
#ROLLBACK;
#COMMIT;

select * from pasaje ORDER BY id_pasaje DESC;
INSERT INTO pasaje (asiento,id_pasajero,id_vuelo) VALUES (16,14,1);
INSERT INTO pasaje (asiento,id_pasajero,id_vuelo) VALUES (18,15,2);
INSERT INTO pasaje (asiento,id_pasajero,id_vuelo) VALUES (17,16,3);
INSERT INTO pasaje (asiento,id_pasajero,id_vuelo) VALUES (10,17,4);
savepoint lote_1;
INSERT INTO pasaje (asiento,id_pasajero,id_vuelo) VALUES (20,13,8);
INSERT INTO pasaje (asiento,id_pasajero,id_vuelo) VALUES (21,12,7);
INSERT INTO pasaje (asiento,id_pasajero,id_vuelo) VALUES (22,11,6);
INSERT INTO pasaje (asiento,id_pasajero,id_vuelo) VALUES (23,10,5);
savepoint lote_2;
#RELEASE SAVEPOINT lote_1;