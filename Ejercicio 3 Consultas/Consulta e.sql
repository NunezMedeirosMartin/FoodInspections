---consulta e

--e. Mostrar el ranking de inspecciones de establecimientos, dicho ranking debe mostrar número y 
--nombre del establecimiento, total de inspecciones, total de inspecciones aprobadas ('Pasa'), 
--porcentaje de dichas inspecciones aprobadas, total de inspecciones reprobadas ('Falla', 'Pasa con condiciones') y 
--porcentaje de dichas inspecciones reprobadas, solo tener en cuenta establecimientos cuyo status de licencia es APR.

select e1.estNumero, e1.estNombre, InspeccionesTotales.Inspeccionestotales, 
	TablaTotalAprobada.TotalInspeccionesAprobada, 
	sum((TotalInspeccionesAprobada *100)/InspeccionesTotales.Inspeccionestotales) as PorcentajeAprobado,
	TablaInseccionesFallidas.InspeccionesFallidas,
	sum((TablaInseccionesFallidas.InspeccionesFallidas*100) /InspeccionesTotales.Inspeccionestotales) as PorcentajeFallidos
from Establecimientos e1, (Select e.estNumero, e.estNombre, 
							count(i.inspResultado) as Inspeccionestotales
							from Establecimientos e
							left join Inspecciones i on i.estNumero = e.estNumero
							group by e.estNumero, e.estNombre) as InspeccionesTotales,
						(Select e.estNumero, count(i.inspResultado) as TotalInspeccionesAprobada
							from Establecimientos e
							left join Inspecciones i on i.estNumero = e.estNumero
							where i.inspResultado = 'Pasa'
							group by e.estNumero) as TablaTotalAprobada,
						(Select e.estNumero, e.estNombre, 
								count(i.inspResultado) as InspeccionesFallidas
								from Establecimientos e
								join Inspecciones i on i.estNumero = e.estNumero
								where i.inspResultado in ('Falla', 'Pasa con condiciones')
								group by e.estNumero, e.estNombre) as TablaInseccionesFallidas,
						Licencias l
where e1.estNumero = Inspeccionestotales.estNumero and e1.estNumero = TablaTotalAprobada.estNumero 
	and e1.estNumero = TablaInseccionesFallidas.estNumero and e1.estNumero = l.estNumero 
	and l.licStatus = 'APR'
group by e1.estNumero, e1.estNombre, InspeccionesTotales.Inspeccionestotales, 
	TablaTotalAprobada.TotalInspeccionesAprobada, TablaInseccionesFallidas.InspeccionesFallidas
order by PorcentajeAprobado desc;

