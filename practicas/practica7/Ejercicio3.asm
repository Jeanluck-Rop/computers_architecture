# Ejercicio 3. #
# Programa que dados tres numeros de precision doble ingresados por el usuario
#   calcula la Formula General Cuadratica (Chicharronera) e imprime el resultado.
# Si la ecuacion no tiene se respuesta imprimir un mensaje de error.
.data
start: .asciiz "Ingrese las variables a, b, c: \n" #cadena inicial que pide al usuario ingresar las variables
x1: .asciiz "Primer resultado: x1 = "              #cadena para indicar el promedio de los numeros ingresados
x2: .asciiz "Segundo resultado: x2 = "             #cadena para indicar el promedio de los numeros ingresados
not_valid: .asciiz "[ERROR]: La ecuacion no tiene respuesta." #cadena que indica si se pudo resolver la ecuacion
error_div: .asciiz "[ERROR]: No se puede dividir entre 0."    #cadena que indica no es posible dividir entre cero
end_line: .asciiz ".\n" #indicamos el final de la linea
ceroo: .double 0.0 #constante cero
two: .double 2.0   #constante para 2(a)
four: .double 4.0  #constante para 4(a)(c)
.text
.globl main #lo primero a ejecutar es el main

main: #eitqueta main
li $v0 4            #imprimir la cadena que pide ingresar los datos
la $a0 start        #cargamos al registro a0 la direccion de memoria de start
syscall
li $v0 7            #leemos el primer numero float ingresado por el usuario
syscall
mov.d $f6 $f0       #cargamos el primer numero float ingresado por el usuario a f0
li $v0 7            #leemos el segundo numero float ingresado por el ususario
syscall
mov.d $f8 $f0       #cargamos el segundo numero float ingresado por el usuario a f1
li $v0 7            #leemos el tercer numero float ingresado por el usuario
syscall
mov.d $f10 $f0      #cargamos el tercer numero float ingresado por el usuario a f1
l.d $f30 ceroo
c.eq.d $f6 $f30     #verificamos si la variable a es 0
bc1t division_error #si a es cero terminamos el programa con un error

chicharronera:
l.d $f2 two
l.d $f4 four
mul.d $f16 $f8 $f8   #f16 = b * b
mul.d $f14 $f6 $f10  #f14 = a * c 
mul.d $f14 $f4 $f14  #f14 = 4 * a * c
sub.d $f18 $f16 $f14 #f18 = b^2 - 4ac
c.lt.d $f18 $f30     #verificamos que lo que esta dentro de la raiz no sea negativo
bc1t invalid_root    #si el resultado es negativo terminamos el programa con un error
sqrt.d $f18 $f18     #si lo que esta dentro de la raiz es positivo continuamos obteniendo su raiz
neg.d $f20 $f8       #f20 = -b
mul.d $f22 $f2 $f6   #f22 = 2 * a
add.d $f24 $f20 $f18 #obtenemos x1 de la forma -b + f18 que es la raiz obtenida
div.d $f12 $f24 $f22 #realizamos la division para obtener x1
li $v0 4             #imprimir la cadena
la $a0 x1            #cargamos al registro a0 la direccion de memoria de x1
syscall
li $v0 3             #imprimimos el resultado
syscall
li $v0 4             #para imprimir el final de linea
la $a0 end_line      #imprimimos el final de la linea
syscall
sub.d $f24 $f20 $f18 #obtenemos x2 de la forma -b - f8 que es la raiz obtenida
div.d $f12 $f24 $f22 #realizamos la division para obtener x2
li $v0 4             #imprimir la cadena
la $a0 x2            #cargamos al registro a0 la direccion de memoria de x2
syscall
li $v0 3             #imprimimos el resultado
syscall
li $v0 4             #para imprimir el final de linea
la $a0 end_line      #imprimimos el final de la linea
syscall
j exit

division_error:
li $v0 4         #imprimir la cadena
la $a0 error_div #cargamos al registro a0 la direccion de memoria de error_div
syscall
j exit

invalid_root:
li $v0 4         #imprimir la cadena
la $a0 not_valid #cargamos al registro a0 la direccion de memoria de not_valid
syscall
j exit

exit:
li $v0 10 #syscall para salir
syscall   #terminar el programa 
