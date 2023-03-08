#!/bin/bash

if [ $# -lt 1 ];
then
    echo "Error, faltan parametros"
    echo "Sintaxis: ./ejercicio2.sh <ruta_directorio>"
    exit
fi

chmod u+rwx,g+rx,g-w,o-rwx $1
cd $1

for directorio in $(ls -d */)
do
    echo "Modificando permisos de $directorio..."
    chmod u+rwx,g+rx,g-w,o-rwx $directorio
    cd $directorio

    echo "Entrando en directorio $directorio"
    echo "Modificando permisos de los scripts..."
    chmod u+x *.sh
    echo "Modificando permisos de ficheros claves..."
    chmod u+rwx,go-rwx *.key

    cd ..

done