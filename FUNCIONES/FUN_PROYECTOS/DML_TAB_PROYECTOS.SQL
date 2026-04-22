-- DML para TAB_PROYECTOS
-- INSERCIÓN DE DATOS DE PRUEBA
-- NOTA: Los supervisores y municipios deben existir previamente

-- Insertar datos iniciales de proyectos
SELECT FUN_INSERTAR_PROYECTOS_JSON(
    'SUP001',
    'Proyecto Perforación Zona A',
    '05001',
    'Proyecto de exploración de petróleo en la zona A del departamento de Antioquia',
    'admin'
);

SELECT FUN_INSERTAR_PROYECTOS_JSON(
    'SUP002',
    'Proyecto Sondeo Complementario',
    '08001',
    'Proyecto de sondeo geotécnico y perforación de pozo complementario',
    'admin'
);

SELECT FUN_INSERTAR_PROYECTOS_JSON(
    'SUP003',
    'Proyecto Validación Estructural',
    '13001',
    'Proyecto para validar la estructura geológica mediante perforaciones estratigráficas',
    'admin'
);

-- Consultar los datos insertados
SELECT 
    ID_PROYECTO,
    ID_SUPERVISOR,
    NOM_PROYECTO,
    ID_MUNICIPIO,
    USUARIO_CREACION,
    FECHA_CREACION
FROM TAB_PROYECTOS
ORDER BY ID_PROYECTO;
