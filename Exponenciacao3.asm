.data
	inputX: .asciiz "Insira um numero: "
	inputExp: .asciiz "Insira o valor do expoente: "
	resultado: .asciiz "O resultado é: "
.text
.globl main

	main:	
		li $v0, 4
		la $a0, inputX		# Pede um numero ao usuário
		syscall
	
		li $v0, 5		# Lê o numero digitado pelo usuario e armazena em x
		syscall
	
		la $a2, ($v0) 
	
		li $v0, 4
		la $a0, inputExp	# Pede o valor do expoente
		syscall
	
		li $v0, 5 		# Lê o numero digitado pelo usuario e armazena em exp
		syscall
	
		la $a1, ($v0)
	
		jal powerBase2		# Chama a funcao
	
		move $t1, $v0		# t1 recebe o returno da funcao 
	
		li $v0, 4
		la $a0, resultado 	# Printa a label do resultado
		syscall
	
		li $v0, 1
		move $a0, $t1 		# Printa o resultado
		syscall
	
	exit:
		
		li $v0, 10 		
		syscall
	
	powerBase2:
	
		beq $a1, 0, exp0 	# Se o expoente for 0, retorna x
		beq $a1, 1, exp1 	# Se o expoente for 1, retorna x * 2
		li $v0, 2 		# Valor da base
		subi $a1, $a1, 1   	# Decrementa em 1 o exp
		sllv $v0, $v0, $a1 	# Desloca exp bits à esquerda de v0
		mul $v0, $v0, $a2  	# v0 *= x
		jr $ra
	
		exp0:
			move $v0, $a2 	# Retorna x
			jr $ra
	
		exp1:
			mul $v0, $a2, 2 # Retorna x * 2
			jr $ra