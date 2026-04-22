-- DML para TAB_SUELOS
-- INSERCIÓN DE DATOS DE PRUEBA

-- Insertar datos iniciales de suelos
SELECT FUN_INSERTAR_SUELOS_JSON(
    1,
    'Suelo Arenoso Fino',
    'Arenoso',
    'Suelo compuesto principalmente por granos de arena fina, con buena drenabilidad',
    'admin'
);

SELECT FUN_INSERTAR_SUELOS_JSON(
    2,
    'Suelo Arcilloso Compacto',
    'Arcilloso',
    'Suelo con alta concentración de arcilla, muy compacto y con baja permeabilidad',
    'admin'
);

SELECT FUN_INSERTAR_SUELOS_JSON(
    3,
    'Suelo Limoso',
    'Limoso',
    'Suelo con textura intermedia entre arena y arcilla, presenta características de ambos',
    'admin'
);

SELECT FUN_INSERTAR_SUELOS_JSON(
    4,
    'Suelo Orgánico Rich',
    'Orgánico',
    'Suelo rico en materia orgánica, oscuro y con alto contenido de nutrientes',
    'admin'
);

SELECT FUN_INSERTAR_SUELOS_JSON(
    5,
    'Roca Sedimentaria',
    'Rocoso',
    'Formación rocosa sedimentaria con capas de piedra caliza y arenisca',
    'admin'
);

SELECT FUN_INSERTAR_SUELOS_JSON(
    6,
    'Suelo Mixto Heterogéneo',
    'Mixto',
    'Composición variada con mezcla de arena, arcilla y grava en diferentes proporciones',
    'admin'
);

-- Consultar los datos insertados
SELECT 
    ID_SUELO,
    NOM_SUELO,
    TIPO_SUELO,
    DESCRIPCION_SUELO,
    USUARIO_CREACION,
    FECHA_CREACION
FROM TAB_SUELOS
ORDER BY ID_SUELO;
