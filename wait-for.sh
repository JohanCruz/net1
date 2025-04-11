#!/bin/sh

# Esperar a que MySQL est� listo
host="$1"
shift
cmd="$@"

until nc -z "$host" 3306; do
  echo "Esperando a que MySQL est� disponible en $host:3306..."
  sleep 1
done

exec $cmd