---consulta c

--c. Mostrar n�mero y nombre de los establecimientos que cometieron todos los tipos de violaci�n
--que existen.


Select e.estNumero, e.estNombre
From Establecimientos e
Join (Select estNumero, count(distinct violCodigo) as tiposViolCometidos
     From Inspecciones
     Group by estNumero) as estViolaciones on e.estNumero = estViolaciones.estNumero
	Where estViolaciones.tiposViolCometidos = (Select Count(*) from�TipoViolacion);
