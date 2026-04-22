-- PRUEBAS para TAB_SUELOS
-- Suite completa de pruebas para las funciones de suelos

-- ============================================================
-- PRUEBAS PARA: FUN_VALIDAR_SUELOS
-- ============================================================
COMMENT ON TABLE TAB_SUELOS IS 'Pruebas de validación para inserción';

-- Prueba 1.1: Validación exitosa - Todos los datos válidos
SELECT 'PRUEBA 1.1: Validación exitosa' as PRUEBA;
SELECT FUN_VALIDAR_SUELOS(
    99,
    'Suelo Prueba',
    'Arenoso',
    'Descripción de prueba del suelo'
) as RESULTADO;

-- Prueba 1.2: ID_SUELO nulo
SELECT 'PRUEBA 1.2: ID_SUELO nulo - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_SUELOS(
    NULL,
    'Suelo Test',
    'Arcilloso',
    'Descripción de test'
) as RESULTADO;

-- Prueba 1.3: ID_SUELO negativo
SELECT 'PRUEBA 1.3: ID_SUELO negativo - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_SUELOS(
    -1,
    'Suelo Test',
    'Arenoso',
    'Descripción de test'
) as RESULTADO;

-- Prueba 1.4: NOM_SUELO nulo
SELECT 'PRUEBA 1.4: NOM_SUELO nulo - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_SUELOS(
    97,
    NULL,
    'Limoso',
    'Descripción válida'
) as RESULTADO;

-- Prueba 1.5: NOM_SUELO vacío
SELECT 'PRUEBA 1.5: NOM_SUELO vacío - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_SUELOS(
    97,
    '',
    'Orgánico',
    'Descripción válida'
) as RESULTADO;

-- Prueba 1.6: NOM_SUELO muy corto (menos de 3 caracteres)
SELECT 'PRUEBA 1.6: NOM_SUELO muy corto - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_SUELOS(
    97,
    'AB',
    'Rocoso',
    'Descripción válida'
) as RESULTADO;

-- Prueba 1.7: TIPO_SUELO nulo
SELECT 'PRUEBA 1.7: TIPO_SUELO nulo - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_SUELOS(
    97,
    'Suelo Válido',
    NULL,
    'Descripción válida'
) as RESULTADO;

-- Prueba 1.8: TIPO_SUELO inválido (no en lista permitida)
SELECT 'PRUEBA 1.8: TIPO_SUELO inválido - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_SUELOS(
    97,
    'Suelo Válido',
    'Volcánico',
    'Descripción válida'
) as RESULTADO;

-- Prueba 1.9: TIPO_SUELO válido (Arenoso)
SELECT 'PRUEBA 1.9: TIPO_SUELO Arenoso - DEBE FUNCIONAR' as PRUEBA;
SELECT FUN_VALIDAR_SUELOS(
    97,
    'Suelo Prueba',
    'Arenoso',
    'Descripción válida del suelo'
) as RESULTADO;

-- Prueba 1.10: TIPO_SUELO válido (Mixto)
SELECT 'PRUEBA 1.10: TIPO_SUELO Mixto - DEBE FUNCIONAR' as PRUEBA;
SELECT FUN_VALIDAR_SUELOS(
    97,
    'Suelo Prueba',
    'Mixto',
    'Descripción válida del suelo'
) as RESULTADO;

-- Prueba 1.11: DESCRIPCION_SUELO nulo
SELECT 'PRUEBA 1.11: DESCRIPCION_SUELO nulo - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_SUELOS(
    97,
    'Suelo Válido',
    'Arenoso',
    NULL
) as RESULTADO;

-- Prueba 1.12: DESCRIPCION_SUELO vacío
SELECT 'PRUEBA 1.12: DESCRIPCION_SUELO vacío - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_SUELOS(
    97,
    'Suelo Válido',
    'Arenoso',
    ''
) as RESULTADO;

-- Prueba 1.13: DESCRIPCION_SUELO muy corta (menos de 5 caracteres)
SELECT 'PRUEBA 1.13: DESCRIPCION_SUELO muy corta - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_SUELOS(
    97,
    'Suelo Válido',
    'Arenoso',
    'Corta'
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_INSERTAR_SUELOS_JSON
-- ============================================================

-- Prueba 2.1: Inserción exitosa
SELECT 'PRUEBA 2.1: Inserción exitosa' as PRUEBA;
SELECT FUN_INSERTAR_SUELOS_JSON(
    99,
    'Suelo Test 99',
    'Arenoso',
    'Descripción detallada del suelo de prueba',
    'admin'
) as RESULTADO;

-- Prueba 2.2: Intento de inserción con ID duplicado
SELECT 'PRUEBA 2.2: Inserción con ID duplicado - DEBE FALLAR' as PRUEBA;
SELECT FUN_INSERTAR_SUELOS_JSON(
    99,
    'Otro Suelo',
    'Arcilloso',
    'Descripción alternativa del suelo',
    'admin'
) as RESULTADO;

-- Prueba 2.3: Intento de inserción con TIPO_SUELO inválido
SELECT 'PRUEBA 2.3: Inserción con TIPO_SUELO inválido - DEBE FALLAR' as PRUEBA;
SELECT FUN_INSERTAR_SUELOS_JSON(
    98,
    'Suelo Test 98',
    'Desconocido',
    'Descripción detallada del suelo de prueba',
    'admin'
) as RESULTADO;

-- Prueba 2.4: Intento de inserción con NOM_SUELO muy corto
SELECT 'PRUEBA 2.4: Inserción con NOM_SUELO corto - DEBE FALLAR' as PRUEBA;
SELECT FUN_INSERTAR_SUELOS_JSON(
    98,
    'AB',
    'Limoso',
    'Descripción detallada del suelo de prueba',
    'admin'
) as RESULTADO;

-- Prueba 2.5: Intento de inserción con DESCRIPCION_SUELO muy corta
SELECT 'PRUEBA 2.5: Inserción con DESCRIPCION corta - DEBE FALLAR' as PRUEBA;
SELECT FUN_INSERTAR_SUELOS_JSON(
    98,
    'Suelo Test 98',
    'Rocoso',
    'Corta',
    'admin'
) as RESULTADO;

-- Prueba 2.6: Inserción exitosa con tipo Orgánico
SELECT 'PRUEBA 2.6: Inserción tipo Orgánico - DEBE FUNCIONAR' as PRUEBA;
SELECT FUN_INSERTAR_SUELOS_JSON(
    98,
    'Suelo Orgánico Test',
    'Orgánico',
    'Suelo rico en materia orgánica para pruebas',
    'admin'
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_VALIDAR_ACTUALIZAR_SUELOS
-- ============================================================

-- Prueba 3.1: Validación exitosa para actualización
SELECT 'PRUEBA 3.1: Validación de actualización exitosa' as PRUEBA;
SELECT FUN_VALIDAR_ACTUALIZAR_SUELOS(
    99,
    'Suelo Test 99 - Actualizado',
    'Arcilloso',
    'Descripción actualizada del suelo de prueba'
) as RESULTADO;

-- Prueba 3.2: Intentar actualizar ID que no existe
SELECT 'PRUEBA 3.2: Actualizar ID inexistente - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_ACTUALIZAR_SUELOS(
    9999,
    'Test User',
    'Arenoso',
    'Descripción de prueba'
) as RESULTADO;

-- Prueba 3.3: Validación con TIPO_SUELO inválido en actualización
SELECT 'PRUEBA 3.3: Actualización con TIPO_SUELO inválido - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_ACTUALIZAR_SUELOS(
    99,
    'Suelo Test 99',
    'Tipo Inválido',
    'Descripción válida del suelo'
) as RESULTADO;

-- Prueba 3.4: Validación con NOM_SUELO muy corto en actualización
SELECT 'PRUEBA 3.4: Actualización con NOM_SUELO corto - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_ACTUALIZAR_SUELOS(
    99,
    'XY',
    'Mixto',
    'Descripción válida del suelo'
) as RESULTADO;

-- Prueba 3.5: Actualización válida con todos los datos nuevos
SELECT 'PRUEBA 3.5: Actualización válida - DEBE FUNCIONAR' as PRUEBA;
SELECT FUN_VALIDAR_ACTUALIZAR_SUELOS(
    98,
    'Suelo Rocoso Actualizado',
    'Rocoso',
    'Formación rocosa actualizada con nuevas características'
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_ACTUALIZAR_SUELOS_JSON
-- ============================================================

-- Prueba 4.1: Actualización exitosa
SELECT 'PRUEBA 4.1: Actualización exitosa' as PRUEBA;
SELECT FUN_ACTUALIZAR_SUELOS_JSON(
    99,
    'Suelo Test 99 - Actualizado',
    'Arcilloso',
    'Descripción completamente actualizada del suelo de prueba',
    'admin'
) as RESULTADO;

-- Verificar cambios
SELECT 'Verificación de cambios del ID 99' as PRUEBA;
SELECT 
    ID_SUELO,
    NOM_SUELO,
    TIPO_SUELO,
    DESCRIPCION_SUELO,
    USUARIO_MODIFICACION,
    FECHA_MODIFICACION
FROM TAB_SUELOS
WHERE ID_SUELO = 99;

-- Prueba 4.2: Intentar actualizar un registro que no existe
SELECT 'PRUEBA 4.2: Actualizar registro inexistente - DEBE FALLAR' as PRUEBA;
SELECT FUN_ACTUALIZAR_SUELOS_JSON(
    9999,
    'Suelo Inexistente',
    'Arenoso',
    'Descripción de suelo que no existe',
    'admin'
) as RESULTADO;

-- Prueba 4.3: Intentar actualizar con TIPO_SUELO inválido
SELECT 'PRUEBA 4.3: Actualizar con TIPO_SUELO inválido - DEBE FALLAR' as PRUEBA;
SELECT FUN_ACTUALIZAR_SUELOS_JSON(
    98,
    'Suelo Válido',
    'Tipo_Invalido',
    'Descripción válida del suelo',
    'admin'
) as RESULTADO;

-- Prueba 4.4: Actualización con cambio de tipo
SELECT 'PRUEBA 4.4: Cambio de tipo de Orgánico a Mixto - DEBE FUNCIONAR' as PRUEBA;
SELECT FUN_ACTUALIZAR_SUELOS_JSON(
    98,
    'Suelo Mixto Convertido',
    'Mixto',
    'Suelo convertido de orgánico a composición mixta',
    'admin'
) as RESULTADO;

-- Verificar cambios del ID 98
SELECT 'Verificación de cambios del ID 98' as PRUEBA;
SELECT 
    ID_SUELO,
    NOM_SUELO,
    TIPO_SUELO,
    DESCRIPCION_SUELO,
    USUARIO_MODIFICACION,
    FECHA_MODIFICACION
FROM TAB_SUELOS
WHERE ID_SUELO = 98;

-- ============================================================
-- PRUEBAS PARA: FUN_OBTENER_SUELO_POR_ID_JSON
-- ============================================================

-- Prueba 5.1: Obtener suelo existente por ID
SELECT 'PRUEBA 5.1: Obtener suelo ID 1 por ID - EXITOSA' as PRUEBA;
SELECT FUN_OBTENER_SUELO_POR_ID_JSON(1) as RESULTADO;

-- Prueba 5.2: Obtener suelo existente por ID (99 creado en prueba anterior)
SELECT 'PRUEBA 5.2: Obtener suelo ID 99 por ID - EXITOSA' as PRUEBA;
SELECT FUN_OBTENER_SUELO_POR_ID_JSON(99) as RESULTADO;

-- Prueba 5.3: Intentar obtener suelo con ID que no existe
SELECT 'PRUEBA 5.3: Obtener suelo ID 9999 - DEBE FALLAR' as PRUEBA;
SELECT FUN_OBTENER_SUELO_POR_ID_JSON(9999) as RESULTADO;

-- Prueba 5.4: Obtener suelo con ID nulo
SELECT 'PRUEBA 5.4: Obtener suelo NULL - DEBE FALLAR' as PRUEBA;
SELECT FUN_OBTENER_SUELO_POR_ID_JSON(NULL) as RESULTADO;

-- Prueba 5.5: Obtener suelo con ID negativo
SELECT 'PRUEBA 5.5: Obtener suelo ID -1 - DEBE FALLAR' as PRUEBA;
SELECT FUN_OBTENER_SUELO_POR_ID_JSON(-1) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_OBTENER_TODOS_SUELOS_JSON
-- ============================================================

-- Prueba 6.1: Obtener lista completa de suelos
SELECT 'PRUEBA 6.1: Obtener lista completa de suelos - EXITOSA' as PRUEBA;
SELECT FUN_OBTENER_TODOS_SUELOS_JSON() as RESULTADO;

-- Prueba 6.2: Verificar que la lista contiene datos
SELECT 'PRUEBA 6.2: Verificar lista no está vacía' as PRUEBA;
SELECT (FUN_OBTENER_TODOS_SUELOS_JSON()->'DATOS') IS NOT NULL as LISTA_CONTIENE_DATOS;

-- Prueba 6.3: Contar cantidad de suelos en la lista
SELECT 'PRUEBA 6.3: Contar elementos en lista' as PRUEBA;
SELECT json_array_length(FUN_OBTENER_TODOS_SUELOS_JSON()->'DATOS') as CANTIDAD_SUELOS;



-- ============================================================
-- RESUMEN FINAL Y DATOS ACTUALES
-- ============================================================

SELECT '=== RESUMEN DE SUELOS EN BASE DE DATOS ===' as TITULO;
SELECT 
    ID_SUELO,
    NOM_SUELO,
    TIPO_SUELO,
    DESCRIPCION_SUELO,
    USUARIO_CREACION,
    USUARIO_MODIFICACION,
    FECHA_CREACION,
    FECHA_MODIFICACION
FROM TAB_SUELOS
ORDER BY ID_SUELO;

SELECT '=== ESTADÍSTICAS ===' as TITULO;
SELECT COUNT(*) as TOTAL_SUELOS FROM TAB_SUELOS;
SELECT TIPO_SUELO, COUNT(*) as CANTIDAD FROM TAB_SUELOS GROUP BY TIPO_SUELO ORDER BY CANTIDAD DESC;


