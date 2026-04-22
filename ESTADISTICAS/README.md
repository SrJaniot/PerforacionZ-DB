╔═══════════════════════════════════════════════════════════════════════════╗
║                                                                             ║
║           📊 ESTADÍSTICAS Y ANÁLISIS DE BROCAS - PERFORACIONZ              ║
║                                                                             ║
║              Base de Datos de Perforación - Sistema Analítico               ║
║                                                                             ║
╚═══════════════════════════════════════════════════════════════════════════╝

═══════════════════════════════════════════════════════════════════════════════
📋 DESCRIPCIÓN DE ARCHIVOS
═══════════════════════════════════════════════════════════════════════════════

📁 CARPETA: ESTADISTICAS/
└── Contiene análisis, reportes y queries sobre el desempeño de brocas,
    perforaciones y operaciones del sistema PerforacionZ.

───────────────────────────────────────────────────────────────────────────────

📄 01_ESTADISTICAS_RENDIMIENTO_BROCAS.SQL
   ┣━━ Propósito: Analizar cuál es la broca que MEJOR PERFORA
   ┣━━ Datos incluidos:
   ┃   • Top 10 brocas por profundidad total perforada
   ┃   • Eficiencia (Profundidad vs Movimientos)
   ┃   • Top instancias por durabilidad
   ┃   • Promedio de profundidad por tramo
   ┗━━ Casos de uso:
       ├─ Identificar brocas más productivas
       ├─ Evaluar inversión en nuevas brocas
       └─ Comparar rendimiento entre modelos

───────────────────────────────────────────────────────────────────────────────

📄 02_ESTADISTICAS_BROCAS_POR_SUELO.SQL
   ┣━━ Propósito: Analizar QUÉ TIPO DE SUELO PERFORA MEJOR CADA BROCA
   ┣━━ Datos incluidos:
   ┃   • Efectividad de brocas por tipo de suelo
   ┃   • Matriz performance: Tipo de Broca vs Tipo de Suelo
   ┃   • Suelos ordenados por dificultad de perforación
   ┃   • Recomendación de mejor broca por tipo de suelo
   ┗━━ Casos de uso:
       ├─ Seleccionar broca correcta para suelo específico
       ├─ Predecir dificultad de nueva perforación
       ├─ Optimizar recursos y tiempos
       └─ Entrenamiento de personal operativo

───────────────────────────────────────────────────────────────────────────────

📄 03_ESTADISTICAS_BROCAS_POR_LOCALIDADES.SQL
   ┣━━ Propósito: Analizar EN QUÉ LOCALIDADES SE USA MÁS CADA BROCA
   ┣━━ Datos incluidos:
   ┃   • Distribución de uso de brocas por municipio
   ┃   • Top municipios por actividad de perforación
   ┃   • Preferencia de tipos de broca por departamento
   ┃   • Estadísticas de proyectos por municipio
   ┗━━ Casos de uso:
       ├─ Logística y distribución de brocas
       ├─ Planificación regional
       ├─ Identificar tendencias geográficas
       └─ Asignación de recursos por región

───────────────────────────────────────────────────────────────────────────────

📄 04_ESTADISTICAS_CONSUMO_DESGASTE.SQL
   ┣━━ Propósito: Analizar CONSUMO, DESGASTE y MANTENIMIENTO DE BROCAS
   ┣━━ Datos incluidos:
   ┃   • Inventario por estado (NUEVA, EN_USO, DAÑADA, DESCARTADA)
   ┃   • Vida útil promedio por modelo
   ┃   • Rotación y frecuencia de uso
   ┃   • Índice de desgaste y necesidad de mantenimiento
   ┃   • Análisis de productividad (metros perforados vs uso)
   ┗━━ Casos de uso:
       ├─ Planificación de mantenimiento preventivo
       ├─ Presupuesto para reemplazo de brocas
       ├─ Predicción de fallas
       ├─ Optimización de ciclo de vida
       └─ Control de inventario

───────────────────────────────────────────────────────────────────────────────

📄 05_DASHBOARD_RESUMEN_GENERAL.SQL
   ┣━━ Propósito: Vista EJECUTIVA con KPIs principales del sistema
   ┣━━ Datos incluidos:
   ┃   • Indicadores clave de desempeño (KPIs)
   ┃   • Volumen operacional total
   ┃   • Inventario de brocas resumen
   ┃   • Cobertura geográfica
   ┃   • Eficiencia operacional
   ┃   • Top 5 brocas más productivas
   ┃   • Top 5 municipios más activos
   ┃   • Análisis de suelos por dificultad
   ┃   • Recomendaciones operacionales
   ┗━━ Casos de uso:
       ├─ Reportes ejecutivos/gerenciales
       ├─ Presentaciones a stakeholders
       ├─ Toma de decisiones estratégicas
       ├─ Monitoreo de salud general del sistema
       └─ Alertas y recomendaciones

───────────────────────────────────────────────────────────────────────────────

📄 06_ANALISIS_AVANZADO_COMPARATIVO.SQL
   ┣━━ Propósito: Análisis COMPARATIVOS y ESPECIALIZADOS
   ┣━━ Datos incluidos:
   ┃   • Matriz comparativa de rendimiento por modelo
   ┃   • Matriz de compatibilidad Brocas vs Suelos
   ┃   • Eficiencia por proyecto (ROI de brocas)
   ┃   • Tendencias operacionales temporales
   ┃   • Análisis de desgaste esperado vs real
   ┃   • Especialización de brocas por tipo
   ┗━━ Casos de uso:
       ├─ Benchmarking entre modelos
       ├─ Análisis de compatibilidad
       ├─ Optimización de recursos por proyecto
       ├─ Identificación de especialidades
       ├─ Predicción de tendencias
       └─ Investigación de anomalías

═══════════════════════════════════════════════════════════════════════════════
🚀 CÓMO USAR ESTOS ARCHIVOS
═══════════════════════════════════════════════════════════════════════════════

1️⃣  OPCIÓN 1: EJECUTAR UN ARCHIVO COMPLETO
   • Abrir el archivo SQL en PostgreSQL/PGAdmin
   • Ejecutar TODO el contenido (Ctrl+A → Ctrl+Enter)
   • Los resultados estarán separados por secciones con títulos claros

2️⃣  OPCIÓN 2: EJECUTAR CONSULTAS INDIVIDUALES
   • Cada archivo tiene múltiples queries separadas por comentarios
   • Seleccionar una query específica (desde SELECT hasta ;)
   • Ejecutar solo esa query (Ctrl+Enter)
   • Útil para análisis puntual

3️⃣  OPCIÓN 3: CREAR UN SCRIPT PERSONALIZADO
   • Copiar queries de diferentes archivos según necesidad
   • Combinarlas en un nuevo SQL
   • Guardar como ESTADISTICAS_PERSONALIZADO.SQL

4️⃣  OPCIÓN 4: AUTOMATIZAR REPORTES
   • Exportar resultados a CSV/Excel
   • Programar ejecución automática con cron/Windows Task Scheduler
   • Integrar con herramientas BI (Power BI, Tableau, etc.)

═══════════════════════════════════════════════════════════════════════════════
📊 EJEMPLOS DE ANÁLISIS RECOMENDADOS
═══════════════════════════════════════════════════════════════════════════════

👉 ANÁLISIS COMPLETO DE BROCAS:
   1. Ejecutar: 01_ESTADISTICAS_RENDIMIENTO_BROCAS.SQL
      └─ Identifica brocas más productivas
   2. Ejecutar: 02_ESTADISTICAS_BROCAS_POR_SUELO.SQL
      └─ Ve cómo se comportan en diferentes suelos
   3. Ejecutar: 06_ANALISIS_AVANZADO_COMPARATIVO.SQL
      └─ Compara especialización entre modelos

👉 PLANNING DE MANTENIMIENTO:
   1. Ejecutar: 04_ESTADISTICAS_CONSUMO_DESGASTE.SQL
      └─ Identifica brocas en servicio prolongado
   2. Revisar sección "Índice de Desgaste"
   3. Priorizar mantenimiento según "RECOMENDACIÓN_MANTENIMIENTO"

👉 REPORTES EJECUTIVOS:
   1. Ejecutar: 05_DASHBOARD_RESUMEN_GENERAL.SQL
      └─ Obtener vista rápida del sistema
   2. Filtrar por métricas de interés
   3. Usar para presentaciones directivas

👉 OPTIMIZACIÓN POR LOCALIDAD:
   1. Ejecutar: 03_ESTADISTICAS_BROCAS_POR_LOCALIDADES.SQL
      └─ Ver distribución geográfica
   2. Ejecutar: 06_ANALISIS_AVANZADO_COMPARATIVO.SQL
      └─ Sección "Eficiencia por Proyecto"
   3. Identificar proyectos con bajo ROI

═══════════════════════════════════════════════════════════════════════════════
🔍 INTERPRETACIÓN DE RESULTADOS
═══════════════════════════════════════════════════════════════════════════════

📈 PROFUNDIDAD TOTAL PERFORADA:
   • Mayor = Mejor rendimiento general
   • Considerar cantidad de instancias (una broca con una instancia vs 10)

⚡ PROFUNDIDAD PROMEDIO POR TRAMO:
   • Mayor = Mejor para suelos blandos
   • Menor = Mejor para suelos duros (requiere más precisión)

🔧 MOVIMIENTOS POR INSTANCIA:
   • Mayor = Más uso de recurso (desgaste faster)
   • Útil para planificar reemplazo

📍 METROS POR MOVIMIENTO:
   • Mayor = Más eficiente (menos movimientos, misma profundidad)

⏱️ DÍAS EN USO:
   • Vida útil del recurso
   • Comparar con expectativa de fabricante

═══════════════════════════════════════════════════════════════════════════════
💡 RECOMENDACIONES OPERACIONALES
═══════════════════════════════════════════════════════════════════════════════

✅ EJECUTAR REGULARMENTE:
   • Dashboard General (05): Semanal o mensual
   • Rendimiento (01): Mensual
   • Consumo/Desgaste (04): Antes de ciclos de mantenimiento

✅ MONITOREAR CONSTANTEMENTE:
   • Estado del inventario (04 - Estado General)
   • Brocas dañadas (requieren reemplazo inmediato)
   • Tendencias de desgaste

✅ USAR PARA DECISIONES:
   • Selección de broca por suelo (02)
   • Distribución de recursos (03)
   • Presupuesto de mantenimiento (04, 05)

═══════════════════════════════════════════════════════════════════════════════
📞 CONTACTO Y SOPORTE
═══════════════════════════════════════════════════════════════════════════════

Para preguntas sobre:
  • Interpretación de resultados → Consultar documentación técnica
  • Nuevos análisis → Modificar queries existentes o crear nuevas
  • Problemas de performance → Revisar índices de base de datos

═══════════════════════════════════════════════════════════════════════════════
📅 FECHA DE CREACIÓN: 2026-04-21
🔄 ÚLTIMA ACTUALIZACIÓN: 2026-04-21
📌 VERSIÓN: 1.0
═══════════════════════════════════════════════════════════════════════════════
