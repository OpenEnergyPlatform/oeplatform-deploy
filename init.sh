#!/bin/bash

echo "Creating Databases..."

createdb oep_django
createdb oedb

psql -U postgres -d oedb -c "create extension postgis;"
psql -U postgres -d oedb -c "create extension postgis_topology;"
psql -U postgres -d oedb -c "create extension hstore;"