.data
prompt1: .asciiz "Ingrese el primer número: "
prompt2: .asciiz "Ingrese el segundo número: "
prompt3: .asciiz "Ingrese el tercer número: "
message: .asciiz "\nEl número más pequeño es: "

.text
.globl main

main:
    # Solicitar al usuario ingresar los tres números
    li $v0, 4
    la $a0, prompt1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0  # Primer número en $t0

    li $v0, 4
    la $a0, prompt2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0  # Segundo número en $t1

    li $v0, 4
    la $a0, prompt3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0  # Tercer número en $t2

    # Determinar el número más pequeño
    blt $t1, $t0, L1
    move $t1, $t0  # El número más pequeño está en $t1
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
