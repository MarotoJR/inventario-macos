#!/bin/bash
set -euo pipefail

ram_bytes=$(sysctl -n hw.memsize)
ram_gib=$(awk -v bytes="$ram_bytes" \
  'BEGIN { printf "%.0f", bytes / 1073741824 }')

{
  echo "INVENTARIO DEL EQUIPO — macOS"
  echo "============================"
  echo "Fecha: $(date '+%Y-%m-%d %H:%M:%S %z')"
  echo
  echo "SISTEMA"
  echo "Versión: $(sw_vers -productVersion)"
  echo "Compilación: $(sw_vers -buildVersion)"
  echo "Arquitectura: $(uname -m)"
  echo
  echo "HARDWARE"
  echo "Chip: $(sysctl -n machdep.cpu.brand_string)"
  echo "RAM: $ram_gib GiB"
  echo
  echo "ALMACENAMIENTO — VOLUMEN DE DATOS"
  df -h /System/Volumes/Data
} | tee informe.txt

libre_kib=$(LC_ALL=C df -Pk /System/Volumes/Data |
  awk 'NR == 2 { print $4 }')

umbral_kib=$(( ${UMBRAL_GIB:-10} * 1024 * 1024 ))

libre_gib=$(awk -v kib="$libre_kib" \
  'BEGIN { printf "%.1f", kib / 1048576 }')

{
  echo
  echo "COMPROBACIÓN DE ESPACIO"

  if [ "$libre_kib" -lt "$umbral_kib" ]; then
    echo "AVISO: quedan $libre_gib GiB disponibles."
    echo "El espacio está por debajo del umbral de ${UMBRAL_GIB:-10} GiB."
    echo "Recomendación: revisar el almacenamiento."
  else
    echo "OK: hay $libre_gib GiB disponibles."
    echo "El espacio cumple el umbral de ${UMBRAL_GIB:-10} GiB."
  fi
} | tee -a informe.txt
