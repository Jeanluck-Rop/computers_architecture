# Ejercicio 3.
# Programa que imprime la cadena shell, el cual simula la ejecucion de un comando shell malicioso.
.data
shell: .asciiz "Corriendo codigo mailicioso en Shell jejeje."
.text
.globl main
main:
 
       j codigo 

tesoro:
       li $v0 10#Terminamos el programa
       syscall
       li $v0, 4#Cargamos la string Shell
       la $a0, shell #Direccion de la String Shell
       syscall #Imprime el Shell. Si lo logramos imprimir, gananmos.
       li $v0 10#Terminamos el programa
       syscall
       
codigo:
jal hack #usamos jal para llamar a la funcion con la que ajustamos $ra
jr $ra   #usamos jr para saltar a tesoro + 8 bytes, las dos instrucciones innecesarias

hack:
la $ra tesoro  #cargamos la direccion de tesoro
addi $ra $ra 8 #saltamos las 2 instrucciones innecesarias
jr $ra         #regresamos tesoro + 8

#O simplemente podemos definir la etiqueta codigo de la forma:
#codigo:
# la $ra tesoro  #cargamos la direccion de tesoro
# addi $ra $ra 8 #saltamos las 2 instrucciones innecesarias
# jr $ra         #regresamos tesoro + 8
#Omitiendo la instruccion 'jal', sin embargo cualquiera con de las dos formas 
# cumplimos lo necesario para el Ejercicio 3.
 