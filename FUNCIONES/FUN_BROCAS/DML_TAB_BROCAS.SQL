-- DML para TAB_BROCAS
-- INSERCIÓN DE DATOS DE PRUEBA

-- Insertar datos iniciales de brocas
SELECT FUN_INSERTAR_BROCAS_JSON(
    'Broca PDC 5 7/8',
    'PDC',
    'Broca tricónica PDC de 5 7/8 pulgadas para formaciones duras',
    5.875,
    'PDC Matrix',
    'admin'
);

SELECT FUN_INSERTAR_BROCAS_JSON(
    'Broca Triconica 6',
    'TRICONICA',
    'Broca tricónica estándar de 6 pulgadas para formaciones medias',
    6.0,
    'Acero',
    'admin'
);

SELECT FUN_INSERTAR_BROCAS_JSON(
    'Broca Diamante 4.5',
    'DIAMANTE',
    'Broca de diamante natural de 4 1/2 pulgadas para roca muy dura',
    4.5,
    'Diamante Natural',
    'admin'
);

SELECT FUN_INSERTAR_BROCAS_JSON(
    'Broca PDC 7 7/8',
    'PDC',
    'Broca PDC de 7 7/8 pulgadas para perforación profunda',
    7.875,
    'PDC Matrix',
    'admin'
);

SELECT FUN_INSERTAR_BROCAS_JSON(
    'Broca Triconica 3.5',
    'TRICONICA',
    'Broca tricónica de 3 1/2 pulgadas para formaciones blandas',
    3.5,
    'Acero',
    'admin'
);

-- Consultar los datos insertados
SELECT 
    ID_BROCA,
    NOM_BROCA,
    TIPO_BROCA,
    TAMANIO_BROCA,
    MATRIX_BROCA,
    USUARIO_CREACION,
    FECHA_CREACION
FROM TAB_BROCAS
ORDER BY ID_BROCA;
