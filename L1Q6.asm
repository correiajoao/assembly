# Fibonnaci - recursivo
# Registrador de entrada a0
# Registrador de saída v0

addi $a0, $zero, 5 # Parâmetro da função  a0 = X
jal fib
j end

fib:
addi $sp, $sp, -16 # Ajustando a pilha para 4 itens
sw $ra, 0($sp)     # Salva ra na pilha
sw $a0, 4($sp)     # Salva a0 na pilha

addi $t0, $zero, 2 # t0 = 2
sge  $t1, $t0, $a0 # t1 = 1 se t0 >= a0

beq $t1, $zero, L1 # Se t1 = 0, vá para L1
addi $v0, $zero, 1 # Senão v0 = 1
addi $sp, $sp, 16  # Desaloca a pilha
jr $ra		         # Retorna

L1:
lw $a0, 4($sp)	   # Restaura a0 armazenado na pilha
addi $a0, $a0, -1  # Subtrai 1 de a0
jal fib		   # Chama a função de fibonnaci recursiavamente para (a0 - 1)
sw $v0, 8($sp)     # Salva o resultado na pilha
addi $v0, $zero, 0 # v0 = 0, para eliminar qualquer lixo nas chamadas recursivas

lw $a0, 4($sp)	   # Restaura a0 armazenado na pilha
addi $a0, $a0, -2  # Subtrai 2 de a0
jal fib		         # Chama a função de fibonnaci recursiavamente para (a0 - 2)
sw $v0, 12($sp)    # Salva o resultado na pilha
addi $v0, $zero, 0 # v0 = 0, para eliminar qualquer lixo nas chamadas recursivas

lw $ra, 0($sp)     # Restaura ra
lw $a0, 4($sp)     # Restaura  a0
lw $t1, 8($sp)     # Restaura t1, o valor de v0 para (a0 - 1)
lw $t2, 12($sp)    # Restaura t2, o valor de v0 para (a0 - 2)
addi $sp, $sp, 16  # Desaloca a pilha

add $v0, $v0, $t1  # Soma a v0 o resultado t1
add $v0, $v0, $t2  # Soma a v0 o resultado t2
jr $ra

end:
