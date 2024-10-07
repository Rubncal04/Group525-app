# Proyecto Rails 7 con Docker y MySQL

Este proyecto es una aplicación web construida con Ruby on Rails 7, que utiliza Docker y Docker Compose para facilitar el desarrollo y la gestión de la base de datos MySQL.

## Requisitos Previos

- [Docker](https://www.docker.com/get-started) y [Docker Compose](https://docs.docker.com/compose/install/) instalados en tu máquina.

## Descarga del Proyecto

Puedes descargar el proyecto desde el siguiente enlace:
  ```bash
  git clone git@github.com:Rubncal04/Group525-app.git
  ```


## Inicialización del Proyecto con Docker

1. **Navega a la carpeta del proyecto:**

   ```bash
   cd <NOMBRE_DEL_DIRECTORIO_DEL_PROYECTO>
   ```
2. **Construye y levanta los contenedores:**

    ```bash
    docker-compose up --build
    ```
    Esto iniciará todos los servicios definidos en el archivo docker-compose.yml.
3. **Ejecuta las migraciones de la base de datos:**

   Las migraciones y semillas se corren automaticamente, ya que el comando está definido en el `Dockerfile`. En caso dado no se hayan
   ejecutado las migraciones, debes correr el siguiente comando desde tu terminal:
   ```bash
   docker-compose exec web rails db:migrate
   ```

   Y luego ejecutas:
    ```bash
   docker-compose exec web rails db:seed
   ```
    
5. **Accede a la aplicación:**

   La aplicación estará disponible en `http://localhost:4563`.

## Inicialización del Proyecto con Rails server

1. **Navega a la carpeta del proyecto:**

   ```bash
   cd <NOMBRE_DEL_DIRECTORIO_DEL_PROYECTO>
   ```
2. **Levanta el servidor:**

    ```bash
    rails s
    ```
    Esto iniciará la aplicación
3. **Ejecuta las migraciones de la base de datos:**

   Debes correr el siguiente comando desde tu terminal:
   ```bash
   rails db:migrate
   ```
   luego correr las semillas:
   ```bash
   rails db:seed
   ```
5. **Accede a la aplicación:**

  La aplicación estará disponible en `http://localhost:3000`.

  ## Endpoints
  ### Contactos
  #### GET /contacts

  Retorna todos los contactos en formato HTML y JSON. Si se solicita en JSON, retornará los datos que pueden ser consumidos por una API.

  #### GET /contacts/new

  Muestra el formulario para crear un nuevo contacto.

  #### POST /contacts

  Crea un nuevo contacto y redirige a la lista de contactos.

  #### GET /contacts/:id

  Muestra la vista detallada de un contacto específico.

  #### GET /contacts/:id/edit

  Muestra el formulario para editar un contacto existente.

  #### PATCH/PUT /contacts/:id

  Actualiza un contacto existente y redirige a la lista de contactos.

  #### DELETE /contacts/:id

  Elimina un contacto específico y redirige a la raíz de la aplicación.

  ### Descarga de Archivo
  #### GET /contacts/download_file

  Permite descargar un archivo relacionado con los contactos.

  ## Base de Datos
  El proyecto utiliza MySQL como base de datos. La configuración de la base de datos se encuentra en el archivo `config/database.yml`.


  ### Notas
  - Asegúrate de reemplazar `<NOMBRE_DEL_DIRECTORIO_DEL_PROYECTO>` con la URL real de tu repositorio y el nombre del directorio donde se encuentra tu proyecto, respectivamente.


