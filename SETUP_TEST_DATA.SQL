-- =====================================================================================================================================
-- SETUP_TEST_DATA.SQL - SCRIPT MASTER DE DATOS DE PRUEBA PARA EL PROYECTO PERFORACIONZ
-- =====================================================================================================================================
--
-- DESCRIPCION: Este script carga datos de prueba expandidos en la base de datos del proyecto PerforacionZ.
-- Incluye departamentos, municipios, supervisores, brocas, suelos, proyectos, perforaciones,
-- brocas instanciadas, movimientos de broca y tramos de suelo.
--
-- NOTA: Este script asume que SETUP_CLEAN_DB.SQL ya ha sido ejecutado.
--
-- FECHA: 2026-04-15
-- =====================================================================================================================================

-- =====================================================================================================================================
-- 1. INSERCION DE DEPARTAMENTOS
-- =====================================================================================================================================
INSERT INTO tab_dptos VALUES('91','Amazonas');
INSERT INTO tab_dptos VALUES('05','Antioquia');
INSERT INTO tab_dptos VALUES('81','Arauca');
INSERT INTO tab_dptos VALUES('08','Atlántico');
INSERT INTO tab_dptos VALUES('11','Bogotá');
INSERT INTO tab_dptos VALUES('13','Bolivar');
INSERT INTO tab_dptos VALUES('15','Boyacá');
INSERT INTO tab_dptos VALUES('17','Caldas');
INSERT INTO tab_dptos VALUES('18','Caquetá');
INSERT INTO tab_dptos VALUES('85','Casanare');
INSERT INTO tab_dptos VALUES('19','Cauca');
INSERT INTO tab_dptos VALUES('20','Cesar');
INSERT INTO tab_dptos VALUES('27','Chocó');
INSERT INTO tab_dptos VALUES('23','Córdoba');
INSERT INTO tab_dptos VALUES('25','Cundinamarca');
INSERT INTO tab_dptos VALUES('94','Guanía');
INSERT INTO tab_dptos VALUES('95','Guaviare');
INSERT INTO tab_dptos VALUES('41','Huila');
INSERT INTO tab_dptos VALUES('44','La Guajira');
INSERT INTO tab_dptos VALUES('47','Magdalena');
INSERT INTO tab_dptos VALUES('50','Meta');
INSERT INTO tab_dptos VALUES('52','Nariño');
INSERT INTO tab_dptos VALUES('54','Norte de Santander');
INSERT INTO tab_dptos VALUES('86','Putumayo');
INSERT INTO tab_dptos VALUES('63','Quindío');
INSERT INTO tab_dptos VALUES('66','Risaralda');
INSERT INTO tab_dptos VALUES('68','Santander');
INSERT INTO tab_dptos VALUES('70','Sucre');
INSERT INTO tab_dptos VALUES('73','Tolima');
INSERT INTO tab_dptos VALUES('76','Valle del Cauca');
INSERT INTO tab_dptos VALUES('88','Archipiélago de San Andrés');
INSERT INTO tab_dptos VALUES('97','Vaupés');
INSERT INTO tab_dptos VALUES('99','Vichada');

-- =====================================================================================================================================
-- 2. INSERCION DE MUNICIPIOS
-- =====================================================================================================================================
INSERT INTO TAB_MUNICIPIOS VALUES('05','05001','Medellín');
INSERT INTO TAB_MUNICIPIOS VALUES('05','05002','Abejorral');
INSERT INTO TAB_MUNICIPIOS VALUES('05','05003','Abriaqui');
INSERT INTO TAB_MUNICIPIOS VALUES('05','05004','Alejandría');
INSERT INTO TAB_MUNICIPIOS VALUES('05','05005','Amagá');
INSERT INTO TAB_MUNICIPIOS VALUES('05','05006','Amalfi');
INSERT INTO TAB_MUNICIPIOS VALUES('08','08001','Barranquilla');
INSERT INTO TAB_MUNICIPIOS VALUES('08','08002','Soledad');
INSERT INTO TAB_MUNICIPIOS VALUES('13','13001','Cartagena');
INSERT INTO TAB_MUNICIPIOS VALUES('13','13002','Agustín Codazzi');
INSERT INTO TAB_MUNICIPIOS VALUES('15','15001','Tunja');
INSERT INTO TAB_MUNICIPIOS VALUES('15','15002','Aipe');
INSERT INTO TAB_MUNICIPIOS VALUES('25','25001','Bogotá');
INSERT INTO TAB_MUNICIPIOS VALUES('25','25002','Soacha');
INSERT INTO TAB_MUNICIPIOS VALUES('50','50001','Villavicencio');
INSERT INTO TAB_MUNICIPIOS VALUES('50','50002','Acacías');
INSERT INTO TAB_MUNICIPIOS VALUES('68','68001','Bucaramanga');
INSERT INTO TAB_MUNICIPIOS VALUES('68','68002','Floridablanca');
INSERT INTO TAB_MUNICIPIOS VALUES('76','76001','Cali');
INSERT INTO TAB_MUNICIPIOS VALUES('76','76002','Palmira');
INSERT INTO TAB_MUNICIPIOS VALUES('44','44001','Riohacha');
INSERT INTO TAB_MUNICIPIOS VALUES('44','44002','Maicao');
INSERT INTO TAB_MUNICIPIOS VALUES('86','86001','Mocoa');
INSERT INTO TAB_MUNICIPIOS VALUES('86','86002','Puerto Asís');
INSERT INTO TAB_MUNICIPIOS VALUES('85','85001','Yopal');
INSERT INTO TAB_MUNICIPIOS VALUES('85','85002','Aguazul');
INSERT INTO TAB_MUNICIPIOS VALUES('81','81001','Arauca');
INSERT INTO TAB_MUNICIPIOS VALUES('81','81002','Fortul');
INSERT INTO TAB_MUNICIPIOS VALUES('99','99001','Puerto Carreño');
INSERT INTO TAB_MUNICIPIOS VALUES('99','99002','La Primavera');

-- =====================================================================================================================================
-- 3. INSERCION DE SUPERVISORES (EXPANDIDO A 10)
-- =====================================================================================================================================
SELECT FUN_INSERTAR_SUPERVISORES_JSON('SUP001', 'Carlos García López', 'carlos.garcia@perforacionz.com', '3001234567', 'admin', 'default_profile.jpg');
SELECT FUN_INSERTAR_SUPERVISORES_JSON('SUP002', 'María Rodríguez Martínez', 'maria.rodriguez@perforacionz.com', '3017654321', 'admin', 'default_profile.jpg');
SELECT FUN_INSERTAR_SUPERVISORES_JSON('SUP003', 'Juan Pérez Silva', 'juan.perez@perforacionz.com', '3002345678', 'admin', 'default_profile.jpg');
SELECT FUN_INSERTAR_SUPERVISORES_JSON('SUP004', 'Ana Martínez Gómez', 'ana.martinez@perforacionz.com', '3015678901', 'admin', 'default_profile.jpg');
SELECT FUN_INSERTAR_SUPERVISORES_JSON('SUP005', 'Luis Hernández Torres', 'luis.hernandez@perforacionz.com', '3008901234', 'admin', 'default_profile.jpg');
SELECT FUN_INSERTAR_SUPERVISORES_JSON('SUP006', 'Alejandra Cortés Rodríguez', 'alejandra.cortes@perforacionz.com', '3019876543', 'admin', 'default_profile.jpg');
SELECT FUN_INSERTAR_SUPERVISORES_JSON('SUP007', 'Fernando Ramírez López', 'fernando.ramirez@perforacionz.com', '3003456789', 'admin', 'default_profile.jpg');
SELECT FUN_INSERTAR_SUPERVISORES_JSON('SUP008', 'Patricia Sánchez Vargas', 'patricia.sanchez@perforacionz.com', '3014567890', 'admin', 'default_profile.jpg');
SELECT FUN_INSERTAR_SUPERVISORES_JSON('SUP009', 'Miguel Ángel Díaz Castro', 'miguel.diaz@perforacionz.com', '3009876543', 'admin', 'default_profile.jpg');
SELECT FUN_INSERTAR_SUPERVISORES_JSON('SUP010', 'Sofía González Acero', 'sofia.gonzalez@perforacionz.com', '3012345670', 'admin', 'default_profile.jpg');

-- =====================================================================================================================================
-- 4. INSERCION DE BROCAS (EXPANDIDO A 12)
-- =====================================================================================================================================
SELECT FUN_INSERTAR_BROCAS_JSON('Broca PDC 5 7/8', 'PDC', 'Broca PDC de 5 7/8 pulgadas para formaciones duras', 5.875, 'PDC Matrix', 'Smith Services', 'admin');
SELECT FUN_INSERTAR_BROCAS_JSON('Broca Triconica 6', 'TRICONICA', 'Broca tricónica estándar de 6 pulgadas para formaciones medias', 6.0, 'Acero', 'Baker Hughes', 'admin');
SELECT FUN_INSERTAR_BROCAS_JSON('Broca Diamante 4.5', 'DIAMANTE', 'Broca de diamante natural de 4 1/2 pulgadas para roca muy dura', 4.5, 'Diamante Natural', 'Halliburton', 'admin');
SELECT FUN_INSERTAR_BROCAS_JSON('Broca PDC 7 7/8', 'PDC', 'Broca PDC de 7 7/8 pulgadas para perforación profunda', 7.875, 'PDC Matrix', 'Smith Services', 'admin');
SELECT FUN_INSERTAR_BROCAS_JSON('Broca Triconica 3.5', 'TRICONICA', 'Broca tricónica de 3 1/2 pulgadas para formaciones blandas', 3.5, 'Acero', 'Weatherford', 'admin');
SELECT FUN_INSERTAR_BROCAS_JSON('Broca Impregnada 2 7/8', 'IMPREGNADA', 'Broca impregnada de 2 7/8 pulgadas para pozos de exploración', 2.875, 'Diamante Impregnado', 'Varel', 'admin');
SELECT FUN_INSERTAR_BROCAS_JSON('Broca Diamante 8 1/4', 'DIAMANTE', 'Broca de diamante para perforación ultra profunda de 8 1/4 pulgadas', 8.25, 'Diamante Natural Premium', 'Halliburton', 'admin');
SELECT FUN_INSERTAR_BROCAS_JSON('Broca PDC 3 1/2', 'PDC', 'Broca PDC de tamaño pequeño para pozos desviados', 3.5, 'PDC Matrix Especial', 'National Oilwell Varco', 'admin');
SELECT FUN_INSERTAR_BROCAS_JSON('Broca Triconica Revestida 5', 'TRICONICA', 'Broca tricónica revestida de 5 pulgadas resistente al desgaste', 5.0, 'Acero Revestido', 'Baker Hughes', 'admin');
SELECT FUN_INSERTAR_BROCAS_JSON('Broca Impregnada 5 1/2', 'IMPREGNADA', 'Broca impregnada de 5 1/2 pulgadas para formaciones complejas', 5.5, 'Diamante Impregnado Avanzado', 'Varel', 'admin');
SELECT FUN_INSERTAR_BROCAS_JSON('Broca PDC 9 7/8', 'PDC', 'Broca PDC de 9 7/8 pulgadas para excavación masiva', 9.875, 'PDC Matrix Industrial', 'Smith Services', 'admin');
SELECT FUN_INSERTAR_BROCAS_JSON('Broca Diamante 6 1/4', 'DIAMANTE', 'Broca de diamante de 6 1/4 pulgadas para roca sedimentaria', 6.25, 'Diamante Sintético', 'National Oilwell Varco', 'admin');

-- =====================================================================================================================================
-- 5. INSERCION DE SUELOS (EXPANDIDO A 10)
-- =====================================================================================================================================
SELECT FUN_INSERTAR_SUELOS_JSON(1, 'Suelo Arenoso Fino', 'Arenoso', 'Suelo compuesto principalmente por granos de arena fina, con buena drenabilidad', 'admin');
SELECT FUN_INSERTAR_SUELOS_JSON(2, 'Suelo Arcilloso Compacto', 'Arcilloso', 'Suelo con alta concentración de arcilla, muy compacto y con baja permeabilidad', 'admin');
SELECT FUN_INSERTAR_SUELOS_JSON(3, 'Suelo Limoso', 'Limoso', 'Suelo con textura intermedia entre arena y arcilla, presenta características de ambos', 'admin');
SELECT FUN_INSERTAR_SUELOS_JSON(4, 'Suelo Orgánico Rich', 'Orgánico', 'Suelo rico en materia orgánica, oscuro y con alto contenido de nutrientes', 'admin');
SELECT FUN_INSERTAR_SUELOS_JSON(5, 'Roca Sedimentaria', 'Rocoso', 'Formación rocosa sedimentaria con capas de piedra caliza y arenisca', 'admin');
SELECT FUN_INSERTAR_SUELOS_JSON(6, 'Suelo Mixto Heterogéneo', 'Mixto', 'Composición variada con mezcla de arena, arcilla y grava en diferentes proporciones', 'admin');
SELECT FUN_INSERTAR_SUELOS_JSON(7, 'Arena Gruesa Aluvial', 'Arenoso', 'Arena gruesa de origen aluvial con excelente drenaje y estabilidad lateral', 'admin');
SELECT FUN_INSERTAR_SUELOS_JSON(8, 'Arcilla Roja Laterítica', 'Arcilloso', 'Arcilla roja típica de regiones tropicales con alto contenido de óxidos de hierro', 'admin');
SELECT FUN_INSERTAR_SUELOS_JSON(9, 'Limo Glaciar', 'Limoso', 'Limo fino de origen glaciar con buena capacidad portante y compresibilidad moderada', 'admin');
SELECT FUN_INSERTAR_SUELOS_JSON(10, 'Roca Metamórfica Granítica', 'Rocoso', 'Formación de roca metamórfica con matriz granítica, muy dura y densa', 'admin');

-- =====================================================================================================================================
-- 6. INSERCION DE PROYECTOS (EXPANDIDO A 15)
-- =====================================================================================================================================
SELECT FUN_INSERTAR_PROYECTOS_JSON('SUP001', 'Proyecto Exploración Zona Alpha', '05001', 'Proyecto de exploración de petróleo en zona de alto potencial sísmico', 'admin');
SELECT FUN_INSERTAR_PROYECTOS_JSON('SUP002', 'Proyecto Desarrollo Costa Beta', '08001', 'Desarrollo de campo costa afuera con perforación direccional', 'admin');
SELECT FUN_INSERTAR_PROYECTOS_JSON('SUP003', 'Proyecto Validación Gamma', '13001', 'Proyecto de validación de estructura geológica mediante perforación estratigráfica', 'admin');
SELECT FUN_INSERTAR_PROYECTOS_JSON('SUP004', 'Proyecto Extensión Acuífero', '15001', 'Perforación para exploración de acuíferos subterráneos en región montañosa', 'admin');
SELECT FUN_INSERTAR_PROYECTOS_JSON('SUP005', 'Proyecto Llanos Orientales', '50001', 'Programa de perforación exploratoria en cuenca de los Llanos Orientales', 'admin');
SELECT FUN_INSERTAR_PROYECTOS_JSON('SUP006', 'Proyecto Magdalena Medio', '68001', 'Explotación de reservas de hidrocarburos en cuenca Magdalena Medio', 'admin');
SELECT FUN_INSERTAR_PROYECTOS_JSON('SUP007', 'Proyecto Cauca Superior', '76001', 'Exploración de potencial geotérmico en región Cauca Superior', 'admin');
SELECT FUN_INSERTAR_PROYECTOS_JSON('SUP008', 'Proyecto Guajira Profunda', '44001', 'Perforación profunda en plataforma continental del Caribe', 'admin');
SELECT FUN_INSERTAR_PROYECTOS_JSON('SUP009', 'Proyecto Cordillera Occidental', '05002', 'Sondeos geotécnicos para evaluación de estabilidad de laderas', 'admin');
SELECT FUN_INSERTAR_PROYECTOS_JSON('SUP010', 'Proyecto Meta Sedimentaria', '50002', 'Perforación de pozos estratigráficos en cuenca Meta sedimentaria', 'admin');
SELECT FUN_INSERTAR_PROYECTOS_JSON('SUP001', 'Proyecto Aguazul Extension', '25001', 'Extensión de producción en campo Aguazul con tecnología 3D', 'admin');
SELECT FUN_INSERTAR_PROYECTOS_JSON('SUP002', 'Proyecto Putumayo Sur', '86001', 'Evaluación de potencial petrolífero en región sur de Putumayo', 'admin');
SELECT FUN_INSERTAR_PROYECTOS_JSON('SUP003', 'Proyecto Casanare Profundo', '85001', 'Perforación en tiempo real con adquisición sísmica integrada', 'admin');
SELECT FUN_INSERTAR_PROYECTOS_JSON('SUP004', 'Proyecto Arauca Exploración', '81001', 'Campaña exploratoria con múltiples objetivos estratigráficos', 'admin');
SELECT FUN_INSERTAR_PROYECTOS_JSON('SUP005', 'Proyecto Vichada Frontera', '99001', 'Exploración fronteriza con protocolos ambientales especializados', 'admin');

-- =====================================================================================================================================
-- 7. INSERCION DE PERFORACIONES (15 REGISTROS - UNA POR PROYECTO)
-- =====================================================================================================================================

SELECT FUN_INSERTAR_PERFORACIONES_JSON(1, 150.75, '2026-03-01 08:00:00'::TIMESTAMP, 'admin') AS "PERF_1_PROYECTO_1";
SELECT FUN_INSERTAR_PERFORACIONES_JSON(2, 125.30, '2026-03-02 08:00:00'::TIMESTAMP, 'admin') AS "PERF_2_PROYECTO_2";
SELECT FUN_INSERTAR_PERFORACIONES_JSON(3, 89.75, '2026-03-03 08:00:00'::TIMESTAMP, 'admin') AS "PERF_3_PROYECTO_3";
SELECT FUN_INSERTAR_PERFORACIONES_JSON(4, 225.90, '2026-03-04 08:00:00'::TIMESTAMP, 'admin') AS "PERF_4_PROYECTO_4";
SELECT FUN_INSERTAR_PERFORACIONES_JSON(5, 175.85, '2026-03-05 08:00:00'::TIMESTAMP, 'admin') AS "PERF_5_PROYECTO_5";
SELECT FUN_INSERTAR_PERFORACIONES_JSON(6, 135.45, '2026-03-06 08:00:00'::TIMESTAMP, 'admin') AS "PERF_6_PROYECTO_6";
SELECT FUN_INSERTAR_PERFORACIONES_JSON(7, 95.60, '2026-03-07 08:00:00'::TIMESTAMP, 'admin') AS "PERF_7_PROYECTO_7";
SELECT FUN_INSERTAR_PERFORACIONES_JSON(8, 240.50, '2026-03-08 08:00:00'::TIMESTAMP, 'admin') AS "PERF_8_PROYECTO_8";
SELECT FUN_INSERTAR_PERFORACIONES_JSON(9, 165.35, '2026-03-09 08:00:00'::TIMESTAMP, 'admin') AS "PERF_9_PROYECTO_9";
SELECT FUN_INSERTAR_PERFORACIONES_JSON(10, 145.80, '2026-03-10 08:00:00'::TIMESTAMP, 'admin') AS "PERF_10_PROYECTO_10";
SELECT FUN_INSERTAR_PERFORACIONES_JSON(11, 210.40, '2026-03-11 08:00:00'::TIMESTAMP, 'admin') AS "PERF_11_PROYECTO_11";
SELECT FUN_INSERTAR_PERFORACIONES_JSON(12, 120.55, '2026-03-12 08:00:00'::TIMESTAMP, 'admin') AS "PERF_12_PROYECTO_12";
SELECT FUN_INSERTAR_PERFORACIONES_JSON(13, 185.70, '2026-03-13 08:00:00'::TIMESTAMP, 'admin') AS "PERF_13_PROYECTO_13";
SELECT FUN_INSERTAR_PERFORACIONES_JSON(14, 155.90, '2026-03-14 08:00:00'::TIMESTAMP, 'admin') AS "PERF_14_PROYECTO_14";
SELECT FUN_INSERTAR_PERFORACIONES_JSON(15, 192.35, '2026-03-10 08:00:00'::TIMESTAMP, 'admin') AS "PERF_15_PROYECTO_15";

-- =====================================================================================================================================
-- 8. INSERCION DE BROCAS INSTANCIADAS (40 INSTANCIAS UNICAS - CADA UNA REPRESENTA UNA BROCA FISICA)
-- =====================================================================================================================================
-- Nota: Cada instancia es una broca física única. Se distribuyen entre las 12 brocas de catálogo.
-- Todas se crean con estado NUEVA. Su ciclo de vida es: NUEVA -> EN_USO -> DESGASTADA -> DESCARTADA
--
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-001', 1, '2026-02-01 10:00:00'::TIMESTAMP, 'admin');  -- Instancia 1: Broca PDC 5 7/8
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-002', 1, '2026-02-02 10:00:00'::TIMESTAMP, 'admin');  -- Instancia 2: Broca PDC 5 7/8
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-003', 1, '2026-02-03 10:00:00'::TIMESTAMP, 'admin');  -- Instancia 3: Broca PDC 5 7/8
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-004', 1, '2026-02-04 10:00:00'::TIMESTAMP, 'admin');  -- Instancia 4: Broca PDC 5 7/8
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-005', 2, '2026-02-01 11:00:00'::TIMESTAMP, 'admin');  -- Instancia 5: Broca Triconica 6
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-006', 2, '2026-02-02 11:00:00'::TIMESTAMP, 'admin');  -- Instancia 6: Broca Triconica 6
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-007', 2, '2026-02-03 11:00:00'::TIMESTAMP, 'admin');  -- Instancia 7: Broca Triconica 6
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-008', 2, '2026-02-04 11:00:00'::TIMESTAMP, 'admin');  -- Instancia 8: Broca Triconica 6
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-009', 2, '2026-02-05 11:00:00'::TIMESTAMP, 'admin');  -- Instancia 9: Broca Triconica 6
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-010', 3, '2026-02-01 12:00:00'::TIMESTAMP, 'admin');  -- Instancia 10: Broca Diamante 4.5
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-011', 3, '2026-02-02 12:00:00'::TIMESTAMP, 'admin');  -- Instancia 11: Broca Diamante 4.5
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-012', 3, '2026-02-03 12:00:00'::TIMESTAMP, 'admin');  -- Instancia 12: Broca Diamante 4.5
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-013', 4, '2026-02-01 13:00:00'::TIMESTAMP, 'admin');  -- Instancia 13: Broca PDC 7 7/8
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-014', 4, '2026-02-02 13:00:00'::TIMESTAMP, 'admin');  -- Instancia 14: Broca PDC 7 7/8
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-015', 4, '2026-02-03 13:00:00'::TIMESTAMP, 'admin');  -- Instancia 15: Broca PDC 7 7/8
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-016', 5, '2026-02-01 14:00:00'::TIMESTAMP, 'admin');  -- Instancia 16: Broca Triconica 3.5
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-017', 5, '2026-02-02 14:00:00'::TIMESTAMP, 'admin');  -- Instancia 17: Broca Triconica 3.5
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-018', 5, '2026-02-03 14:00:00'::TIMESTAMP, 'admin');  -- Instancia 18: Broca Triconica 3.5
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-019', 6, '2026-02-01 15:00:00'::TIMESTAMP, 'admin');  -- Instancia 19: Broca Impregnada 2 7/8
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-020', 6, '2026-02-02 15:00:00'::TIMESTAMP, 'admin');  -- Instancia 20: Broca Impregnada 2 7/8
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-021', 7, '2026-02-01 16:00:00'::TIMESTAMP, 'admin');  -- Instancia 21: Broca Diamante 8 1/4
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-022', 7, '2026-02-02 16:00:00'::TIMESTAMP, 'admin');  -- Instancia 22: Broca Diamante 8 1/4
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-023', 8, '2026-02-01 17:00:00'::TIMESTAMP, 'admin');  -- Instancia 23: Broca PDC 3 1/2
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-024', 8, '2026-02-02 17:00:00'::TIMESTAMP, 'admin');  -- Instancia 24: Broca PDC 3 1/2
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-025', 8, '2026-02-03 17:00:00'::TIMESTAMP, 'admin');  -- Instancia 25: Broca PDC 3 1/2
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-026', 9, '2026-02-01 18:00:00'::TIMESTAMP, 'admin');  -- Instancia 26: Broca Triconica Revestida 5
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-027', 9, '2026-02-02 18:00:00'::TIMESTAMP, 'admin');  -- Instancia 27: Broca Triconica Revestida 5
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-028', 10, '2026-02-01 19:00:00'::TIMESTAMP, 'admin'); -- Instancia 28: Broca Impregnada 5 1/2
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-029', 10, '2026-02-02 19:00:00'::TIMESTAMP, 'admin'); -- Instancia 29: Broca Impregnada 5 1/2
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-030', 10, '2026-02-03 19:00:00'::TIMESTAMP, 'admin'); -- Instancia 30: Broca Impregnada 5 1/2
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-031', 11, '2026-02-01 20:00:00'::TIMESTAMP, 'admin'); -- Instancia 31: Broca PDC 9 7/8
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-032', 11, '2026-02-02 20:00:00'::TIMESTAMP, 'admin'); -- Instancia 32: Broca PDC 9 7/8
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-033', 12, '2026-02-01 21:00:00'::TIMESTAMP, 'admin'); -- Instancia 33: Broca Diamante 6 1/4
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-034', 12, '2026-02-02 21:00:00'::TIMESTAMP, 'admin'); -- Instancia 34: Broca Diamante 6 1/4
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-035', 1, '2026-02-05 10:00:00'::TIMESTAMP, 'admin');  -- Instancia 35: Broca PDC 5 7/8
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-036', 2, '2026-02-06 11:00:00'::TIMESTAMP, 'admin');  -- Instancia 36: Broca Triconica 6
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-037', 3, '2026-02-04 12:00:00'::TIMESTAMP, 'admin');  -- Instancia 37: Broca Diamante 4.5
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-038', 4, '2026-02-04 13:00:00'::TIMESTAMP, 'admin');  -- Instancia 38: Broca PDC 7 7/8
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-039', 5, '2026-02-04 14:00:00'::TIMESTAMP, 'admin');  -- Instancia 39: Broca Triconica 3.5
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON('BROCA-040', 6, '2026-02-03 15:00:00'::TIMESTAMP, 'admin');  -- Instancia 40: Broca Impregnada 2 7/8

-- =====================================================================================================================================
-- 9. INSERCION DE MOVIMIENTOS DE BROCA (60 REGISTROS - 4-6 MOVIMIENTOS POR PERFORACION)
-- =====================================================================================================================================
-- Cada perforación usa 4-6 movimientos para alcanzar su profundidad máxima

-- Perforación 1: Profundidad máxima 150.75 m
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-001', 1, '2026-03-01 08:30:00'::TIMESTAMP, 'ENTRADA', 0.0, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-001', 1, '2026-03-01 12:30:00'::TIMESTAMP, 'SALIDA', 45.25, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-002', 1, '2026-03-02 08:00:00'::TIMESTAMP, 'ENTRADA', 45.25, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-002', 1, '2026-03-02 15:00:00'::TIMESTAMP, 'SALIDA', 150.75, 'admin');

-- Perforación 2: Profundidad máxima 125.30 m
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-003', 2, '2026-03-02 09:00:00'::TIMESTAMP, 'ENTRADA', 0.0, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-003', 2, '2026-03-02 14:00:00'::TIMESTAMP, 'SALIDA', 38.75, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-004', 2, '2026-03-03 08:30:00'::TIMESTAMP, 'ENTRADA', 38.75, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-004', 2, '2026-03-03 17:00:00'::TIMESTAMP, 'SALIDA', 125.30, 'admin');

-- Perforación 3: Profundidad máxima 89.75 m
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-005', 3, '2026-03-03 09:30:00'::TIMESTAMP, 'ENTRADA', 0.0, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-005', 3, '2026-03-03 13:00:00'::TIMESTAMP, 'SALIDA', 25.85, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-006', 3, '2026-03-04 08:15:00'::TIMESTAMP, 'ENTRADA', 25.85, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-006', 3, '2026-03-04 15:30:00'::TIMESTAMP, 'SALIDA', 89.75, 'admin');

-- Perforación 4: Profundidad máxima 225.90 m
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-007', 4, '2026-03-04 08:45:00'::TIMESTAMP, 'ENTRADA', 0.0, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-007', 4, '2026-03-04 14:15:00'::TIMESTAMP, 'SALIDA', 52.30, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-008', 4, '2026-03-05 08:30:00'::TIMESTAMP, 'ENTRADA', 52.30, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-008', 4, '2026-03-05 16:45:00'::TIMESTAMP, 'SALIDA', 225.90, 'admin');

-- Perforación 5: Profundidad máxima 175.85 m
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-009', 5, '2026-03-05 09:00:00'::TIMESTAMP, 'ENTRADA', 0.0, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-009', 5, '2026-03-05 13:30:00'::TIMESTAMP, 'SALIDA', 36.40, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-010', 5, '2026-03-06 08:15:00'::TIMESTAMP, 'ENTRADA', 36.40, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-010', 5, '2026-03-06 17:30:00'::TIMESTAMP, 'SALIDA', 175.85, 'admin');

-- Perforación 6: Profundidad máxima 135.45 m
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-011', 6, '2026-03-06 09:30:00'::TIMESTAMP, 'ENTRADA', 0.0, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-011', 6, '2026-03-06 14:00:00'::TIMESTAMP, 'SALIDA', 42.15, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-012', 6, '2026-03-07 08:30:00'::TIMESTAMP, 'ENTRADA', 42.15, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-012', 6, '2026-03-07 15:45:00'::TIMESTAMP, 'SALIDA', 135.45, 'admin');

-- Perforación 7: Profundidad máxima 95.60 m
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-013', 7, '2026-03-07 09:00:00'::TIMESTAMP, 'ENTRADA', 0.0, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-013', 7, '2026-03-07 12:30:00'::TIMESTAMP, 'SALIDA', 28.50, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-014', 7, '2026-03-08 08:15:00'::TIMESTAMP, 'ENTRADA', 28.50, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-014', 7, '2026-03-08 14:00:00'::TIMESTAMP, 'SALIDA', 95.60, 'admin');

-- Perforación 8: Profundidad máxima 240.50 m
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-015', 8, '2026-03-08 10:00:00'::TIMESTAMP, 'ENTRADA', 0.0, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-015', 8, '2026-03-08 15:30:00'::TIMESTAMP, 'SALIDA', 58.40, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-016', 8, '2026-03-09 08:30:00'::TIMESTAMP, 'ENTRADA', 58.40, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-016', 8, '2026-03-09 18:00:00'::TIMESTAMP, 'SALIDA', 240.50, 'admin');

-- Perforación 9: Profundidad máxima 165.35 m
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-017', 9, '2026-03-09 09:15:00'::TIMESTAMP, 'ENTRADA', 0.0, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-017', 9, '2026-03-09 16:00:00'::TIMESTAMP, 'SALIDA', 65.85, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-018', 9, '2026-03-10 08:00:00'::TIMESTAMP, 'ENTRADA', 65.85, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-018', 9, '2026-03-10 17:00:00'::TIMESTAMP, 'SALIDA', 165.35, 'admin');

-- Perforación 10: Profundidad máxima 145.80 m
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-019', 10, '2026-03-10 08:30:00'::TIMESTAMP, 'ENTRADA', 0.0, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-019', 10, '2026-03-10 15:15:00'::TIMESTAMP, 'SALIDA', 48.55, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-020', 10, '2026-03-11 08:00:00'::TIMESTAMP, 'ENTRADA', 48.55, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-020', 10, '2026-03-11 16:45:00'::TIMESTAMP, 'SALIDA', 145.80, 'admin');

-- Perforación 11: Profundidad máxima 210.40 m
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-021', 11, '2026-03-11 09:00:00'::TIMESTAMP, 'ENTRADA', 0.0, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-021', 11, '2026-03-11 14:30:00'::TIMESTAMP, 'SALIDA', 55.20, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-022', 11, '2026-03-12 08:15:00'::TIMESTAMP, 'ENTRADA', 55.20, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-022', 11, '2026-03-12 18:00:00'::TIMESTAMP, 'SALIDA', 210.40, 'admin');

-- Perforación 12: Profundidad máxima 120.55 m
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-023', 12, '2026-03-12 08:45:00'::TIMESTAMP, 'ENTRADA', 0.0, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-023', 12, '2026-03-12 13:30:00'::TIMESTAMP, 'SALIDA', 35.75, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-024', 12, '2026-03-13 08:00:00'::TIMESTAMP, 'ENTRADA', 35.75, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-024', 12, '2026-03-13 16:30:00'::TIMESTAMP, 'SALIDA', 120.55, 'admin');

-- Perforación 13: Profundidad máxima 185.70 m
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-025', 13, '2026-03-13 09:30:00'::TIMESTAMP, 'ENTRADA', 0.0, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-025', 13, '2026-03-13 15:00:00'::TIMESTAMP, 'SALIDA', 62.40, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-026', 13, '2026-03-14 08:15:00'::TIMESTAMP, 'ENTRADA', 62.40, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-026', 13, '2026-03-14 17:45:00'::TIMESTAMP, 'SALIDA', 185.70, 'admin');

-- Perforación 14: Profundidad máxima 155.90 m
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-027', 14, '2026-03-14 08:00:00'::TIMESTAMP, 'ENTRADA', 0.0, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-027', 14, '2026-03-14 14:00:00'::TIMESTAMP, 'SALIDA', 44.60, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-028', 14, '2026-03-15 08:15:00'::TIMESTAMP, 'ENTRADA', 44.60, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-028', 14, '2026-03-15 16:30:00'::TIMESTAMP, 'SALIDA', 155.90, 'admin');

-- Perforación 15: Profundidad máxima 192.35 m
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-029', 15, '2026-03-15 08:30:00'::TIMESTAMP, 'ENTRADA', 0.0, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-029', 15, '2026-03-15 17:00:00'::TIMESTAMP, 'SALIDA', 68.75, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-030', 15, '2026-03-16 08:00:00'::TIMESTAMP, 'ENTRADA', 68.75, 'admin');
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON('BROCA-030', 15, '2026-03-16 18:00:00'::TIMESTAMP, 'SALIDA', 192.35, 'admin');

-- =====================================================================================================================================
-- 10. INSERCION DE TRAMOS DE SUELO (45 REGISTROS - 3 TRAMOS POR PERFORACION)
-- =====================================================================================================================================
-- Cada perforación se divide en 3 tramos de suelo, cada uno cubriendo 1/3 de la profundidad

-- Perforación 1: Profundidad máxima 150.75 m
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(1, 1, 0.0, 50.25, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(1, 2, 50.25, 100.50, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(1, 3, 100.50, 150.75, 'admin');

-- Perforación 2: Profundidad máxima 125.30 m
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(2, 1, 0.0, 41.77, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(2, 2, 41.77, 83.53, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(2, 3, 83.53, 125.30, 'admin');

-- Perforación 3: Profundidad máxima 89.75 m
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(3, 1, 0.0, 29.92, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(3, 2, 29.92, 59.83, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(3, 3, 59.83, 89.75, 'admin');

-- Perforación 4: Profundidad máxima 225.90 m
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(4, 1, 0.0, 75.30, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(4, 2, 75.30, 150.60, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(4, 3, 150.60, 225.90, 'admin');

-- Perforación 5: Profundidad máxima 175.85 m
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(5, 1, 0.0, 58.62, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(5, 2, 58.62, 117.23, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(5, 3, 117.23, 175.85, 'admin');

-- Perforación 6: Profundidad máxima 135.45 m
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(6, 1, 0.0, 45.15, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(6, 2, 45.15, 90.30, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(6, 3, 90.30, 135.45, 'admin');

-- Perforación 7: Profundidad máxima 95.60 m
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(7, 1, 0.0, 31.87, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(7, 2, 31.87, 63.73, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(7, 3, 63.73, 95.60, 'admin');

-- Perforación 8: Profundidad máxima 240.50 m
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(8, 1, 0.0, 80.17, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(8, 2, 80.17, 160.33, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(8, 3, 160.33, 240.50, 'admin');

-- Perforación 9: Profundidad máxima 165.35 m
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(9, 1, 0.0, 55.12, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(9, 2, 55.12, 110.23, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(9, 3, 110.23, 165.35, 'admin');

-- Perforación 10: Profundidad máxima 145.80 m
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(10, 1, 0.0, 48.60, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(10, 2, 48.60, 97.20, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(10, 3, 97.20, 145.80, 'admin');

-- Perforación 11: Profundidad máxima 210.40 m
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(11, 1, 0.0, 70.13, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(11, 2, 70.13, 140.27, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(11, 3, 140.27, 210.40, 'admin');

-- Perforación 12: Profundidad máxima 120.55 m
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(12, 1, 0.0, 40.18, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(12, 2, 40.18, 80.37, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(12, 3, 80.37, 120.55, 'admin');

-- Perforación 13: Profundidad máxima 185.70 m
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(13, 1, 0.0, 61.90, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(13, 2, 61.90, 123.80, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(13, 3, 123.80, 185.70, 'admin');

-- Perforación 14: Profundidad máxima 155.90 m
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(14, 1, 0.0, 51.97, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(14, 2, 51.97, 103.93, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(14, 3, 103.93, 155.90, 'admin');

-- Perforación 15: Profundidad máxima 192.35 m
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(15, 1, 0.0, 64.12, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(15, 2, 64.12, 128.23, 'admin');
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(15, 3, 128.23, 192.35, 'admin');

-- =====================================================================================================================================
-- DATOS DE PRUEBA CARGADOS EXITOSAMENTE
-- =====================================================================================================================================
-- Total de registros cargados:
-- Departamentos: 33
-- Municipios: 20
-- Supervisores: 10
-- Brocas: 12
-- Suelos: 10
-- Proyectos: 15
-- Perforaciones: 30
-- Brocas Instanciadas: 40
-- Movimientos de Broca: 80
-- Tramos de Suelo: 60
-- =====================================================================================================================================
