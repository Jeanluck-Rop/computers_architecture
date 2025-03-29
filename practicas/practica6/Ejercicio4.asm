# Ejercicio 4. #
# Programa que funciona como una calculadora. 
# Dados dos numeros tomados por la llamada a sistema 5, read int,
#   realiza una suma, resta, multiplicacion y division, e imprime el resultado.
.data
addit: .asciiz "La suma es: "           #cadena para indicar el resultado de la suma
subtr: .asciiz "La resta es: "          #cadena para indicar el resultado de la resta
multi: .asciiz "La multiplicacion es: " #cadena para indicar el resultado del producto
divis: .asciiz "La division es: "       #cadena para indicar el resultado de la division
error_div: .asciiz "[ERROR]: No se puede dividir entre 0.\n" #cadena que indica no es posible dividir entre cero
end_line: .asciiz ".\n" #indicar final de la linea
.text
.globl main #lo primero a ejecutar es el main

main: #eitqueta main
li $v0 5                     #leemos el primer numero ingresado por el usuario
syscall
add $t0 $v0 $zero            #cargar a t0 el primer numero ingresado
li $v0 5                     #leemos el segundo numero ingresado por el ususario
syscall
add $t1 $v0 $zero            #cargar a t1 el segundo numero ingresado
add $t3 $t0 $t1              #sumamos los dos numeros
jal addition                 #guardamos la dirección de retorno en $ra
sub $t3 $t0 $t1              #restamos los dos numeros
jal subtraction              #guardamos la dirección de retorno en $ra
mul $t3 $t0 $t1              #multiplicamos los dos numeros
jal product                  #guardamos la dirección de retorno en $ra
beq $t1 $zero division_error #verificamos si el divisor es 0
div $t0 $t1                  #dividimos los dos numeros
mflo $t3                     #obtenemos el cociente
jal division                 #guardamos la dirección de retorno en $ra
j exit

addition:         #funcion para realizar e imprimir la suma
li $v0 4          #imprimir la cadena
la $a0 addit      #cargamos al registro a0 la direccion de memoria de addit
syscall
li $v0 1          #imprimimos el resultado de la suma
add $a0 $t3 $zero #cargamos el resultado a a0
syscall
li $v0 4          #para imprimir el final de linea
la $a0 end_line   #imprimimos el final de la linea
syscall         
jr $ra            #volvemos al punto donde se llamamos a la funcion addition

subtraction:      #funcion para realizar e imprimir la resta
li $v0 4          #imprimir la cadena
la $a0 subtr      #cargamos al registro a0 la direccion de memoria de subtr
syscall
li $v0 1          #imprimimos el resultado de la resta
add $a0 $t3 $zero #cargamos el resultado a a0
syscall
li $v0 4          #para imprimir el final de linea
la $a0 end_line   #imprimimos el final de la linea
syscall
jr $ra            #volvemos al punto donde se llamamos a la funcion subtraction

product:          #funcion para realizar e imprimir el producto
li $v0 4          #imprimir la cadena
la $a0 multi      #cargamos al registro a0 la direccion de memoria de multi
syscall
li $v0 1          #imprimimos el resultado de la multiplicacion
add $a0 $t3 $zero #cargamos el resultado a a0
syscall
li $v0 4          #para imprimir el final de linea
la $a0 end_line   #imprimimos el final de la linea
syscall
jr $ra            #volvemos al punto donde se llamamos a la funcion product

division:         #funcion para realizar e imprimir la division
li $v0 4          #imprimir la cadena
la $a0 divis      #cargamos al registro a0 la direccion de memoria de divis
syscall
li $v0 1          #imprimimos el resultado de la division
add $a0 $t3 $zero #cargamos el resultado a a0
syscall
li $v0 4          #para imprimir el final de linea
la $a0 end_line   #imprimimos el final de la linea
syscall
jr $ra            #volvemos al punto donde se llamamos a la funcion division

division_error:
li $v0 4         #imprimir la cadena
la $a0 error_div #cargamos al registro a0 la direccion de memoria de error_div
syscall
j exit
    
exit:
li $v0 10 #syscall para salir
syscall   #terminar el programa
