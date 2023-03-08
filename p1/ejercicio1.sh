#!/bin/bash

randomName(){
    TAM=$[$[$RANDOM%$[$2-$1+1]]+$1]
    echo `tr -dc A-Za-z0-9 < /dev/urandom | head -c $TAM`
}

if [ $# -lt 4 ];
then
    echo "Error, faltan parametros"
    echo "Sintaxis: ./ejercicio1.sh <ruta_nuevo_direcctorio> <n_subdirectorios> <long_max_nombre_fich> <long_min_nombre_fich>"
    exit
fi

DIRECTORIO=$1

if [ -d $DIRECTORIO ];
then
    read -t5 -p "El directorio $DIRECTORIO ya existe. Deseas eliminarlo? [y/n] " respuesta
    if [ -z $respuesta ];
    then
        echo -e "\nTiempo de respuesta agotado. No se borra el directorio"
    elif [ $respuesta == "y" ];
    then
        rm -r $DIRECTORIO
        echo "Directorio $DIRECTORIO borrado con exito"
        mkdir $DIRECTORIO
    fi
else
    mkdir $DIRECTORIO
fi

cd $DIRECTORIO

SUB=$2
MAX=$3
MIN=$4

for i in $(seq $SUB)
do
    NAMEDIR=$(randomName $MAX $MIN)
    mkdir $NAMEDIR

    cd $NAMEDIR

    touch $(randomName $MAX $MIN).sh
    touch $(randomName $MAX $MIN).html
    touch $(randomName $MAX $MIN).key
    touch $(randomName $MAX $MIN).txt

    cd ..

done