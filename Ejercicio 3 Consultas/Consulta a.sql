---consulta a

--a. Mostrar nombre, direcci�n y tel�fono de los establecimientos que tuvieron la inspecci�n fallida
--m�s reciente.
	Select  e.estNombre, e.estDireccion, e.estTelefono
From Establecimientos e
	Join (Select estNumero, max(inspFecha) as maxFecha
     From Inspecciones
     Where inspResultado = 'Falla'
     Group By estNumero) As ultInspeccion on e.estNumero = ultInspeccion.estNumero
	Join Inspecciones i on e.estNumero = i.estNumero 
	and i.inspFecha = ultInspeccion.maxFecha
	Where i.inspResultado = 'Falla'
	order by e.estNumero asc;

	