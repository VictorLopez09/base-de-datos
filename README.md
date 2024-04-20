## base-de-datos

# Pasos después de descargar el proyecto.

Después de descargar un proyecto en Laravel desde GitHub, es importante seguir algunos pasos para asegurarte de que el proyecto esté configurado correctamente y listo para su uso. A continuación, se detallan los pasos comunes que debes seguir:

1. Instalación de dependencias

El primer paso es instalar todas las dependencias del proyecto utilizando Composer. Para ello, abre una terminal en la raíz del proyecto y ejecuta el siguiente comando:

```php
composer install
```

2. Ejecución de migraciones 

```php
php artisan migrate
```



## Cambiar la base de datos en Laravel

1. **Abrir el archivo `.env`**: Encuentra y abre el archivo `.env` en la raíz de tu proyecto Laravel.

2. **Modificar `DB_CONNECTION`**: Cambia la variable `DB_CONNECTION` para seleccionar el controlador de base de datos adecuado. Por ejemplo, cambia de `mysql` a `pgsql` para PostgreSQL.

3. **Modificar otras variables**: Actualiza las variables `DB_HOST`, `DB_PORT`, `DB_DATABASE`, `DB_USERNAME` y `DB_PASSWORD` según la configuración de tu nueva base de datos.

4. **Guardar los cambios**: Guarda el archivo `.env` después de realizar las modificaciones.

5. **Ejecutar migraciones (opcional)**: Si es necesario, ejecuta las migraciones con `php artisan migrate` para aplicar los cambios en la nueva base de datos.



## Consumir la API en Laravel

1. Registro de Usuario

Para registrar un nuevo usuario, envía una solicitud `POST` a la ruta `/api/register` con los siguientes datos en formato JSON:

```json
{
  "curp": "ABC123456DEFGHIJ1",
  "rfc": "RFC123456ABC",
  "nombre": "Nombre",
  "paterno": "ApellidoPaterno",
  "materno": "ApellidoMaterno",
  "sexo": "M",
  "clave_estado": 1,
  "clave_ciudad": 1,
  "clave_colonia": 1,
  "calle": "Calle 123",
  "telefono": "1234567890",
  "email": "usuario@example.com",
  "contrasena": "contraseña"
}
```

2. Inicio de Sesión
Para iniciar sesión, envía una solicitud POST a la ruta /api/login con las credenciales de inicio de sesión en formato JSON:


```json
Copy code
{
  "email": "usuario@example.com",
  "contrasena": "contraseña"
}
```


