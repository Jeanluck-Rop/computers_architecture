# Ejercicio 5. #
# Programa que calcula e imprime la Fuerza Gravitacional entre la Luna y la Tierra.
.data
msg: .asciiz "La Fuerza Gravitacional entre la Luna y la Tierra es de: " #cadena para indicar el resultado de la Fuerza Gravitacional
earth_mass: .double 5.9722e24 #masa de la Tierra en vez de escribir 5972200000000000000000000.0, usamos Xe24
moon_mass: .double 7.349e22   #masa de la Luna en vez de escribir 73490000000000000000000.0, usamos Xe22
distance: .double 384400.0    #distancia entre la Tierra y la Luna 
grav: .double 6.674e-11       #constante gravitacional en vez de escribir 0.00000000006674, usamos Xe-11
.text
.globl main #lo primero a ejecutar es el main

main: #eitqueta main
l.d $f2 grav       #asignamos el valor de G a f2
l.d $f4 earth_mass #asignamos el valor de m1 a f4\
l.d $f6 moon_mass  #asignamos el valor de m2 a f6
l.d $f8 distance   #asignamos el valor de r a f8
mul.d $f8 $f8 $f8  #f8 = r * r
mul.d $f4 $f4 $f6  #f4 = m1 * m2
mul.d $f2 $f2 $f4  #f2 = G * m1 * m2
div.d $f12 $f2 $f8 #f12 = (G * m1 * m2) / r^2
li $v0 4           #imprimir la cadena
la $a0 msg         #cargamos al registro a0 la direccion de memoria de msg
syscall
li $v0 3           #imprimimos el resultado
syscall
li $v0 10          #syscall para salir
syscall            #terminar el programa 
