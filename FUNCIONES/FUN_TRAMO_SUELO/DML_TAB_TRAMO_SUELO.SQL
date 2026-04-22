-- DML para TAB_TRAMO_SUELO
-- INSERCIÓN DE DATOS DE PRUEBA

-- Insertar datos iniciales de tramos suelo
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(
    1,
    1,
    0.0,
    25.50,
    'admin'
);

SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(
    1,
    2,
    25.50,
    75.80,
    'admin'
);

SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(
    1,
    3,
    75.80,
    125.50,
    'admin'
);

SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(
    2,
    1,
    0.0,
    15.30,
    'admin'
);

SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(
    2,
    2,
    15.30,
    56.30,
    'admin'
);

-- Consultar los datos insertados
SELECT 
    ID_TRAMO,
    ID_PERFORACION,
    ID_SUELO,
    PROFUNDIDAD_INICIO,
    PROFUNDIDAD_FIN,
    USUARIO_CREACION,
    FECHA_CREACION
FROM TAB_TRAMO_SUELO
ORDER BY ID_TRAMO;
