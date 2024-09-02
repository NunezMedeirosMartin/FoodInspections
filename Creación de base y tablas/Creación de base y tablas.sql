---creacion de base y tablas

CREATE DATABASE FoodInspections
GO
USE FoodInspections
GO

set dateformat ymd;

/*
Creacion de las tablas
*/
CREATE TABLE Establecimientos(estNumero int identity not null, 
                              estNombre varchar(40) not null, 
							  estDireccion varchar(60) not null, 
							  estTelefono varchar(50), 
							  estLatitud money, 
							  estLongitud money,
							  constraint pk_Estab primary key(estNumero))
GO
CREATE TABLE Licencias(licNumero int identity not null, 
                       estNumero int not null, 
					   licFchEmision date, 
					   licFchVto date, 
					   licStatus character(3) not null,
					   constraint pk_Licencia primary key(licNumero),
					   constraint fk_EstLic foreign key(estNumero) references Establecimientos(estNumero),
					   constraint ck_StatusLic check(licStatus in ('APR','REV')))
GO
CREATE TABLE TipoViolacion(violCodigo int identity not null, 
                           violDescrip varchar(30) not null,
						   constraint pk_TipoViol primary key(violCodigo))
GO

CREATE TABLE Inspecciones(inspID int identity not null, 
                          inspFecha datetime, 
						  estNumero int not null, 
						  inspRiesgo varchar(5) not null, 
						  inspResultado varchar(25) not null, 
						  violCodigo int not null, 
						  inspComents varchar(100),
						  constraint pk_Inspect primary key(inspID),
						  constraint fk_EstabInsp foreign key(estNumero) references Establecimientos(estNumero),
						  constraint fk_ViolInsp foreign key(violCodigo) references TipoViolacion(violCodigo),
						  constraint ck_Riesgo check(inspRiesgo IN('Bajo','Medio','Alto')),
						  constraint ck_Result check(inspResultado IN('Pasa', 'Falla', 'Pasa con condiciones', 'Oficina no encontrada')))

GO


