.data

	resultado: .asciiz "\nO resultado do fatorial de 10 é: "
	numero: .word 10
	resposta: .word 0
	
.text .globl Main

	main:
		
		# Chamada da função fatorial
		lw $a0, numero
		jal fatorial
		sw $v0, resposta
		
		# Mostra o resultado
		li $v0, 4
		la $a0, resultado
		syscall
		
		li $v0, 1
		lw $a0, resposta
		syscall
		
		# Fim do programa
		li $v0, 10
		syscall
		
.globl fatorial

	fatorial:
		
		subu $sp, $sp, 8
		sw $ra, ($sp)
		sw $s0, 4($sp)
		
		# Testa se chegou em 0
		li $v0, 1
		beq $a0, 0, fimfatorial
		
		# Chama o numero e subtrai 1 do seu valor
		move $s0, $a0
		sub $a0, $a0, 1
		jal fatorial
		
		# Multiplica os valores
		mul $v0, $s0, $v0
		
	fimfatorial:
	
		lw $ra, ($sp)
		lw $s0, 4($sp)
		addu $sp, $sp, 8
		jr $ra