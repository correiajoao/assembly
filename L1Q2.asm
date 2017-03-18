# Código referente a questão dois
# Registradores de entrada t0, t1, t2
# Registrador de saída t2

addi $t0, $zero, -1 	# t0 = a = 5
addi $t1, $zero, 0 		# t1 = b = 3
addi $t2, $zero, 0 		# t2 = x = 0

#Fluxo do if
slt $s0, $zero, $t0 	# s0 = 1, se a > 0
and $s1, $t0, $zero 	# s1 = 1, se a = 0
or $s3, $s0, $s1 			# s3 = 1, se a > 0 ou a = 0

slt $s4, $t0, $t1 		# s4 = 1, se a < b

and $s5, $s3, $s4 		# s5 = 1, se (a >= 0 && a < b)

beq $s5, $zero, elseif 	# se s5 = 0, vá para o elseif
addi $t2, $zero, 1 			# t2 = x = 1
j end

#Fluxo do elseif
elseif:
slt $s0, $t0, $zero 		# s0 = 1, se a < 0
slt $s1, $t1, $t0 			# s1 = 1, se b < a
and $s3, $s0, $s1 			# s3 = 1, se (a < 0 && a > b)

beq $s3, $zero, 				# Else se s3 = 0, vá para o else
addi $t2, $zero, 2 # t2 = x = 2
j end

#Fluxo do else
else:
addi $t2, $zero, 3 			# t2 = x = 3

end:
