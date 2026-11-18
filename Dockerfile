FROM postgis/postgis:18-3.6

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    postgresql-server-dev-18 \
    pgxnclient \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN pgxn install h3

COPY --chmod=755 docker/postgres-entrypoint.sh /usr/local/bin/geobeacon-postgres-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/geobeacon-postgres-entrypoint.sh"]

CMD ["postgres"]
