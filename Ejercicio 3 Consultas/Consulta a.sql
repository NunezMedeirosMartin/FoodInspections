---consulta a

--a. Mostrar nombre, dirección y teléfono de los establecimientos que tuvieron la inspección fallida
--más reciente.
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

	