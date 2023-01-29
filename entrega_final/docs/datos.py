import random

"""

lista = [('Chrissie','Burmaster','29842 Schmedeman Crossing'),
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
('Millard','Dollard','62 Bonner Drive')]

lista2 = []

for i in lista:
    contador = 0
    lista3 = []
    for c in i:
        lista3.append(c)
        contador +=1
        if contador == 3:
            lista3.append(random.randint(10000000, 99999999))
            continue
    lista2.append(lista3)

texto = ""
for i in lista2:
    texto = texto + (f"{tuple(i)},\n")

print(texto[:-2])




('Chrissie', 'Burmaster', '29842 Schmedeman Crossing', 22255051),
('Alister', 'Beazer', '13 Harper Lane', 77657724),
('Osbourne', 'Fernao', '20 Debs Street', 49051101),
('Francklin', 'Urien', '2 Westridge Park', 67520288),
('Beret', 'Anderson', '5744 Badeau Hill', 97285310),
('Zechariah', 'Keener', '0206 Tennyson Park', 72250939),
('Derrik', 'Fynes', '58355 Kim Center', 19425848),
('Lettie', 'Ord', '9759 Westerfield Parkway', 23529283),
('Ediva', 'Twiggs', '10459 American Ash Avenue', 44509133),
('Albertine', 'Pulster', '4 Continental Drive', 13650593),
('Karilynn', 'Wibberley', '5 Dunning Crossing', 61788010),
('Ketti', 'Hinrichsen', '28 Sutherland Crossing', 26038435),
('Giacopo', 'Szymanek', '34 Cambridge Junction', 81665837),
('Richard', 'Feehan', '80683 Forest Dale Parkway', 13007801),
('Liuka', 'Refford', '0824 Hanson Crossing', 68590137),
('Cher', 'Haylett', '1087 Hermina Lane', 88275525),
('Niki', 'Pescud', '271 Bunker Hill Hill', 29547828),
('Keith', 'Tooley', '8 Sycamore Terrace', 45333729),
('Elia', 'Guynemer', '827 Lotheville Center', 61777079),
('Millard', 'Dollard', '62 Bonner Drive', 37884623)

"""


# (id_empleado, posicion, nombre_empleado, apellido_empleado, antiguedad, sueldo)
########################################################################################


"""
lista = [('Odille','MacCafferky',25),
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
('Kirbie','Duffin',18)]

ides = ["AZ0", "PI0", "ST0", "OF0"]

lista2 = []
contador2 = 0
for i in lista:
    contador = 0
    lista3 = []
    pos = random.choice(ides)
    contador2 += 1
    ide = pos + str(contador2)
    for c in i:
        lista3.append(c)
        contador +=1
        if contador == 3:
            if pos == "AZ0":
                posi = "Azafata"
            elif pos == "PI0":
                posi = "Piloto"
            elif pos == "ST0":
                posi = "Técnico"
            else:
                posi = "Administrativo"
            
            lista3.insert(0, posi)
            
            lista3.append(random.randint(1000, 9999))
            continue
    
    lista3.insert(0, ide)
    lista2.append(lista3)

texto = ""
for i in lista2:
    texto = texto + (f"{tuple(i)},\n")

print(texto[:-2])

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
('AZ020', 'Azafata', 'Kirbie', 'Duffin', 18, 8408)


# PUNTOS 
puntos = [
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
( 34,"Venezuela - Caracas")
]

# print(random.choice(puntos))
"""

"""INSERT INTO rutas (origen,destino,distancia)
VALUES

"""
# rutas = []
# for i in range(20):
#     origen = random.choice(puntos)
#     destino = random.choice(puntos)
#     if origen != destino:
#         tupla = (origen, destino)
#         rutas.append(tupla)

# for i in rutas:
#     print(i)
"""
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
(32, 23, 4187.7)



# INSERT INTO vuelo (id_afazata, id_piloto, id_ruta, id_avion, horario_vuelo, fecha)

empleados = [
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
    ('AZ020', 'Azafata', 'Kirbie', 'Duffin', 18, 8408)
]

azafatas = []
for i in empleados:
    if i[1] == 'Azafata':
        azafatas.append(i)
# azafata_elegida = random.choice(azafatas)
# print(azafata_elegida[0])
pilotos = []
for i in empleados:
    if i[1] == 'Piloto':
        pilotos.append(i)

lista = []

lista2 = [
        ("15:06","2023-01-01"),
        ("19:09","2023-01-02"),
        ("12:39","2023-01-03"),
        ("11:58","2023-01-07"),
        ("13:22","2023-01-08"),
        ("20:25","2023-01-09"),
        ("17:48","2023-01-10"),
        ("13:48","2023-01-11"),
        ("13:02","2023-01-12"),
        ("12:10","2023-01-30")
    ]
for i in range(10):
    azafata = random.choice(azafatas)
    piloto = random.choice(pilotos)
    lista.append((azafata[0], piloto[0], random.randint(1, 20), random.randint(1, 20), lista2[i][0], lista2[i][1]))

for index in lista:
    print(index)


('AZ013', 'PI05', 4, 9, '15:06', '2023-01-01'),
('AZ013', 'PI03', 17, 9, '19:09', '2023-01-02'),
('AZ014', 'PI05', 14, 6, '12:39', '2023-01-03'),
('AZ015', 'PI05', 3, 2, '11:58', '2023-01-07'),
('AZ012', 'PI03', 18, 5, '13:22', '2023-01-08'),
('AZ014', 'PI019', 15, 14, '20:25', '2023-01-09'),
('AZ015', 'PI02', 11, 17, '17:48', '2023-01-10'),
('AZ010', 'PI05', 8, 16, '13:48', '2023-01-11'),
('AZ020', 'PI019', 18, 2, '13:02', '2023-01-12'),
('AZ013', 'PI07', 12, 19, '12:10', '2023-01-30')
"""

# INSERT INTO pasaje (id_pasajero, id_vuelo, pas_fre, asiento, precio)
# VALUES
"""
lista = [
    (15,14,6),
    (20,2,5),
    (15,11,3),
    (34,19,6),
    (44,20,9),
    (30,20,6),
    (29,4,1),
    (20,5,9),
    (42,17,3),
    (11,10,9)
]

for i in range(20):
    print(f"{(random.randint(1, 20), random.randint(1, 20), random.randint(0, 1), random.randint(1, 40), random.randint(200, 1000))},")
"""
empleados = [
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
    ('AZ020', 'Azafata', 'Kirbie', 'Duffin', 18, 8408)
]

tecnicos = []
for i in empleados:
    if i[1] == 'Técnico':
        tecnicos.append(i)
# for x in tecnicos:
#     print(x)
"""
('ST06', 'Técnico', 'Virgie', 'Lenoir', 17, 6133)
('ST08', 'Técnico', 'Delcine', 'Siflet', 16, 8777)
('ST017', 'Técnico', 'Richy', 'Shannon', 17, 1345)
('ST018', 'Técnico', 'Dorotea', 'Coneybeare', 28, 5573)
"""
# INSERT INTO taller (id_punto, id_empleado, telefono) VALUES;
# for i in range(10):
#     tecnico = random.choice(tecnicos)
#     print(f"{(random.randint(1, 34), tecnico[0], random.randint(10000000, 99999999))},")

"""
(32, 'ST06', 98172567),
(23, 'ST018', 55631803),
(16, 'ST018', 81709608),
(19, 'ST018', 22673187),
(24, 'ST017', 24789875),
(12, 'ST06', 65874321),
(27, 'ST06', 62296993),
(22, 'ST06', 43545850),
(17, 'ST017', 72376679),
(13, 'ST017', 84409428)
"""

# INSERT INTO mantenimiento (id_avion, id_taller, motivo, fecha, tipo)
# VALUES
"""
motivo = ["Ala", "Radar", "Motores", "Eléctrico", "Estético", "Combustión", "Controles"]
fechas = ['2023-10-2', '2023-03-26', '2023-07-16', '2023-05-08', '2023-09-24', '2023-01-23', '2023-06-22', '2023-03-20', '2023-08-06', '2023-05-04']
tipo = ["Preventivo", "Correctivo"]
# for i in range(10):
#     dia = random.randint(1, 31)
#     mes = random.randint(1, 12)
#     fechas.append(f'2023-{mes}-{dia}')
# print(fechas)
for i in range(10):
    print(f"{(random.randint(1, 20), random.randint(1, 10), random.choice(motivo), fechas[i], random.choice(tipo))},")
"""
# ADMINISTRATIVOS
"""
data = [
	{
		'address': "1350 Magna. Street"
	},
	{
		'address': "Ap #626-944 Diam Rd."
	},
	{
		'address': "P.O. Box 711, 3899 Risus. Rd."
	},
	{
		'address': "354-1464 Auctor Street"
	},
	{
		'address': "P.O. Box 302, 1435 Sem. Rd."
	}
]
direcciones = []
for i in data:
    direcciones.append(i["address"])

admin = []
for i in empleados:
    if i[1] == 'Administrativo':
        admin.append(i)
ap = ["08:00", "09:00", "10:00"]
cie = ["17:00", "16:00", "18:00"]
for i in range(4):
    print(f"{(random.randint(1, 20), admin[i][0], random.choice(ap), random.choice(cie), direcciones[i])},")
"""

proveedores = {
    "YPF": "Combustible",
    "Shell": "Combustible",
    "Arcor": "Comestibles",
    "Pepsi": "Comestibles",
    "Ledesma": "Librería",
    "Dell": "Computación",
    "Telas LD": "Indumentaria",
    "Gativideo": "Entretenimiento",
    "Grupo Queruclor": "Limpieza"
}


for i, j in proveedores.items():
    print(f"{(random.randint(1, 20), i, j)},")