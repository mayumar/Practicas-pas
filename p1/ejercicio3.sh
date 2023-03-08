#!/bin/bash

if [ $# -lt 2 ];
then
    echo "Error, faltan parametros"
    echo "Sintaxis: ./ejercicio3.sh <ruta_dir_copiar> <ruta_dir_almacenar>"
    exit
fi

dir_salida=$2
dir_entrada=$1

if !([ -d $dir_salida ]);
then
    mkdir $dir_salida
fi
cd $dir_salida

dir_entrada=`basename $dir_entrada`
dir_salida=`basename $dir_salida`

fecha=`date +%s`

copia=($dir_entrada"_"$USER"_"$fecha".tar.gz")

tar -cvzf $copia "../"$dir_entrada
echo "Copia realizada en $dir_salida/$copia"

for comprimido in $(ls)
do
    fecha=`date +%s`
    tiempo=`stat -c %W $comprimido`
    let resta=($fecha-$tiempo)
    if [ $resta -gt 200 ];
    then
        echo "Borrando $comprimido..."
        rm $comprimido
    fi
done