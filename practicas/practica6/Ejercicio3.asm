# Ejercicio 3. #
# Programa que realiza la sustraccion de 2 numeros y la guarda en un registro temporal, despues:
# Si el resultado es positivo, imprime el resultado.
# Si el resultado es negativo, imprime un mensaje de error y limpia el espacio en memoria usado por el resultado.
.data
valid: .asciiz "El resultado es: " # cadena para indicar el resultado positivo
not_valid: .asciiz "[ERROR]: El resultado no es positivo, limpiando el espacio en memoria..."
.text
.globl main #lo primero a ejecutar es el main

main: #eitqueta main
li $v0 5               #leemos el primer numero ingresado por el usuario
syscall
add $t0 $v0 $zero      #cargar a t0 el primer numero ingresado
li $v0 5               #leemos el segundo numero ingresado por el ususario
syscall
add $t1 $v0 $zero      #cargar a t1 el segundo numero ingresado
sub $t3 $t0 $t1        #restamos los dos numeros
bge $t3 $zero positive #comprobamos que la resta sea mayor o igual a cero
li $v0 4               #imprimir la cadena
la $a0 not_valid       #en otro caso imprimimos el mensaje de error
syscall
li $t3 0               #limpiamos el espacio en memoria usado por el resultao
j exit

positive:
li $v0 4            #imprimir la cadena
la $a0 valid        #cargamos al registro a0 la direccion de memoria de valid
syscall
li $v0 1            #imprimimos el resultado
add $a0 $t3 $zero   #cargamos el resultado a a0
syscall

exit:
li $v0 10 #syscall para salir
syscall   #terminar el programa

