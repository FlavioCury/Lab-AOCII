.data
.text
.globl main

	main:

		li $a1, 3		# int exp = 3
	
		jal powerBase2
	
		move $t1, $v0		# t1 recebe o returno da funcao
	
		li $v0, 1
		move $a0, $t1		# printa o resultado
		syscall
	
	exit:
	
		li $v0, 10 
		syscall

	powerBase2:
	
		li $v0, 2
		sllv $v0, $v0, $a1	# v0 = 2 << exp
		jr $ra			# return v0
	