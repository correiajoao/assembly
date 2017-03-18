# Multiplicação de números sem usar a função mul
# Registradores de entrada t0, t1
# Registrador de saída s0

addi $t0, $zero, -3
addi $t1, $zero, -4

addi $sp, $sp, -8 # Ajustando pilha para 2 itens
sw $t0, 4($sp) # Salva t0
sw $t1, 0($sp) # Salva t1

abs $t0, $t0 # Calcula o módulo de t0
abs $t1, $t1 # Calcula o múdulo de t1

# Realiza a multiplicação dos números em módulo
loop:
beq $t3, $t0, sinal # Se t3 = t0, vá para sinal
add $s0, $s0, $t1   # Soma t1 a s0, registrador de resultado
add $t3, $t3, 1     # Soma 1 a t3, registrador de controle da multiplicação
j loop

# Nesse ponto a multiplicação já foi efetuada, apenas iremos inserir o sinal no resultado
sinal:
lw $t0, 4($sp)    # Recupera t0 original
lw $t1, 0($sp)    # Recupera t1 original
addi $sp, $sp, 8  # Desaloca duas posições na pilha

slt $t2, $t0, $zero # t2 = 1, se t0 < 0
slt $t3, $t1, $zero # t3 = 1, se t1 < 0

xor $t4, $t2, $t3   # Faz um xor de to < 0 e t1 < 0
beq $t4, $zero, end # Se ambos tiverem o mesmo sinal, o resultado é positivo, vá para o fim
neg $s0, $s0        # Caso um dos números seja negativo, adicione o sinal - ao resultado

end:
