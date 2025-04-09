        .data  
a:      .word 5
b:      .word 4
resultado: .asciiz "El resultado es: "
        .text
.globl main
main:   # Preambulo main
lw $a0 a #cargamos 'a' en $a0
lw $a1 b #cargamos 'b' en $a1
        # Invocacion de mist_1
jal mist_1
        # Retorno de mist_1
move $t2 $v0     #guardamos el resultado
li $v0 4
la $a0 resultado #imprimimos el resultado
syscall
move $a0 $t2     #movemos el resultado a a0 para imprimirlo
li $v0 1         #imprimimos el resultado
syscall
        # Conclusion main
j exit
        
# mist_1 recibe como argumentos $a0 y $a1
mist_1: # Preambulo mist_1
addi $sp $sp -12 #creamos 12 espacios en la pila, 3 espacios en realidad que es 12/4 = 3
sw $ra 0($sp)    #guardamos ra hasta abajo de la pila
sw $a0 4($sp)    #despues lo que tenga a0
sw $a1 8($sp)    #despues lo que tenga s0
        move    $s0 $a0
        move    $t0 $a1
        li      $t1 1
        
loop_1: beqz $s0 end_1
        # Invocacion de mist_0
        move    $a0 $t0         # Se pasa el argumento $a0
        move    $a1 $t1         # Se pasa el argumento $a1
jal mist_0 #llamamos a mist_0
        # Retorno de mist_0
        move    $t1 $v0
        subi    $s0 $s0 1
        j       loop_1
        
end_1: # Conclusion mist_1
       move     $v0 $t1         # Se retorna el resultado en $v0
#Restauramos los valores de la pila
lw $ra 0($sp)    
lw $a0 4($sp)    
lw $a1 8($sp)    
addi $sp $sp 12 #liberamos el espacio en la pila
jr $ra          #regresamos a donde invocamos mist_1
       
# mist_0 recibe como argumentos $a0 y $a1
mist_0: # Preambulo mist_0
addi $sp $sp -4 #creamos 4 espacios en la pila
sw $ra 0($sp)   #guardamos ra hasta abajo de la pila
        mult    $a0 $a1
        # Conclusion mist_0
        mflo    $v0             # Se retorna el resultado en $v0
lw $ra 0($sp)
addi $sp $sp 4 #liberamos el espacio reservado en la pila
jr $ra         #regresamos a donde invocamos mist_0

exit:
li $v0 10 #syscall para salir
syscall   #terminar el programa 
