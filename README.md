# oyd-exercise-4-1

Se ha configurado un bucket de S3 para archivado de logs y una tabla de DynamoDB para el registro de eventos, cumpliendo con los requisitos de seguridad (HTTPS-only) y optimización de costos (Lifecycle y TTL) solicitados en el curso.

## 1. Estado de la Infraestructura

A continuación se listan los recursos gestionados por Terraform:

```console
module.log_archive.aws_s3_bucket.this
module.log_archive.aws_s3_bucket_lifecycle_configuration.this
module.log_archive.aws_s3_bucket_policy.this
module.log_archive.aws_s3_bucket_server_side_encryption_configuration.this
module.log_archive.aws_s3_bucket_versioning.this
module.user_events.aws_dynamodb_table.this
```

## 2. Salidas del Proyecto (Outputs)

Los siguientes valores confirman el aprovisionamiento exitoso y la conectividad entre el módulo raíz y los módulos hijos:

```console
dynamodb_table_name = "user-events-dev"
s3_bucket_name = "oyd-log-archive-pdds-26001460-dev"
```

## 3. Resumen de Implementación

### Módulo S3
- Implementa versionamiento.
- Cifrado AES256.
- Ciclo de vida de 60 días para logs.
- Denegación de tráfico no cifrado.

### Módulo DynamoDB
- Configurado en modo `PAY_PER_REQUEST`.
- Índice secundario global (GSI) para estados de orden.
- Cifrado habilitado.
- TTL en el atributo `expires_at`.

### Gestión de Variables
- No se utilizaron valores fijos (*hardcoded*) dentro de los recursos.
- Toda la configuración se inyecta mediante el archivo `terraform.tfvars` del *root module*.