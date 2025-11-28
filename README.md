# Repositorio API Gateway - `api-gateway`
Este repositorio contiene la implementación de un API Gateway encargado de centralizar el acceso a todos los microservicios del proyecto. Además, proporciona balanceo de carga entre las instancias de los microservicios, gestionando rutas y optimizando la disponibilidad del sistema.

# Descripcion
El API Gateway actúa como punto único de entrada para todos los clientes que consumen los microservicios. Sus principales responsabilidades incluyen:

* Enrutamiento de peticiones a los microservicios correspondientes según la ruta solicitada.

* Balanceo de carga entre múltiples instancias de un mismo microservicio, distribuyendo las solicitudes de manera equitativa.

* Seguridad centralizada, aplicando validación de tokens y roles antes de redirigir las solicitudes.

* Desacoplamiento entre clientes y microservicios, permitiendo cambios internos en los servicios sin afectar a los consumidores.

El gateway se integra con Eureka para descubrir dinámicamente las instancias de cada microservicio y actualizar las rutas disponibles.

## Contenido del repositorio
1. **Código del API Gateway***
    * Configuración de rutas y filtros de entrada.
    * Balanceo de carga entre instancias registradas en Eureka.
    * Integración con Keycloak para autorización y autenticación.
2. `docker-compose.yml` (opcional)
   Permite desplegar el API Gateway como contenedor Docker junto con otros servicios críticos.
3. **Configuración de rutas y balance**
   Define las rutas disponibles y las políticas de distribución de peticiones entre instancias de los microservicios.

## Requisitos Previos
* Java 17+ 
* Gradle para compilar el proyecto
* Docker y Docker Compose (para despliegue en contenedores)
* Acceso a Eureka Server para descubrimiento de servicios
* Integración con Keycloak para gestión de seguridad

## Despliegue
### Local
1. **Clonar el repositorio**:
   ```console
   foo@bar:~$ git clone <URL_DEL_REPOSITORIO>
   foo@bar:~$ cd api-gateway 
   ```
2. **Ejecutar el gateway:**
   ```console
   foo@bar:~$ ./gradlew bootRun
   ```
### Con Docker
1. **Levantar el contenedor:**
   Ir al repositorio undersounds_gc01_infra
   ```console
   foo@bar:~$ docker-compose up -d
   ```
2. **Acceder al gateway en:**
   `http://localhost:8080`
   Las solicitudes serán enrutadas automáticamente a los microservicios correspondientes, con balanceo de carga si existen múltiples instancias.

## Objetivo
El API Gateway centraliza la entrada de todas las solicitudes al ecosistema de microservicios, ofreciendo:

* Rutas unificadas y balanceadas
* Seguridad centralizada mediante validación de tokens y roles
* Escalabilidad y resiliencia, desacoplando clientes de la implementación interna de los microservicios
