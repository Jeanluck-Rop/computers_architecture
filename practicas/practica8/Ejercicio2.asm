# Ejercicio 2. #
# Programa que utiliza una rutina que calcula recursivamente el coeficiente binomial de n en k
#    utilizando la identidad de Pascal, para todo k,n enteros positivos.
.data  
start: .asciiz "Ingrese los valores para n, k: \n"
resultado: .asciiz "El resultado del coeficiente binomial es: "
error: .asciiz "[ERROR]: Los valores ingresados deben ser positivos.\n"
.text
.globl main

main:
li $v0 4              #imprimir la cadena que pide ingresar los datos
la $a0 start          #cargamos al registro a0 la direccion de memoria de start
syscall
li $v0 5              #leemos el primer numero ingresado por el usuario
syscall
add $a0 $v0 $zero     #cargar a a0 el primer numero ingresado
li $v0 5              #leemos el segundo numero ingresado por el ususario
syscall
add $a1 $v0 $zero     #cargar a a1 el segundo numero ingresado
ble $a0 -1 invalid    #si n es menor a cero terminamos con un mensaje de error
ble $a1 $zero invalid #si k es menor a cero terminamos con un mensaje de error
jal Pascal
move $t0 $v0          #guardamos el resultado
li $v0 4
la $a0 resultado
syscall
move $a0 $t0          #movemos el resultado a a0 para imprimirlo
li $v0 1
syscall
j exit

Pascal:
#Preambulo
addi $sp $sp -16    #creamos 12 espacios en la pila, 4 espacios en realidad que es 16/4 = 4
sw $ra 0($sp)       #guardamos ra hasta abajo de la pila
sw $a0 4($sp)       #despues lo que tenga a0
sw $a1 8($sp)       #despues lo que tenga a1
sw $s0 12($sp)      #despues lo que tenga s0, es decir, el resultado de la primera llamada
bgt $a1 $a0 k_mayor #si k es mayor a n regresamos 0 como resultado
#Si k = 0 o k = n entonces regresamos 1
beq $a1 $zero caso_base
beq $a0 $a1 caso_base
#Primer llamada recursiva Pascal(n-1, k-1)
addi $a0 $a0 -1
addi $a1 $a1 -1
jal Pascal
move $s0 $v0 
#Segunda llamada recursiva Pascal(n-1, k)
#Restaurar los valores de la pila
lw $a1 8($sp)
lw $a0 4($sp)
addi $a0 $a0 -1
jal Pascal
add $v0 $v0 $s0      #sumamos los resultados
j Pascal_regreso
    
k_mayor:
li $v0 0
j Pascal_regreso

caso_base:
li $v0 1

Pascal_regreso:
lw $s0 12($sp)
lw $a1 8($sp)
lw $a0 4($sp)
lw $ra 0($sp)
addi $sp $sp 16
jr $ra

invalid:
li $v0 4     #imprimir la cadena
la $a0 error #cargamos al registro a0 la direccion de memoria de error
syscall
j exit

exit:
li $v0 10 #syscall para salir
syscall   #terminar el programa 

