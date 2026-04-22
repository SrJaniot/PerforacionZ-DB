-- FUNCIONES para TAB_SUELOS
-- FUNCION PARA VALIDAR LOS DATOS A INSERTAR EN LA TABLA DE SUELOS
CREATE OR REPLACE FUNCTION FUN_VALIDAR_SUELOS(
    jID_SUELO TAB_SUELOS.ID_SUELO%TYPE,
    jNOM_SUELO TAB_SUELOS.NOM_SUELO%TYPE,
    jTIPO_SUELO TAB_SUELOS.TIPO_SUELO%TYPE,
    jDESCRIPCION_SUELO TAB_SUELOS.DESCRIPCION_SUELO%TYPE
    ) RETURNS JSON AS
$$
DECLARE
    RETORNO JSON;
BEGIN
    --VALIDACION VARIABLE ID_SUELO
    IF jID_SUELO IS NULL THEN
        RETORNO := json_build_object('CODIGO', 400, 'MENSAJE', 'ID_SUELO no puede ser nulo'); -- ID_SUELO no puede ser nulo
        RETURN RETORNO;
    ELSIF jID_SUELO < 1 THEN
        RETORNO := json_build_object('CODIGO', 400, 'MENSAJE', 'ID_SUELO debe ser un número positivo'); -- ID_SUELO debe ser un número positivo
        RETURN RETORNO;
    ELSIF EXISTS (SELECT 1 FROM TAB_SUELOS WHERE ID_SUELO = jID_SUELO) THEN
        RETORNO := json_build_object('CODIGO', 400, 'MENSAJE', 'ID_SUELO ya existe en la tabla'); -- ID_SUELO ya existe en la tabla
        RETURN RETORNO;

    --VALIDACION VARIABLE NOM_SUELO
    ELSIF jNOM_SUELO IS NULL OR jNOM_SUELO = '' THEN
        RETORNO := json_build_object('CODIGO', 400, 'MENSAJE', 'NOM_SUELO no puede ser nulo o vacío'); -- NOM_SUELO no puede ser nulo o vacío
        RETURN RETORNO;
    ELSIF LENGTH(jNOM_SUELO) < 3 THEN
        RETORNO := json_build_object('CODIGO', 400, 'MENSAJE', 'NOM_SUELO debe tener al menos 3 caracteres'); -- NOM_SUELO debe tener al menos 3 caracteres
        RETURN RETORNO;

    --VALIDACION VARIABLE TIPO_SUELO
    ELSIF jTIPO_SUELO IS NULL OR jTIPO_SUELO = '' THEN
        RETORNO := json_build_object('CODIGO', 400, 'MENSAJE', 'TIPO_SUELO no puede ser nulo o vacío'); -- TIPO_SUELO no puede ser nulo o vacío
        RETURN RETORNO;
    ELSIF jTIPO_SUELO NOT IN ('Arenoso', 'Arcilloso', 'Limoso', 'Orgánico', 'Rocoso', 'Mixto') THEN
        RETORNO := json_build_object('CODIGO', 400, 'MENSAJE', 'TIPO_SUELO debe ser: Arenoso, Arcilloso, Limoso, Orgánico, Rocoso o Mixto'); -- TIPO_SUELO inválido
        RETURN RETORNO;

    --VALIDACION VARIABLE DESCRIPCION_SUELO
    ELSIF jDESCRIPCION_SUELO IS NULL OR jDESCRIPCION_SUELO = '' THEN
        RETORNO := json_build_object('CODIGO', 400, 'MENSAJE', 'DESCRIPCION_SUELO no puede ser nulo o vacío'); -- DESCRIPCION_SUELO no puede ser nulo o vacío
        RETURN RETORNO;
    ELSIF LENGTH(jDESCRIPCION_SUELO) < 5 THEN
        RETORNO := json_build_object('CODIGO', 400, 'MENSAJE', 'DESCRIPCION_SUELO debe tener al menos 5 caracteres'); -- DESCRIPCION_SUELO debe tener al menos 5 caracteres
        RETURN RETORNO;

    ELSE
        RETORNO := json_build_object('CODIGO', 200, 'MENSAJE', 'Todos los datos son válidos'); -- Todos los datos son válidos
    END IF;
    RETURN RETORNO;
END;
$$ LANGUAGE plpgsql;


-- FUNCION PARA VALIDAR LOS DATOS A ACTUALIZAR EN LA TABLA DE SUELOS
CREATE OR REPLACE FUNCTION FUN_VALIDAR_ACTUALIZAR_SUELOS(
    jID_SUELO TAB_SUELOS.ID_SUELO%TYPE,
    jNOM_SUELO TAB_SUELOS.NOM_SUELO%TYPE,
    jTIPO_SUELO TAB_SUELOS.TIPO_SUELO%TYPE,
    jDESCRIPCION_SUELO TAB_SUELOS.DESCRIPCION_SUELO%TYPE
    ) RETURNS JSON AS
$$
DECLARE
    RETORNO JSON;
BEGIN
    --VALIDACION VARIABLE ID_SUELO
    IF jID_SUELO IS NULL THEN
        RETORNO := json_build_object('CODIGO', 400, 'MENSAJE', 'ID_SUELO no puede ser nulo'); -- ID_SUELO no puede ser nulo
        RETURN RETORNO;
    ELSIF jID_SUELO < 1 THEN
        RETORNO := json_build_object('CODIGO', 400, 'MENSAJE', 'ID_SUELO debe ser un número positivo'); -- ID_SUELO debe ser un número positivo
        RETURN RETORNO;
    ELSIF NOT EXISTS (SELECT 1 FROM TAB_SUELOS WHERE ID_SUELO = jID_SUELO) THEN
        RETORNO := json_build_object('CODIGO', 400, 'MENSAJE', 'ID_SUELO no existe en la tabla'); -- ID_SUELO no existe en la tabla
        RETURN RETORNO;

    --VALIDACION VARIABLE NOM_SUELO
    ELSIF jNOM_SUELO IS NULL OR jNOM_SUELO = '' THEN
        RETORNO := json_build_object('CODIGO', 400, 'MENSAJE', 'NOM_SUELO no puede ser nulo o vacío'); -- NOM_SUELO no puede ser nulo o vacío
        RETURN RETORNO;
    ELSIF LENGTH(jNOM_SUELO) < 3 THEN
        RETORNO := json_build_object('CODIGO', 400, 'MENSAJE', 'NOM_SUELO debe tener al menos 3 caracteres'); -- NOM_SUELO debe tener al menos 3 caracteres
        RETURN RETORNO;

    --VALIDACION VARIABLE TIPO_SUELO
    ELSIF jTIPO_SUELO IS NULL OR jTIPO_SUELO = '' THEN
        RETORNO := json_build_object('CODIGO', 400, 'MENSAJE', 'TIPO_SUELO no puede ser nulo o vacío'); -- TIPO_SUELO no puede ser nulo o vacío
        RETURN RETORNO;
    ELSIF jTIPO_SUELO NOT IN ('Arenoso', 'Arcilloso', 'Limoso', 'Orgánico', 'Rocoso', 'Mixto') THEN
        RETORNO := json_build_object('CODIGO', 400, 'MENSAJE', 'TIPO_SUELO debe ser: Arenoso, Arcilloso, Limoso, Orgánico, Rocoso o Mixto'); -- TIPO_SUELO inválido
        RETURN RETORNO;

    --VALIDACION VARIABLE DESCRIPCION_SUELO
    ELSIF jDESCRIPCION_SUELO IS NULL OR jDESCRIPCION_SUELO = '' THEN
        RETORNO := json_build_object('CODIGO', 400, 'MENSAJE', 'DESCRIPCION_SUELO no puede ser nulo o vacío'); -- DESCRIPCION_SUELO no puede ser nulo o vacío
        RETURN RETORNO;
    ELSIF LENGTH(jDESCRIPCION_SUELO) < 5 THEN
        RETORNO := json_build_object('CODIGO', 400, 'MENSAJE', 'DESCRIPCION_SUELO debe tener al menos 5 caracteres'); -- DESCRIPCION_SUELO debe tener al menos 5 caracteres
        RETURN RETORNO;

    ELSE
        RETORNO := json_build_object('CODIGO', 200, 'MENSAJE', 'Todos los datos son válidos'); -- Todos los datos son válidos
    END IF;
    RETURN RETORNO;
END;
$$ LANGUAGE plpgsql;



-- FUNCION PARA INSERTAR UN NUEVO SUELO EN LA TABLA DE SUELOS
CREATE OR REPLACE FUNCTION FUN_INSERTAR_SUELOS_JSON(
    jID_SUELO TAB_SUELOS.ID_SUELO%TYPE,
    jNOM_SUELO TAB_SUELOS.NOM_SUELO%TYPE,
    jTIPO_SUELO TAB_SUELOS.TIPO_SUELO%TYPE,
    jDESCRIPCION_SUELO TAB_SUELOS.DESCRIPCION_SUELO%TYPE,
    jUSUARIO_CREACION TAB_SUELOS.USUARIO_CREACION%TYPE
) RETURNS JSON AS
$$
DECLARE
    RETORNO JSON;
    jVALIDACION JSON;
BEGIN
    --LLAMAR A LA FUNCION DE VALIDACION
    jVALIDACION := FUN_VALIDAR_SUELOS(jID_SUELO, jNOM_SUELO, jTIPO_SUELO, jDESCRIPCION_SUELO);

    --VERIFICAR EL RESULTADO DE LA VALIDACION
    IF (jVALIDACION ->> 'CODIGO')::INTEGER != 200 THEN
        RETURN jVALIDACION; -- Si la validación no es exitosa, retornar el mensaje de error
    END IF;

    --INSERTAR EL NUEVO SUELO EN LA TABLA
    IF jVALIDACION ->> 'CODIGO' = '200' THEN
        INSERT INTO TAB_SUELOS (ID_SUELO, NOM_SUELO, TIPO_SUELO, DESCRIPCION_SUELO, USUARIO_CREACION)
        VALUES (jID_SUELO, jNOM_SUELO, jTIPO_SUELO, jDESCRIPCION_SUELO, jUSUARIO_CREACION);

        --VERIFICAR SI LA INSERCIÓN FUE EXITOSA
            IF FOUND THEN
                RETORNO := json_build_object('CODIGO', 200, 'MENSAJE', 'Suelo insertado exitosamente'); -- Suelo insertado exitosamente
            ELSE
                RETORNO := json_build_object('CODIGO', 500, 'MENSAJE', 'Error al insertar el suelo'); -- Error al insertar el suelo
            END IF;        
    END IF;

    RETURN RETORNO;
END;
$$ LANGUAGE plpgsql;



-- FUNCION PARA ACTUALIZAR LOS DATOS DE UN SUELO EN LA TABLA DE SUELOS
CREATE OR REPLACE FUNCTION FUN_ACTUALIZAR_SUELOS_JSON(
    jID_SUELO TAB_SUELOS.ID_SUELO%TYPE,
    jNOM_SUELO TAB_SUELOS.NOM_SUELO%TYPE,
    jTIPO_SUELO TAB_SUELOS.TIPO_SUELO%TYPE,
    jDESCRIPCION_SUELO TAB_SUELOS.DESCRIPCION_SUELO%TYPE,
    jUSUARIO_MODIFICACION TAB_SUELOS.USUARIO_MODIFICACION%TYPE
) RETURNS JSON AS
$$
DECLARE
    RETORNO JSON;
    jVALIDACION JSON;
BEGIN
    --LLAMAR A LA FUNCION DE VALIDACION
    jVALIDACION := FUN_VALIDAR_ACTUALIZAR_SUELOS(jID_SUELO, jNOM_SUELO, jTIPO_SUELO, jDESCRIPCION_SUELO);

    --VERIFICAR EL RESULTADO DE LA VALIDACION
    IF (jVALIDACION ->> 'CODIGO')::INTEGER != 200 THEN
        RETURN jVALIDACION; -- Si la validación no es exitosa, retornar el mensaje de error
    END IF;

    --ACTUALIZAR LOS DATOS DEL SUELO EN LA TABLA
    IF jVALIDACION ->> 'CODIGO' = '200' THEN
        UPDATE TAB_SUELOS
        SET NOM_SUELO = jNOM_SUELO,
            TIPO_SUELO = jTIPO_SUELO,
            DESCRIPCION_SUELO = jDESCRIPCION_SUELO,
            USUARIO_MODIFICACION = jUSUARIO_MODIFICACION,
            FECHA_MODIFICACION = NOW()
        WHERE ID_SUELO = jID_SUELO;

        --VERIFICAR SI LA ACTUALIZACIÓN FUE EXITOSA
            IF FOUND THEN
                RETORNO := json_build_object('CODIGO', 200, 'MENSAJE', 'Suelo actualizado exitosamente'); -- Suelo actualizado exitosamente
            ELSE
                RETORNO := json_build_object('CODIGO', 500, 'MENSAJE', 'Error al actualizar el suelo'); -- Error al actualizar el suelo
            END IF;        
    END IF;

    RETURN RETORNO;
END;
$$ LANGUAGE plpgsql;



--FUNCION QUE ME RETORNA UN SUELO POR SU ID EN FORMATO JSON
CREATE OR REPLACE FUNCTION FUN_OBTENER_SUELO_POR_ID_JSON(
    jID_SUELO TAB_SUELOS.ID_SUELO%TYPE
) RETURNS JSON AS
$$
DECLARE
    RETORNO JSON;
    DATOS_SUELO JSON;
BEGIN
    SELECT json_build_object(
        'ID_SUELO', ID_SUELO,
        'NOM_SUELO', NOM_SUELO,
        'TIPO_SUELO', TIPO_SUELO,
        'DESCRIPCION_SUELO', DESCRIPCION_SUELO
    )
    INTO DATOS_SUELO
    FROM TAB_SUELOS
    WHERE ID_SUELO = jID_SUELO;

    -- VALIDAR SI SE OBTUVIERON DATOS DEL SUELO
    IF DATOS_SUELO IS NULL THEN
        RETORNO := json_build_object('CODIGO', 404, 'MENSAJE', 'Suelo no encontrado'); -- Suelo no encontrado
    ELSE
        RETORNO := json_build_object('CODIGO', 200, 'MENSAJE', 'Suelo encontrado', 'DATOS', DATOS_SUELO); -- Suelo encontrado
    END IF;
    RETURN RETORNO;
END;
$$ LANGUAGE plpgsql;




--FUNCION QUE ME RETORNA TODOS LOS SUELOS EN FORMATO JSON SOLO ME INTERESA EL ID Y EL NOMBRE
CREATE OR REPLACE FUNCTION FUN_OBTENER_TODOS_SUELOS_JSON() RETURNS JSON AS
$$
DECLARE
    RETORNO JSON;
    DATOS_SUELOS JSON;
BEGIN
    SELECT json_agg(json_build_object(
        'ID_SUELO', ID_SUELO,
        'NOM_SUELO', NOM_SUELO
    ))
    INTO DATOS_SUELOS
    FROM TAB_SUELOS;

    -- VALIDAR SI SE OBTUVIERON DATOS DE SUELOS
    IF DATOS_SUELOS IS NULL THEN
        RETORNO := json_build_object('CODIGO', 404, 'MENSAJE', 'No se encontraron suelos'); -- No se encontraron suelos
    ELSE
        RETORNO := json_build_object('CODIGO', 200, 'MENSAJE', 'Suelos encontrados', 'DATOS', DATOS_SUELOS); -- Suelos encontrados
    END IF;
    RETURN RETORNO;
END;
$$ LANGUAGE plpgsql;



