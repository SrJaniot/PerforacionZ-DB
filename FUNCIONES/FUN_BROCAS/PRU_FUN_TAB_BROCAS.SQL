-- PRUEBAS para TAB_BROCAS
-- Suite completa de pruebas para las funciones de brocas

-- ============================================================
-- PRUEBAS PARA: FUN_VALIDAR_BROCAS
-- ============================================================

-- Prueba 1.1: Validación exitosa - Todos los datos válidos
SELECT 'PRUEBA 1.1: Validación exitosa' as PRUEBA;
SELECT FUN_VALIDAR_BROCAS(
    'Broca Test',
    'PDC',
    'Prueba de validación',
    5.875,
    'Test Matrix',
    'Test Brand'
) as RESULTADO;

-- Prueba 1.2: NOM_BROCA nulo
SELECT 'PRUEBA 1.2: NOM_BROCA nulo - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_BROCAS(
    NULL,
    'PDC',
    'Prueba',
    5.875,
    'Test Matrix',
    'Test Brand'
) as RESULTADO;

-- Prueba 1.3: TIPO_BROCA vacío
SELECT 'PRUEBA 1.3: TIPO_BROCA vacío - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_BROCAS(
    'Broca Test',
    '',
    'Prueba',
    5.875,
    'Test Matrix',
    'Test Brand'
) as RESULTADO;

-- Prueba 1.4: TAMANIO_BROCA negativo
SELECT 'PRUEBA 1.4: TAMANIO_BROCA negativo - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_BROCAS(
    'Broca Test',
    'PDC',
    'Prueba',
    -5.875,
    'Test Matrix',
    'Test Brand'
) as RESULTADO;

-- Prueba 1.5: TAMANIO_BROCA cero
SELECT 'PRUEBA 1.5: TAMANIO_BROCA cero - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_BROCAS(
    'Broca Test',
    'PDC',
    'Prueba',
    0,
    'Test Matrix',
    'Test Brand'
) as RESULTADO;

-- Prueba 1.6: MATRIX_BROCA nulo
SELECT 'PRUEBA 1.6: MATRIX_BROCA nulo - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_BROCAS(
    'Broca Test',
    'PDC',
    'Prueba',
    5.875,
    NULL,
    'Test Brand'
) as RESULTADO;

-- Prueba 1.7: MARCA_BROCA nulo
SELECT 'PRUEBA 1.7: MARCA_BROCA nulo - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_BROCAS(
    'Broca Test',
    'PDC',
    'Prueba',
    5.875,
    'Test Matrix',
    NULL
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_INSERTAR_BROCAS_JSON
-- ============================================================

-- Prueba 2.1: Inserción exitosa
SELECT 'PRUEBA 2.1: Inserción exitosa' as PRUEBA;
SELECT FUN_INSERTAR_BROCAS_JSON(
    'Broca Prueba Exitosa',
    'PDC',
    'Broca de prueba para validación exitosa',
    6.5,
    'PDC Matrix',
    'Smith Services',
    'desarrollo'
) as RESULTADO;

-- Prueba 2.2: Inserción de otra broca - SIN RESTRICCION DE ID YA QUE SE AUTO-GENERA
SELECT 'PRUEBA 2.2: Segunda inserción válida' as PRUEBA;
SELECT FUN_INSERTAR_BROCAS_JSON(
    'Broca Segunda Prueba',
    'PDC',
    'Intento de segunda inserción con auto-generación de ID',
    5.875,
    'Test Matrix',
    'Baker Hughes',
    'desarrollo'
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_ACTUALIZAR_BROCAS_JSON
-- ============================================================

-- Prueba 3.1: Actualización exitosa
SELECT 'PRUEBA 3.1: Actualización exitosa' as PRUEBA;
SELECT FUN_ACTUALIZAR_BROCAS_JSON(
    100,
    'Broca Actualizada',
    'TRICONICA',
    'Descripción actualizada',
    7.0,
    'Acero Mejorado',
    'Weatherford',
    'desarrollo'
) as RESULTADO;

-- Prueba 3.2: Actualización con ID inexistente - DEBE FALLAR
SELECT 'PRUEBA 3.2: ID inexistente - DEBE FALLAR' as PRUEBA;
SELECT FUN_ACTUALIZAR_BROCAS_JSON(
    999,
    'Broca No Existe',
    'PDC',
    'Test',
    5.0,
    'Test Matrix',
    'Varel',
    'desarrollo'
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_OBTENER_BROCA_POR_ID_JSON
-- ============================================================

-- Prueba 4.1: Obtener broca existente
SELECT 'PRUEBA 4.1: Obtener broca existente' as PRUEBA;
SELECT FUN_OBTENER_BROCA_POR_ID_JSON(100) as RESULTADO;

-- Prueba 4.2: Obtener broca inexistente
SELECT 'PRUEBA 4.2: Obtener broca inexistente' as PRUEBA;
SELECT FUN_OBTENER_BROCA_POR_ID_JSON(999) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_OBTENER_TODAS_BROCAS_JSON
-- ============================================================

-- Prueba 5.1: Obtener todas las brocas
SELECT 'PRUEBA 5.1: Obtener todas las brocas' as PRUEBA;
SELECT FUN_OBTENER_TODAS_BROCAS_JSON() as RESULTADO;
