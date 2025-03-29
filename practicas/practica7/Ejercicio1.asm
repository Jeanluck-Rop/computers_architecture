# Ejercicio 1. #
# Programa que calcula la serie de Leibniz.
.data
start: .asciiz "Ingrese un valor para m: " #cadena inicial que pide al usuario ingresar la variable m
str: .asciiz "Resultado de la serie: "     #cadena que indica el resultado de la serie
cero: .float 0.0   #constante 0.0 para iniciar el contador n
one: .float 1.0    #constante 1.0 para realizar la suma en 2n + 1 y aumentar el contador n
n_one: .float -1.0 #constante -1.0 para alternar la division de 1 a -1
two: .float 2.0    #constante 2.0 para multiplicar 2 * n
four: .float 4.0   #constante 4.0 para multiplicar la suma final por 4
.text
.globl main #lo primero a ejecutar es el main

main: #eitqueta main 
li $v0 4          #imprimir la cadena que pide ingresar los datos
la $a0 start      #cargamos al registro a0 la direccion de memoria de start
syscall
li $v0 5          #leemos el numero m ingresado por el usuario
syscall
add $t0 $v0 $zero #creamos un contador con el numero ingresado
blez $t0 exit     #si el numero es menor o igual a 0, salimos del programa
l.s $f1 n_one     #asignamos la constante 1 a f1
l.s $f2 two       #asignamos la constante 2 a f2
l.s $f4 four      #asignamos la constante 2 a f4
l.s $f3 cero      #contador n
l.s $f5 one       #constante 1 para sumar a 2n, 2 * n + 1
l.s $f12 cero     #acumulador para el resultado
 
loop:
beq $t0 $zero print_result #si m llega a 0 salimos del loop e imprimimos el programa
sub.s $f1 $f0 $f1          #alternamos el valor de 1 a -1 y viceversa
mul.s $f6 $f2 $f3          #multiplicamos 2 * n
add.s $f7 $f6 $f5          #sumamos 2 * n + 1
div.s $f14 $f1 $f7         #dividimos ya sea -1 y 1 con lo obtenido en f7 
add.s $f12 $f12 $f14       #sumamos lo obtenido con los resultados previos
sub $t0 $t0 1              #decrementamos el iteraodr m
add.s $f3 $f3 $f5          #aumentamos el contador n
j loop                     #continuamos con la iteracion

print_result:
mul.s $f12 $f12 $f4 #multiplicamos el resultado del loop r * 4
li $v0 4            #imprimir la cadena
la $a0 str          #cargamos al registro a0 la direccion de memoria de str
syscall
li $v0 2            #imprimimos el resultado de la serie
syscall

exit:
li $v0 10 #syscall para salir
syscall   #terminar el programa
