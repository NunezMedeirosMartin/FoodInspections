---creacion de indices


----------------Index---------------------------------------------------------------------------------
create index IEstablecimiento on Establecimientos(estNombre, estDireccion, estTelefono);
create index IDescripcionCod on TipoViolacion(violDescrip);
create index IInspecciones on Inspecciones(inspRiesgo, inspResultado, inspComents);
create index ILicencias on Licencias(LicFchEmision, LicFchVto, LicStatus);

