#!/bin/bash

HOST=$1
PORT=$2
shift 2
CMD="$@"

echo "Aguardando $HOST:$PORT estar disponível..."

while ! nc -z "$HOST" "$PORT"; do
  sleep 1
done

echo "$HOST:$PORT está disponível. Executando o comando: $CMD"
exec $CMD