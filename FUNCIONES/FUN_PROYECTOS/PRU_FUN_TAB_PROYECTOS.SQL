-- PRUEBAS para TAB_PROYECTOS
-- Suite completa de pruebas para las funciones de proyectos

-- ============================================================
-- PRUEBAS PARA: FUN_VALIDAR_PROYECTOS
-- ============================================================

-- Prueba 1.1: Validación exitosa - Todos los datos válidos
SELECT 'PRUEBA 1.1: Validación exitosa' as PRUEBA;
SELECT FUN_VALIDAR_PROYECTOS(
    'SUP001',
    'Proyecto Test',
    '05001',
    'Descripción de prueba'
) as RESULTADO;

-- Prueba 1.2: ID_SUPERVISOR inexistente - DEBE FALLAR
SELECT 'PRUEBA 1.2: ID_SUPERVISOR inexistente - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_PROYECTOS(
    'SUPINVALID',
    'Proyecto Test',
    '05001',
    'Descripción de prueba'
) as RESULTADO;

-- Prueba 1.3: ID_MUNICIPIO inexistente - DEBE FALLAR
SELECT 'PRUEBA 1.3: ID_MUNICIPIO inexistente - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_PROYECTOS(
    'SUP001',
    'Proyecto Test',
    '99999',
    'Descripción de prueba'
) as RESULTADO;

-- Prueba 1.4: NOM_PROYECTO nulo - DEBE FALLAR
SELECT 'PRUEBA 1.4: NOM_PROYECTO nulo - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_PROYECTOS(
    'SUP001',
    NULL,
    '05001',
    'Descripción de prueba'
) as RESULTADO;

-- Prueba 1.5: DESCRIPCION_PROYECTO vacía - DEBE FALLAR
SELECT 'PRUEBA 1.5: DESCRIPCION_PROYECTO vacía - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_PROYECTOS(
    'SUP001',
    'Proyecto Test',
    '05001',
    ''
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_INSERTAR_PROYECTOS_JSON
-- ============================================================

-- Prueba 2.1: Inserción exitosa
SELECT 'PRUEBA 2.1: Inserción exitosa' as PRUEBA;
SELECT FUN_INSERTAR_PROYECTOS_JSON(
    'SUP001',
    'Proyecto Prueba Exitosa',
    '05001',
    'Proyecto de prueba para validación exitosa',
    'desarrollo'
) as RESULTADO;

-- Prueba 2.2: Inserción con supervisor inválido - DEBE FALLAR
SELECT 'PRUEBA 2.2: Supervisor inválido - DEBE FALLAR' as PRUEBA;
SELECT FUN_INSERTAR_PROYECTOS_JSON(
    'SUPINVALID',
    'Proyecto Inválido',
    '05001',
    'Intento con supervisor inválido',
    'desarrollo'
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_ACTUALIZAR_PROYECTOS_JSON
-- ============================================================

-- Prueba 3.1: Actualización exitosa
SELECT 'PRUEBA 3.1: Actualización exitosa' as PRUEBA;
SELECT FUN_ACTUALIZAR_PROYECTOS_JSON(
    1,
    'SUP002',
    'Proyecto Actualizado',
    '08001',
    'Descripción actualizada del proyecto',
    'desarrollo'
) as RESULTADO;

-- Prueba 3.2: Actualización con ID inexistente - DEBE FALLAR
SELECT 'PRUEBA 3.2: ID inexistente - DEBE FALLAR' as PRUEBA;
SELECT FUN_ACTUALIZAR_PROYECTOS_JSON(
    999,
    'SUP001',
    'Proyecto No Existe',
    '05001',
    'Test',
    'desarrollo'
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_OBTENER_PROYECTO_POR_ID_JSON
-- ============================================================

-- Prueba 4.1: Obtener proyecto existente
SELECT 'PRUEBA 4.1: Obtener proyecto existente' as PRUEBA;
SELECT FUN_OBTENER_PROYECTO_POR_ID_JSON(1) as RESULTADO;

-- Prueba 4.2: Obtener proyecto inexistente
SELECT 'PRUEBA 4.2: Obtener proyecto inexistente' as PRUEBA;
SELECT FUN_OBTENER_PROYECTO_POR_ID_JSON(999) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_OBTENER_TODOS_PROYECTOS_JSON
-- ============================================================

-- Prueba 5.1: Obtener todos los proyectos
SELECT 'PRUEBA 5.1: Obtener todos los proyectos' as PRUEBA;
SELECT FUN_OBTENER_TODOS_PROYECTOS_JSON() as RESULTADO;
