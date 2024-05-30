.data	
.text
.globl main

	main:
		
		li $a1, 2		# b = 2
		li $a2, 3		# e = 3 (exp)
		
		jal power
		
		move $t1, $v0 # t1 recebe o retorno da funcao
		
		li $v0, 1
		move $a0, $t1 		
		syscall
	
	exit:
		
		li $v0, 10
		syscall
		
	power:
	
		li $t0, 0		# incrementador
		li $v0, 1		# resultado
		
		for:
			beq $t0, $a2, exit_pow	# caso incremento seja igual a e, vai pro fim funcao
			mul $v0, $v0, $a1 	# multiplica base com resultado e armazena no resultado
			addi $t0, $t0, 1 	# incrementar $t0 em 1
			j for			# mantem o loop
			
		exit_pow:
			
			jr $ra
	