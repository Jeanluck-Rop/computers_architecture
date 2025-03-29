# Ejercicio2. #
# Programa que dado un numero n, por la llamda a sistema 5, read_int, imprime n veces un mensaje cualquiera.
.data
str: .asciiz "Imprimiendo n veces un mensaje cualquiera.\n" # cadena como la variable a imprimir n veces 
.text
.globl main #lo primero a ejecutar es el main

main: #etiqueta main
li $v0 5          #leemos el numero ingresado por el usuario
syscall
add $t0 $v0 $zero #creamos un contador con el numero ingresado
blez $t0 exit     #si el numero es menor o igual a 0, salimos del programa

loop:
beq $t0 $zero exit #Si el contador es 0 salimos del loop y terminamos el programa
li $v0 4           #imprimir la cadena
la $a0 str         #cargamos al registro a0 la direccion de memoria de str
syscall
sub $t0 $t0 1      #decrementamos el contador
j loop             #continuamos con la iteracion

exit:
li $v0 10 #syscall para salir
syscall   #terminar el programa
