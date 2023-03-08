#!/bin/bash

read -p "Introduzca un numero (1 <= x < 10): " num

if [ $num -lt 1 ] || [ $num -ge 10 ];
then
    echo "Fuera del rango!"
#elif [ $num -ge 10 ];
#then
#    echo "Fuera del rango!"
else
    echo "El numero $num es correcto!"
fi