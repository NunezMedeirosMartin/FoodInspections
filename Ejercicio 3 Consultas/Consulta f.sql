---consulta f

--f. Mostrar la diferencia de d�as en que cada establecimiento renov� su licencia.
select e.estNombre, DATEDIFF(day, l.licFchEmision, GETDATE()) AS DiferenciaEnDias
from Establecimientos e
join Licencias l on l.estNumero = e.estNumero