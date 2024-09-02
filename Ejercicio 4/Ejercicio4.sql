---ejercicio 4

--4. Utilizando T-SQL realizar los siguientes ejercicios:  
--a. Escribir un procedimiento almacenado que dado un tipo de riesgo ('Bajo','Medio','Alto'), 
--muestre los datos de las violaciones (violCodigo, violDescrip) para dicho tipo, no devolver 
--datos repetidos. 
set dateformat ymd;
create or alter procedure procedimientoTipoRiesgo @tipoRiesgo varchar(5)
as
	begin
		
		if(@tipoRiesgo in('Bajo','Medio','Alto'))
		begin
			if(exists (select inspRiesgo from Inspecciones where inspRiesgo = @tipoRiesgo))
			begin
				select distinct i.violCodigo, tv.violDescrip  
				from Inspecciones i, TipoViolacion tv
				where i.violCodigo = tv.violCodigo and i.inspRiesgo = @tipoRiesgo
				
			end
			else begin
				print 'No se enctró ningún riesgo ingresado'
			end
		end
		else begin
			print 'ERROR, No seleccionó la lista de opciones validas ("Bajo", "Medio" o "Alto")'
		end
	end
	--Pruebas
	exec procedimientoTipoRiesgo 'adfa'
	exec procedimientoTipoRiesgo 'Alto'
	exec procedimientoTipoRiesgo 'Medio'
	exec procedimientoTipoRiesgo 'Bajo'
--Verificacion	
	select distinct i.inspRiesgo,  i.violCodigo
	from Inspecciones i
	where i.inspRiesgo = 'Bajo';

--b. Mediante una función que reciba un código de violación, devolver cuantos establecimientos 
--con licencia vencida y nunca renovada tuvieron dicha violación.
create or alter function  funcionCodigoViolacion(@codViolacion int)
	returns int as
	begin 
		declare @contador int
		set @contador=(select count(distinct i.estNumero) as contadorEstablecimientos
					from Inspecciones i
					join Licencias l on l.estNumero = i.estNumero
					where l.licStatus = 'REV' and i.violCodigo = @codViolacion
					)
		return @contador
	end
	--probar function
	select dbo.funcionCodigoViolacion(1) as Resultado
	select dbo.funcionCodigoViolacion(2) as Resultado
	select dbo.funcionCodigoViolacion(3) as Resultado
	select dbo.funcionCodigoViolacion(4) as Resultado
	select dbo.funcionCodigoViolacion(5) as Resultado
	select dbo.funcionCodigoViolacion(6) as Resultado
	select dbo.funcionCodigoViolacion(7) as Resultado
	select dbo.funcionCodigoViolacion(8) as Resultado
	select dbo.funcionCodigoViolacion(9) as Resultado
	select dbo.funcionCodigoViolacion(10) as Resultado

----------------------------------Por hacer--------------------------------------------------------
--c. Escribir un procedimiento almacenado que dado un rango de fechas, retorne por parámetros 
--de salida la cantidad de inspecciones que tuvieron un resultado 'Oficina no encontrada' y la 
--cantidad de inspecciones que no tienen comentarios. 


create or alter procedure ObtenerInspeccionesPorFechas @FechaInicio datetime, @FechaFinal datetime, @CantOficinaNoEncontrada int out, @CantSinComentarios int out

	 as
	begin
	declare @FechaInicio2 datetime, @FechaFinal2 datetime;
	if(@FechaFinal > @FechaInicio)
	begin 
     set @FechaInicio2 = @FechaInicio
	 set @FechaFinal2 = @FechaFinal
	 end
	 else 
	 begin
	  set @FechaInicio2 = @FechaFinal
	 set @FechaFinal2 = @FechaInicio
	 end
		set @CantOficinaNoEncontrada= (select count(i.inspID) 
		from Inspecciones i
			where inspResultado = 'Oficina no encontrada' and i.inspFecha between @FechaInicio2 and @FechaFinal2);
		
		set @CantSinComentarios = (select count(i.inspID)
		from Inspecciones i
		where inspComents is null
		  and inspFecha between @FechaInicio2 and @FechaFinal2);
	end;
	


	declare @CantOficinaNoEncontrada int;
	declare @CantSinComentarios int;
exec ObtenerInspeccionesPorFechas  '2023-11-30', '2024-11-30', @CantOficinaNoEncontrada out,  @CantSinComentarios out;
print 'Cantidad de oficinas no encontrada'+STR(@CantOficinaNoEncontrada)
print 'Cantidad de inspecciones sin comentarios'+STR(@CantSinComentarios)

	declare @CantOficinaNoEncontrada int;
	declare @CantSinComentarios int;
exec ObtenerInspeccionesPorFechas  '2024-11-30', '2023-11-30', @CantOficinaNoEncontrada out,  @CantSinComentarios out;
print 'Cantidad de oficinas no encontrada'+STR(@CantOficinaNoEncontrada)
print 'Cantidad de inspecciones sin comentarios'+STR(@CantSinComentarios)

declare @CantOficinaNoEncontrada int;
	declare @CantSinComentarios int;
exec ObtenerInspeccionesPorFechas  '2027-11-30', '2028-11-30', @CantOficinaNoEncontrada out,  @CantSinComentarios out;
print 'Cantidad de oficinas no encontrada'+STR(@CantOficinaNoEncontrada)
print 'Cantidad de inspecciones sin comentarios'+STR(@CantSinComentarios)



