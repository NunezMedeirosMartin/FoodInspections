----ejercicio 6

--6-Escribir una vista que muestre todos los datos de las licencias vigentes y los días que faltan para 
--el vencimiento de cada una de ellas. 

create or alter view vistaLicenciasVigentes as(
	select *, DATEDIFF(day,GETDATE() ,licFchVto) as diasRestantes
	from Licencias
	where licStatus = 'APR' and licFchVto>= GETDATE()
);

select * from vistaLicenciasVigentes;


--Por si precisamos borrar la base de datos y no nos deja----------------------------------------------
USE master;
ALTER DATABASE FoodInspections SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
drop database FoodInspections