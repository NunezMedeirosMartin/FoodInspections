set dateformat ymd;

--insert de datos
--select * from Establecimientos
insert into Establecimientos(estNombre, estDireccion,estTelefono, estLatitud, estLongitud) 
	values 
	('El Asador Criollo', 'Av. Italia 1234', '2901-5678', -34.901234, -56.123456),
('La Parrilla del Puerto', 'Rambla Wilson 5678', '2902-3456', -34.812345, -56.234567),
('Pizza Mía', 'Av. Libertador 9876', '2903-4567', -34.987654, -56.345678),
('El Rinconcito Oriental', 'Calle Oriental 5432', '2904-5678', -34.876543, -56.456789),
('Sabor a Mar', 'Av. Brasil 6543', '2905-6789', -34.765432, -56.567890),
('La Cantina Italiana', 'Calle Italia 4321', '2906-7890', -34.654321, -56.678901),
('El Patio Mexicano', 'Av. México 321', '2907-8901', -34.543210, -56.789012),
('Parrillada La Estrella', 'Av. Estrella 123', '2908-9012', -34.432109, -56.890123),
('Sabores del Este', 'Calle del Este 456', '2909-0123', -34.321098, -56.901234),
('El Rincón Gaucho', 'Av. Gaucho 789', '2910-1234', -34.210987, -56.012345),
('La Cabaña del Chef', 'Calle del Chef 987', '2911-2345', -34.109876, -56.123456),
('Sushi Nippon', 'Av. Nippon 654', '2912-3456', -34.098765, -56.234567),
('La Parrillita', 'Calle Parrilla 321', '2913-4567', -34.987654, -56.345678),
('La Cuchara de Oro', 'Av. de Oro 654', '2914-5678', -34.876543, -56.456789),
('Delicias de Asia', 'Calle Asia 789', '2915-6789', -34.765432, -56.567890),
('El Fogón de Doña María', 'Av. Doña María 123', '2916-7890', -34.654321, -56.678901),
('La Taquería', 'Calle Taquería 456', '2917-8901', -34.543210, -56.789012),
('Pizzería Bella Napoli', 'Av. Bella Napoli 789', '2918-9012', -34.432109, -56.890123),
('El Rincón Peruano', 'Calle Peruana 654', '2919-0123', -34.321098, -56.901234),
('La Trattoria', 'Av. Trattoria 321', '2920-1234', -34.210987, -56.012345);


-- Generar nuevos datos ficticios para Licencias
--select * from Licencias
INSERT INTO Licencias (estNumero, licFchEmision, licFchVto, licStatus)
VALUES
(1, '2024-01-01', '2024-06-30', 'APR'),
(2, '2023-06-15', '2024-06-15', 'REV'),
(3, '2023-09-30', '2024-07-30', 'APR'),
(4, '2024-03-10', '2025-03-10', 'REV'),
(5, '2023-11-20', '2024-11-20', 'APR'),
(6, '2024-02-28', '2024-06-15', 'REV'),
(7, '2023-08-05', '2024-06-17', 'APR'),
(8, '2023-12-25', '2024-06-19', 'REV'),
(9, '2024-04-15', '2025-04-15', 'APR'),
(10, '2023-10-10', '2024-10-10', 'REV'),
(11, '2024-01-20', '2024-06-29', 'APR'),
(12, '2023-07-08', '2024-06-27', 'REV'),
(13, '2023-09-18', '2024-06-18', 'APR'),
(14, '2024-02-05', '2024-06-25', 'REV'),
(15, '2023-11-30', '2024-11-30', 'APR'),
(16, '2024-03-25', '2024-06-25', 'REV'),
(17, '2023-08-15', '2024-06-15', 'APR'),
(18, '2024-01-10', '2025-06-10', 'REV'),
(19, '2023-10-25', '2024-06-25', 'APR'),
(20, '2024-04-05', '2025-04-05', 'REV');


INSERT INTO TipoViolacion (violDescrip) VALUES
('Almacenamiento inadecuado'),
('Manipulación incorrecta'),
('Falta de higiene personal'),
('Contaminación cruzada'),
('Uso de alimentos vencidos'),
('Mal mantenimiento equipos'),
('Falta de control de plagas'),
('Incumplimiento de etiquetado'),
('Ausencia registro temperaturas'),
('No contar con licencia');

select *
from TipoViolacion;


-- Insertar datos en Inspecciones con restricciones adicionales en los violCodigo
-- Insertar datos en Inspecciones con restricciones adicionales en los violCodigo
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents)
VALUES
-- Primer tercio (Bajo riesgo)
('2023-05-10', 1, 'Bajo', 'Pasa', 6, 'Inspección rutinaria, todo en orden'),
('2023-06-20', 7, 'Bajo', 'Falla', 3, 'Se encontraron áreas con falta de limpieza'),
('2023-07-15', 12, 'Bajo', 'Pasa con condiciones', 7, 'Se observaron indicios de plagas'),
('2023-08-25', 20, 'Bajo', 'Oficina no encontrada', 2, 'No se pudo realizar la inspección'),
('2023-09-12', 8, 'Bajo', 'Pasa', 4, 'Se realizó una revisión exhaustiva y todo está en orden'),
('2023-10-30', 19, 'Bajo', 'Falla', 10, 'Se identificaron problemas con la ventilación en la cocina'),
('2023-12-17', 15, 'Bajo', 'Oficina no encontrada', 8, 'Se requiere inspección más detallada'),
('2024-02-14', 18, 'Bajo', 'Falla', 3, 'Se identificaron áreas con problemas de almacenamiento'),
('2024-03-20', 2, 'Bajo', 'Pasa con condiciones', 4, 'Se recomienda mejorar la higiene personal del personal'),
('2024-04-05', 13, 'Bajo', 'Oficina no encontrada', 7, 'La inspección fue interrumpida por problemas técnicos'),
('2024-05-18', 5, 'Bajo', 'Pasa', 6, 'El personal estaba siguiendo adecuadamente los procedimientos');
--sin comentarios
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo)
VALUES
('2024-06-27', 10, 'Bajo', 'Falla', 2),
('2024-07-30', 17, 'Bajo', 'Pasa con condiciones', 4),
('2024-08-08', 6, 'Bajo', 'Oficina no encontrada', 10),
('2024-09-19', 14, 'Bajo', 'Pasa', 1),
('2024-10-10', 11, 'Bajo', 'Falla', 7),
('2024-11-25', 4, 'Bajo', 'Pasa con condiciones', 8),
('2024-12-06', 16, 'Bajo', 'Oficina no encontrada', 10);

select *from Inspecciones;
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents)
VALUES
-- Segundo tercio (Medio riesgo)
('2024-01-15', 13, 'Medio', 'Pasa', 10, 'Se identificaron áreas con etiquetado incorrecto'),
('2024-02-28', 4, 'Medio', 'Falla', 7, 'Se encontraron áreas con almacenamiento inadecuado'),
('2024-03-10', 18, 'Medio', 'Pasa con condiciones', 9, 'Se observaron fluctuaciones en las temperaturas'),
('2024-04-20', 11, 'Medio', 'Oficina no encontrada', 6, 'Se realizaron recomendaciones para el control de plagas'),
('2024-05-07', 9, 'Medio', 'Pasa', 8, 'Se identificaron áreas con equipos en mal estado'),
('2024-06-14', 16, 'Medio', 'Falla', 3, 'Se observaron áreas con manipulación incorrecta de alimentos'),
('2024-07-25', 2, 'Medio', 'Pasa con condiciones', 4, 'Se requiere mejorar la gestión de alimentos vencidos'),
('2024-08-03', 20, 'Medio', 'Oficina no encontrada', 5, 'La inspección fue reprogramada debido a problemas técnicos'),
('2024-09-14', 5, 'Medio', 'Pasa', 9, 'Se realizaron recomendaciones para evitar la contaminación cruzada');

--Sin comentarios:
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo)
VALUES
('2024-10-05', 1, 'Medio', 'Falla', 6),
('2024-11-21', 15, 'Medio', 'Pasa con condiciones', 8),
('2024-12-10', 3, 'Medio', 'Oficina no encontrada', 2),
('2024-06-27', 6, 'Medio', 'Pasa con condiciones', 1);

INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents)
VALUES
-- Tercer tercio (Alto riesgo)
('2024-01-29', 8, 'Alto', 'Pasa', 3, 'Se requiere cierre inmediato debido a falta de licencia sanitaria'),
('2024-02-17', 19, 'Alto', 'Falla', 4, 'Se identificaron áreas con manipulación incorrecta de alimentos'),
('2024-03-30', 12, 'Alto', 'Pasa con condiciones', 6, 'Se requiere mejorar la higiene del personal'),
('2024-01-15', 5, 'Alto', 'Oficina no encontrada', 7, 'La inspección fue cancelada debido a problemas de agenda'),
('2024-02-28', 15, 'Alto', 'Pasa', 9, 'Se observaron áreas con contaminación cruzada'),
('2024-03-10', 10, 'Alto', 'Falla', 10, 'Se identificaron áreas con mal mantenimiento de equipos'),
('2024-04-20', 3, 'Alto', 'Pasa con condiciones', 1, 'Se requiere mejorar el control de plagas'),
('2024-06-14', 8, 'Alto', 'Pasa', 9, 'Se observaron áreas con ausencia de registro de temperaturas');
--Sin comentarios
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo)
VALUES
('2024-07-25', 13, 'Alto', 'Falla', 2),
('2024-09-14', 17, 'Alto', 'Oficina no encontrada', 4),
('2024-11-21', 19, 'Alto', 'Falla', 1),
('2024-12-10', 4, 'Alto', 'Pasa con condiciones', 3),
('2024-06-27', 16, 'Alto', 'Falla', 7),
('2024-07-30', 18, 'Alto', 'Pasa con condiciones', 10);


INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents)
VALUES
-- Nuevos datos para el establecimiento 12
('2024-03-01', 12, 'Alto', 'Pasa', 5, 'El establecimiento cumple con las condiciones mínimas de seguridad'),
('2024-04-10', 12, 'Alto', 'Falla', 8, 'Se identificaron problemas graves de higiene personal'),
('2024-05-15', 12, 'Alto', 'Oficina no encontrada', 6, 'No se pudo realizar la inspección debido a que el establecimiento estaba cerrado'),
('2024-06-20', 12, 'Alto', 'Pasa con condiciones', 4, 'Se observó manipulación incorrecta de alimentos'),
('2024-07-05', 12, 'Alto', 'Pasa', 1, 'Las condiciones del establecimiento mejoraron significativamente desde la última inspección'),
('2024-08-10', 12, 'Alto', 'Falla', 3, 'Se encontraron alimentos vencidos en las áreas de almacenamiento'),
('2024-09-25', 12, 'Alto', 'Oficina no encontrada', 2, 'El establecimiento estaba cerrado al momento de la inspección'),
('2024-10-30', 12, 'Alto', 'Pasa con condiciones', 7, 'Se recomienda mejorar la ventilación en las áreas de cocina'),
('2024-11-15', 12, 'Alto', 'Pasa', 9, 'Se requiere registrar adecuadamente las temperaturas'),
('2024-12-05', 12, 'Alto', 'Falla', 10, 'El establecimiento no cuenta con la licencia requerida'),
-- Nuevos datos para el establecimiento 19
('2024-03-01', 19, 'Alto', 'Pasa', 5, 'El establecimiento cumple con las condiciones mínimas de seguridad'),
('2024-04-10', 19, 'Alto', 'Falla', 8, 'Se identificaron problemas graves de higiene personal'),
('2024-05-15', 19, 'Alto', 'Oficina no encontrada', 6, 'No se pudo realizar la inspección debido a que el establecimiento estaba cerrado'),
('2024-06-20', 19, 'Alto', 'Pasa con condiciones', 4, 'Se observó manipulación incorrecta de alimentos'),
('2024-07-05', 19, 'Alto', 'Pasa', 1, 'Las condiciones del establecimiento mejoraron significativamente desde la última inspección'),
('2024-08-10', 19, 'Alto', 'Falla', 3, 'Se encontraron alimentos vencidos en las áreas de almacenamiento'),
('2024-09-25', 19, 'Alto', 'Oficina no encontrada', 2, 'El establecimiento estaba cerrado al momento de la inspección'),
('2024-10-30', 19, 'Alto', 'Pasa con condiciones', 7, 'Se recomienda mejorar la ventilación en las áreas de cocina'),
('2024-11-15', 19, 'Alto', 'Pasa', 9, 'Se requiere registrar adecuadamente las temperaturas'),
('2024-12-05', 19, 'Alto', 'Falla', 10, 'El establecimiento no cuenta con la licencia requerida');







