#!/bin/bash

if [ $# -lt 2 ];
then
    echo "Error, faltan parametros"
    echo "Sintaxis: ./ejercicio4.sh <ruta_directorio> <extension_fichero>"
    exit
fi
directorio=$1
extension=$2
contador=0

if !([ -d $directorio ]);
then
    echo "$directorio no es un directorio"
    exit
fi

read -t5 -p "Que caracter quieres contar? " respuesta

if [ -z $respuesta ];
then
    echo "Tiempo de espera agotado, se quedara caracter por defecto: a"
    respuesta="a"
fi

cd $directorio

for fich in $(find . -type f -name "*.$extension")
do
    name=`basename $fich`

    echo "$name" > nomfich
    cont=`grep -o $respuesta nomfich | wc -l`

    name="\t$name\t\t${#name}\t\t$cont"
    echo -e "$name" >> salida
done

echo -e "\nFicheros: \n"
nl salida
rm salida
rm nomfich