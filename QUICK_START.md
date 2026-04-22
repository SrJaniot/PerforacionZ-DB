# ⚡ Quick Start - PerforacionZ (2 Minutos)

## 🚀 Para Empezar Rápido

### Opción 1: Script Automático (RECOMENDADO - 30 segundos)

**Windows (PowerShell)**:
```powershell
cd v:\proyectos\PerforacionZ\db
.\setup.ps1
```

**Linux/Mac (Terminal)**:
```bash
cd /ruta/a/PerforacionZ/db
chmod +x setup.sh
./setup.sh
```

✅ **Listo!** Tu base de datos está operativa.

---

### Opción 2: Una Línea (CLI)

**Windows (CMD)**:
```cmd
cd v:\proyectos\PerforacionZ\db && ^
psql -U postgres -c "CREATE DATABASE PerforacionZ;" && ^
psql -U postgres -d PerforacionZ -f SETUP_CLEAN_DB.SQL && ^
psql -U postgres -d PerforacionZ -f SETUP_TEST_DATA.SQL
```

**Linux/Mac (Bash)**:
```bash
cd /ruta/a/PerforacionZ/db && \
psql -U postgres -c "CREATE DATABASE PerforacionZ;" && \
psql -U postgres -d PerforacionZ -f SETUP_CLEAN_DB.SQL && \
psql -U postgres -d PerforacionZ -f SETUP_TEST_DATA.SQL
```

---

## 📊 ¿Qué Se Instala?

Después de ejecutar el setup:

✅ **Base de datos** completa (10 tablas)
✅ **40 brocas** en inventario (BROCA-001 a BROCA-040)
✅ **3 proyectos** de ejemplo
✅ **15 perforaciones** con datos reales
✅ **60 movimientos** de brocas
✅ **Todos los procedimientos CRUD**

---

## 📝 Primeras Consultas

### Ver todas las brocas:
```bash
psql -U postgres -d PerforacionZ -c "SELECT * FROM TAB_BROCAS LIMIT 5;"
```

### Ver inventario de brocas:
```bash
psql -U postgres -d PerforacionZ -c "SELECT ESTADO_BROCA, COUNT(*) FROM TAB_BROCAINSTANCIADAS GROUP BY ESTADO_BROCA;"
```

### Insertar una nueva broca:
```bash
psql -U postgres -d PerforacionZ -c "SELECT FUN_INS_TAB_BROCAS('Mi Broca', 'Diamante', 5.0, 'Acero', 'Descripción');"
```

---

## 📈 Ver Estadísticas

### Broca que más perfora:
```bash
psql -U postgres -d PerforacionZ -f ESTADISTICAS/01_ESTADISTICAS_RENDIMIENTO_BROCAS.SQL
```

### Mejor broca por tipo de suelo:
```bash
psql -U postgres -d PerforacionZ -f ESTADISTICAS/02_ESTADISTICAS_BROCAS_POR_SUELO.SQL
```

### Distribución de brocas por municipio:
```bash
psql -U postgres -d PerforacionZ -f ESTADISTICAS/03_ESTADISTICAS_BROCAS_POR_LOCALIDADES.SQL
```

---

## 🐛 Solucionar Problemas

### "psql no es reconocido"
PostgreSQL no está en el PATH. Soluciones:
- Windows: Añade `C:\Program Files\PostgreSQL\XX\bin` a variables de entorno
- Linux: `sudo apt-get install postgresql-client`
- Mac: `brew install postgresql`

### "password authentication failed"
Usa `-W` para que te pida contraseña:
```bash
psql -U postgres -W -d PerforacionZ
```

O especifica contraseña:
```bash
PGPASSWORD=tu_contraseña psql -U postgres -d PerforacionZ
```

### "database does not exist"
Corre primero:
```bash
psql -U postgres -c "CREATE DATABASE PerforacionZ;"
```

### Windows: Script.ps1 no se ejecuta
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
.\setup.ps1
```

---

## 📚 Documentación Completa

- **README.md** - Guía completa
- **CONTRIBUTING.md** - Cómo contribuir
- **ESTADISTICAS/README.md** - Guía de análisis
- **ESTADISTICAS/GUIA_RAPIDA_CONSULTAS.SQL** - Queries listas para usar

---

## ✅ Verificar Instalación

```bash
psql -U postgres -d PerforacionZ -f VERIFICAR_DATOS.SQL
```

Debería mostrarte un resumen como:

```
VERIFICACIÓN DE DATOS - PerforacionZ
═════════════════════════════════════════════════════════════════

✓ Departamentos: 4
✓ Municipios: 10
✓ Supervisores: 5
✓ Tipos de Suelo: 7
✓ Modelos de Brocas: 10
✓ Instancias de Brocas: 40
✓ Proyectos: 3
✓ Perforaciones: 15
✓ Movimientos: 60
✓ Tramos de Suelo: 30
```

---

## 🎯 Próximo Paso

1. Lee [README.md](README.md) para entender la estructura
2. Explora las funciones en [FUNCIONES/](FUNCIONES/)
3. Corre análisis en [ESTADISTICAS/](ESTADISTICAS/)
4. Personaliza según tus necesidades

---

**¿Preguntas?** Ver README.md o CONTRIBUTING.md

**¡Listo para empezar!** 🚀
