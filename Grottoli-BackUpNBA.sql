#Creacion de la base de datos de la NBA

DROP database IF EXISTS nba;
create database nba;
use nba;

#Creacion de tabla para luego cargar los equipos


DROP table IF EXISTS equipos;
create table equipos(
ID_Equipo int auto_increment primary key,
ID_Estadio int not null,
Nombre varchar(50) DEFAULT NULL,
Ciudad varchar(50) DEFAULT NULL,
Titulos int DEFAULT NULL,
Conferencia varchar(20) DEFAULT NULL
);

#Insercion de contenido en la tabla Equipos

INSERT INTO equipos (ID_Equipo, ID_Estadio,   Nombre, Ciudad, Titulos, Conferencia) 
VALUES 
(01, 01,  'Atlanta Hawks', 'Atlanta', 1, 'Este'), 
(02, 02,  'Boston Celtics','Boston',17, 'Este'),
(03, 03,  'Brooklyn Nets','Brooklyn',2, 'Este'),
(04, 04,  'Charlotte Hornets','Charlotte',0, 'Este'),
(05, 05,  'Chicago Bulls','Chicago',6, 'Este'),
(06, 06,  'Cleveland Cavaliers','Cleveland',1, 'Este'),
(07, 07,  'Detroit Pistons','Detroit',3, 'Este');

#Creacion de la tabla estadios

DROP table IF EXISTS estadios;
create table estadios(
ID_Estadio int auto_increment primary key not null,
Ciudad varchar(50) default null,
Nombre varchar(50) default null,
Capacidad int not null
);

#Asignacion de cada estadio con su respectivo equipo

INSERT INTO estadios (ID_Estadio,  Ciudad, Nombre, Capacidad) 
VALUES 
('01',   'Atlanta','State Farm Arena', '16600'), 
('02',   'Boston','TD Garden', '18624'),
('03',   'Brooklyn','Barclays Center', '17732'),
('04',   'Charlotte','Spectrum Center', '19077'),
('05',   'Chicago','United Center', '23500'),
('06',   'Cleveland','	Rocket Mortgage FieldHouse', '19432'),
('07',   'Detroit','	Little Caesars Arena', '20332');

#Creo la tabla de los jugadores para asignar a cada equipo

DROP table IF EXISTS jugadores;
create table jugadores(
ID_Jugador int not null primary key,
ID_Equipo int not null,
Nombre varchar(50),
FechaNacimiento date,
Nacionalidad varchar(50),
Posicion varchar(20)
);

#Agrego los jugadores a su respectivo equipo junto con sus datos

INSERT INTO jugadores ( ID_Jugador, ID_Equipo,  Nombre, FechaNacimiento, Nacionalidad, Posicion) 
VALUES 
(01, 01,  'Bogdan Bogdanovic', '1992/08/18', 'Serbio', 'Escolta'), 
(02, 01,  'Clint Capela', '1994/05/18', 'Suizo', 'Pivot'), 
(03, 01,  '	John Collins', '1997/09/23', 'Estadounidense', 'Ala Pivot'), 
(04, 01,  'Sharife Cooper', '2001/06/11', 'Estadounidense', 'Base'), 
(05, 01,  '	Gorgui Dieng', '1990/01/18', 'Senegales', 'Pivot'), 
(06, 02,  'Bol Bol', '1999/11/16', 'Estadounidense', 'Pivot'), 
(07, 02,  'Jaylen Brown', '1996/10/24', 'Estadounidense', 'Escolta'), 
(08, 02,  '	P.J. Dozier', '1996/10/25', 'Estadounidense', 'Base'), 
(09, 03,  '	LaMarcus Aldridge', '1985/07/19', 'Estadounidense', 'Ala Pivot'), 
(10, 03,  '	DeAndre Bembry', '1994/07/04', 'Estadounidense', 'Alero'),
(11, 03,  '	Bruce Brown', '1996/07/15', 'Estadounidense', 'Ala Pivot'),
(12, 03,  'Jevon Carter', '1995/09/14', 'Estadounidense', 'Base'),
(13, 04,  'LaMelo Ball', '2001/08/22', 'Estadounidense', 'Base'),
(14, 04,  'James Bouknigh', '2000/09/18', 'Estadounidense', 'Escolta'),
(15, 04,  'Miles Bridges', '1998/03/21', 'Estadounidense', 'Alero'),
(16, 04,  '	Montrezl Harrell', '1994/01/26', 'Estadounidense', 'Ala Pivot'),
(17, 04,  '	Gordon Hayward', '1990/03/23', 'Estadounidense', 'Alero'),
(18, 04,  '	Kai Jones', '2001/01/19', 'Bahameño', 'Pivot');

#Se crea una tabla para saber de que temporada son los equipos y datos obtenidos

DROP table IF EXISTS temporada;
create table temporada(
ID_Temporada int auto_increment primary key,
ID_Equipo int not null,
Season varchar(50)
);

#Se agregan algunas temporadas de algunos equipos

INSERT INTO Temporada (ID_Temporada, ID_Equipo, Season) 
VALUES 
(01,   03,  1947), 
(02,   02,  1948),
(03,   02,  1949),
(04,   01,  1950);

#Se crea tabla que refleje resultados de partidos entre equipos en determinada temporada

DROP table IF EXISTS Partidos;
create table Partidos(
ID_Partido int auto_increment primary key,
ID_Temporada int not null,
ID_Equipo_Local int not null,
ID_Equipo_Visitante int not null,
Resultado varchar(20)
);

#Se cargan algunos resultados de partidos en cada temporada cargada

INSERT INTO partidos (ID_Partido,ID_Temporada, ID_Equipo_Local,ID_Equipo_Visitante, Resultado) 
VALUES 
(01,   01,  01, 02, '120-80'), 
(02,   02,  03, 04, '110-89'), 
(03,   03,  01, 03, '90-95'), 
(04,   04,  02, 04, '99-82') ;

#se crea tabla en la cual se va a ver el record (Cantidad de partidos ganados y perdidos) de determinada temporada


DROP table IF EXISTS record;
create table record(
ID_Record int auto_increment primary key,
ID_Equipo int not null,
ID_Temporada int not null,
PartidosGanados int,
PartidosPerdidos int,
Ratio float,
Posicion int not null
);

#Se cargan los records correspondientes

INSERT INTO Record (ID_Record,ID_Equipo, ID_Temporada,PartidosGanados, PartidosPerdidos, Ratio, Posicion) 
VALUES 
(01,   01,  01, 45, 37, 54.87, 6), 
(02,   02,  04, 50, 32, 60.97, 3), 
(03,   01,  02, 30, 52, 36.58, 10), 
(04,   04,  03, 40, 42, 48.78, 8);

#Se crea una tabla para llevar reconto de los puntos de cada jugador

DROP table IF EXISTS puntos;
create table puntos(
ID_Puntos int primary key,
ID_Jugador int not null,
ID_Temporada int not null,
Cantidad int,
Promedio float
);


#Se cargan los puntos de algunos jugadores

INSERT INTO puntos (ID_Puntos,ID_Jugador, ID_Temporada, Cantidad, Promedio) 
VALUES 
(01,   01,  01, 820,  10.00), 
(02,   02,  04, 1437,  17.52),
(03,   03,  02, 752,  9.17), 
(04,   04,  03, 452,  5.51);

#Se crea tabla para llevar cuenta de rebotes de los jugadores

DROP table IF EXISTS rebotes;
create table rebotes(
ID_Rebotes int primary key,
ID_Jugador int not null,
ID_Temporada int not null,
Cantidad int,
Promedio float
);


#Se carga informacion acerca de los rebotes de los jugadores

INSERT INTO rebotes (ID_Rebotes,ID_Jugador, ID_Temporada, Cantidad, Promedio) 
VALUES 
(01,   01,  01, 620,  7.56), 
(02,   02,  04, 1022,  12.46),
(03,   03,  02, 256,  3.12), 
(04,   04,  03, 427,  5.20);

#Mismo caso que los dos anteriores pero con asistencias

DROP table IF EXISTS asistencias;
create table asistencias(
ID_Asistencias int primary key,
ID_Jugador int not null,
ID_Temporada int not null,
Cantidad int,
Promedio float
);

INSERT INTO asistencias (ID_Asistencias,ID_Jugador, ID_Temporada, Cantidad, Promedio) 
VALUES 
(01,   01,  01, 510,  6.21), 
(02,   02,  04, 856,  10.43),
(03,   03,  02, 420,  5.12), 
(04,   04,  03, 512,  6.24);


#Creo una tabla llamada estadisticas donde se juntan varias observaciones

DROP table IF EXISTS estadisticas;
create table estadisticas(
ID_Estadisticas int  primary key,
ID_Jugador int not null,
ID_Temporada int not null,
ID_Puntos int not null,
ID_Rebotes int not null,
ID_Asistencias int not null
);

INSERT INTO estadisticas (ID_Estadisticas ,ID_Jugador, ID_Temporada, ID_Puntos, ID_Rebotes, ID_Asistencias) 
VALUES 
(01,   01,  01, 01,  01, 01), 
(02,   02,  02, 02, 02,02),
(03,   03,  03, 03, 03,03),
(04,   04,  04, 04, 04,04);


#Foreign Keys
#Asigno cuales son las claves foraneas en cada tabla

alter table Equipos add constraint Equipo_estadio foreign key (ID_Estadio) references Estadios(ID_Estadio);
alter table Jugadores add constraint Jugador_Equipo foreign key (ID_Equipo) references Equipos(ID_Equipo);
alter table Temporada add constraint Equipo_Campeon foreign key (ID_Equipo) references Equipos(ID_Equipo);
alter table Partidos add constraint Partido_Temporada foreign key (ID_Temporada) references Temporada(ID_Temporada);
alter table Partidos add constraint Equipo_Local foreign key (ID_Equipo_Local) references Equipos(ID_Equipo);
alter table Partidos add constraint Equipo_Visitante foreign key (ID_Equipo_Visitante) references Equipos(ID_Equipo);
alter table Record add constraint Record_Temporada foreign key (ID_Temporada) references Temporada(ID_Temporada);
alter table Record add constraint Equipo_Record foreign key (ID_Equipo) references Equipos(ID_Equipo);
alter table Puntos add constraint Puntos_Temporada foreign key (ID_Temporada) references Temporada(ID_Temporada);
alter table Puntos add constraint Jugador_Puntos foreign key (ID_Jugador) references Jugadores(ID_Jugador);
alter table Rebotes add constraint Rebotes_Temporada foreign key (ID_Temporada) references Temporada(ID_Temporada);
alter table Rebotes add constraint Jugador_Rebotes foreign key (ID_Jugador) references Jugadores(ID_Jugador);
alter table Asistencias add constraint Asistencias_Temporada foreign key (ID_Temporada) references Temporada(ID_Temporada);
alter table Asistencias add constraint Jugador_Asistencias foreign key (ID_Jugador) references Jugadores(ID_Jugador);
alter table Estadisticas add constraint Estadisticas_Temporada foreign key (ID_Temporada) references Temporada(ID_Temporada);
alter table Estadisticas add constraint Jugador_Estadisticas foreign key (ID_Jugador) references Jugadores(ID_Jugador);
alter table Estadisticas add constraint Puntos_Estadisticas foreign key (ID_Puntos) references Puntos(ID_Puntos);
alter table Estadisticas add constraint Rebotes_Estadisticas foreign key (ID_Rebotes) references Rebotes(ID_Rebotes);
alter table Estadisticas add constraint Asistencias_Estadisticas foreign key (ID_Asistencias) references Asistencias(ID_Asistencias);

#Creo cinco vistas diferentes
#Vista que muestra que equipos fueron campeones


CREATE VIEW Equipos_Campeones AS
     SELECT  Nombre, Titulos
     FROM Equipos
     WHERE Titulos != 0;
     
#Vista que muestra la capacidad de los estadios en orden
     
CREATE VIEW Capacidad AS
     SELECT Capacidad, Nombre, now() 'Ahora'
     FROM Estadios;
 
#Vista que muestra a los jugadores ordenados por su edad

CREATE VIEW Jugadores_por_edad AS
     SELECT  Nombre, FechaNacimiento
     FROM jugadores
     ORDER BY FechaNacimiento DESC;

#vista que muestra a los jugadores por equipo

CREATE VIEW Jugadores_por_equipo
 AS SELECT  jugadores.Nombre 'Jugador',
            equipos.Nombre 'Equipo',
            jugadores.Posicion
     FROM jugadores, equipos
     WHERE jugadores.ID_Equipo = equipos.ID_Equipo;

#Vista que muestra a los equipos con efectividad myor del 50% en los partidos

CREATE VIEW Ratios_mayores_a_50
 AS SELECT  
            equipos.Nombre 'Equipo',
            record.Ratio 'Ratio',
            record.ID_Temporada
     FROM record, equipos
     WHERE record.ID_Equipo = equipos.ID_Equipo
     AND record.Ratio > 50;



#Creacion de funciones
#Cuenta la cantidad de jugadores que tiene un equipo cargado en la base de datos


delimiter #
CREATE FUNCTION CANTIDAD_JUGADORES_EQUIPO(PARAM_EQUIPO INT)
RETURNS INT
DETERMINISTIC
BEGIN 
     DECLARE CANTIDAD_JUGADORES INT;
     
     SELECT COUNT(ID_Jugador) INTO CANTIDAD_JUGADORES
     FROM JUGADORES
     WHERE ID_EQUIPO = PARAM_EQUIPO;
     RETURN CANTIDAD_JUGADORES;

END #


DELIMITER ;


SELECT *,
CANTIDAD_JUGADORES_EQUIPO(Id_Equipo)
FROM Equipos ;


#Procedure ordenamiento

DROP PROCEDURE IF EXISTS orden_campeonatos;
delimiter $$
CREATE PROCEDURE orden_campeonatos (IN campo_a_ordenar VARCHAR(50), IN orden BOOLEAN)
-- orden=1 -> asc
-- orden=0 -> desc

BEGIN
	IF campo_a_ordenar <> '' AND orden = 1 THEN
		SET @ordenar = concat('ORDER BY ', campo_a_ordenar);
	ELSEIF campo_a_ordenar <> '' AND orden = 0 THEN
		SET @ordenar = concat('ORDER BY ', campo_a_ordenar, ' DESC');
	ELSEIF campo_a_ordenar <> '' AND orden NOT IN (0,1) THEN
		SET @ordenar = 'No válido';
		SELECT 'Parámetro de ordenamiento ingresado no válido' AS Mensaje;
    ELSE
		SET @ordenar = '';
	END IF;
    IF @ordenar <> 'No válido' THEN
		SET @clausula_select = concat('SELECT * FROM equipos ', @ordenar);
		PREPARE ejecucion FROM @clausula_select;
		EXECUTE ejecucion;
		DEALLOCATE PREPARE ejecucion;
	END IF;
END $$
delimiter ;
CALL orden_campeonatos('Titulos',1);

#Procedure Inserción
#Creo una tabla de all star para el procedure

DROP TABLE IF EXISTS All_star_game;
create table All_star_game(
ID_Allstar int auto_increment primary key,
Año int not null ,
City varchar(50)
);

INSERT INTO All_star_game (ID_Allstar, Año, City) 
VALUES 
(01,   2019,'Charlotte'), 
(02,   2020,'Chicago'), 
(03,   2021,'Atlanta');

DROP PROCEDURE IF EXISTS nuevo_allstargame;
DELIMITER $$
CREATE PROCEDURE nuevo_allstargame (IN City varchar(50))
BEGIN
	INSERT INTO All_star_game VALUES (DEFAULT, 2022 , City);
END $$
DELIMITER ;

select * from All_star_game;
CALL nuevo_allstargame('Los Angeles');
select * from All_star_game where city='Los Angeles';

DELIMITER ;

#Triggers

#Creo una tabla para el trigger

DROP TABLE IF EXISTS AI_insercion_equipo;
CREATE TABLE AI_insercion_equipo (
id_equipo INT PRIMARY KEY auto_increment,
id_estadio INT NOT NULL,
nombre VARCHAR(50),
ciudad VARCHAR(50),
titulos INT,
conferencia VARCHAR(20) 
);


DROP TABLE IF EXISTS log_modificacion_equipo;
CREATE TABLE log_modificacion_equipo (
id_equipo INT PRIMARY KEY auto_increment,
id_estadio INT NOT NULL,
nombre_viejo VARCHAR(50),
nombre_nuevo VARCHAR(50),
ciudad_viejo VARCHAR(50),
titulos_viejo INT,
conferencia_viejo VARCHAR(20) 
);


-- Creación
DROP TRIGGER IF EXISTS AI_insercion_equipo;
CREATE TRIGGER AI_insercion_equipo
AFTER INSERT ON equipos
FOR EACH ROW
INSERT INTO AI_insercion_equipo VALUES (DEFAULT, new.ID_Estadio, new.Nombre, new.Ciudad, new.Titulos, new.Conferencia);


-- Lo probamos:
select * from AI_insercion_equipo;
INSERT INTO equipos VALUES (default,5,'Chicago Bulls',default,default,default);
select * from AI_insercion_equipo;

# Log de evento de modificación
-- Creación
DROP TRIGGER IF EXISTS log_modificacion_equipo;
CREATE TRIGGER log_modificacion_equipo
AFTER UPDATE ON equipos
FOR EACH ROW
INSERT INTO log_modificacion_equipo VALUES (DEFAULT, old.id_equipo, old.nombre, new.nombre, default, default,default);

-- Lo probamos:
select * from log_modificacion_equipo;
update equipos set nombre='Los Angeles Lakers' WHERE id_equipo=1;
select * from log_modificacion_equipo;
truncate log_modificacion_equipo;


#Probando triggers para jugadores

DROP TABLE IF EXISTS AI_insercion_jugadores;
CREATE TABLE AI_insercion_jugadores (
id_jugador INT PRIMARY KEY auto_increment,
id_equipo INT ,
nombre VARCHAR(50),
FechaNacimiento date,
Nacionalidad VARCHAR(50),
Posicion VARCHAR(50)
);


DROP TABLE IF EXISTS log_modificacion_jugadores;
CREATE TABLE log_modificacion_jugadores (
id_Jugador INT PRIMARY KEY auto_increment,
id_equipo INT,
nombre_viejo VARCHAR(50),
nombre_nuevo VARCHAR(50),
FechaNacimiento date,
Nacionalidad VARCHAR(50),
Posicion VARCHAR(50)
);

-- Creación
DROP TRIGGER IF EXISTS AI_insercion_jugadores;
CREATE TRIGGER AI_insercion_jugadores
AFTER INSERT ON jugadores
FOR EACH ROW
INSERT INTO AI_insercion_jugadores VALUES (new.id_jugador, new.id_equipo, new.Nombre, default, new.Nacionalidad,new.Posicion);


-- Lo probamos:
select * from AI_insercion_jugadores;
INSERT INTO jugadores VALUES (19,5,'Michael Jordan',default,'Estadounidense','Escolta'); 
select * from AI_insercion_jugadores;
select * from jugadores;

# Log de evento de modificación
-- Creación
DROP TRIGGER IF EXISTS log_modificacion_jugadores;
CREATE TRIGGER log_modificacion_jugadores
AFTER UPDATE ON jugadores
FOR EACH ROW
INSERT INTO log_modificacion_jugadores VALUES (DEFAULT, default, old.nombre, new.nombre, default, default,default);

-- Lo probamos:
select * from log_modificacion_jugadores;
update jugadores set nombre='Magic Johnson' WHERE id_jugador=1;
select * from log_modificacion_jugadores;
truncate log_modificacion_jugadores;


#Creacion de usuarios
#Observo cuales usuarios ya se encuentran creados en sistema

USE mysql;
SELECT * FROM user;

#Ejecuto la creacion de nuevos usuarios segun lo especificado
#Creo un usuario que tenga solo permiso de lectura

DROP USER IF EXISTS 'Anderson'@'localhost';
CREATE USER 'Anderson'@'localhost' IDENTIFIED BY '123456' ; 
ALTER USER 'Anderson'@'localhost' IDENTIFIED BY 'Contrasenia123'; 
GRANT SELECT ON *.* TO 'Anderson'@'localhost';

DROP USER IF EXISTS 'Arturo'@'localhost';
CREATE USER 'Arturo'@'localhost' IDENTIFIED BY 'Arturo';
GRANT SELECT, INSERT, UPDATE ON *.* TO 'Arturo'@'localhost';

SET PASSWORD FOR 'Arturo'@'localhost' = 'NBA123';
FLUSH PRIVILEGES;


#TCL
#Primer parte
use nba;
START TRANSACTION;
DELETE FROM equipos WHERE id_equipo = 6;
DELETE FROM equipos WHERE id_equipo = 7;
#ROLLBACK;
-- COMMIT;

SELECT * FROM equipos;



#Segunda parte

START TRANSACTION;

INSERT INTO JUGADORES VALUES (20, 04,  'Scottie Lewis', '2000/03/12', 'Estadounidense', 'Escolta');
INSERT INTO JUGADORES VALUES (21, 05,  'Lonzo Ball', '1997/10/27', 'Estadounidense', 'Base');
INSERT INTO JUGADORES VALUES (22, 05,  'Tony Bradley', '1998/01/08', 'Estadounidense', 'Pivot');
SAVEPOINT primer_registro;
INSERT INTO JUGADORES VALUES (23, 05,  'Troy Brown Jr.', '1999/07/28', 'Estadounidense', 'Alero');
INSERT INTO JUGADORES VALUES (24, 05,  'Alex Caruso', '1994/02/28', 'Estadounidense', 'Base');
INSERT INTO JUGADORES VALUES (25, 05,  'Tyler Cook', '1997/09/23', 'Estadounidense', 'Ala Pivot');
INSERT INTO JUGADORES VALUES (26, 05,  'DeMar DeRozan', '1989/08/07', 'Estadounidense', 'Alero');
INSERT INTO JUGADORES VALUES (27, 04,  'Arnoldas Kulboka', '1998/01/04', 'Lituano', 'Ala Pivot');
SAVEPOINT segundo_registro;
ROLLBACK;


#Back up 

#Se utiliza Administration ---> Data export y se elige solo la data de las tablas, sin las estructuras.
#Utilizo export to selfcontained File llamado NbaBackUp 

