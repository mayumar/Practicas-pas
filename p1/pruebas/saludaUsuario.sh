#!/bin/bash

read -p "Introduzca su nombre de usuario: " name

if [ $name == $USER ];
then
    echo "Bienvenido/a $name"
else
    echo "Eso es mentira"
fi