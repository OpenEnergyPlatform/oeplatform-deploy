FROM postgres:9.6

RUN apt-get update && \
	apt-get install -y postgresql-contrib-9.6 \
	postgresql-9.6-postgis-2.3 \
    postgresql-plpython3-9.6 postgresql-plpython-9.6 \
    && rm -rf /var/lib/apt/lists/*

COPY * /

COPY init.sh /docker-entrypoint-initdb.d/init.sh

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres