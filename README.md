# Infraestructura Como Estas

- [Infraestructura Como Estas](#infraestructura-como-estas)
  - [Pre-requisitos](#pre-requisitos)
    - [Instalación Terraform](#instalación-terraform)
    - [Instalación Terragrunt](#instalación-terragrunt)
    - [Instalación Terraform Lint](#instalación-terraform-lint)
  - [Getting started](#getting-started)
  - [Estructura del proyecto](#estructura-del-proyecto)

## Pre-requisitos

Antes de comenzar a utilizar los scripts de **Terragrunt** de este repositorio, es necesario contar con el siguiente software instalado en su equipo.

- Visual Studio Code: [Documentación oficial](https://code.visualstudio.com/Download)
- Extensión Terraform: [Instrucciones instalación](https://marketplace.visualstudio.com/items?itemName=mauve.terraform)
- Credenciales AWS CLI: [Documentación oficial](https://learn.hashicorp.com/terraform/getting-started/install.html)
- Terraform versión 0.12: [Instalación Terraform](#instalaci%c3%b3n-terraform)
- Terraform Lint versión 0.15: [Instalación Terraform Lint](#instalaci%c3%b3n-terraform-lint)
- Terragrunt versión 0.23: [Instalación Terragrunt](#instalaci%c3%b3n-terragrunt)

> Para todos lo binarios de terraform se recomienda usar las versiones indicadas. Todo lo relacionado con **Visual Studio Code** es opcional, pero es recomendado su uso.

### Instalación Terraform

Primero debe descargar el binario de **Terraform** en el siguiente [enlace](https://releases.hashicorp.com/terraform/0.12.24/). 

> Recuerde descargar el binario correspondiente al sistema operativo que utiliza

Dependiendo del sistema operativo deberá descomprimir el archivo para obtener el binario. En el caso de linux, para usar Terraform basta con mover el binario al directorio `/usr/bin`. En otros sistemas operativos, deberá mover el binario al directorio que más le acomode y agregar su ruta en la variable de ambiente PATH.

```shell
sudo mv terraform /usr/bin
sudo chmod +x /usr/bin/terraform
```

Para validar la instalación ejecute el siguiente comando:

```shell
terraform -v
Terraform v0.12.24
```

### Instalación Terragrunt

Primero debe descargar el binario de **Terragrunt** en el siguiente [enlace](https://github.com/gruntwork-io/terragrunt/releases/download/v0.23.2).

> Recuerde descargar el binario correspondiente al sistema operativo que utiliza

En el caso de linux, para usar Terragrunt basta con mover el binario al directorio `/usr/bin`. En otros sistemas operativos, deberá mover el binario al directorio que más le acomode y agregar su ruta en la variable de ambiente PATH.

```shell
sudo mv terragrunt_linux_amd64 /usr/bin/terragrunt
sudo chmod +x /usr/bin/terragrunt
```

Para validar la instalación ejecute el siguiente comando:

```shell
terragrunt -v
terragrunt version v0.23.2
```

### Instalación Terraform Lint

Primero debe descargar el binario de **Terraform Lint** en el siguiente [enlace](https://github.com/terraform-linters/tflint/releases/tag/v0.15.3).

> Recuerde descargar el binario correspondiente al sistema operativo que utiliza

Dependiendo del sistema operativo deberá descomprimir el archivo para obtener el binario. En el caso de linux, para usar Terraform basta con mover el binario al directorio `/usr/bin`. En otros sistemas operativos, deberá mover el binario al directorio que más le acomode y agregar su ruta en la variable de ambiente PATH.

```shell
sudo mv tflint /usr/bin
sudo chmod +x /usr/bin/tflint
```

Para validar la instalación ejecute el siguiente comando:

```shell
tflint -v
TFLint version 0.15.3
```

## Getting started

Para probar los scripts de **Terragrunt**, usaremos el ambiente de stage. Para comenzar se deben crear las credenciales de AWS CLI indicando como profile el valor **x**.

```shell
aws configure --profile x
```

A continuación se solicitarán las credenciales, región y el formato de la salida de los comandos.

Ahora es momento de ejecutar terragrunt, para esto hay que acceder al directorio `stage` y ejecutar el comando `terragrunt apply-all -auto-approve`.

```
cd stage
terragrunt apply-all  -auto-approve
```

> En caso de que se presenten errores porque los recursos ya existen ejecute **CON PRECAUSION** el comando `terrgrunt destroy-all -auto-approve`

## Estructura del proyecto