#!/bin/bash

if [ $# -lt 2 ];
then
    echo "Error, faltan parametros"
    echo "Sintaxis: ./ejercicio4.sh <ruta_directorio> <tam_bytes>"
    exit
fi

directorio=$1
tam=$2

cd $directorio

if !([ -d $directorio ]);
then
    echo "$directorio no es un directorio"
    exit
fi

