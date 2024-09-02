--consulta b
--b. Mostrar los 5 tipos de violaciones mas comunes, el informe debe mostrar c�digo y descripci�n
--de la violaci�n y cantidad de inspecciones en el a�o presente.
	Select top 5 tv.violCodigo, tv.violDescrip, COUNT(i.inspID) AS cantidadInspecciones
From Inspecciones i Join TipoViolacion tv on i.violCodigo = tv.violCodigo
Where year(i.inspFecha) = year(getdate())
Group by tv.violCodigo, tv.violDescrip
Order by cantidadInspecciones desc;

