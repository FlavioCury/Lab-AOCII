.data
	calculadora: .asciiz "-----=====CALCULADORA=====-----\n"
	primeironum: .asciiz "Digite o primeiro n�mero: " 
	segundonum: .asciiz "Digite o segundo n�mero: " 
	operacao: .asciiz "1-) Adi��o\n2-) Subtra��o\n3-) Multiplica��o\n4-) Divis�o\n5-) Sair\nDigite uma opera��o: " 
	resultado: .asciiz "O resultado �: "
	resto: .asciiz "O resto �: "
	erro: .asciiz "O n�mero n�o pode ser dividido por 0\n"
	pulalinha: .asciiz "\n"
.text
.globl main
	
	main:
		li $v0, 4
		la $a0, calculadora
		syscall
	
	Operacao:
		
		li $v0, 4
		la $a0, operacao
		syscall
   
 		li $v0, 5
		syscall
		move $t2,$v0 
    
		beq $t2, 5, exit
		
		li $v0, 4
		la $a0, primeironum  
		syscall
		
		li $v0, 5  
		syscall
		move $t0, $v0 
		
		li $v0, 4
		la $a0, segundonum
		syscall
                               
		li $v0,5
		syscall
		move $t1, $v0
		
		beq $t2, 1, Adicao     
		beq $t2, 2, Subtracao    
		beq $t2, 3, Multiplicacao
		beq $t2, 4, Divisao

		j Operacao
	
	Adicao:
	
		add $t3, $t0, $t1
		
		li $v0, 4
		la $a0, resultado
		syscall
   
		li $v0, 1
		move $a0, $t3
		syscall
    
		li $v0, 4
		la $a0, pulalinha
		syscall
    
		li $v0, 4
		la $a0, pulalinha
		syscall
    
    		j Operacao
    
	Subtracao:
    
		sub $t3, $t0,$t1
		li $v0, 4
		la $a0, resultado
		syscall
   
		li $v0, 1
		move $a0, $t3
		syscall
    
		li $v0, 4
		la $a0, pulalinha
		syscall
    
		li $v0, 4
		la $a0, pulalinha
		syscall
    
		j Operacao
    
	Multiplicacao:
    
		mult $t1, $t0
		mflo $t3
    
		li $v0, 4
		la $a0, resultado
		syscall
   
		li $v0, 1
		move $a0, $t3
		syscall
    
		li $v0, 4
		la $a0, pulalinha
		syscall
    
		li $v0, 4
		la $a0, pulalinha
		syscall
    
		j Operacao
    
	Divisao:
	
		beqz $t1, Erro
		div $t0, $t1
		mflo $t3
		mfhi $t4
    
		li $v0, 4
		la $a0, resultado
		syscall
   
		li $v0, 1
		move $a0, $t3
		syscall
		
		li $v0, 4
		la $a0, pulalinha
		syscall
    
		bgtz $t4, Resto
    
		j Operacao
    
	Resto:
		li $v0, 4
		la $a0, resto
		syscall
   
		li $v0, 1
		move $a0, $t4
		syscall
    
		li $v0, 4
		la $a0, pulalinha
		syscall
    
		li $v0, 4
		la $a0, pulalinha
		syscall
		
		j Operacao
	
	Erro:
    		li $v0, 4
		la $a0, erro
		syscall
		
		j Operacao
    
	exit:
    
		li $v0, 10
		syscall