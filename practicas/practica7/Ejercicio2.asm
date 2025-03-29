# Ejercicio 2. #
# Programa que calcula el promedio de cinco numeros flotantes recibidos.
.data
start: .asciiz "Ingrese los cinco numeros de tipo flotante a promediar: \n" #cadena inicial que pide al usuario ingresar las variables
prom: .asciiz "Tu promedio es: " #cadena para indicar el promedio de los numeros ingresados
five: .float 5.0                 #constante para la division
.text
.globl main #lo primero a ejecutar es el main

main: #eitqueta main
li $v0 4            #imprimir la cadena que pide ingresar los datos
la $a0 start        #cargamos al registro a0 la direccion de memoria de start
syscall
li $v0 6            #leemos el primer numero float ingresado por el usuario
syscall
add.s $f12 $f0 $f12 #iniciamos la suma con el primer numero float ingresado y lo guardamos en f12
li $v0 6            #leemos el segundo numero float ingresado por el ususario
syscall
add.s $f12 $f12 $f0 #sumamos el segundo numero con la suma y lo guardamos en f12 
li $v0 6            #leemos el tercer numero float ingresado por el usuario
syscall
add.s $f12 $f12 $f0 #sumamos el tercer numero con la suma y lo guardamos en f12 
li $v0 6            #leemos el cuarto numero float ingresado por el ususario
syscall
add.s $f12 $f12 $f0 #sumamos el cuarto numero con la suma y lo guardamos en f12 
li $v0 6            #leemos el primer quinto float ingresado por el usuario
syscall
add.s $f12 $f12 $f0 #sumamos el quinto numero con la suma y lo guardamos en f12 
l.s $f1 five        #cargamos 5.0 a f1
div.s $f12 $f12 $f1 #realizamos la division para obtener el promedio 
li $v0 4            #imprimir la cadena
la $a0 prom         #cargamos al registro a0 la direccion de memoria de prom
syscall
li $v0 2            #imprimimos el resultado
syscall
li $v0 10           #syscall para salir
syscall             #terminar el programa
