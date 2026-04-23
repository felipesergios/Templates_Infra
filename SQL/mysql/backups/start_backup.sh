#!/bin/bash
FechaLima=$(TZ='America/Fortaleza' date +%Y%m%d-%H%M%S)

echo "Iniciando dumps em $FechaLima"

mysqlsh --host=10.1.X.X \
  --port=6446 \
  --user=usuariobackup \
  --password='PASSWORD' \
  --js \
  --file=$PWD/commands.js \
  -- "${FechaLima}-5.7" "5.7"

echo "Dumps finalizados."
