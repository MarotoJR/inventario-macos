# Inventario de macOS

Proyecto de aprendizaje de Bash aplicado al soporte IT.
Recoge información básica del equipo, genera un informe
y comprueba el espacio disponible del volumen de datos.

## Funciones

- Consulta la versión y compilación de macOS.
- Identifica la arquitectura y el chip.
- Convierte la memoria RAM de bytes a GiB.
- Muestra el almacenamiento del volumen de datos.
- Compara el espacio disponible con un umbral configurable.
- Muestra los resultados y los guarda en informe.txt.

## Requisitos

macOS con Bash y las herramientas incluidas en el sistema.
No necesita permisos de administrador.

## Uso

Desde la carpeta del proyecto:

```bash
bash inventario.sh
```

El umbral predeterminado es de 10 GiB. Para utilizar otro:

```bash
UMBRAL_GIB=20 bash inventario.sh
```

En esta versión, utiliza un número entero positivo.

## Informe

El archivo informe.txt se genera en la carpeta desde la que
se ejecuta el script. Cada ejecución sustituye el informe anterior.

AVISO significa que el espacio disponible está por debajo
del umbral elegido. OK significa que cumple ese umbral.
No es una evaluación completa del estado del equipo.

## Entorno probado

Mac con chip Apple M1, 8 GiB de RAM y macOS 26.5.1.
Ejecución comprobada manualmente durante el desarrollo.

## Limitaciones

- Diseñado para macOS y el volumen /System/Volumes/Data.
- No incluye todavía validación del umbral introducido.
- No incluye monitorización continua ni notificaciones.
- Las cifras de almacenamiento APFS deben interpretarse
  teniendo en cuenta sus volúmenes y espacio compartido.

## Aprendizajes

Variables, sustitución de comandos, tuberías, awk,
condicionales y generación de informes con tee.

Desarrollado como práctica guiada con ayuda de ChatGPT.
Código ejecutado e interpretado durante el aprendizaje.

## Autor

Javier Rodríguez Cózar
