---consulta f

--f. Mostrar la diferencia de días en que cada establecimiento renovó su licencia.
select e.estNombre, DATEDIFF(day, l.licFchEmision, GETDATE()) AS DiferenciaEnDias
from Establecimientos e
join Licencias l on l.estNumero = e.estNumero