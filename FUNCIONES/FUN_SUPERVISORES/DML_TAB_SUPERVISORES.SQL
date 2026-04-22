-- DML para TAB_SUPERVISORES
-- INSERCIÓN DE DATOS DE PRUEBA

-- Insertar datos iniciales de supervisores
SELECT FUN_INSERTAR_SUPERVISORES_JSON(
    'SUP001',
    'Carlos García López',
    'carlos.garcia@perforacionz.com',
    '3001234567',
    'admin',
    'default_profile.jpg'
);

SELECT FUN_INSERTAR_SUPERVISORES_JSON(
    'SUP002',
    'María Rodríguez Martínez',
    'maria.rodriguez@perforacionz.com',
    '3017654321',
    'admin',
    'default_profile.jpg'
);

SELECT FUN_INSERTAR_SUPERVISORES_JSON(
    'SUP003',
    'Juan Pérez Silva',
    'juan.perez@perforacionz.com',
    '3002345678',
    'admin',
    'default_profile.jpg'
);

SELECT FUN_INSERTAR_SUPERVISORES_JSON(
    'SUP004',
    'Ana Martínez Gómez',
    'ana.martinez@perforacionz.com',
    '3015678901',
    'admin',
    'default_profile.jpg'
);

SELECT FUN_INSERTAR_SUPERVISORES_JSON(
    'SUP005',
    'Luis Hernández Torres',
    'luis.hernandez@perforacionz.com',
    '3008901234',
    'admin',
    'default_profile.jpg'
);

-- Consultar los datos insertados
SELECT 
    ID_SUPERVISOR,
    NOM_SUPERVISOR,
    CORREO_SUPERVISOR,
    NUEM_CEL_SUPERVISOR,
    FOTO_PERFIL_SUPERVISOR,
    USUARIO_CREACION,
    FECHA_CREACION
FROM TAB_SUPERVISORES
ORDER BY ID_SUPERVISOR;
