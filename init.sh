#!/bin/bash

echo "Creating Databases..."

createdb django
createdb dataedit

echo "Inserting Data..."

for fileName in *.dump; do
	psql -d dataedit < $fileName 
done

