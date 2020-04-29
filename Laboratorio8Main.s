/*UNIVERSIDAD DEL VALLE DE GUATEMALA*/
/*BRYANN EDUARDO ALFARO HERNANDEZ 19372*/
/*DIEGO DE JESUS ARREDONDO TURCIOS 19422*/
/*LABORATORIO 8 Menu para realizar operaciones con subrutinas*/
/*REFERENCIA GENERAL: CLASE VIRTUAL Y ARCHIVOS DE CLASE*/
/*ORGANIZACION DE COMPUTADORAS Y ASSEMBLER*/

.text
.align 2
.global main
.type main,%function

main:

	stmfd sp!, {lr}	/* SP = R13 link register */
	/* valor1 */
	
	
salida:
	/* salida correcta */
	mov r0, #0
	mov r3, #0
	ldmfd sp!, {lr}	/* R13 = SP */
	bx lr	