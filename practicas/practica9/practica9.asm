#------------------------------------------------------------------------------------------------------------#
                                #---   Practica 9. Llamadas al sistema.   ---#                              
#------------------------------------------------------------------------------------------------------------#
.data
#---    Espacios a usar para la ejecucion del programa.   ---#
buffer:     .space 1024          #apartamos bytes de memoria como buffer para el input
command:    .space 64            #apartamos bytes de memoria para el comando en el input del usuario
args:       .space 256           #apartamos bytes de memoria para los argumentos del usuario
arg1:       .space 128           #apartamos bytes de memoria para el argumento 1 de dos
arg2:       .space 128           #apartamos bytes de memoria para el argumento 2 de dos
args_rev:   .space 256           #apartamos bytes de memoria para args_rev
cat_buffer: .space 2048          #apartamos bytes de memoria para imprimir el contenido de dos archivos
#---    Cadenas de bienvenida e indicamos que estamos en el prompt.   ---#
welcome: .asciiz "\n\n * Bienvenido a la terminal MIPS *\n"
start:   .asciiz " ** Introduce un comando: **\n"
prompt:  .asciiz "[Terminal MIPS]> "
#---    Cadenas de error.   ---#
invalid_command: .asciiz "[ERROR]: Comando invalido.\n"
invalid_args:    .asciiz "[ERROR]: Argumento(s) invalido(s).\n"
args_error:      .asciiz "[ERROR]: Hubo un error al leer los argumentos ingresados.\n"
many_args:       .asciiz "[ERROR]: Demasiados argumentos para el comando ingresado.\n"
few_args:        .asciiz "[ERROR]: Pocos argumentos para el comando ingresado.\n"
many_coins:      .asciiz "[ERROR]: El numero ingresado supero el limite de monedas lanzables.\n"
file_error:      .asciiz "[ERROR]: Hubo un problema al leer el archivo\n                     o la direccion de archivo es incorrecta.\n"
#---   Cadenas para comparar el tipo de comando ingresado.   ---#
help_id:       .asciiz "help"
mix_id:        .asciiz "mix"
coin_id:       .asciiz "coin"
song_id:       .asciiz "song"
rev_id:        .asciiz "rev"
cat_id:        .asciiz "cat"
count_id:      .asciiz "count"
play_id:       .asciiz "play"
palindrome_id: .asciiz "palindrome"
exit_id:       .asciiz "exit"
#---   Cadenas para imprimir la ayuda del comando solicitado.   ---#
help:                .asciiz "Comandos disponibles: | help | mix | coin | song | rev | cat | count | play | palindrome | exit |\n"
help_comm:           .asciiz "Comando: help.\n"
help_info:           .asciiz "Info: Imprime informacion de los comandos disponibles y sus opciones.\n" 
help_info2:          .asciiz "      Si se llama sin argumentos, imprime una lista de los comandos disponibles.\n"
help_sinopsis:       .asciiz "Sinopsis: help | help [arg] \n"
help_args:           .asciiz "Argumentos: arg - Imprime la descripcion y opciones del comando arg.\n"
mix_comm:            .asciiz "Comando: mix.\n"
mix_info:            .asciiz "Info: Muestra la recomendacion de una cancion.\n"
mix_sinopsis:        .asciiz "Sinopsis: mix \n"
mix_args:            .asciiz "Argumentos: Ninguno.\n"
coin_comm:           .asciiz "Comando: coin.\n"
coin_info:           .asciiz "Info: Dado un numero entero, lanza ese numero de monedas y muestra el resultado.\n"
coin_sinopsis:       .asciiz "Sinopsis: coin [int] \n"
coin_args:           .asciiz "Argumentos: int - Numero de monedas a lanzar.\n"
song_comm:           .asciiz "Comando: song.\n"
song_info:           .asciiz "Info: Genera una cancion corta.\n"
song_sinopsis:       .asciiz "Sinopsis: song \n"
song_args:           .asciiz "Argumentos: Ninguno.\n"
rev_comm:            .asciiz "Comando: rev.\n"
rev_info:            .asciiz "Info: Imprime la reversa de una cadena.\n"
rev_info2:           .asciiz "      Si no se especifica un archivo, se utiliza la entrada estandar (solo una linea).\n"
rev_sinopsis:        .asciiz "Sinopsis: rev [file] \n"
rev_args:            .asciiz "Argumentos: file - Archivo de texto a revertir.\n"
cat_comm:            .asciiz "Comando: cat.\n"
cat_info:            .asciiz "Info: Concatena 2 archivos y los muestra en pantalla.\n"
cat_sinopsis:        .asciiz "Sinopsis: cat [file] [file] \n"
cat_args:            .asciiz "Argumentos: file - Archivos a concatenar.\n"
count_comm:          .asciiz "Comando: count.\n"
count_info:          .asciiz "Info: Cuenta el numero de letras de un archivo.\n"
count_sinopsis:      .asciiz "Sinopsis: count [file] \n"
count_argp:          .asciiz "Argumentos: file - Archivo a contar.\n"
play_comm:           .asciiz "Comando: select.\n"
play_info:           .asciiz "Info: Reproduce alguna de las siguientes canciones:\n"
play_songs:          .asciiz "      | song1 | song2 | |\n"
play_sinopsis:       .asciiz "Sinopsis: play [arg] \n"
play_args:           .asciiz "Argumentos: arg - Nombre de la cancion que se desea escuchar \n"
palindrome_comm:     .asciiz "Comando: palindrome.\n"
palindrome_info:     .asciiz "Info: Verifica si una cadena ingresada es un palindromo.\n"
palindrome_sinopsis: .asciiz "Sinopsis: palindrome [arg] \n"
palindrome_args:     .asciiz "Argumentos: arg - Cadena a verificar si es un palindromo.\n"
exit_comm:           .asciiz "Comando: exit.\n"
exit_info:           .asciiz "Info: Terminamos la ejecucion del interprete de comandos.\n"
exit_sinopsis:       .asciiz "Sinopsis: exit \n"
exit_args:           .asciiz "Argumentos: Ninguno.\n"
file_dir:            .asciiz "NOTA: Especifique la ruta del archivo RELATIVA desde donde se encuentra\n"
file_dir2:           .asciiz "      el programa Mars.jar instalado.\n"
file_dir3:           .asciiz "      Ejemplo: sample/dir/file_to_process.txt\n"
file_dir4:           .asciiz "      donde el programa Mars esta instalado en el directorio padre de sample \n"
#---   Cadenas para los resultados del comando mix.   ---#
mix:   .asciiz "Terminal MIPS te recomienda la cancion:\n"
mix1:  .asciiz "Disco - Surf Curse\n"
mix2:  .asciiz "Sin Control - Candy\n"
mix3:  .asciiz "Something Stupid - Lola Marsh\n"
mix4:  .asciiz "Die With a Smile - Lady Gaga & Bruno Mars\n"
mix5:  .asciiz "You Give Love a Bad Name - Bon Jovi\n"
mix6:  .asciiz "Gangsta's Paradise - Coolio\n"
mix7:  .asciiz "Save Your Tears - The Weeknd\n"
mix8:  .asciiz "Me Voy - Julieta Venegas\n"
mix9:  .asciiz "Beggin' - Maneskin\n"
mix10: .asciiz "El Triste - Jose Jose\n"
mix11: .asciiz "Top of The World - Carpenters\n"
mix12: .asciiz "Golden Slumbers - The Beatles\n"
mix13: .asciiz "Holding Out for a Hero - Bonnie Tyle\n"
mix14: .asciiz "Si no te hubieras ido - Marco Antonio Solis\n"
mix15: .asciiz "Never Gonna Give You Up - Rick Astley\n"
#---   Cadenas para informar al usuairo de los resultados de cada comando.   ---#
coin:           .asciiz "° Moneda: "
cross:          .asciiz "cruz.\n"
face:           .asciiz "cara.\n"
rev_in:         .asciiz "Ingrese la cadena a revertir: "
rev_out:        .asciiz "Cadena invertida: "
rev_file_out:   .asciiz "Archivo invertido:\n"
cat_files:      .asciiz "Archivos concatenados:\n"
count_result:   .asciiz "Numero de caracteres del archivo: "
not_palindrome: .asciiz " No es un plaindromo: "
its_palindrome: .asciiz " Si es un plaindromo: "
#---   Cadenas y datos para manejar los comandos song y play.   ---#
#Cadenas para verificar cual cancion reproducir
song1: .asciiz "song1"
song2: .asciiz "song2"
song3: .asciiz "song3"
playing_song: .asciiz "\nReproduciendo cancion...\n\n"
#Notas musicales (octava 2), en Mars
mi2:    .word 40          #Mi2
sol2:   .word 43          #Sol2
la2:    .word 45          #La2
#Notas musicales (octava 3), en Mars
do3:    .word 48          #Do3
re3:    .word 50          #Re3
mi3:    .word 52          #Mi3
fa3:    .word 53          #Fa3
fa_s3:  .word 54          #Fa#3 / SolB3
sol3:   .word 55          #Sol3
sol_s3: .word 56          #Sol#3 / LaB3
la3:    .word 57          #La3
la_s3:  .word 58          #La#3 / SiB3
si3:    .word 59          #Si3
#Notas musicales (octava 4, central), en Mars
do:      .word 60         #Do
do_s:    .word 61         #Do# / ReB
re:      .word 62         #Re
re_s:    .word 63         #Re# / MiB
mi:      .word 64         #Mi
fa:      .word 65         #Fa
fa_s:    .word 66         #Fa# / SolB
sol:     .word 67         #Sol4
sol_s:   .word 68         #Sol# / LaB
la_note: .word 69         #La
la_s:    .word 70         #La# /SiB
si:      .word 71         #Si
#Notas musicales (octava 5), en Mars
do5:    .word 72          #Do5
do_s5:  .word 73          #Do#5 / ReB5
re5:    .word 74          #Re5
re_s5:  .word 75          #Re#5 / MiB5
mi5:    .word 76          #Mi5
fa5:    .word 77          #Fa5
sol5:   .word 79          #Sol5
la5:    .word 81          #La5
la_s5:  .word 82          #La#5 / SiB5
#Notas musicales (octava 6), en Mars
do6:    .word 84          #Do6
mi6:    .word 88          #Mi6
#Duraciones de las notas
redonda: .word 2000          #2 segundos
dot_neg: .word 750           #3/4 segundo
negra:   .word 500           #1/2 segundo
dot_cor: .word 290           #3/8 segundo
corchea: .word 250           #1/4 segundo
min_cor: .word 190           #2/10 segundo
#Silencios y Pausas
min_pause:   .word 195           #195 milisegundos
minex_pause: .word 210           #205 milisegundos
pause:       .word 255           #255 milisegundos
mid_pause:   .word 295           #380 milisegundos
midex_pause: .word 310           #380 milisegundos
dob_pause:   .word 505           #505 milisegundos
red_pause:   .word 1505          #1005 milisegunods
#---   Cadenas para manejar el cierre del programa.   ---#
exit_confirm: .asciiz "¿Estas seguro de salir del prompt?"
exit_msg: .asciiz "Saliendo del programa...\n"
new_line: .asciiz "\n"          #Cadena auxiliar
.text
.globl main
#------------------------------------------------------------------------------------------------------------#
  #---   Main del programa, simplemente damos la bienvenida al usuario y comenzamos el loop principal.  ---#
#------------------------------------------------------------------------------------------------------------#
main:
li $v0 4       #imprimir la cadena que indica que estamos en la terminal MIPS
la $a0 welcome #cargamos al registro a0 la direccion de memoria de terminal
syscall
li $v0 4       #imprimir la cadena que indica al usuario que ingrese un comando
la $a0 start   #cargamos al registro a0 la direccion de memoria de start
syscall
#------------------------------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------------------------------#
  #---   Loop principal del programa, imprimimos la cadena prompt y preparamos la lectura del input.   ---#
#------------------------------------------------------------------------------------------------------------#
main_loop:
li $v0 4                    #imprimimos la cadena que indica que estamos en el prompt
la $a0 prompt               #cargamos al registro a0 la direccion de memoria de prompt
syscall
li $v0 8                    #syscall para leer una cadena del input del usuario
la $a0 buffer               #apartamos en $a0 un buffer de bytes
li $a1 1025                 #longitud maxima del buffer
syscall
jal remove_newline          #removemos el salto de linea del input
la $t0 buffer               #apuntamos con $t0 al inicio del buffer
la $t1 command              #con $t1 vamos a guardar el comando
#------------------------------------------------------------
#------------------------------------------------------------
#---   Subrutinas para obtener el comando y argumentos ingresados.   ---#
#------------------------------------------------------------
#Obtenemos la primer cadena (el comando) caracter por caracter
get_command_loop:
lb $t2 0($t0)                         #cargamos el siguiente byte del buffer
beqz $t2 end_command_loop             #terminamos si llegamos al final de cadena
li $t3 32                             #espacio en ASCII
beq $t2 $t3 end_command_loop          #terminamos si encontramos un espacio
sb $t2 0($t1)                         #concatenamos el caracter con lo demas en el comando
addi $t0 $t0 1                        #avanzamos al siguiente caracter del buffer
addi $t1 $t1 1                        #avanzamos al siguiente byte de command
j get_command_loop
#Terminamos el loop, pues ya obtuvimos la primer cadena del usuario
end_command_loop:
li $t2 0                       #asignamos null para terminar
sb $t2 0($t1)                  #terminamos la cadena en command con '\0'
lb $t2 0($t0)                  #leemos el siguiente caracter del buffer
li $t3 32                      #espacio en ASCII
bne $t2 $t3 skip_args          #si no hay espacio, no hay argumentos
addi $t0 $t0 1                 #de otro modo, saltamos el espacio
la $t1 args                    #preparamos el apuntador para los argumentos
#Obtenemos los argumentos (si los hay) del resto del buffer
get_args_loop:
lb $t2 0($t0)                   #cargamos el siguiente byte del buffer  
beqz $t2 end_args_loop          #si hay null, terminamos         
sb $t2 0($t1)                   #concatenamos el caracter con lo demas en args
addi $t0 $t0 1                  #avanzamos al siguiente caracter del buffer
addi $t1 $t1 1                  #avanzamos al siguiente byte de args
j get_args_loop
#Terminamos el loop, pues ya obtuvimos los argumentos
end_args_loop:
li $t2 0                         #asignamos null para terminar
sb $t2 0($t1)                    #terminamos args con null
jal remove_newline_args          #eliminamos el salto de linea (si lo hay)
jal trim_spaces                  #eliminamos los espacios al inicio de los argumentos
j compare_commands               #continuamos con la comparacion del comando ingresado
#------------------------------------------------------------
#------------------------------------------------------------
#---   Subrutinas auxiliares para la lectura del buffer, limpiar command y args.   ---#
#------------------------------------------------------------
#Si no hay argumentos, aseguramos que args este vacio
skip_args:
li $t2 0               #cargamos null para terminar
la $t1 args            #cargamos el inicio de args a $t1
sb $t2 0($t1)          #guardamos null en el inicio de args
#Verificamos si el usuario ingreso solo un salto de linea o continuamos procesando el comando
compare_commands:
jal handle_new_line          #verificamos si el comando es '\n'
jal check_help               #si no fue una linea vacia, comenzamos el chequeo de comandos
#Manejamos el caso en el que el usuario dio enter, solo regresamos al principio del main loop
handle_new_line:
lb $t2 command              #cargamos el primer byte
beqz $t2 main_loop          #si es null, no hay comando y volvemos a main_loop
jr $ra                      #de otro modo continuamos con la ejecucion
#Eliminamos los espacios al inicio de args
trim_spaces:
la $t0 args          #cargamos la direccion de args
la $t1 args          #cargamos donde escribiremos args
li $t3 32            #espacio en ASCII
#Loop para quitar los espacios antes de args
trim_spaces_loop:
lb $t2 0($t0)                  #cargamos el byte actual
beqz $t2 end_trim              #si es null, terminamos
bne $t2 $t3 copy_args          #si no es espacio, empezamos a copiar
addi $t0 $t0 1                 #si es espacio, lo omitimos
j trim_spaces_loop
#Comienzamos a copiar los argumentos desde el primer caracter valido
copy_args:
sb $t2 0($t1)               #copiamos el caracter actual
addi $t0 $t0 1              #avanzamos en la lectura
addi $t1 $t1 1              #avanzamos en la escritura
lb $t2 0($t0)               #cargamos el siguiente byte
bnez $t2 copy_args          #continuamos hasta encontrar null
end_trim:
sb $zero 0($t1)          #terminamos la cadena con null
jr $ra                   #regresamos
#Eliminamos el salto de línea ('\n') al final de command
remove_newline:
la $t0 buffer          #apuntamos al inicio de command
#Iniciamos un loop en busca del salto de linea
remove_newline_loop:
lb $t1 0($t0)
beqz $t1 end_remove_newline   #si es null, llegamos al final
li $t2 10                     #ASCII de '\n'
beq $t1 $t2 replace_newline_comm #si encontramos '\n' lo reemplazamos por null
addi $t0 $t0 1                #avanzamos al siguiente byte
j remove_newline_loop
replace_newline_comm:
li $t1 0      #cargamos null
sb $t1 0($t0) #sobrescribimos '\n' con null
end_remove_newline:
jr $ra          #regresamos a compare_commands, donde estas subrutinas fueron llamadas
#Eliminamos el salto de línea ('\n') al final de args
remove_newline_args:
la $t0 args          #apuntamos al inicio de args
remove_newline_args_loop:
lb $t1 0($t0)                             #cargamos el byte actual
beqz $t1 end_remove_newline_args          #si es null, llegamos al final y terminamos
li $t2 10                                 #'\n' en ASCII
beq $t1 $t2 replace_newline_args          #si encontramos '\n' lo reemplazamos por null
addi $t0 $t0 1                            #avanzamos al siguiente byte
j remove_newline_args_loop
replace_newline_args:
li $t1 0               #cargamos null
sb $t1 0($t0)          #sobrescribimos '\n' con null
end_remove_newline_args:
jr $ra          #volvemos a la subrutina llamadora
#------------------------------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------------------------------#
       #---   Comparamos el comando ingresado y comenzamos con la respectiva ejecucion de codigo.   ---#     
#------------------------------------------------------------------------------------------------------------#
#Comparamos si el comando es help
check_help:
la $a0 command               #cargamos la cadena del usuario en $a0
la $a1 help_id               #cargamos help_id en $a1
jal strcmp                   #llamamos a strcmp con los valores (args, help_id)
beq $v0 1 case_help          #si son iguales nos movemos a case_help
j check_mix                  #si son diferentes continuamos al siguiente comando 
#Comparamos si el comando es mix
check_mix: 
la $a0 command              #cargamos la cadena del usuario en $a0
la $a1 mix_id               #cargamos mix_id en $a1
jal strcmp                  #llamamos a strcmp con los valores (args, mix_id)
beq $v0 1 case_mix          #si son iguales nos movemos a case_mix
j check_coin                #si son diferentes continuamos al siguiente comando
#Comparamos si el comando es coin
check_coin:
la $a0 command               #cargamos la cadena del usuario en $a0
la $a1 coin_id               #cargamos coin_id en $a1
jal strcmp                   #llamamos a strcmp con los valores (args, coin_id)
beq $v0 1 case_coin          #si son iguales nos movemos a case_coin
j check_song                 #si son diferentes continuamos al siguiente comando
#Comparamos si el comando es song
check_song:
la $a0 command               #cargamos la cadena del usuario en $a0 
la $a1 song_id               #cargamos song_id en $a1
jal strcmp                   #llamamos a strcmp con los valores (args, song_id)
beq $v0 1 case_song          #si son iguales nos movemos a case_song
j check_rev                  #si son diferentes continuamos al siguiente comando
#Comparamos si el comando es rev
check_rev:
la $a0 command              #cargamos la cadena del usuario en $a0 
la $a1 rev_id               #cargamos rev_id en $a1
jal strcmp                  #llamamos a strcmp con los valores (args, rev_id)
beq $v0 1 case_rev          #si son iguales nos movemos a case_rev
j check_cat                 #si son diferentes continuamos al siguiente comando
#Comparamos si el comando es cat
check_cat:
la $a0 command              #cargamos la cadena del usuario en $a0 
la $a1 cat_id               #cargamos cat_id en $a1 
jal strcmp                  #llamamos a strcmp con los valores (args, cat_id)
beq $v0 1 case_cat          #si son iguales nos movemos a check_count
j check_count               #si son diferentes continuamos al siguiente comando
#Comparamos si el comando es count
check_count:
la $a0 command                #cargamos la cadena del usuario en $a0 
la $a1 count_id               #cargamos count_id en $a1
jal strcmp                    #llamamos a strcmp con los valores (args, count_id)
beq $v0 1 case_count          #si son iguales nos movemos a case_exit
j check_play                 #si son diferentes continuamos al siguiente comando
#Comparamos si el comando es play
check_play:
la $a0 command               #cargamos la cadena del usuario en $a0 
la $a1 play_id               #cargamos select_id en $a1
jal strcmp                   #llamamos a strcmp con los valores (args, play_id)
beq $v0 1 case_play          #si son iguales nos movemos a case_play
j check_palindrome           #si son diferentes continuamos al siguiente comando
#Comparamos si el comando es palindrome
check_palindrome:
la $a0 command                     #cargamos la cadena del usuario en $a0 
la $a1 palindrome_id               #cargamos palindrome_id en $a1
jal strcmp                         #llamamos a strcmp con los valores (args, palindrome_id)
beq $v0 1 case_palindrome          #si son iguales nos movemos a case_palindrome
j check_exit                       #si son diferentes continuamos al siguiente comando
#Comparamos si el comando es exit
check_exit: 
la $a0 command                   #cargamos la cadena del usuario en $a0
la $a1 exit_id                   #cargamos exit_id en $a1
jal strcmp                       #llamamos a strcmp con los valores (args, exit_id)
beq $v0 1 case_exit              #si son iguales nos movemos a case_exit
j print_invalid_command          #como este es el ultimo input a comprobar, si son diferentes, este es invalido
#------------------------------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------------------------------#
                #---   Seccion del codigo donde manejamos cada comando de la practica.   ---#               
#------------------------------------------------------------------------------------------------------------#
                               #---   Manejamos el comando 'help'   ---#                    
#------------------------------------------------------------------------------------------------------------#
case_help:
jal count_args              #contamos los argumentos en args
beqz $v0 print_general_help #si no hay argumentos imprimimos la ayuda general
li $t0 1
bgt $v0 $t0 print_many_args #si hay mas de un argumento, error
j is_help                   #si es un argumento comenzamos la verificacion de cual es
#------------------------------------------------------------
#------------------------------------------------------------
#---   Subrutinas auxiliares para el comando que se solicito ayuda.   ---#
#------------------------------------------------------------
#Comparamos si el argumento es help
is_help:
la $a0 args                  #cargamos el argumento del usuario en $a0
la $a1 help_id               #cargamos help_id en $a1
jal strcmp                   #llamamos a strcmp con los valores (args, help_id)
beq $v0 1 print_help         #si son iguales imprimimos la cadena help_help
j is_mix                     #si son diferentes continuamos al siguiente argumento 
#Comparamos si el argumento es mix
is_mix:
la $a0 args                 #cargamos el argumento del usuario en $a0
la $a1 mix_id               #cargamos mix_id en $a1
jal strcmp                  #llamamos a strcmp con los valores (args, mix_id)
beq $v0 1 print_mix         #si son iguales imprimimos la cadena help_mix
j is_coin                   #si son diferentes continuamos al siguiente argumento
#Comparamos si el argumento es coin
is_coin:
la $a0 args                  #cargamos la cadena del usuario en $a0
la $a1 coin_id               #cargamos coin_id en $a1
jal strcmp                   #llamamos a strcmp con los valores (args, coin_id)
beq $v0 1 print_coin         #si son iguales imprimimos la cadena help_coin
j is_song                    #si son diferentes continuamos al siguiente argumento
#Comparamos si el argumento es song
is_song:
la $a0 args                  #cargamos la cadena del usuario en $a0 
la $a1 song_id               #cargamos song_id en $a1
jal strcmp                   #llamamos a strcmp con los valores (args, song_id)
beq $v0 1 print_song         #si son iguales imprimimos la cadena help_song
j is_rev                     #si son diferentes continuamos al siguiente argumento
#Comparamos si el argumento es rev
is_rev:
la $a0 args                 #cargamos la cadena del usuario en $a0 
la $a1 rev_id               #cargamos rev_id en $a1
jal strcmp                  #llamamos a strcmp con los valores (args, rev_id)
beq $v0 1 print_rev         #si son iguales imprimimos la cadena help_rev
j is_cat                    #si son diferentes continuamos al siguiente argumento

#Comparamos si el argumento es cat
is_cat:
la $a0 args                 #cargamos la cadena del usuario en $a0 
la $a1 cat_id               #cargamos cat_id en $a1 
jal strcmp                  #llamamos a strcmp con los valores (args, cat_id)
beq $v0 1 print_cat         #si son iguales imprimimos la cadena help_count
j is_count                  #si son diferentes continuamos al siguiente argumento
#Comparamos si el comando es count
is_count:
la $a0 args                   #cargamos la cadena del usuario en $a0 
la $a1 count_id               #cargamos count_id en $a1
jal strcmp                    #llamamos a strcmp con los valores (args, count_id)
beq $v0 1 print_count         #si son iguales imprimimos la cadena help_exit
j is_play                     #si son diferentes continuamos al siguiente argumento
#Comparamos si el argumento es play
is_play:
la $a0 args                   #cargamos la cadena del usuario en $a0 
la $a1 play_id                #cargamos play_id en $a1
jal strcmp                    #llamamos a strcmp con los valores (args, play_id)
beq $v0 1 print_play          #si son iguales imprimimos la cadena help_play
j is_palindrome               #si son diferentes continuamos al siguiente argumento
#Comparamos si el argumento es palindrome
is_palindrome:
la $a0 args                        #cargamos la cadena del usuario en $a0 
la $a1 palindrome_id               #cargamos palindrome_id en $a1
jal strcmp                         #llamamos a strcmp con los valores (args, palindrome_id)
beq $v0 1 print_palindrome         #si son iguales imprimimos la cadena help_palindrome
j is_exit                          #si son diferentes continuamos al siguiente argumento
#Comparamos si el argumento es exit
is_exit: 
la $a0 args                  #cargamos la cadena del usuario en $a0
la $a1 exit_id               #cargamos exit_id en $a1
jal strcmp                   #llamamos a strcmp con los valores (args, exit_id)
beq $v0 1 print_exit         #si son iguales imprimimos la cadena help_exit
j print_invalid_args         #como este es el ultimo input a comprobar, si son diferentes, este es invalido
#------------------------------------------------------------
#------------------------------------------------------------
#---   Subrtuinas para imprimir la ayuda para el comando solicitado.   ---#
#------------------------------------------------------------
#Si el usuario no ingreso argumentos imprimimos la ayuda general
print_general_help:
li $v0 4             #imprimir la cadena
la $a0 help          #cargamos al registro a0 la direccion de memoria de help
syscall
j main_loop
#Imprimimos la ayuda para el comando help
print_help:
li $v0 4                     #imprimir la cadena
la $a0 help_comm             #cargamos al registro a0 la direccion de memoria del comando
syscall
li $v0 4                     #imprimir la cadena
la $a0 help_info             #cargamos al registro a0 la direccion de memoria de la info
syscall
li $v0 4                     #imprimir la cadena
la $a0 help_info2            #cargamos al registro a0 la direccion de memoria de la info
syscall
li $v0 4                     #imprimir la cadena
la $a0 help_sinopsis         #cargamos al registro a0 la direccion de memoria de la sinopsis
syscall
li $v0 4                     #imprimir la cadena
la $a0 help_args             #cargamos al registro a0 la direccion de memoria de los argumentos
syscall
j main_loop
#Imprimimos la ayuda para el comando mix
print_mix:
li $v0 4                    #imprimir la cadena
la $a0 mix_comm             #cargamos al registro a0 la direccion de memoria del comando
syscall
li $v0 4                    #imprimir la cadena
la $a0 mix_info             #cargamos al registro a0 la direccion de memoria de la info
syscall
li $v0 4                    #imprimir la cadena
la $a0 mix_sinopsis         #cargamos al registro a0 la direccion de memoria de la sinopsis
syscall
li $v0 4                    #imprimir la cadena
la $a0 mix_args             #cargamos al registro a0 la direccion de memoria de los argumentos
syscall
j main_loop
#Imprimimos la ayuda para el comando coin
print_coin:
li $v0 4                     #imprimir la cadena
la $a0 coin_comm             #cargamos al registro a0 la direccion de memoria del comando
syscall
li $v0 4                     #imprimir la cadena
la $a0 coin_info             #cargamos al registro a0 la direccion de memoria de la info
syscall
li $v0 4                     #imprimir la cadena
la $a0 coin_sinopsis         #cargamos al registro a0 la direccion de memoria de la sinopsis
syscall
li $v0 4                     #imprimir la cadena
la $a0 coin_args             #cargamos al registro a0 la direccion de memoria de los argumentos
syscall
j main_loop
#Imprimimos la ayuda para el comando song
print_song:
li $v0 4                     #imprimir la cadena
la $a0 song_comm             #cargamos al registro a0 la direccion de memoria del comando
syscall
li $v0 4                     #imprimir la cadena
la $a0 song_info             #cargamos al registro a0 la direccion de memoria de la info
syscall
li $v0 4                     #imprimir la cadena
la $a0 song_sinopsis         #cargamos al registro a0 la direccion de memoria de la sinopsis
syscall
li $v0 4                     #imprimir la cadena
la $a0 song_args             #cargamos al registro a0 la direccion de memoria de los argumentos
syscall
j main_loop
#Imprimimos la ayuda para el comando rev
print_rev:
li $v0 4                    #imprimir la cadena
la $a0 rev_comm             #cargamos al registro a0 la direccion de memoria del comando
syscall
li $v0 4                    #imprimir la cadena
la $a0 rev_info             #cargamos al registro a0 la direccion de memoria de la info
syscall
li $v0 4                    #imprimir la cadena
la $a0 rev_info2            #cargamos al registro a0 la direccion de memoria de la info
syscall
li $v0 4                    #imprimir la cadena
la $a0 rev_sinopsis         #cargamos al registro a0 la direccion de memoria de la sinopsis
syscall
li $v0 4                    #imprimir la cadena
la $a0 rev_args             #cargamos al registro a0 la direccion de memoria de los argumentos
syscall
li $v0 4                    #imprimir la cadena
la $a0 file_dir             #cargamos al registro a0 la direccion de memoria de la especificacion del archivo
syscall
li $v0 4                    #imprimir la cadena
la $a0 file_dir2            #cargamos al registro a0 la direccion de memoria de la especificacion del archivo
syscall
li $v0 4                    #imprimir la cadena
la $a0 file_dir3            #cargamos al registro a0 la direccion de memoria de la especificacion del archivo
syscall
li $v0 4                    #imprimir la cadena
la $a0 file_dir4            #cargamos al registro a0 la direccion de memoria de la especificacion del archivo
syscall
j main_loop
#Imprimimos la ayuda para el comando cat
print_cat:
li $v0 4                    #imprimir la cadena
la $a0 cat_comm             #cargamos al registro a0 la direccion de memoria del comando
syscall
li $v0 4                    #imprimir la cadena
la $a0 cat_info             #cargamos al registro a0 la direccion de memoria de la info
syscall
li $v0 4                    #imprimir la cadena
la $a0 cat_sinopsis         #cargamos al registro a0 la direccion de memoria de la sinopsis
syscall
li $v0 4                    #imprimir la cadena
la $a0 cat_args             #cargamos al registro a0 la direccion de memoria de los argumentos
syscall
li $v0 4                    #imprimir la cadena
la $a0 file_dir             #cargamos al registro a0 la direccion de memoria de la especificacion del archivo
syscall
li $v0 4                    #imprimir la cadena
la $a0 file_dir2            #cargamos al registro a0 la direccion de memoria de la especificacion del archivo
syscall
li $v0 4                    #imprimir la cadena
la $a0 file_dir3            #cargamos al registro a0 la direccion de memoria de la especificacion del archivo
syscall
li $v0 4                    #imprimir la cadena
la $a0 file_dir4            #cargamos al registro a0 la direccion de memoria de la especificacion del archivo
syscall
j main_loop
#Imprimimos la ayuda para el comando count
print_count:
li $v0 4                      #imprimir la cadena
la $a0 count_comm             #cargamos al registro a0 la direccion de memoria del comando
syscall
li $v0 4                      #imprimir la cadena
la $a0 count_info             #cargamos al registro a0 la direccion de memoria de la info
syscall
li $v0 4                      #imprimir la cadena
la $a0 count_sinopsis         #cargamos al registro a0 la direccion de memoria de la sinopsis
syscall
li $v0 4                      #imprimir la cadena
la $a0 count_argp             #cargamos al registro a0 la direccion de memoria de los argumentos
syscall
li $v0 4                      #imprimir la cadena
la $a0 file_dir               #cargamos al registro a0 la direccion de memoria de la especificacion del archivo
syscall
li $v0 4                      #imprimir la cadena
la $a0 file_dir2              #cargamos al registro a0 la direccion de memoria de la especificacion del archivo
syscall
li $v0 4                      #imprimir la cadena
la $a0 file_dir3              #cargamos al registro a0 la direccion de memoria de la especificacion del archivo
syscall
li $v0 4                      #imprimir la cadena
la $a0 file_dir4              #cargamos al registro a0 la direccion de memoria de la especificacion del archivo
syscall
j main_loop
#Imprimimos la ayuda para el comando play
print_play:
li $v0 4                     #imprimir la cadena
la $a0 play_comm             #cargamos al registro a0 la direccion de memoria del comando
syscall
li $v0 4                     #imprimir la cadena
la $a0 play_info             #cargamos al registro a0 la direccion de memoria de la info
syscall
li $v0 4                     #imprimir la cadena
la $a0 play_songs             #cargamos al registro a0 la direccion de memoria de play_songs
syscall      
la $a0 play_sinopsis         #cargamos al registro a0 la direccion de memoria de la sinopsis
syscall
li $v0 4                     #imprimir la cadena
la $a0 play_args             #cargamos al registro a0 la direccion de memoria de los argumentos
syscall
j main_loop
#Imprimimos la ayuda para el comando idk
print_palindrome:
li $v0 4                           #imprimir la cadena
la $a0 palindrome_comm             #cargamos al registro a0 la direccion de memoria del comando
syscall
li $v0 4                           #imprimir la cadena
la $a0 palindrome_info             #cargamos al registro a0 la direccion de memoria de la info
syscall
la $a0 palindrome_sinopsis         #cargamos al registro a0 la direccion de memoria de la sinopsis
syscall
li $v0 4                           #imprimir la cadena
la $a0 palindrome_args             #cargamos al registro a0 la direccion de memoria de los argumentos
syscall
j main_loop
#Imprimimos la ayuda para el comando exit
print_exit:
li $v0 4                     #imprimir la cadena
la $a0 exit_comm             #cargamos al registro a0 la direccion de memoria del comando
syscall
li $v0 4                     #imprimir la cadena
la $a0 exit_info             #cargamos al registro a0 la direccion de memoria de la info
syscall
li $v0 4                     #imprimir la cadena
la $a0 exit_sinopsis         #cargamos al registro a0 la direccion de memoria de la sinopsis
syscall
li $v0 4                     #imprimir la cadena
la $a0 exit_args             #cargamos al registro a0 la direccion de memoria de los argumentos
syscall
j main_loop
#------------------------------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------------------------------#
                               #---   Manejamos el comando 'mix'   ---#                    
#------------------------------------------------------------------------------------------------------------#
case_mix:
jal count_args
bnez $v0 print_many_args          #mix no acepta argumentos
li $a1 15                         #rango de los numeros aleatorio, un numero aleatorio del 1 al 15
li $v0 42                         #obtenemos un numero entero aleatorio
syscall
move $t0 $a0                      #movemos el valor de #$a0 a $t0
li $v0 4                          #imprimir la cadena
la $a0 mix                        #cargamos al registro a0 la direccion de memoria de mix
syscall
beq $t0 0 print_mix1              #si el numero random es 0 imprimimos mix1
beq $t0 1 print_mix2              #si el numero random es 1 imprimimos mix2
beq $t0 2 print_mix3              #si el numero random es 2 imprimimos mix3
beq $t0 3 print_mix4              #si el numero random es 3 imprimimos mix4
beq $t0 4 print_mix5              #si el numero random es 4 imprimimos mix5
beq $t0 5 print_mix6              #si el numero random es 5 imprimimos mix6
beq $t0 6 print_mix7              #si el numero random es 6 imprimimos mix7
beq $t0 7 print_mix8              #si el numero random es 7 imprimimos mix8
beq $t0 8 print_mix9              #si el numero random es 8 imprimimos mix9
beq $t0 9 print_mix10             #si el numero random es 9 imprimimos mix10
beq $t0 10 print_mix11            #si el numero random es 10 imprimimos mix11
beq $t0 11 print_mix12            #si el numero random es 11 imprimimos mix12
beq $t0 12 print_mix13            #si el numero random es 12 imprimimos mix13
beq $t0 13 print_mix14            #si el numero random es 13 imprimimos mix13
j print_mix15                     #si no fue ninguno de los anteriores imprimimos el ultimo mix, mix15
#------------------------------------------------------------
#------------------------------------------------------------
#---   Subrtuinas para una sugerencia al azar.   ---#
#------------------------------------------------------------
print_mix1:
li $v0 4             #imprimir la cadena
la $a0 mix1          #cargamos al registro a0 la direccion de memoria de lo mix1
syscall
j main_loop
print_mix2:
li $v0 4             #imprimir la cadena
la $a0 mix2          #cargamos al registro a0 la direccion de memoria de lo mix2
syscall
j main_loop
print_mix3:
li $v0 4             #imprimir la cadena
la $a0 mix3          #cargamos al registro a0 la direccion de memoria de lo mix3
syscall
j main_loop
print_mix4:
li $v0 4             #imprimir la cadena
la $a0 mix4          #cargamos al registro a0 la direccion de memoria de lo mix4
syscall
j main_loop
print_mix5:
li $v0 4             #imprimir la cadena
la $a0 mix5          #cargamos al registro a0 la direccion de memoria de lo mix5
syscall
j main_loop
print_mix6:
li $v0 4             #imprimir la cadena
la $a0 mix6          #cargamos al registro a0 la direccion de memoria de lo mix6
syscall
j main_loop
print_mix7:
li $v0 4             #imprimir la cadena
la $a0 mix7          #cargamos al registro a0 la direccion de memoria de lo mix7
syscall
j main_loop
print_mix8:
li $v0 4             #imprimir la cadena
la $a0 mix8          #cargamos al registro a0 la direccion de memoria de lo mix8
syscall
j main_loop
print_mix9:
li $v0 4             #imprimir la cadena
la $a0 mix9          #cargamos al registro a0 la direccion de memoria de lo mix9
syscall
j main_loop
print_mix10:
li $v0 4              #imprimir la cadena
la $a0 mix10          #cargamos al registro a0 la direccion de memoria de lo mix10
syscall
j main_loop
print_mix11:
li $v0 4              #imprimir la cadena
la $a0 mix11          #cargamos al registro a0 la direccion de memoria de lo mix11
syscall
j main_loop
print_mix12:
li $v0 4              #imprimir la cadena
la $a0 mix12          #cargamos al registro a0 la direccion de memoria de lo mix12
syscall
j main_loop
print_mix13:
li $v0 4              #imprimir la cadena
la $a0 mix13          #cargamos al registro a0 la direccion de memoria de lo mix13
syscall
j main_loop
print_mix14:
li $v0 4              #imprimir la cadena
la $a0 mix14          #cargamos al registro a0 la direccion de memoria de lo mix14
syscall
j main_loop
print_mix15:
li $v0 4              #imprimir la cadena
la $a0 mix15          #cargamos al registro a0 la direccion de memoria de lo mix15
syscall
j main_loop
#------------------------------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------------------------------#
                               #---   Manejamos el comando 'coin'   ---#                    
#------------------------------------------------------------------------------------------------------------#
case_coin:
jal count_args
beqz $v0 print_few_args              #pocos argumentos, al menos uno
li $t0 1
bgt $v0 $t0 print_many_args          #demasiados argumentos, maximo uno
la $a0 args                          #cargamos la direccion de args con el unico argumento
jal clear_string                     #limpiamos el unico argumento
move $a0 $v0                         #movemos la cadena limpiada a $a0
jal is_integer                       #comprobamos que sea un entero
beqz $v0 print_invalid_args          #si no es un numero entero, imprimimos invalid_args
blez $v1 print_invalid_args          #si no es un numero positivo, imprimimos invalid_args
move $t1 $v1                         #de otro modo creamos un contador con el numero de monedas a lanzar
li $t2 1                             #creamos un segundo contador para imprimir el numero de la moneda lanzada
li $t3 100                           #limitamos el maximo de lanzamientos
bgt $t1 $t3 print_many_coins
j coin_loop
#------------------------------------------------------------
#------------------------------------------------------------
#---   Subrutinas auxiliares para validar que arg es un int.   ---#
#------------------------------------------------------------
#Comprobamos si el caracter es un entero
is_integer:
move $t0 $a0          #apuntador al inicio de arg
li $v0 1              #asumimos que es un entero valido
li $v1 0              #acumulador del numero resultante
li $t1 10             #definimos una base decimal
#Loop para revisar que cada caracter de arg sea un digito
int_loop:
lb $t2 0($t0)                  #cargar el siguiente byte de arg
beqz $t2 end_int_loop          #fin de arg
li $t3 48                      #verificamos si el caracter esta entre '0' (48) 
li $t4 57                      #y entre '9' (57)
blt $t2 $t3 not_int
bgt $t2 $t4 not_int
sub $t2 $t2 $t3                #convertimos el caracter a digito, restamos '0' (48)
mul $v1 $v1 $t1                #multiplicamos v1 por 10 y sumamos el digito actual
add $v1 $v1 $t2
addi $t0 $t0 1                 #avanzamos al siguiente caracter
j int_loop
#Si hay un caracter que no es un digito, arg no es valido
not_int:
li $v0 0          #no es un entero valido
jr $ra
end_int_loop:
jr $ra
#------------------------------------------------------------
#------------------------------------------------------------
#---   Subrutinas auxiliares para lanzar las n monedas.   ---#
#------------------------------------------------------------
#Loop para el manejo del lanzamiento de cada moneda
coin_loop:
beqz $t1 end_coin_loop          #verificamos que si el contador es 0, terminamos el loop y regresamos al main_loop
li $a1 2                        #rango de las dos cara de la moneda
li $v0 42                       #obtenemos un numero entero aleatorio
syscall
move $t4 $a0                    #asignamos a $a0 el numero del tiro lanzado
li $v0 1                        #imprimimos el numero de lanzamiento
move $a0 $t2
syscall
li $v0 4                        #imprimir la cadena
la $a0 coin                     #cargamos al registro a0 la direccion de memoria de coin
syscall    
beqz $t4 print_face             #si es 0 entonces es cara
li $v0 4                        #imprimir la cadena
la $a0 cross                    #cargamos al registro a0 la direccion de memoria de cross
syscall
j next_coin
#Imprimimos el resultado, cara en este caso
print_face:
li $v0 4             #imprimir la cadena
la $a0 face          #cargamos al registro a0 la direccion de memoria de face
syscall
#Continuamos con el siguiente lanzamiento
next_coin:
addi $t1 $t1 -1          #restamos uno al contador principal
addi $t2 $t2 1           #sumamos uno al contador secundario
j coin_loop
end_coin_loop:
j main_loop 
#------------------------------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------------------------------#
                               #---   Manejamos el comando 'song'   ---#                    
#------------------------------------------------------------------------------------------------------------#
case_song:
jal count_args
bnez $v0 print_many_args          #song no acepta argumentos
li $v0 4                          #imprimir la cadena
la $a0 playing_song               #cargamos al registro a0 la direccion de memoria de mix
syscall
play_songx:
jal furelise_A1
jal furelise_A2
jal furelise_A1
jal furelise_A3
jal furelise_A1
jal furelise_A2
jal furelise_A1
jal furelise_A3
jal furelise_A4
jal furelise_A5
jal furelise_A1
jal furelise_A2
jal furelise_A1
jal furelise_A3
j main_loop
#Clave de Sol: Mi5 - Re#5 - Mi5 - Re#5 - Mi5 - Si - Re5 - Do5 - La - Do - Mi - La - Si
#Clave de Fa: La2 - Mi3 - La3 - Mi2 - Mi3 - Sol#3/LaB3
furelise_A1:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 corchea          #duracion de la nota
li $a2 0                #definimos al piano como instrumentos
li $a3 100              #volumen de las notas
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 mi5              #nota Mi5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 re_s5            #nota re_s5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 mi5              #nota Mi5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 re_s5            #nota re_s5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 mi5              #nota Mi5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 si               #nota Si
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 re5              #nota Re5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 do5              #nota Do5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a1 negra            #duracion de la nota
lw $a0 la_note          #nota La5
li $v0 31               #syscall para reproducir la nota
syscall
li $a0 5                #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a1 corchea          #duracion de la nota
lw $a0 la2              #nota La2
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 mi3              #nota Mi3
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 la3              #nota La3
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 do               #nota Do
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 mi               #nota Mi
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 la_note          #nota La
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a1 negra            #duracion de la nota
lw $a0 si               #nota si
li $v0 31               #syscall para reproducir la nota
syscall
li $a0 5                #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a1 corchea          #duracion de la nota
lw $a0 mi2              #nota Mi2
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 mi3              #nota Mi3
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 sol_s3           #nota Sol#3
li $v0 31               #syscall para reproducir la nota
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Mi - Sol#/LaB - Si - Do5 - Mi
#Clave de Fa: La2 - Mi3 - La3
furelise_A2:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 corchea          #duracion de la nota
lw $a0 pause            #silencio
li $v0 32               #syscall sleep
syscall
lw $a0 mi               #nota Mi
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 sol_s            #nota Sol#
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 si               #nota Si
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a1 negra            #duracion de la nota
lw $a0 do5              #nota Do5
li $v0 31               #syscall para reproducir la nota
syscall
li $a0 5                #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a1 corchea          #duracion de la nota
lw $a0 la2              #nota La2
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 mi3              #nota Mi3
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 la3              #nota La3
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 mi               #nota Mi
li $v0 31               #syscall para reproducir la nota
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Mi - Do5 - Si -La
#Clave de Fa: La2 - Mi3 - La3
furelise_A3:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 corchea          #duracion de la nota
lw $a0 pause            #silencio
li $v0 32               #syscall sleep
syscall
lw $a0 mi               #nota Mi
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 do5              #nota Do5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 si               #nota Si
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
li $a1 650              #duracion de la nota
lw $a0 la_note          #nota La
li $v0 31               #syscall para reproducir la nota
syscall
li $a0 5                #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a1 corchea          #duracion de la nota
lw $a0 la2              #nota La2
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
li $a1 350              #duracion de la nota
lw $a0 mi3              #nota Mi3
li $v0 31               #syscall para reproducir la nota
syscall
li $a0 355              #pausa entre notas
li $v0 32               #syscall sleep
syscall
li $a1 450          #duracion de la nota
lw $a0 la3              #nota La3
li $v0 31               #syscall para reproducir la nota
syscall
li $a0 355            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Si - Do5 - Re5 - Mi5 - Sol - Fa5 - Mi5 - Re5 - Fa - Mi5 - Re5 - Do5 - Mi - Re5 - Do5 - Si
#Clave de Fa: Do3 - Sol3 - Do - Sol2 - Sol3 - Si3 - La2 - Mi3 - La3 - Mi2 - Mi3 - Mi
furelise_A4:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 corchea          #duracion de la nota
li $a0 105              #silencio
li $v0 32               #syscall sleep
syscall
lw $a0 si               #nota Si
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 do5              #nota Do5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 re5              #nota Re5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a1 dot_neg          #duracion de la nota
lw $a0 mi5              #nota Mi5
li $v0 31               #syscall para reproducir la nota
syscall
li $a0 5                #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a1 corchea          #duracion de la nota
lw $a0 do3              #nota Do3
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 sol3             #nota Sol3
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 do               #nota do
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
li $a1 270              #duracion de la nota
lw $a0 sol              #nota Sol
li $v0 31               #syscall para reproducir la nota
syscall
li $a0 275              #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a1 corchea          #duracion de la nota
lw $a0 fa5              #nota Fa5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 mi5              #nota Mi5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a1 dot_neg          #duracion de la nota
lw $a0 re5              #nota Re5
li $v0 31               #syscall para reproducir la nota
syscall
li $a0 5                #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a1 corchea          #duracion de la nota
lw $a0 sol2             #nota Sol2
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 sol3             #nota Sol3
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 si3              #nota Si3
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
li $a1 270              #duracion de la nota
lw $a0 fa               #nota Fa
li $v0 31               #syscall para reproducir la nota
syscall
li $a0 275              #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a1 corchea          #duracion de la nota
lw $a0 mi5              #nota Mi5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 re5              #nota Re5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a1 dot_neg          #duracion de la nota
lw $a0 do5              #nota Do5
li $v0 31               #syscall para reproducir la nota
syscall
li $a0 5                #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a1 corchea          #duracion de la nota
lw $a0 la2              #nota La3
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 mi3              #nota Mi3
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 la3              #nota La3
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
li $a1 270              #duracion de la nota
lw $a0 mi               #nota Mi
li $v0 31               #syscall para reproducir la nota
syscall
li $a0 275              #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a1 corchea          #duracion de la nota
lw $a0 re5              #nota Re5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 do5              #nota Do5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a1 negra            #duracion de la nota
lw $a0 si               #nota Si
li $v0 31               #syscall para reproducir la nota
syscall
lw $a1 corchea          #duracion de la nota
lw $a0 mi2              #nota Mi2
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 mi3              #nota Mi3
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 mi               #nota Mi
li $v0 31               #syscall para reproducir la nota
syscall
li $a0 5                #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Mi - Mi5 - Mi5 - Mi6 - Re#5 - Mi5 - Re#5
#Clave de Fa:  Mi - Mi5 - Re#5 - Mi5 - Re#5 - Mi5
furelise_A5:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 corchea          #duracion de la nota
lw $a0 pause            #silencio
li $v0 32               #syscall sleep
syscall
lw $a0 mi               #nota Mii
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 mi5              #nota Mi5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 mi               #nota Mii
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 mi5              #nota Mi5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
li $a1 270              #duracion de la nota
lw $a0 mi               #nota Mi vjhvvkh
li $v0 31               #syscall para reproducir la nota
syscall
li $a0 275              #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 mi6              #nota Mi6
li $v0 31               #syscall para reproducir la nota
syscall
li $a0 275              #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a1 corchea          #duracion de la nota
lw $a0 re_s5            #nota Re#5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 mi5              #nota Mi5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 re_s5            #nota Re#5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 mi5              #nota Mi5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 re_s5            #nota Re#5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 mi5              #nota Mi5
li $v0 31               #syscall para reproducir la nota
syscall
lw $a0 pause            #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $a0 re_s5            #nota Re#5
li $v0 31               #syscall para reproducir la nota
syscall
li $a0 5                #pausa entre notas
li $v0 32               #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#------------------------------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------------------------------#
                               #---   Manejamos el comando 'rev'   ---#                    
#------------------------------------------------------------------------------------------------------------#
case_rev:
jal count_args
li $t0 1
bgt $v0 $t0 print_many_args          #demasiados argumentos
beq $v0 $t0 rev_file_buffer          #si hay un solo argumento lo limpiamos
#Si no hay argumentos, leemos de la linea de entrada
li $v0 4
la $a0 rev_in
syscall
li $v0 8                             #syscall para leer la entrada del usuario
la $a0 buffer                        #cargamos la direccion del buffer
li $a1 1024                          #tamano maxima del buffer
syscall
la $t0 buffer                        #cargamos la direccion del buffer
li $t1 0                             #contador de la longitud
#------------------------------------------------------------
#------------------------------------------------------------
#---   Subrutinas para revertir el contenido de la entrada o del buffer del archivo.   ---#
#------------------------------------------------------------
#Buscamos la longitud de la cadena sin incluir el salto de linea
find_length:
lb $t2 ($t0)                        #cargamos el byte actual
beq $t2 10 end_find_length          #si es '\n', terminamos
beqz $t2 end_find_length            #si es null, terminamos
addi $t0 $t0 1                      #avanzamos al siguiente caracter
addi $t1 $t1 1                      #incrementamos el contador
j find_length
#Terminamos de calcular la longitud de la cadena
end_find_length:
li $v0 4
la $a0 rev_out
syscall
#Imprimimos la reversa
la $t0 buffer            #regresamos el apuntador al inicio
add $t0 $t0 $t1          #movemos el apuntador al final de la cadena
subi $t0 $t0 1           #pequeno ajuste para apuntar al ultimo caracter
la $t3 buffer            #guardamos la direccion inicial del buffer para compararla
print_reverse:
blt $t0 $t3 end_reverse          #si el apuntador es menor que inicio del buffer, terminamos
lb $a0 ($t0)                     #cargamos byte actual
li $v0 11                        #imprimir caracter
syscall
subi $t0 $t0 1                   #retrocedemos al caracter anterior
j print_reverse
end_reverse:
li $v0 4
la $a0 new_line
syscall
j main_loop
#Procesamos el archivo ingresado para revertirlo
rev_file_buffer:
addi $sp $sp -24
sw $ra 0($sp)                    #guardamos la direccion de retorno
sw $s0 4($sp)                    #$s0 para el descriptor del archivo
sw $s1 8($sp)                    #$s1 para el nombre del archivo
sw $s2 12($sp)                   #$s2 para el tamano de los bytes leidos
sw $s3 16($sp)                   #$s3 para el buffer temporal
sw $a0 20($sp)                   #guardamos el args original
la $a0 args                      #movemos args a $a0 para limpiar la cadena
jal clear_string                 #limpiamos args
move $s1 $v0                     #guardamos el nombre limpio en $s1
li $v0 13                        #syscall para abrir archivo
move $a0 $s1                     #nombre del archivo
li $a1 0                         #modo lectura (0)
li $a2 0                         #permisos por defecto
syscall
bltz $v0 file_rev_error          #no se encontro el archivo o hubo un error al abrirlo
move $s0 $v0                     #guardamos el descriptor del archivo
li $v0 14                        #syscall para leer archivo
move $a0 $s0                     #descriptor del archivo
la $a1 buffer                    #buffer temporal para cargar los datos
li $a2 1024                      #maximo de bytes a leer por archivo (1kb)
syscall
blez $v0 end_print_rev_file      #si no se leyeron bytes, terminamos
move $s2 $v0                     #guardamos bytes leidos
li $v0 16                        #syscall para cerrar archivo
move $a0 $s0                     #descriptor del archivo
syscall
#Preparamos la reversion de los datos con 
la $s3 buffer                    #buffer con los datos
add $t1 $s3 $s2                  #apuntador al final del buffer
subi $t1 $t1 1                   #ultimo byte valido
#Verificamos si el ultimo caracter es '\n'
lb $t2 ($t1)
li $t3 10                        #'\n' en ASCII
bne $t2 $t3 print_rev_file
subi $s2 $s2 1                   #reducimos el contador si es '\n'
print_rev_file:
li $v0 4
la $a0 rev_file_out      #imprimimos la cadena que indica el resultado de revertir el archivo 
syscall
la $t0 buffer            #apuntamos al inicio
add $t0 $t0 $s2          #apuntamos al final de los datos
subi $t0 $t0 1           #ultimo caracter valido
print_rev_loop:
blt $t0 $s3 end_print_rev_file          #si el apuntador es menor que inicio del buffer, terminamos
lb $a0 ($t0)                            #cargamos el byte actual
li $v0 11                               #imprimimos el caracter
syscall    
subi $t0 $t0 1                          #retrocedemos al caracter anterior
j print_rev_loop
#Simplemente imprimimos el final de la reversa y restauramos registros
end_print_rev_file:
li $v0 4
la $a0 new_line
syscall
lw $ra 0($sp)
lw $s0 4($sp)
lw $s1 8($sp)
lw $s2 12($sp)
lw $s3 16($sp)
lw $a0 20($sp)
addi $sp $sp 24
j main_loop
#Imprimimos mensaje de error y restauramos registros
file_rev_error:
li $v0 55
la $a0 file_error
li $a1 0          #tipo de icon
syscall
lw $ra 0($sp)
lw $s0 4($sp)
lw $s1 8($sp)
lw $s2 12($sp)
lw $s3 16($sp)
lw $a0 20($sp)
addi $sp $sp 24
j main_loop
#------------------------------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------------------------------#
                               #---   Manejamos el comando 'cat'   ---#                    
#------------------------------------------------------------------------------------------------------------#
case_cat:
jal count_args
li $t0 2         
blt $v0 $t0 print_few_args           #pocos argumentos, al menos dos
bgt $v0 $t0 print_many_args          #demasiados argumentos, maximo dos
la $a0 args
jal get_first_arg                    #obtenemos el primer archivo de los dos arguementos
move $s1 $v0                         #guardamos la direccion del primer archivo en $s1
la $a0 args
jal get_second_arg                   #obtenemos el segundo archivo de los dos arguementos
move $s2 $v0                         #guardamos la direccion del segundo archivo en $s2
move $a0 $s1                         #cargamos el primer archivo en el buffer
la $a1 cat_buffer
jal file_to_buffer                   #procesamos el primer archivo
move $t5 $v0                         #guardamos la cantidad de bytes leidos
move $a0 $s2                         #cargamos el primer archivo en el buffer
la $t0 cat_buffer                    #cargamos cat_buffer a $t0
add $a1 $t0 $t5                      #apuntamos al final del contenido anterior
jal file_to_buffer                   #procesamos el segundo archivo
add $t5 $t5 $v0                      #total final de bytes leidos
li $v0 4
la $a0 cat_files
syscall
li $v0 4
la $a0 cat_buffer
syscall
j main_loop
#------------------------------------------------------------
#------------------------------------------------------------
#--   Subrutinas para extraer y limpiar los argumentos.   ---#
#------------------------------------------------------------
#Obtenemos la primer cadena como la direccion del primer archivo
get_first_arg:
move $t0 $a0          #asignamos a $t0 el apuntador al inicio de args
la $t1 arg1           #espacio para la cadena de la direccion del primer archivo

copy_first_loop:
lb $t2 0($t0)                       #cargamos el caracter actual
li $t3 32                           #espacio en ASCII
beq $t2 $t3 end_first_copy          #si es espacio terminamos
li $t3 9                            #tab en ASCII
beq $t2 $t3 end_first_copy          #si es tab terminamos
beqz $t2 end_first_copy             #aseguramos el fin de la cadena
sb $t2 0($t1)                       #guardamos el caracter en arg1
addi $t0 $t0 1                      #avanzamos al siguiente caracter en args
addi $t1 $t1 1                      #avanzamos al siguiente espacio en arg1
j copy_first_loop
end_first_copy:
li $t2 0
sb $t2 0($t1)          #terminamos la cadena con un null
la $v0 arg1            #regresamos al apuntero al inicio de arg1
jr $ra
#Obtenemos la segunda cadena como la direccion del segundo archivo
get_second_arg:
move $t0 $a0          #apuntamos al inicio de args
#Saltamos la primera cadena hasta el primer espacio o tab
skip_to_second:
lb $t2 0($t0)
li $t3 32                          #espacio en ASCII
beq $t2 $t3 skip_spaces            #omitimos los espacios
li $t3 9                           #tab en ASCII
beq $t2 $t3 skip_spaces            #omitimos los tabs
beqz $t2 print_args_error          #por si acaso encontramos null antes de un caracter valido
addi $t0 $t0 1                     #avanzamos al siguiente caracter
j skip_to_second
#Omitimos todos los espacios o tabs consecutivos
skip_spaces:
lb $t2 0($t0)
li $t3 32
beq $t2 $t3 skip_spaces_advance          #mientras haya espacios, los omitimos
li $t3 9
beq $t2 $t3 skip_spaces_advance          #mientras haya tabs, los omitimos
j copy_second_loop                       #encontramos el comienzo del segundo file
skip_spaces_advance:
addi $t0 $t0 1
j skip_spaces
copy_second_loop:
la $t1 arg2          #asignamos a $t1 el inicio de arg2
copy_loop:
lb $t2 0($t0)                        #cargamos el byte actual
li $t3 32
beq $t2 $t3 end_second_copy          #si encontramos espacio, terminamos
li $t3 9
beq $t2 $t3 end_second_copy          #si encontramos tab, terminamos
beqz $t2 end_second_copy             #terminamos si llegamos al final de la cadena
sb $t2 0($t1)                        #guardamos el caracter en arg1
addi $t0 $t0 1                       #avanzamos al siguiente caracter en args
addi $t1 $t1 1                       #avanzamos al siguiente caracter en arg2
j copy_loop
end_second_copy:
li $t2 0
sb $t2 0($t1)          #terminamos la cadena con null
la $v0 arg2            #regresamos al apuntero al inicio de arg2
jr $ra
#------------------------------------------------------------
#------------------------------------------------------------        
#---   Subrutinas para leer e imprimir un archivo.   ---#
#------------------------------------------------------------
#Guardamos los registros en la pila para preservar su estado
file_to_buffer:
addi $sp $sp -16
sw $ra 0($sp)                       #guardamos la direccion de retorno
sw $s0 4($sp)                       #$s0 para el descriptor del archivo
sw $s1 8($sp)                       #$s1 para el nombre del archivo
sw $s2 12($sp)                      #$s2 para el contador de bytes leidos
move $s1 $a1                        #direccion del buffer destino
li $s2 0                            #el dichoso contador de bytes leidos
li $v0 13                           #syscall para abrir archivo
move $a0 $a0                        #nombre del archivo
li $a1 0                            #modo lectura (0)
li $a2 0                            #permisos por defecto
syscall
bltz $v0 read_buffer_error          #no se encontro el archivo o hubo un error al abrirlo
move $s0 $v0                        #guardamos el descriptor del archivo
#Leemos un 'chunk' del archivo
read_buffer_loop:
li $v0 14                         #syscall para leer archivo
move $a0 $s0                      #descriptor del archivo
la $a1 buffer                     #buffer temporal para cargar los datos
li $a2 1024                       #maximo de bytes a leer por archivo (1kb)
syscall
blez $v0 read_buffer_end          #si no se leyeron bytes, terminamos
move $t0 $v0                      #guardamos bytes leidos
move $t1 $s1                      #guardamos bytes leidos
la $t2 buffer                     #buffer con los datos
#Copiamos byte a byte del buffer temporal al buffer destino
copy_buffer:
beqz $t0 after_copy          #si ya no hay bytes por copiar, terminmos
lb $t3 0($t2)                #leemos byte desde el buffer temporal
sb $t3 0($t1)                #escribimos en el buffer destino
addi $t1 $t1 1               #avanzamos el apuntador destino
addi $t2 $t2 1               #avanzamos el apuntador fuente
addi $t0 $t0 -1              #decrementamos contador de bytes
j copy_buffer
#Actualizamos apuntadores y el contador total tras copiar el 'chunk'
after_copy:
sub $t1 $t1 $s1          #cantidad de bytes copiados
add $s2 $s2 $t1          #acumulamos el total
add $s1 $s1 $t1          #avanzamos el apuntador del destino
j read_buffer_loop
#Cerramos el archivo y restauramos registros
read_buffer_end:
li $v0 16             #syscall para cerrar archivo
move $a0 $s0
syscall
move $v0 $s2          #devolvemos en el total de bytes leidos
lw $ra 0($sp)
lw $s0 4($sp)
lw $s1 8($sp)
lw $s2 12($sp)
addi $sp $sp 16
jr $ra
#Imprimimos mensaje de error y restauramos los registros
read_buffer_error:
li $v0 55
la $a0 file_error
li $a1 0            #tipo de icon
syscall
li $v0 0            #indicamos que se leyeron 0 bytes
lw $ra 0($sp)
lw $s0 4($sp)
lw $s1 8($sp)
lw $s2 12($sp)
addi $sp $sp 16
j main_loop
#------------------------------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------------------------------#
                               #---   Manejamos el comando 'count'   ---#                    
#------------------------------------------------------------------------------------------------------------#
case_count:
jal count_args
beqz $v0 print_few_args              #pocos argumentos, al menos uno
li $t0 1
bgt $v0 $t0 print_many_args          #demasiados argumentos, maximo uno
la $a0 args
jal clear_string                     #limpaimos args
li $v0 13                            #syscall para abrir un archivo
la $a0 args                          #cargamos el archivo a abrir, args tiene la dirrecion del mismo
li $a1 0                             #modo lectura 0
li $a2 0                             #permisos por defecto
syscall
bltz $v0 print_file_error            #si el archivo no fue encontrado imrpimimos file_error
move $s0 $v0                         #descriptor del archivo
li $t0 0
#------------------------------------------------------------
#------------------------------------------------------------
#---   Subrutinas para auntenticar los argumentos de cada comando.   ---#
#------------------------------------------------------------
#Leemos 'chunk' por chunk del archivo
read_loop:
li $v0 14                  #syscall para leer un archivo
move $a0 $s0               #movemos el descriptor al $a0
la $a1 buffer              #cargamos la direccion del buffer a $a1
li $a2 1024                #limite de lectura
syscall
blez $v0 end_read          #si no hay que leer, terminamos
move $t2 $v0               #creamos un contador del numero de bytes leídos
la $t1 buffer              #asignamos a $t1 como el apuntador al buffer
#Loop para contar los caracteres del archivo  
count_chars_loop:
lb $t3 0($t1)                  #cargamos el byte actual
beqz $t3 skip_char             #si es null, lo saltamos
li $t4 10                      #'\n' en ASCII
beq $t3 $t4 skip_char          #ignoramos el salto de linea, '\n'
li $t4 32                      #espacio en ASCII
beq $t3 $t4 skip_char          #ignoramos el espacio
li $t4 9                       #tab en ASCII
beq $t3 $t4 skip_char          #ignoramos el tab
addi $t0 $t0 1                 #de otro modo incrementamos el contador
#Omitimos los chars innecesarios de contar
skip_char:
addi $t1 $t1 1                     #avanzamos al siguiente byte
addi $t2 $t2 -1                    #decrementamos contador de bytes
bgtz $t2 count_chars_loop          #si quedan bytes continuamos
j read_loop
end_read:
li $v0 4                     #imprimir cadena 
la $a0 count_result          #cargamos al registro a0 la direccion de memoria de count_result
syscall
li $v0 1                     #syscall para imprimir un int
move $a0 $t0                 #imprimimos el resultado
syscall
li $v0 4                     #imprimir cadena 
la $a0 new_line              #cargamos al registro a0 la direccion de memoria de new_line
syscall
li $v0 16                    #syscall para cerrar un archivo.
move $a0 $s0                 #movemos el descriptor del archivo a $a0
syscall
j main_loop
#Definimos un contador de los argumentos ingresados por el usuario
count_args:
la $t0 args          #asignamos args a $t0
li $v0 0             #asignamos a $v0 el contador de argumentos
li $t2 32            #espacio en ASCII
#Loop para contar los argumentos 
count_args_loop:
lb $t1 0($t0)                   #cargamos a $t0 el byte actual
beqz $t1 end_count              #si llegamos al null terminamos
beq $t1 $t2 skip_space          #omitimos los espacios
addi $v0 $v0 1                  #aumentamos el contador pues el caracter anterior fue un espacio
#Nos saltamos la cadena encontrada hasta el proximo espacio o null
skip_token:
lb $t1 0($t0)                      #cargamos a $t0 el byte actual
beqz $t1 end_count                 #si es null, terminamos de contar
beq $t1 $t2 continue_loop          #si es un espacio terminamos la cadena y saltamos al siguiente
addi $t0 $t0 1                     #si no es espacio ni null, seguimos avanzando en la cadena
j skip_token                       #repetimos el loop hasta terminar la cadena
#Terminamos de recorrer la cadena hasta el final y continuamos leyendo el buffer
continue_loop:
addi $t0 $t0 1
j count_args_loop          #regresamos al loop para continuar con el conteo
#Ignoramos espacios consecutivos para evitar contar argumentos vacios
skip_space:
addi $t0 $t0 1             #avanzamos un byte, saltamos el espacio extra
j count_args_loop          #regresamos al loop para continuar con el conteo
#Terminamos el conteo de argumentos
end_count:
jr $ra
#------------------------------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------------------------------#
                               #---   Manejamos el comando 'play'   ---#                    
#------------------------------------------------------------------------------------------------------------#
case_play:
jal count_args
beqz $v0 print_few_args              #pocos argumentos, al menos uno
li $t0 1
bgt $v0 $t0 print_many_args          #demasiados argumentos, maximo uno
la $a0 args                          #cargamos la direccion de args con el unico argumento
jal clear_string                     #limpiamos el unico argumento
move $a0 $v0                         #movemos la cadena limpiada a $a0
j is_song1                           #si es un argumento comenzamos la verificacion de cual cancion es
#------------------------------------------------------------
#------------------------------------------------------------
#---   Subrutinas auxiliares para elegir y tocar las canciones.   ---#
#------------------------------------------------------------
#-------------------------------#
#---    Codigo para song1    ---#
#-------------------------------#
#Comprobamos si la cancion que el usuario solicito es song1
is_song1:
la $a0 args                   #cargamos el argumento del usuario en $a0
la $a1 song1                  #cargamos song1 en $a1
jal strcmp                    #llamamos a strcmp con los valores (args, song1)
beq $v0 0 is_song2            #si son diferentes comprobamos la siguiente cancion
#Reproducimos song1
play_song1:
li $v0 4                     #imprimir la cadena
la $a0 playing_song          #cargamos al registro a0 la direccion de memoria de mix
syscall
lw $a1 dot_cor               #duracion de la nota
li $a2 0                     #definimos al piano como instrumentos
li $a3 100                   #volumen de las notas
jal snow_A1
jal snow_A1
jal snow_A2
jal snow_A3
jal snow_A3
jal snow_A4
jal snow_A3
jal snow_A5
jal snow_A6
jal snow_A7
jal snow_A3
jal snow_A8
jal snow_A3
jal snow_A5
jal snow_A9
jal snow_A7
jal snow_A10
jal snow_A11
jal snow_A12
jal snow_A13
jal snow_A11
jal snow_A12
jal snow_A14
jal snow_A15
jal snow_A16
jal snow_A17
jal snow_A18
jal snow_A16
jal snow_A17
jal snow_A18
jal snow_A5
jal snow_A11 
jal snow_A7
jal snow_A18
jal snow_A5
jal snow_A11
jal snow_A7
jal snow_A3
jal snow_A1
jal snow_A1
jal snow_A2
j main_loop
#Clave de Sol: Fa3 - Sol#3 - Do# - Fa - Do# - Sol#3
snow_A1:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa3                #nota Fa3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol_s3             #nota Sol#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol_s3             #nota Sol#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Fa3 - Sol#3 - Do# - Fa - Sol# - Do#5 - Fa5
snow_A2:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa3                #nota Fa3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol_s3             #nota Sol#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol_s              #nota Sol#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s5              #nota Do#5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 redonda            #duracion de la nota
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 red_pause         #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Fa#3 - La#3 - Re# - Fa# - Re# - La#3 
snow_A3:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 dot_cor            #duracion de la nota
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa_s3              #nota Fa#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_s3              #nota La#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 re_s               #nota Re#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa_s               #nota Fa#
li $v0 31                 #syscall para reproducir la nota
syscall  
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 re_s               #nota Re#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_s3              #nota La#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Sol#3 - Do - Re# - Sol# - Re# - Do
snow_A4:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol_s3             #nota Sol#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 re_s               #nota Re#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol_s              #nota Sol#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 re_s               #nota Re#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Fa3 - Sol#3 - Do# - Fa - Do# - Sol#3
snow_A5:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa3                #nota Fa3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol_s3             #nota Sol#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol_s3             #nota Sol#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Fa3 - Sol#3 - Do# - Fa - Do# - Do - Do# - Fa3 - La#3 - Fa - Do# - La#3
snow_A6:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa3                #nota Fa3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol_s3             #nota Sol#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa3                #nota Fa3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_s3             #nota Sol#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_s3             #nota Sol#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Fa3 - La#3 - Do# - Fa - Do# - La#3
snow_A7:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa3                #nota Fa3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_s3             #nota Sol#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_s3              #nota La#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Fa#3 - La#3 - Re# - Fa# - Fa#3 - Sol3 - Sol#3 - Do - Re# - Sol# - Re# - Do
snow_A8:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa_s3              #nota Fa#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_s3              #nota La#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 re_s               #nota Re#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa_s               #nota Fa#
li $v0 31                 #syscall para reproducir la nota
syscall  
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa_s3              #nota Fa#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol3               #nota Sol3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol_s3             #nota Sol#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall  
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 re_s               #nota Re#
li $v0 31                 #syscall para reproducir la nota
syscall  
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol_s              #nota Sol#
li $v0 31                 #syscall para reproducir la nota
syscall  
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 re_s               #nota Re#
li $v0 31                 #syscall para reproducir la nota
syscall  
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Fa3 - Sol#3 - Do# - Fa - Sol#3 - Re#
snow_A9:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa3                #nota Fa3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol_s3             #nota Sol#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol_s3             #nota Sol#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 re_s               #nota Re#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Do5 - La# - Fa - Do# - Do - La#3
snow_A10:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do5                #nota Do5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_s               #nota La#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 la_s3              #nota La#3
li $v0 31                 #syscall para reproducir la nota
syscall 
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Fa3 - La3 - Do - Fa - Do - La3
snow_A11:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa3                #nota Fa3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la3                #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la3                #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: La#3 - Do# - Fa - La# - Sol# - Fa#
snow_A12:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_s3              #nota La#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_s               #nota La#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol_s              #nota Sol#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa_s               #nota Fa#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Sol#3 - Do - Re# - Sol# - Re# - Do - Do# - Fa - Sol# - Do#5 - Sol# - Fa
snow_A13:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol_s3             #nota Sol#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 re_s               #nota Re#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol_s              #nota Sol#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 re_s               #nota Re#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol_s              #nota Sol#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s5              #nota Do#5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol_s              #nota Sol#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Fa - La#3 - Do# - Re# - La#3 - Do#
snow_A14:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_s3              #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 re_s               #nota Re#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_s3              #nota La#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Sol#3 - Do - Re# - Fa# - Re# - Do
snow_A15:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol_s3             #nota Sol#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 re_s               #nota Re#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa_s               #nota Fa#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 re_s               #nota Re#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Sol#3 - La#3 - Do# - Fa - Do# - Sol#3 - La3 - Do - Re# - Fa - Re# - La3
snow_A16:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol_s3             #nota Sol#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_s3              #nota La#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol_s3             #nota Sol#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la3                #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 re_s               #nota Re#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 re_s               #nota Re#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la3                #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Fa3 - La#3 - Do# - Fa - Do# - Sol#3
snow_A17:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa3                #nota Fa3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_s3              #nota La#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do# 
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol_s3             #nota Sol#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Fa#3 - La#3 - Do# - Fa# - Do# - La#3 
snow_A18:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa_s3              #nota Fa#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_s3              #nota La#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa_s               #nota Fa#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_s3              #nota La#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#------------------------------------------------------------
#-------------------------------#
#---    Codigo para song2    ---#
#-------------------------------#
#Comprobamos si la cancion que el usuario solicito es song2
is_song2:
la $a0 args                           #cargamos el argumento del usuario en $a0
la $a1 song2                          #cargamos song2 en $a1
jal strcmp                            #llamamos a strcmp con los valores (args, song2)
beq $v0 0 print_invalid_args          #si son diferentes la cancion solicitada no es valida
#Reproducimos song2
play_song2:
li $v0 4                     #imprimir la cadena
la $a0 playing_song          #cargamos al registro a0 la direccion de memoria de mix
syscall
li $a2 0                     #definimos al piano como instrumentos
li $a3 100                   #volumen de las notas
lw $a0 mid_pause             #silencio
li $v0 32                    #syscall sleep
syscall
jal pirate_A1
jal pirate_A2
jal pirate_A1
jal pirate_A2
jal pirate_A1
jal pirate_A3
jal pirate_A4
jal pirate_A5
jal pirate_A6
jal pirate_Ado
jal pirate_A7
jal pirate_A8
jal pirate_A9
jal pirate_A6
jal pirate_A7
jal pirate_A4
jal pirate_A10
jal pirate_A11
jal pirate_A5
jal pirate_A12
jal pirate_A13
jal pirate_A14
jal pirate_Alado5
jal pirate_A15
jal pirate_A16
jal pirate_Alarefa5
jal pirate_A17
jal pirate_Ado5
jal pirate_A18
jal pirate_A19
jal pirate_A20
jal pirate_A17
jal pirate_A18
jal pirate_A15
jal pirate_A21
jal pirate_A22
jal pirate_A16
jal pirate_A23
jal pirate_A24
jal pirate_A25
jal pirate_A26
jal pirate_A27
jal pirate_A28
jal pirate_A28
jal pirate_A29
jal pirate_A29
jal pirate_A29
jal pirate_A30
jal pirate_A31
jal pirate_A31
jal pirate_A31
jal pirate_A31
jal pirate_A32
jal pirate_A33
jal pirate_A33
jal pirate_A33
jal pirate_A34
jal pirate_A33
jal pirate_A35
jal pirate_A36
jal pirate_A37
jal pirate_A38
jal pirate_A39
jal pirate_A40
jal pirate_A41
jal pirate_A42
jal pirate_A43
jal pirate_A44
jal pirate_A44
jal pirate_A44
jal pirate_A44
jal pirate_A45
jal pirate_A46
jal pirate_A47
jal pirate_A44
jal pirate_A44
jal pirate_A48
jal pirate_A44
jal pirate_A45
jal pirate_A46
jal pirate_A49
j main_loop
#Clave de Sol: Re3 - Re3 - Re3 - Re3 - Re3 - Re3
pirate_A1:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 dot_cor            #duracion de la nota
lw $a0 re3                #nota Re3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 re3                #nota Re3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 dot_cor            #duracion de la nota
lw $a0 re3                #nota Re3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 re3                #nota Re3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 dot_cor            #duracion de la nota
lw $a0 re3                #nota Re3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 re3                #nota Re3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Re3 - Re3 - Re3
pirate_A2:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 re3                #nota Re3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 re3                #nota Re3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 re3                #nota Re3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Re3 - La3 - Do
pirate_A3:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 re3                #nota Re3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la3                #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do                 #nota Re3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Fa3/La3/Re - Fa3/La3/Re
pirate_A4:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 dot_cor            #duracion de la nota
lw $a0 fa3                #nota Fa3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la3                #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 fa3                #nota Fa3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la3                #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Re - Mi - La#3/Re/Fa - La#3/Re/Fa
pirate_A5:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 mi                 #nota Mi
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 dot_cor            #duracion de la nota
lw $a0 la_s3              #nota La#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 la_s3              #nota La#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Fa - Sol - La3/Do/Mi - La3/Do/Mi - Re
pirate_A6:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a1 dot_cor            #duracion de la nota
lw $a0 la3                #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi                 #nota Mi
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 la3                #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi                 #nota Mi
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Do
pirate_Ado:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Do - Fa3/La3/Re - La3 - Do
pirate_A7:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
li $a1 350                #duracion de la nota
lw $a0 fa3                #nota Fa3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la3                #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 360                #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 minex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 la3                #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Fa3/La#3/Re - Fa3/La#3/Re
pirate_A8:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 dot_cor            #duracion de la nota
lw $a0 fa3                #nota Fa3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_s3              #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 fa3                #nota Fa3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_s3              #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Re - Mi - La3/Do/Fa - La3/Do/Fa
pirate_A9:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 mi                 #nota Mi
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 dot_cor            #duracion de la nota
lw $a0 la3                #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 la3                #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Re - Fa - La#3/Re/Sol - La#3/Re/Sol - Sol - La
pirate_A10:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 min_cor            #duracion de la nota
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a1 dot_cor            #duracion de la nota
lw $a0 la_s3              #nota La#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 la_s3              #nota La#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Re/Sol/La# - Re/Sol/La# - La - Sol - La/Re - Re
pirate_A11:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 dot_cor            #duracion de la nota
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_s               #nota La#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a1 min_cor            #duracion de la nota
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_s               #nota La#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 minex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_note             #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 dot_cor            #duracion de la nota
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: La#3/Re/Sol - Re/Fa/La - Re
pirate_A12:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 dot_cor            #duracion de la nota
lw $a0 la_s3              #nota La#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a1 min_cor            #duracion de la nota
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 dot_cor            #duracion de la nota
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Re - Fa - Sol3/Do#/Mi - Sol3/Do#/Mi
pirate_A13:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 dot_cor            #duracion de la nota
lw $a0 sol3               #nota Sol3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi                 #nota Mi
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a1 min_cor            #duracion de la nota
lw $a0 sol3               #nota Sol3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi                 #nota Mi
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Fa - Re - Sol3/Do#/Mi
pirate_A14:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
li $a1 350               #duracion de la nota
lw $a0 sol3               #nota Sol3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi                 #nota Mi
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 360                #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 minex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: La - Do5
pirate_Alado5:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 min_cor            #duracion de la nota
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do5                 #nota Do5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Fa/La/Re5 - Fa/La/Re5
pirate_A15:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 dot_cor            #duracion de la nota
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Re5 - Mi5 - La#/Re5/Fa5
pirate_A16:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 min_cor            #duracion de la nota
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 dot_cor            #duracion de la nota
lw $a0 la_s               #nota La#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: La#/Re5/Fa5
pirate_Alarefa5:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 min_cor            #duracion de la nota
lw $a0 la_s               #nota La#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 min_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Fa5 - Sol5 - La/Do5/Mi5 - La/Do5/Mi5 - Re5
pirate_A17:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol5               #nota Sol5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a1 dot_cor            #duracion de la nota
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do5                #nota Do5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do5                #nota Do5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Do5
pirate_Ado5:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 do5                #nota Do5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Do5 - Fa/La/Re5 - La - Do5
pirate_A18:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 do5                #nota Do5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
li $a1 350                #duracion de la nota
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_note             #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 360                #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 do5                #nota Do5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Fa/La#/Re5 - Fa/La#/Re5
pirate_A19:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 dot_cor            #duracion de la nota
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_s               #nota La#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_s               #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 minex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Re5 - Mi5 - La/Do5/Fa5 - La/Do5/Fa5
pirate_A20:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 dot_cor            #duracion de la nota
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do5                #nota Do5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do5                #nota Do5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Re5 - Fa5 - La#/Re5/Sol5 - La#/Re5/Sol5 - Sol5 - La5
pirate_A21:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 min_cor            #duracion de la nota
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a1 dot_cor            #duracion de la nota
lw $a0 la_s               #nota La#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol5               #nota Sol5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 la_s               #nota La#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol5               #nota Sol5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol5               #nota Sol5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la5                #nota La5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Re5/Sol5/La#5 - Re5/Sol5/La#5 - La5 - Sol5 - La5/Re5 - Re5
pirate_A22:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 dot_cor            #duracion de la nota
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol5               #nota Sol5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_s5              #nota La#5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a1 min_cor            #duracion de la nota
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol5               #nota Sol5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_s5              #nota La#5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 min_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la5                #nota La5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol5               #nota Sol5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la5                #nota La5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 dot_cor            #duracion de la nota
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: La#5/Re5/Fa5 - La#5/Re5/Sol5 - Re5/Fa5/La5 - Re5
pirate_A23:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 dot_cor            #duracion de la nota
lw $a0 la_s5              #nota La#5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 la_s5              #nota La#5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol5               #nota Sol5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la5                #nota La5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 dot_cor            #duracion de la nota
lw $a0 re5                #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 minex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
li $a0 25          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Re5 - Fa5 - Sol/Do#5/Mi5 - Sol/Do#5/Mi5 - Fa/Re5 - Mi/Do#5 - Fa/Re5
pirate_A24:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 min_cor            #duracion de la nota
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 dot_cor            #duracion de la nota
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do_s5              #nota Do#5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a1 min_cor            #duracion de la nota
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do_s5              #nota Do#5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 mi                 #nota Mi
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do_s5              #nota Do#5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 dot_cor            #duracion de la nota
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Fa/Re5 - Sol/Mi5 - La/Fa5 - La/Fa5 - La/Fa5 - La#/Sol5 - La/La5
pirate_A25:
addi $sp $sp -4
sw $ra 0($sp)
li $a1 320                #duracion de la nota
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 335                #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 335                #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 335                #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
li $a1 205                #duracion de la nota
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 225                #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 225                #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
li $a1 320                #duracion de la nota
lw $a0 la_s               #nota La#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol5               #nota Sol5
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 335                #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
li $a1 350                #duracion de la nota
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la5                #nota La5
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 365                #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Fa5 - Re5 - La - La#/Re5/La#5 - Fa5 - Re5 - La#
pirate_A26:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 min_cor            #duracion de la nota
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
li $a1 320                #duracion de la nota
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 335                #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
li $a1 320                #duracion de la nota
lw $a0 la_s               #nota La#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_s5              #nota La#5
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 335                #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a1 min_cor            #duracion de la nota
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
li $a1 320                #duracion de la nota
lw $a0 la_s               #nota La#5
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 335                #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 min_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Re - La3 - Fa3/La3/Re - Mi3/La3/Do#
pirate_A27:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 min_cor            #duracion de la nota
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 la3                #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 fa3                #nota Fa3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la3                #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 mi3                #nota Mi3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la3                #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do_s               #nota Do#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 min_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Do#5/Sol5
pirate_A28:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 min_cor            #duracion de la nota
lw $a0 do_s5              #nota Do#5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol5               #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause         #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: La/Re5/Fa5/La5
pirate_A29:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 min_cor            #duracion de la nota
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la5                #nota La5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 minex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: La#/Sol5/La#5 - La/Fa5/La5
pirate_A30:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 min_cor            #duracion de la nota
lw $a0 la_s               #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol5               #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_s5              #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la5                #nota La5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Sol/Do5/Mi5/Sol5
pirate_A31:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do5                #nota Do5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol5               #nota Sol5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: La/Do5/Fa5/La5
pirate_A32:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 min_cor            #duracion de la nota
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la5                #nota La5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: La/Fa5/La5
pirate_A33:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 min_cor            #duracion de la nota
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la5                #nota La5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: La#/Fa5/La#5
pirate_A34:
addi $sp $sp -4
sw $ra 0($sp)
li $a0 50                 #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 la_s               #nota La#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_s5              #nota La#5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
li $a0 50                 #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Sol/La#5/Re5/Sol5 - Fa/La#5/Re5/Fa5 - Mi/La/Do#5/Mi5 - Re/Fa/La/Re5
pirate_A35:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
li $a0 100                #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a1 min_cor            #duracion de la nota
li $v0 32                 #syscall sleep
syscall 
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_s5              #nota La#5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol5               #nota Sol5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 min_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_s5              #nota La#5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 min_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 mi                 #nota Mi
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do_s5                #nota Do#5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 min_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a1 dot_cor            #duracion de la nota
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall 
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Re - Mi - La3/Fa - Sol - La
pirate_A36:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 min_cor            #duracion de la nota
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 mi                 #nota Mi
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
li $a1 320                #duracion de la nota
lw $a0 la3                #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 335                #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: La#3/Sol - La3/Fa - Sol3/Mi - La3/Fa - Do/Sol - Do/La
pirate_A37:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 dot_cor            #duracion de la nota
lw $a0 la_s3              #nota La#3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la3                #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol3               #nota Sol3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi                 #nota Mi
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la3                #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Do/Mi/Sol - Fa - Sol - Do/Fa/La - Sol - Fa
pirate_A38:
addi $sp $sp -4
sw $ra 0($sp)
li $a1 320                #duracion de la nota
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi                 #nota Mi
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 335                #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
li $a1 320                #duracion de la nota
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 335                #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Sol3/Mi - La3/Fa - Sol3/Mi - Fa3/Re - Fa3/Re - Sol3/Mi - Do - Fa3/Re
pirate_A39:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 dot_cor            #duracion de la nota
lw $a0 sol3               #nota Sol3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi                 #nota Mi
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la3                #nota La3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol3               #nota Sol3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi                 #nota Mi
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa3                #nota Fa3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa3                #nota Fa3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol3               #nota Sol3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi                 #nota Mi
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 do                 #nota Do
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
li $a1 320                #duracion de la nota
lw $a0 fa3                #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re                 #nota Re
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 360                #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Re5 - Mi5 - La/Re5/Fa5 - Mi5 - Fa5
pirate_A40:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 min_cor            #duracion de la nota
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
li $a0 350                #duracion de la nota
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 370                #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Do5/Mi5/Sol5 - Do5/Fa5 - Do5/Mi5/Sol5 - Do5/Fa5/La5 - Do5/Mi5/Sol5 - La/Re5/Fa5 - Fa/La#/Re5
pirate_A41:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 dot_cor            #duracion de la nota
lw $a0 do5                #nota Do5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol5               #nota Sol5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do5                #nota Do5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do5                #nota Do5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol5               #nota Sol5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do5                #nota Do5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la5                #nota La5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 do5                #nota Do5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol5               #nota Sol5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
li $a1 320                #duracion de la nota
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_s               #nota La#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 335                #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Re5 - Mi5 - La/Re5/Fa5 - La/Re5/Sol5 - La/Re5/La5 - Re5/Sol5/La#5 - Re5 - La#/Re5/Sol5 - La/Re5/Fa5
pirate_A42:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 min_cor            #duracion de la nota
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 dot_cor            #duracion de la nota
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol5               #nota Sol5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la5                #nota La5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol5               #nota Sol5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_s5              #nota La#5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_s               #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol5               #nota Sol5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
li $a1 320                #duracion de la nota
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 335                #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Sol5 - Mi5 - Fa/La/Re5 - Mi5 - Sol/Do#5 - La/Re5/Fa5/La5 - La#/Re5/Fa5/La#5
pirate_A43:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 min_cor            #duracion de la nota
lw $a0 sol5               #nota Sol5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 dot_cor            #duracion de la nota
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
li $a1 330                #duracion de la nota
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 360                #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 dot_cor            #duracion de la nota
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do_s5              #nota Do#5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
li $a1 320                #duracion de la nota
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la5                #nota La5
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 325                #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_s               #nota La#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_s5              #nota La#5
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 325                #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: La/Do5/Fa5/La5
pirate_A44:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do5                #nota Do5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la5                #nota La5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Sol/Do5/Mi5/Sol5 - Sol/La#/Re5/Sol5 - Fa/La/Re5/Fa5
pirate_A45:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 dot_cor            #duracion de la nota
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do5                #nota Do5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol5               #nota Sol5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 midex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_s               #nota La#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 sol5               #nota Sol5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 midex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 midex_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Sol/Do#5/Mi5 - La/Re5/Fa5 - Sol/Do#5/Mi5
pirate_A46:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 min_cor            #duracion de la nota
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do_s5              #nota Do#5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 min_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 min_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do_s5              #nota Do#5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 min_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Sol/Mi5 - Fa/Re5 - Re5 - Mi5 - Fa5
pirate_A47:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 min_cor            #duracion de la nota
lw $a0 sol                #nota Sol
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 dot_cor            #duracion de la nota
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 midex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
li $a1 340                #duracion de la nota
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la5                #nota La5
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 380                #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
li $a1 340                #duracion de la nota
lw $a0 la_s               #nota La#
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_s5              #nota La#5
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 380                #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 mi5                #nota Mi5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
li $a0 100                #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Do5/Fa5/La5/Do6
pirate_A48:
addi $sp $sp -4
sw $ra 0($sp)
lw $a0 minex_pause        #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 min_cor            #duracion de la nota
lw $a0 do5                #nota Do5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 fa5                #nota Fa5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la5                #nota La5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 do6                #nota Do6
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 min_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Clave de Sol: Fa/La/Re5 - Re3/La2
pirate_A49:
addi $sp $sp -4
sw $ra 0($sp)
lw $a1 dot_neg              #duracion de la nota
lw $a0 fa                 #nota Fa
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la_note            #nota La
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 re5                #nota Re5
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 dob_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 dob_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a1 redonda            #duracion de la nota
lw $a0 re3                #nota Fa3
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 la2                #nota La2
li $v0 31                 #syscall para reproducir la nota
syscall
lw $a0 red_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $a0 mid_pause          #pausa entre notas
li $v0 32                 #syscall sleep
syscall
lw $ra 0($sp)
addi $sp $sp 4
jr $ra
#Iba a haber song3 pero por tiempo y porque ya son muchas lineas, fue descartada:)
#------------------------------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------------------------------#
                               #---   Manejamos el comando 'palindrome'   ---#                    
#------------------------------------------------------------------------------------------------------------#
case_palindrome:
jal count_args
beqz $v0 print_few_args              #pocos argumentos, al menos uno
li $t0 1
bgt $v0 $t0 print_many_args          #demasiados argumentos
#Preparamos la pila para guardar los registros
addi $sp $sp -16
sw $ra 0($sp)                        #guardamos la direccion de regreso
sw $s0 4($sp)                        #guardamos cadena original limpia
sw $s1 8($sp)                        #guardamos el apuntador para avanzar dentro del buffer de salida
sw $s2 12($sp)                       #guardamos el inicio del buffer de salida
la $a0 args                          #cargamos argumentos del usuario
jal clear_string                     #limpiamos la cadena
move $s0 $v0                         #asignamos a $s0 la cadena limpia
li $v0 4
move $a0 $s0                         #imprimimos la cadena orginal, args
syscall
move $a0 $s0
la $a1 args_rev                      #buffer para almacenar la cadena invertida
jal rev_arg                          #revertimos la cadena
move $a0 $s0                         #cadena original
la $a1 args_rev                      #cadena revertida
jal strcmp                           #comparamos ambas cadenas
beqz $v0 print_not_pal               #si no son iguales, no es palindromo
li $v0 4
la $a0 its_palindrome
syscall
j print_pal_result
#------------------------------------------------------------
#------------------------------------------------------------
#---   Subrutinas para definir si la cadena ingresada es palindromo o no.   ---#
#------------------------------------------------------------
#Si no es palindormo, imprimimos
print_not_pal:
li $v0 4
la $a0 not_palindrome
syscall
#Imprimimos los resultados y restauramos los registro
print_pal_result:
li $v0 4
la $a0 args_rev          #imprimimos la cadena revertida
syscall
li $v0 4
la $a0 new_line
syscall
lw $ra 0($sp)
lw $s0 4($sp)
lw $s1 8($sp)
lw $s2 12($sp)
addi $sp $sp 16
j main_loop
#Revertimos la cadena
rev_arg:
addi $sp $sp -16
sw $ra 0($sp)            #guardamos la direccion de regreso
sw $s0 4($sp)            #guardamos la direccion de la cadena original
sw $s1 8($sp)            #guardamos la posicion en buffer de salida
sw $s2 12($sp)           #guardamos el inicio del buffer de salida
move $s0 $a0             #guardamos la cadena original
move $s1 $a1             #asignamos a $s1 el buffer para la cadena inversa
move $s2 $a1             #copiamos el inicio del buffer
jal strlen      
move $t0 $v0             #longitud
add $t1 $s0 $t0          #apuntador al final
subi $t1 $t1 1           #ultimo caracter
#Loop para invertir la cadena caracter por caracter
reverse_loop:
bltz $t0 reverse_done          #si la longitud es negativa, terminamos (caso borde)
lb $t2 ($t1)                   #cargamos el caracter desde el final
sb $t2 ($s1)                   #lo escribimos en el buffer de salida
addi $s1 $s1 1                 #avanzamos en el buffer de salida
subi $t1 $t1 1                 #retrocedemos en la cadena original
subi $t0 $t0 1                 #decrementamos el contador
j reverse_loop
#Terminamos la cadena revertida y restauramos los registros
reverse_done:
sb $zero ($s1)          #definimos el final de la cadena
move $v0 $s2            #devolvemos el inicio del buffer revertido
lw $ra 0($sp)
lw $s0 4($sp)
lw $s1 8($sp)
lw $s2 12($sp)
addi $sp $sp 16
jr $ra
#Calculamos la longitud de cadena
strlen:
li $v0 0          #definimos un contador de la longitud
strlen_loop:
lb $t0 ($a0)                  #cargamos el byte actual
beqz $t0 strlen_done          #si es null, terminamos
addi $v0 $v0 1                #incrementamos el contador
addi $a0 $a0 1                #avanzamos al siguiente caracter
j strlen_loop
#Regresamos la longitud en $v0
strlen_done:
jr $ra    
#------------------------------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------------------------------#
                               #---   Manejamos el comando 'exit'   ---#                    
#------------------------------------------------------------------------------------------------------------#
case_exit:
jal count_args
bnez $v0 print_many_args          #exit no acepta argumentos
li $v0 50                         #preguntamos que el usuario confirme su salida
la $a0 exit_confirm
syscall
beq $a0 2 main_loop               #si el usuario elige 'Cancelar', volvemos a main_loop
beq $a0 1 main_loop               #si el usuario elige 'No', volvemos a main_loop
beq $a0 0 exit_program            #si el usuario elige 'Si', terminamos el programa
j main_loop
#------------------------------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------------------------------#
                          #---   Subrutinas auxiliares para todo el programa   ---#                    
#------------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------
#---   Subrutinas auxiliares para comparar la igualdad de dos cadenas.   ---#
#------------------------------------------------------------
#Comparacion de cadenas
strcmp:
move $t0 $a0          #asignamos a $t0 el comando a comparar
move $t1 $a1          #asignamos a $t1 el input del usuario
#Comparamos byte a byte ambas cadenas mediante un loop
strcmp_loop:
lb $t2 0($t0)               #cargamos el siguiente byte del comando a $t2
lb $t3 0($t1)               #cargamos el siguiente byte del input a $t3
bne $t2 $t3 cmpneq          #si los caracteres son diferentes, salimos
beqz $t2 cmpeq              #si llegamos al final de ambas cadenas, son iguales
addiu $t0 $t0 1             #avanzamos al siguiente byte del comando
addiu $t1 $t1 1             #avanzamos al siguiente byte del input
j strcmp_loop               #repetimos el ciclo con el siguiente caracter
#Las cadenas son distintas
cmpneq:
li $v0 0          #asignamos cero a $v0, regresamos falso
jr $ra
#Las cadenas son iguales
cmpeq:
li $v0 1          #asignamos uno a $v0, regresamos true
jr $ra
#------------------------------------------------------------
#------------------------------------------------------------
###---   Subrutinas auxiliares para limpiar la cadena y evitar que el programa truene.   ---###
#------------------------------------------------------------
#Limpiamos la cadena de args
clear_string:
move $t0 $a0          #apuntamos al inicio de args
move $v0 $a0          #apuntamos el retorno (el inicio)
#Buscamos primer caracter que no sea un espacio
find_start:
lb $t1 0($t0)
beqz $t1 clear_end                    #encontramos null terminamos
li $t2 32                             #espacio en ASCII
beq $t1 $t2 skip_space_start          #omitimos los espacios antes de la cadena
li $t2 9                              #tab en ASCII
beq $t1 $t2 skip_space_start          #omitimos los espacios antes de la cadena
move $v0 $t0
j find_end
#Omitimos el espacio
skip_space_start:
addi $t0 $t0 1
j find_start
#Buscamos el final de arg
find_end:
lb $t1 0($t0)
beqz $t1 clear_end                     #encontramos null terminamos
li $t2 32                              #espacio en ASCII
beq $t1 $t2 replace_with_null          #sustituimos con null el final de la cadena
li $t2 9                               #tab en ASCII
beq $t1 $t2 replace_with_null
addi $t0 $t0 1
j find_end
replace_with_null:
li $t1 0
sb $t1 0($t0)          #terminamos la cadena
    
clear_end:
jr $ra
#------------------------------------------------------------
#------------------------------------------------------------
###---   Subrutinas auxiliares para imprimir errores.   ---###
#------------------------------------------------------------
#Mensaje de error cuando el usuario ingresa un comando invalido
print_invalid_command:
li $v0 55                       #cargamos el mensaje de dialogo para el error
la $a0 invalid_command          #cargamos el mensaje a mostrar en el dialogo
j print_error
#Mensaje de error cuando el usuario ingresa un argumento o argumentos invalido
print_invalid_args:
li $v0 55                    #cargamos el mensaje de dialogo para el error
la $a0 invalid_args          #cargamos el mensaje a mostrar en el dialogo
j print_error
#Mensaje de error de muchos argumentos
print_many_args:
li $v0 55                 #cargamos el mensaje de dialogo para el error
la $a0 many_args          #cargamos el mensaje a mostrar en el dialogo
j print_error
#Mensaje de error de pocos argumentos
print_few_args:
li $v0 55                #cargamos el mensaje de dialogo para el error
la $a0 few_args          #cargamos el mensaje a mostrar en el dialogo
j print_error
#Mensaje de error cuando el usuario ingresa un numero muy alto de monedas
print_many_coins:
li $v0 55                  #cargamos el mensaje de dialogo para el error
la $a0 many_coins          #cargamos el mensaje a mostrar en el dialogo
j print_error
#Mensaje de error al leer argumentos
print_args_error:
li $v0 55                  #cargamos el mensaje de dialogo para el error
la $a0 args_error          #cargamos el mensaje a mostrar en el dialogo
j print_error
#Mensaje de error cuando el usuario ingresa un archivo inexistente
print_file_error:
li $v0 55                  #cargamos el mensaje de dialogo para el error
la $a0 file_error          #cargamos el mensaje a mostrar en el dialogo
j print_error
#Imprimimos el error correspondiente y volvemos al main
print_error:
li $a1 0          #tipo de icon
syscall
j main_loop
#------------------------------------------------------------------------------------------------------------#
                               #---   Finalizamos todo el programa   ---#                    
#------------------------------------------------------------------------------------------------------------#
exit_program:
li $v0 4
la $a0 exit_msg
syscall
li $v0 10          #syscall para salir
syscall            #terminar el programa
#------------------------------------------------------------------------------------------------------------#