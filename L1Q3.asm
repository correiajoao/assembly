#Inversão de string
# Entrada, .data
# Registradores de saída v0, v1

.data
strin: .asciiz "HArdwArE"
strout: .asciiz ""

.text
main:

la $t0, strin 	# Carrega em t0 o endereço da memória da string de entrada
la $t1, strout  # Carrega em t1 o endereço da memória da string de saída

#Leva um registrador t2 até o último caractere da palavra de entrada
countchar:
lb $t2, 0($t0) 			#Carrega um bit da palavra em t2
beq $t2, $zero, reverse		#Se t0 = 0, vá para reverse
add $t0, $t0, 1			#Soma 1 em t0
j countchar


# Inicia a escrita de forma inversa também como a inverte as letras
reverse:
add $t0, $t0, -1 	# Subtrai 1 de t0
lb $t2, 0($t0) 		# Carrega um bit da palavra de entrada em t2
beq $t2, $zero, end 	# Se t2 = 0, vá para end

# Define os limites de maiúsculo e minúsculo
addi $s0, $zero, 65 # A
addi $s1, $zero, 90 # Z
addi $s2, $zero, 97 # a
addi $s3, $zero, 122 # z

# Verifica se a letra é minúscula, maiúscula ou não é letra. Também como converte uper <-> lower case
sle $s4, $s0, $t2 	# s4 = 1 se 65 < t2
sle $s5, $t2, $s1 	# s5 = 1 se t2 < 90

and $s6, $s4, $s5 	# s6 = 1 se 65 < t2 < 90
beq $s6, $zero, elseif  # Se s6 = 0, vá para elseif

add $t2, $t2, 32        # Transforma a letra em maiúscula

sb $t2, 0($t1)          # Armazena a letra na string de saída
add $t1, $t1, 1         # Soma 1 em t1
j reverse		            # Volta para o loop de reversão

elseif:
sle $s4, $s2, $t2 	# s4 = 1 se 97 < t2
sle $s5, $t2, $s3 	# s5 = 1 se t2 < 122

and $s6, $s4, $s5 	# s6 = 1 se 97 < t2 < 122
beq $s6, $zero, else 	# Se s6 = 0, vá para else

add $t2, $t2, -32 	# Transforma a letra em minúscula
sb $t2, 0($t1) 		  # Armazena a letra na string de saída
add $t1, $t1, 1 	  # Soma 1 em t1
j reverse           # Volta para o loop de reversão

else:
addi $v1, $zero, 1 	# Caso não seja letra, adiciona 1 em v1
end:
