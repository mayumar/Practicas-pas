#!/bin/bash

read -p "Introduzca un primer numero: " A
read -p "Introduzca un segundo numero: " B

let X=$A+$B
echo "Suma: " $[ $A+$B ]

let X=$A-$B
echo "Resta: " $X

let X=$A*$B
echo "Multiplicacion: " $X

let X=$A/$B
echo "Division: " $X

let X=$A%$B
echo "Modulo: " $X