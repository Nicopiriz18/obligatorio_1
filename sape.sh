#!/bin/bash
echo "Bienvenido!"
opcion=0
letra="a"
echo "" > usuarios.txt
function1(){
	echo "ingrese usuario"
	read usuario
	echo "ingrese contrasena"
	read contrasena
	echo "usuario:$usuario contrasena:$contrasena" >> usuarios.txt
	opcion=0
	function0
}
validacion(){
	echo "ingrese usuario"
	read usuario
	echo "ingrese contrasena"
	read contrasena
	linea=$(grep "^usuario:$usuario contrasena:$contrasena$" usuarios.txt)
	if [ -z "$linea" ]; then
		echo "ususario no encontrado"
	else
		echo "Bienvenido $usuario"
	fi
}
function2_1(){
	echo "ingrese usuario"
	read usuario
	echo "ingrese nueva contrasena"
	read contrasena
}
function2_2(){
	echo "ingrese letra"
	read letra
	function2
}
function2_3(){
	palabras=$(grep "^$letra" diccionario.txt)
	function2
}
function2_4(){
	num_palabras=$(echo $palabras | wc -w)
	echo $num_palabras
	function2
}
function2_5(){
	echo "Fecha y hora de conuslta es: $(date)" > palabras.txt
	echo "$palabras" >> palabras.txt
	function2
}
function2(){
	validacion
	echo "1) Cambiar Contrasena"
	echo "2) Escoger una letra."
	echo "3) Buscar palabras en el diccionario que finalicen con la letra escogida."
	echo "4) Contar las palabras de la Opcion 3."
	echo "5) Guardar las palabras en un archivo.txt, en conjunto con la fecha y hora de realizado el informe."
	echo "6) Volver al Men Principal."
	read opcion
	case $opcion in
		1)
			function2_1
			;;
		2)
			function2_2
			;;
		3)
			function2_3
			;;
		4)
			function2_4
			;;
		5)
			function2_5
			;;
		6)
			function0
			;;
		*)
			echo "opcion no valida"
		esac
}
function0(){
	while [[ $opcion -ne 1 && $opcion -ne 2 && $opcion -ne 3 ]];do
		echo "1)Opcion 1. ingresar usuario y contrasena"
		echo "2)Opcion 2. ingresar al sistema"
		echo "3)Opcion 3. Salir del Sistema"
		read opcion
		if [[ $opcion -ne 1 && $opcion -ne 2 && $opcion -ne 3 ]]; then
			echo "opcion no valida"
		fi
	done
	case $opcion in
		1)
			function1
			;;
		2)
			function2
			;;
		3)
			echo "saliendo del sistema"
			;;
	esac
}
function0

