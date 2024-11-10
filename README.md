# Proyecto Cafetería - Flask con PostgreSQL

Este es un proyecto de gestión de una cafetería, construido con **Flask** como framework web y **PostgreSQL** como sistema de gestión de base de datos. La aplicación permite gestionar productos, empleados, comandas y realizar diversas operaciones administrativas de la cafetería.



# Estructura del Proyecto

  ```
    /cafeteria
    │
    ├── app.py              # Archivo principal de la aplicación Flask
    ├── db_config.py        # Configuración de la base de datos
    ├── requirements.txt     # Dependencias del proyecto
    ├── templates/           # Directorio de plantillas HTML
    │   ├── login.html       # Plantilla de inicio de sesión
    │   └── home.html        # Plantilla de inicio
    └── static/              # Archivos estáticos (CSS, JS, imágenes)
  ```




## Requisitos

Antes de ejecutar el proyecto, asegúrate de tener instalados los siguientes programas y de haber configurado el entorno de desarrollo:

1. **Crear un entorno virtual** (opcional, pero recomendado):
   - Para crear un entorno virtual, ejecuta el siguiente comando:

     ```bash
     python -m venv venv
     ```

   - Luego, activa el entorno virtual:

     - **Windows**:

       ```bash
       venv\Scripts\activate
       ```

     - **Linux/macOS**:

       ```bash
       source venv/bin/activate
       ```

2. **Python 3.x**: Asegúrate de tener una versión reciente de Python instalada.

3. **PostgreSQL**: Instala PostgreSQL y configura una base de datos para la aplicación.

4. **Instalar las dependencias** usando el comando:

   ```bash
   pip install -r requirements.txt



## Configuración de la Base de Datos

### Paso 1: Crear la base de datos

1. **Accede a tu cliente PostgreSQL** (pgAdmin, terminal o cualquier herramienta que prefieras) y ejecuta el siguiente comando para crear la base de datos `cafeteria`:



   ```sql
   CREATE DATABASE cafeteria;
   \c cafeteria;
   ```


