/*UNIVERSIDAD DEL VALLE DE GUATEMALA*/
/*BRYANN EDUARDO ALFARO HERNANDEZ 19372*/
/*DIEGO DE JESUS ARREDONDO TURCIOS 19422*/
/*LABORATORIO 8 Subrutina donde se encuentran las operaciones a realizar*/
/*REFERENCIA GENERAL: CLASE VIRTUAL Y ARCHIVOS DE CLASE*/
/*ORGANIZACION DE COMPUTADORAS Y ASSEMBLER*/

.data
.align 2
resultadoSuma: .asciz "TU SUMA ES : %d\n"
resultadoProducto: .asciz "TU PRODUCTO ES : %d\n"
resultadoPotencia: .asciz "TU POTENCIA ES : %d\n"
resultadoModulo: .asciz "TU MODULO ES : %d\n"
dato: .asciz "Si entro en suma"
show: .asciz "Valor de r1 es : %d\n"
show1: .asciz "Valor de r2 es : %d\n"

.text
.align 2
.global sumaH

sumaH:
	push {lr}
	and r5, #0
	add r5, r1, r3
	add r1, r1, r3
	ldr r0, =resultadoSuma
	bl printf
	pop {lr}
	mov pc, lr

.global multiplicacionH
multiplicacionH:
	push {lr}
	and r5, #0
	mul r5, r1, r3
	mul r1,r1,r3
	mov r1, r1
	ldr r0, =resultadoProducto
	bl printf
	pop {lr}
	mov pc, lr

.global moduloH
moduloH:
	push {lr}
	
	and r5, #0
	/*Division por metodo de resta continua*/
	resta:
		sub r1, r1, r3
		mov r4, r1
		add r5, r5, #1
		cmp r1, r3
		bgt resta
		blt impresion
	
	impresion:
		mov r4, r1
		ldr r0, =resultadoModulo
		bl printf
		pop {lr}
		mov pc, lr

.global potenciaH
potenciaH:
	push {lr}
	mov r4, r1
	cmp r3, #1
	beq potencia1
	cmp r3, #0
	beq potencia0
	
	
	ciclo:
		mul r1, r4, r1
		sub r3, #1
		cmp r3, #1
		bne ciclo
	mov r5, r1
	mov r1, r1
	ldr r0, =resultadoPotencia
	bl printf
	b salir
	
	potencia1:
	ldr r0, =resultadoPotencia
	bl printf
	b salir
	
	potencia0:
		mov r1, #1
		ldr r0, =resultadoPotencia
		bl printf
		b salir
	salir:
	pop {lr}
	mov pc, lr
	