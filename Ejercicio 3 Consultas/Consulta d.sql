---consulta d

--d. Mostrar el porcentaje de inspecciones reprobadas por cada establecimiento, 
--incluir dentro de la reprobación las categorías 'Falla', 'Pasa con condiciones'.
--Nivel 3
Select e1.estNombre, 
	sum((TablaInseccionesFallidas.InspeccionesFallidas*100) /tablaInspeccionesTotales.Inspeccionestotales) as Porcentaje		
from Establecimientos e1, (Select e.estNumero, e.estNombre, 
						count(i.inspResultado) as Inspeccionestotales
							from Establecimientos e
							join Inspecciones i on i.estNumero = e.estNumero
							group by e.estNumero, e.estNombre) as tablaInspeccionesTotales,
						(Select e.estNumero, e.estNombre, 
								count(i.inspResultado) as InspeccionesFallidas
								from Establecimientos e
								join Inspecciones i on i.estNumero = e.estNumero
								where i.inspResultado in ('Falla', 'Pasa con condiciones')
								group by e.estNumero, e.estNombre) as TablaInseccionesFallidas

where e1.estNumero = tablaInspeccionesTotales.estNumero and e1.estNumero = TablaInseccionesFallidas.estNumero
group by e1.estNombre
order by e1.estNombre asc;






