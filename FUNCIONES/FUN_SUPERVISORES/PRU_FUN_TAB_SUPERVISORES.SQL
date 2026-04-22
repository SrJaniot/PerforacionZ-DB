-- PRUEBAS para TAB_SUPERVISORES
-- Suite completa de pruebas para las funciones de supervisores

-- ============================================================
-- PRUEBAS PARA: FUN_VALIDAR_SUPERVISORES
-- ============================================================
COMMENT ON TABLE TAB_SUPERVISORES IS 'Pruebas de validación para inserción';

-- Prueba 1.1: Validación exitosa - Todos los datos válidos
SELECT 'PRUEBA 1.1: Validación exitosa' as PRUEBA;
SELECT FUN_VALIDAR_SUPERVISORES(
    'SUP099',
    'Prueba Supervisor',
    'prueba@test.com',
    '3109999999'
) as RESULTADO;

-- Prueba 1.2: ID_SUPERVISOR nulo
SELECT 'PRUEBA 1.2: ID_SUPERVISOR nulo - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_SUPERVISORES(
    NULL,
    'Test Supervisor',
    'test@test.com',
    '3101111111'
) as RESULTADO;

-- Prueba 1.3: ID_SUPERVISOR vacío
SELECT 'PRUEBA 1.3: ID_SUPERVISOR vacío - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_SUPERVISORES(
    '',
    'Test Supervisor',
    'test@test.com',
    '3101111111'
) as RESULTADO;

-- Prueba 1.4: NOM_SUPERVISOR nulo
SELECT 'PRUEBA 1.4: NOM_SUPERVISOR nulo - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_SUPERVISORES(
    'SUPTMP01',
    NULL,
    'test@test.com',
    '3101111111'
) as RESULTADO;

-- Prueba 1.5: CORREO_SUPERVISOR con formato inválido
SELECT 'PRUEBA 1.5: Email con formato inválido - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_SUPERVISORES(
    'SUPTMP02',
    'Test User',
    'emailsincorreo.com',
    '3101111111'
) as RESULTADO;

-- Prueba 1.6: CORREO_SUPERVISOR nulo
SELECT 'PRUEBA 1.6: Email nulo - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_SUPERVISORES(
    'SUPTMP03',
    'Test User',
    NULL,
    '3101111111'
) as RESULTADO;

-- Prueba 1.7: NUEM_CEL_SUPERVISOR con menos de 10 dígitos
SELECT 'PRUEBA 1.7: Celular con menos de 10 dígitos - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_SUPERVISORES(
    'SUPTMP04',
    'Test User',
    'test@email.com',
    '310111111'
) as RESULTADO;

-- Prueba 1.8: NUEM_CEL_SUPERVISOR con más de 10 dígitos
SELECT 'PRUEBA 1.8: Celular con más de 10 dígitos - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_SUPERVISORES(
    'SUPTMP05',
    'Test User',
    'test@email.com',
    '31011111111'
) as RESULTADO;

-- Prueba 1.9: NUEM_CEL_SUPERVISOR con caracteres no numéricos
SELECT 'PRUEBA 1.9: Celular con caracteres - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_SUPERVISORES(
    'SUPTMP06',
    'Test User',
    'test@email.com',
    '310ABC4567'
) as RESULTADO;

-- Prueba 1.10: NUEM_CEL_SUPERVISOR nulo
SELECT 'PRUEBA 1.10: Celular nulo - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_SUPERVISORES(
    'SUPTMP07',
    'Test User',
    'test@email.com',
    NULL
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_INSERTAR_SUPERVISORES_JSON
-- ============================================================

-- Prueba 2.1: Inserción exitosa
SELECT 'PRUEBA 2.1: Inserción exitosa' as PRUEBA;
SELECT FUN_INSERTAR_SUPERVISORES_JSON(
    'SUP999',
    'Supervisor Test 999',
    'supervisor999@test.com',
    '3109999999',
    'admin'
) as RESULTADO;

-- Prueba 2.2: Intento de inserción con ID duplicado
SELECT 'PRUEBA 2.2: Inserción con ID duplicado - DEBE FALLAR' as PRUEBA;
SELECT FUN_INSERTAR_SUPERVISORES_JSON(
    'SUP999',
    'Otro Supervisor',
    'otro@test.com',
    '3108888888',
    'admin'
) as RESULTADO;

-- Prueba 2.3: Intento de inserción con Email duplicado (después de 2.1)
SELECT 'PRUEBA 2.3: Inserción con Email duplicado - DEBE FALLAR' as PRUEBA;
SELECT FUN_INSERTAR_SUPERVISORES_JSON(
    'SUP998',
    'Supervisor Test 998',
    'supervisor999@test.com',
    '3107777777',
    'admin'
) as RESULTADO;

-- Prueba 2.4: Intento de inserción con Celular duplicado (después de 2.1)
SELECT 'PRUEBA 2.4: Inserción con Celular duplicado - DEBE FALLAR' as PRUEBA;
SELECT FUN_INSERTAR_SUPERVISORES_JSON(
    'SUP997',
    'Supervisor Test 997',
    'supervisor997@test.com',
    '3109999999',
    'admin'
) as RESULTADO;

-- Prueba 2.5: Intento de inserción con datos inválidos
SELECT 'PRUEBA 2.5: Inserción con email inválido - DEBE FALLAR' as PRUEBA;
SELECT FUN_INSERTAR_SUPERVISORES_JSON(
    'SUP996',
    'Supervisor Test 996',
    'emailinvalido.com',
    '3106666666',
    'admin'
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_VALIDAR_ACTUALIZAR_SUPERVISORES
-- ============================================================

-- Prueba 3.1: Validación exitosa para actualización
SELECT 'PRUEBA 3.1: Validación de actualización exitosa' as PRUEBA;
SELECT FUN_VALIDAR_ACTUALIZAR_SUPERVISORES(
    'SUP999',
    'Supervisor Test 999 - Actualizado',
    'supervisor999@test.com',
    '3109999999'
) as RESULTADO;

-- Prueba 3.2: Intentar actualizar ID que no existe
SELECT 'PRUEBA 3.2: Actualizar ID inexistente - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_ACTUALIZAR_SUPERVISORES(
    'SUPNOEXISTE',
    'Test User',
    'test@test.com',
    '3101111111'
) as RESULTADO;

-- Prueba 3.3: Permitir mantener el mismo email en actualización
SELECT 'PRUEBA 3.3: Mantener el mismo email - DEBE FUNCIONAR' as PRUEBA;
SELECT FUN_VALIDAR_ACTUALIZAR_SUPERVISORES(
    'SUP999',
    'Supervisor Test 999 - Actualizado',
    'supervisor999@test.com',
    '3109999999'
) as RESULTADO;

-- Prueba 3.4: Intentar cambiar a email que ya existe en otro registro
-- PRIMERO: Asegurar que SUP001 existe
SELECT 'PRUEBA 3.4.1: Verificar SUP001 existe' as PRUEBA;
SELECT COUNT(*) FROM TAB_SUPERVISORES WHERE ID_SUPERVISOR = 'SUP001';

-- LUEGO: Intentar cambiar email de SUP999 al de SUP001
SELECT 'PRUEBA 3.4.2: Cambiar a email duplicado - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_ACTUALIZAR_SUPERVISORES(
    'SUP999',
    'Supervisor Test 999',
    'carlos.garcia@perforacionz.com',
    '3109999999'
) as RESULTADO;

-- Prueba 3.5: Permitir cambiar celular a uno nuevo
SELECT 'PRUEBA 3.5: Cambiar a celular válido - DEBE FUNCIONAR' as PRUEBA;
SELECT FUN_VALIDAR_ACTUALIZAR_SUPERVISORES(
    'SUP999',
    'Supervisor Test 999 - Actualizado',
    'newemail@test.com',
    '3105555555'
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_ACTUALIZAR_SUPERVISORES_JSON
-- ============================================================

-- Prueba 4.1: Actualización exitosa
SELECT 'PRUEBA 4.1: Actualización exitosa' as PRUEBA;
SELECT FUN_ACTUALIZAR_SUPERVISORES_JSON(
    'SUP999',
    'Supervisor Test 999 - Actualizado',
    'supervisor999actualizado@test.com',
    '3105555555',
    'admin'
) as RESULTADO;

-- Verificar cambios
SELECT 'Verificación de cambios' as PRUEBA;
SELECT 
    ID_SUPERVISOR,
    NOM_SUPERVISOR,
    CORREO_SUPERVISOR,
    NUEM_CEL_SUPERVISOR,
    USUARIO_MODIFICACION,
    FECHA_MODIFICACION
FROM TAB_SUPERVISORES
WHERE ID_SUPERVISOR = 'SUP999';

-- Prueba 4.2: Intentar actualizar un registro que no existe
SELECT 'PRUEBA 4.2: Actualizar registro inexistente - DEBE FALLAR' as PRUEBA;
SELECT FUN_ACTUALIZAR_SUPERVISORES_JSON(
    'SUPNUEVOTEST',
    'Test User',
    'test@test.com',
    '3101111111',
    'admin'
) as RESULTADO;

-- Prueba 4.3: Intentar actualizar con datos inválidos
SELECT 'PRUEBA 4.3: Actualizar con email inválido - DEBE FALLAR' as PRUEBA;
SELECT FUN_ACTUALIZAR_SUPERVISORES_JSON(
    'SUP999',
    'Supervisor Actualizado',
    'emailinvalido.com',
    '3101111111',
    'admin'
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_OBTENER_SUPERVISOR_POR_ID_JSON
-- ============================================================

-- Prueba 5.1: Obtener supervisor existente por ID
SELECT 'PRUEBA 5.1: Obtener supervisor SUP001 por ID - EXITOSA' as PRUEBA;
SELECT FUN_OBTENER_SUPERVISOR_POR_ID_JSON('SUP001') as RESULTADO;

-- Prueba 5.2: Obtener supervisor existente por ID (SUP999 creado en prueba anterior)
SELECT 'PRUEBA 5.2: Obtener supervisor SUP999 por ID - EXITOSA' as PRUEBA;
SELECT FUN_OBTENER_SUPERVISOR_POR_ID_JSON('SUP999') as RESULTADO;

-- Prueba 5.3: Intentar obtener supervisor con ID que no existe
SELECT 'PRUEBA 5.3: Obtener supervisor SUPNOEXISTE - DEBE FALLAR' as PRUEBA;
SELECT FUN_OBTENER_SUPERVISOR_POR_ID_JSON('SUPNOEXISTE') as RESULTADO;

-- Prueba 5.4: Obtener supervisor con ID nulo
SELECT 'PRUEBA 5.4: Obtener supervisor NULL - DEBE FALLAR' as PRUEBA;
SELECT FUN_OBTENER_SUPERVISOR_POR_ID_JSON(NULL) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_OBTENER_TODOS_SUPERVISORES_JSON
-- ============================================================

-- Prueba 6.1: Obtener lista completa de supervisores
SELECT 'PRUEBA 6.1: Obtener lista completa de supervisores - EXITOSA' as PRUEBA;
SELECT FUN_OBTENER_TODOS_SUPERVISORES_JSON() as RESULTADO;

-- Prueba 6.2: Verificar que la lista contiene datos
SELECT 'PRUEBA 6.2: Verificar lista no está vacía' as PRUEBA;
SELECT (FUN_OBTENER_TODOS_SUPERVISORES_JSON()->'DATOS') IS NOT NULL as LISTA_CONTIENE_DATOS;
SELECT FUN_OBTENER_TODOS_SUPERVISORES_JSON();
-- ============================================================
-- RESUMEN FINAL Y DATOS ACTUALES
-- ============================================================

SELECT '=== RESUMEN DE SUPERVISORES EN BASE DE DATOS ===' as TITULO;
SELECT 
    ID_SUPERVISOR,
    NOM_SUPERVISOR,
    CORREO_SUPERVISOR,
    NUEM_CEL_SUPERVISOR,
    USUARIO_CREACION,
    USUARIO_MODIFICACION,
    FECHA_CREACION,
    FECHA_MODIFICACION
FROM TAB_SUPERVISORES
ORDER BY ID_SUPERVISOR;
