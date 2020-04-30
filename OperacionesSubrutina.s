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
dato: .asciz "Si entro en suma"
show: .asciz "Valor de r1 es : %d\n"
show1: .asciz "Valor de r2 es : %d\n"

.text
.align 2
.global sumaH

sumaH:
	push {lr}
	
	add r1, r1, r3
	mov r1, r1
	ldr r0, =resultadoSuma
	bl printf
	pop {lr}
	mov pc, lr

.global multiplicacionH
multiplicacionH:
	push {lr}
	mul r1,r1,r3
	mov r1, r1
	ldr r0, =resultadoProducto
	bl printf
	pop {lr}
	mov pc, lr

modulo:
	push {lr}
	add r1, r1, r0
	ldr r0, =resultadoProducto
	bl printf
	pop {lr}
	mov pc, lr

.global potenciaH
potenciaH:
	push {lr}
	ciclo:
		mul r1, r1, r1
		sub r3, #1
		cmp r3, #1
		bne ciclo
	
	ldr r0, =resultadoPotencia
	bl printf
	pop {lr}
	mov pc, lr
