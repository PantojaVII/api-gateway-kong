#!/bin/sh
set -e

# Aguardando o PostgreSQL iniciar
until pg_isready -U "${POSTGRES_USER}"; do
  echo "Aguardando o PostgreSQL iniciar..."
  sleep 2
done

# Criar o banco de dados apenas se ele não existir
if psql -U "${POSTGRES_USER}" -lqt | cut -d \| -f 1 | grep -qw "${POSTGRES_DB}"; then
    echo "O banco de dados '${POSTGRES_DB}' já existe."
else
    echo "Criando banco de dados: ${POSTGRES_DB}..."
    psql -U "${POSTGRES_USER}" -c "CREATE DATABASE ${POSTGRES_DB};"
fi
