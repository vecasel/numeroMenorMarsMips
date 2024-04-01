.data
prompt1: .asciiz "Ingrese el primer n�mero: "
prompt2: .asciiz "Ingrese el segundo n�mero: "
prompt3: .asciiz "Ingrese el tercer n�mero: "
message: .asciiz "\nEl n�mero m�s peque�o es: "

.text
.globl main

main:
    # Solicitar al usuario ingresar los tres n�meros
    li $v0, 4
    la $a0, prompt1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0  # Primer n�mero en $t0

    li $v0, 4
    la $a0, prompt2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0  # Segundo n�mero en $t1

    li $v0, 4
    la $a0, prompt3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0  # Tercer n�mero en $t2

    # Determinar el n�mero m�s peque�o
    blt $t1, $t0, L1
    move $t1, $t0  # El n�mero m�s peque�o est� en $t1
L1:
    blt $t2, $t1, L2
    move $t2, $t1

L2:
    # Mostrar el resultado
    li $v0, 4
    la $a0, message
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    # Salir del programa
    li $v0, 10
    syscall
