FROM postgres:13-alpine

# Copia o script de inicialização para o diretório de inicialização do PostgreSQL
COPY init-db.sh /docker-entrypoint-initdb.d/

# Torna o script executável
RUN chmod +x /docker-entrypoint-initdb.d/init-db.sh && \
    mkdir -p /data  # Cria o diretório /data dentro do contêiner
