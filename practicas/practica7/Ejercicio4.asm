# Ejercicio 4. #
# Programa que dados dos numeros de punto flotante ingresados por el usuario
#   calcula la division entera de ambos.
.data
start: .asciiz "Ingrese los dos numeros de punto flotante: \n" #cadena inicial que pide al usuario ingresar las variables
divis: .asciiz "La division entera es: "                       #cadena para indicar el resultado de la division
error_div: .asciiz "[ERROR]: No se puede dividir entre 0.0.\n" #cadena que indica no es posible dividir entre cero
end_line: .asciiz ".\n" #indicamos el final de la linea
ceroo: .double 0.0      #constante cero
.text
.globl main #lo primero a ejecutar es el main

main: #eitqueta main 
li $v0 4            #imprimir la cadena que pide ingresar los datos
la $a0 start        #cargamos al registro a0 la direccion de memoria de start
syscall
li $v0 6            #leemos el primer numero float ingresado por el usuario
syscall
mov.s $f1 $f0       #cargamos el primer numero float ingresado por el usuario a f1
li $v0 6            #leemos el segundo numero float ingresado por el ususario
syscall
mov.s $f2 $f0       #cargamos el segundo numero float ingresado por el usuario a f2
l.s $f3 ceroo
c.eq.s $f2 $f3      #verificamos si la variable a es 0
bc1t division_error #si a es cero terminamos el programa con un error
cvt.w.s $f1 $f1     #convertimos el primer numero de float a int forzando el redondeo
cvt.w.s $f2 $f2     #convertimos el segundo numero de float a int forzando el redondeo
mfc1 $t0 $f1        #movemos el primer numero convertido a un registro de enteros
mfc1 $t1 $f2        #movemos el segundo numero convertido a un registro de enteros
div $t0 $t1         #dividimos los dos numeros
mflo $t3            #obtenemos el cociente
li $v0 4            #imprimir la cadena
la $a0 divis        #cargamos al registro a0 la direccion de memoria de divis
syscall
li $v0 1            #imprimimos el resultado de la division
add $a0 $t3 $zero   #cargamos el resultado a a0
syscall
li $v0 4            #para imprimir el final de linea
la $a0 end_line     #imprimimos el final de la linea
syscall
j exit

division_error:
li $v0 4         #imprimir la cadena
la $a0 error_div #cargamos al registro a0 la direccion de memoria de error_div
syscall

exit:
li $v0 10 #syscall para salir
syscall   #terminar el programa 
