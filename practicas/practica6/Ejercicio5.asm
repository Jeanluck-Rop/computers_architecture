# Ejercicio 5. #
# Programa que calcula el cociente y el residuo de una division sin utilizar la operacion div
#   y se imprime el cociente y el residuo antes de terminar la ejecucion.
# El cociente se guarda en el registro $v0 y el residuo en $v1.
.data
quotient: .asciiz "El cociente es: "
residue: .asciiz "El residuo es: "
error_div: .asciiz "[ERROR]: No se puede dividir entre 0.\n"
invalid_dd: .asciiz "[ERROR]: El dividendo debe ser positivo.\n"
invalid_ds: .asciiz "[ERROR]: El divisor debe ser positivo.\n"
end_line: .asciiz ".\n"
.text
.globl main

main: #eitqueta main
li $v0 5                     #leemos el primer numero ingresado por el usuario (dividendo)
syscall
add $t0 $v0 $zero            #cargar a t0 el primer numero ingresado
li $v0 5                     #leemos el segundo numero ingresado por el ususario (divisor)
syscall
add $t1 $v0 $zero            #cargar a t1 el segundo numero ingresado
beq $t1 $zero division_error #verificamos si el divisor es 0
li $t2 0                     #cargamos a t2 un contador para el cociente
add $t3 $t0 $zero            #cargamos el residuo inicial a t3
li $t4 0                     #cargamos a t4 una bandera para manejar el signo del cociente
blt $t0 $zero invalid_divid  #verificamos que el dividendo no sea negativo
blt $t1 $zero invalid_divis  #verificamos que el divisor no sea negativo
j loop

loop:
blt $t3 $t1 end_loop #verificamos si el residuo es menor que el divisor
sub $t3 $t3 $t1      #restamos el divisor del residuo
addi $t2 $t2 1       #incrementamos el cociente
j loop               #continuamos con la iteracion

end_loop:
add $v0 $t2 $zero #guardamos el cociente en $v0
add $v1 $t3 $zero #guardamos el residuo en $v1
li $v0 4          #imprimir la cadena
la $a0 quotient   #cargamos al registro a0 la direccion de memoria de quotient
syscall
li $v0 1          #imprimimos el resultado
add $a0 $t2 $zero #cargamos el resultado a a0
syscall
li $v0 4          #para imprimir el final de linea
la $a0 end_line   #imprimimos el final de la linea
syscall     
li $v0 4          #imprimir la cadena
la $a0 residue    #cargamos al registro a0 la direccion de memoria de residue
syscall
li $v0 1          #imprimimos el resultado
add $a0 $t3 $zero #cargamos el resultado a a0
syscall
li $v0 4          #para imprimir el final de linea
la $a0 end_line   #imprimimos el final de la linea
syscall          
j exit 

invalid_divid:
li $v0 4          #imprimir la cadena
la $a0 invalid_dd #cargamos al registro a0 la direccion de memoria de invalid_ds
syscall
j exit

invalid_divis:
li $v0 4          #imprimir la cadena
la $a0 invalid_ds #cargamos al registro a0 la direccion de memoria de invalid_ds
syscall
j exit

division_error:
li $v0 4         #imprimir la cadena
la $a0 error_div #cargamos al registro a0 la direccion de memoria de error_div
syscall
j exit
    
exit:
li $v0 10 #syscall para salir
syscall   #terminar el programa
