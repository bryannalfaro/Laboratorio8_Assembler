/*UNIVERSIDAD DEL VALLE DE GUATEMALA*/
/*BRYANN EDUARDO ALFARO HERNANDEZ 19372*/
/*DIEGO DE JESUS ARREDONDO TURCIOS 19422*/
/*LABORATORIO 8 Subrutina donde se encuentran las operaciones a realizar*/
/*REFERENCIA GENERAL: CLASE VIRTUAL Y ARCHIVOS DE CLASE*/
/*ORGANIZACION DE COMPUTADORAS Y ASSEMBLER*/

.data
.align 2
resultadoSuma: .asciz "TU SUMA ES : %d\n"
dato: .asciz "Si entro en suma"

.text
.align 2
.global sumaH

sumaH:
	push {lr}
	add r3, r3, r1
	ldr r1, [r3]
	ldr r0, =resultadoSuma
	bl printf
	pop {lr}
	mov pc, lr

multiplicacion:
	push {lr}
	add r1, r1, r0
	ldr r0, =resultadoSuma
	bl printf
	pop {lr}
	mov pc, lr

modulo:
	push {lr}
	add r1, r1, r0
	ldr r0, =resultadoSuma
	bl printf
	pop {lr}
	mov pc, lr

potencia:
	push {lr}
	add r1, r1, r0
	ldr r0, =resultadoSuma
	bl printf
	pop {lr}
	mov pc, lr
