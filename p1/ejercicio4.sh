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
    for token in $name
    do
        if [ $token == $respuesta ];
        then
            let contador=$contador+1
        fi
    done
    name="\t$name\t\t${#name}\t\t$contador"
    echo -e "$name" >> f1
done

echo -e "\nFicheros: \n"
nl f1
rm f1