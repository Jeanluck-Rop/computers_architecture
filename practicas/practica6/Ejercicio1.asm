# Ejercicio 1. #
# Programa que copia el contenido de un registro a otro sin usar la memoria ni la instruccion move.
.data
.text
.globl main # lo primero a ejecutar es el main

main: #etiqueta main 
add $v0 $a0 $zero #$v0 = $a0 + 0, es decir copiar $t0 en $t1 sin usar move ni memoria
li $v0 10         #syscall para salir
syscall           #terminar el programa
