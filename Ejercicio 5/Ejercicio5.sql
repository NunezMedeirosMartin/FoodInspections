----ejercicio5

--Escribir los siguientes disparadores :
--5
--a. Cada vez que se crea un nuevo establecimiento, se debe crear una licencia de aprobación
--con vencimiento 90 días, el disparador debe ser escrito teniendo en cuenta la posibilidad de
--ingresos múltiples.
set dateformat ymd;
create or alter trigger crearNuevoEstablecimiento on Establecimientos after insert as
begin
	
	insert into Licencias (estNumero,licFchEmision,licFchVto,licStatus)
	select i.estNumero, getdate(),dateadd(day,90,GETDATE()),'APR'
	from inserted i
	

end

--Probar trigger
--Nuevos establecimientos
insert into Establecimientos(estNombre,estDireccion,estTelefono,estLatitud,estLongitud)
values
('El Sabor Inca','Av. Lima 1234','2901-5678',-34.9089,-56.1892),
('Cevichería Pachamama','Calle Arequipa 987','2700 4321',-34.9143,-56.1547),
('Machu Picchu Restaurante','Rbla. República del Perú 5678','2910-9876',-34.9067,-56.1923);


--consulta en sql
select l.*, datediff(day,l.licFchEmision,l.licFchVto) as diferenciaDeDias
from Licencias l, Establecimientos e
where e.estNumero = l.estNumero and l.estNumero >20;

------------------------------Por hacer----------------------------------------------------------------
--b. No permitir que se ingresen inspecciones de establecimientos cuya licencia está próxima a
--vencer, se entiende por próxima a vencer a todas aquellas cuyo vencimiento esté dentro de
--los siguientes 5 días, el disparador debe tener en cuenta la posibilidad de registros
--múltiples

create or alter trigger LicenciaPorExpirar
on Inspecciones
after insert
as
begin
    declare @FechaHoy date = getdate();
    declare @contadorInsp int;
	set @contadorInsp = (select Count(i.inspID) 
	from INSERTED i join Licencias l on i.estNumero = l.estNumero
        where datediff(day, @FechaHoy, l.licFchVto) <= 5
	)
    delete from Inspecciones
    where inspID in (
        select i.inspID
        from INSERTED i
        join Licencias l on i.estNumero = l.estNumero
        where datediff(day, @FechaHoy, l.licFchVto) <= 5
    )

 if(@contadorInsp > 0)
 begin 
 print 'No se permitió insertar' + STR(@contadorInsp) + ' inspecciones debido a que la licencia está a punto de expirar.'
 end
end;


INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents)
VALUES

('2023-05-10', 8, 'Bajo', 'Pasa', 6, 'Inspección rutinaria, todo en orden'),
('2023-06-20', 7, 'Bajo', 'Falla', 3, 'Se encontraron áreas con falta de limpieza'),
('2023-07-15', 13, 'Bajo', 'Pasa con condiciones', 7, 'Se observaron indicios de plagas'),
('2023-07-15', 10, 'Bajo', 'Pasa con condiciones', 7, 'Se observaron indicios de plagas');

select * from Inspecciones i order by i.inspID desc 


