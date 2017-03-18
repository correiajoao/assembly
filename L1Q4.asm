# Soma de intervalo - recursivo
# Registradores de entrada a0, a1
# Registradores de saída v0, v1

addi $a0, $zero, 1 # Parâmetro da função  a0 = X
addi $a1, $zero, 5 # Parâmetro da função  a1 = Y
jal somar
j end

somar:
blt $a1, $a0, exception # Se a1 < a0, vá para exception

addi $sp, $sp, -8 # Ajustando pilha para 2 itens
sw $ra, 4($sp) 		# Salva ra na pilha
sw $a0, 0($sp) 		# Salva a0 na pilha

bne $a0, $a1, L1   	# Se a0 != a1, vá para L1

add $v0, $zero, $a0 	# Senão v0 = a0
addi $sp, $sp, 8    	# Desaloca dois itens na pilha
jr $ra		    				# Retorna

L1:
addi $a0, $a0, 1 	# Soma 1 a a0
jal somar					# Chama a função somar para (a0+1)

lw $ra, 4($sp) 		# Restaura ra
lw $a0, 0($sp) 		# Restaura a0 original
addi $sp, $sp, 8 	# Desaloca dois itens na pilha

add $v0, $v0, $a0  # Soma cada registro de a0 na pilha em v0
jr $ra 						 # Retorna


exception:
addi $v1, $zero, 1	 # v1 = 1 e finaliza o programa

end:
