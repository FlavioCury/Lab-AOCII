    .data
msg: .asciiz "%d\n"
    .text
    .globl fatorial
fatorial:
    # Guarda o endereço de retorno
    sw $ra, 0($sp)
    # Guarda o valor de n
    sw $a0, 4($sp)
    # Corpo da função fatorial
    # Verifica se n <= 1
    lw $t0, 4($sp)      # Carrega n
    ble $t0, 1, caso_base   # Se n <= 1, vá para caso_base
    # n * fatorial(n-1)
    addi $a0, $a0, -1   # n-1
    jal fatorial        # Chama recursivamente fatorial
    lw $a0, 4($sp)      # Restaura o valor de n
    lw $t0, 4($sp)      # Carrega n
    mul $v0, $t0, $v0   # n * fatorial(n-1)
    # Recupera o endereço de retorno e retorna
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

caso_base:
    # Se n <= 1, retorna 1
    li $v0, 1
    # Recupera o endereço de retorno e retorna
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

.globl main
main:
    # Chama fatorial(10)
    li $a0, 10
    jal fatorial
    # Imprime o resultado
    move $a0, $v0
    li $v0, 1
    syscall
    # Termina o programa
    li $v0, 10
    syscall
