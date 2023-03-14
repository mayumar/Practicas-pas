#!/bin/bash

if [ $# -lt 2 ];
then
    echo "Error, faltan parametros"
    echo "Sintaxis: ./ejercicio4.sh <ruta_directorio> <tam_bytes>"
    exit
fi

directorio=$1
tam=$2

if !([ -d $directorio ]);
then
    echo "$directorio no es un directorio"
    exit
fi

if [ $tam -le 0 ];
then
    echo "El numero de bytes debe ser positivo"
    exit
fi

for fichero in $(find $directorio -size "+"$tam"c");
do
    if !([ -d $fichero ]);
    then
        let ejecutable=0
        if [ -x $fichero ];
        then
            let ejecutable=1
        fi
        echo -e "$(basename $fichero); $(stat --print=%w $fichero); $(stat --print=%s $fichero); $(stat --print=%A $fichero); $ejecutable" >> f1
    fi
done

sort -o f1 -t";" -k3nr -u f1

echo "Nombre, FechaModificacion, Tamano, Permisos, Ejecutable"
cat f1
rm f1