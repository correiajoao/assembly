# Código referente a conversão do código um
# Registradores de entrada t0, t1, t2
# Registrador de saída t2

 addi $t0, $zero, 2   # t0 = a = 2
 addi $t1, $zero, 1   # t1 = b = 1
 addi $t2, $zero, 0   # t2 = m = 0
 add $t2, $t0, $zero  # m = a

 slt $s0, $t1, $t2    # S0 = 1 se t1 < t2
 beq $s0, $zero, else # Se s0 = 0, vai para o fluxo do else

 #Fluxo do if
 add $t2, $t1, $zero  # m = b
 j end

 #Fluxo do else
 else:
 addi $t2, $zero, 0   # m = 0

 end:
