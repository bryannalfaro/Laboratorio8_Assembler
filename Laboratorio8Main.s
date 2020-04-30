/*UNIVERSIDAD DEL VALLE DE GUATEMALA*/
/*BRYANN EDUARDO ALFARO HERNANDEZ 19372*/
/*DIEGO DE JESUS ARREDONDO TURCIOS 19422*/
/*LABORATORIO 8 Menu para realizar operaciones con subrutinas*/
/*REFERENCIA GENERAL: CLASE VIRTUAL Y ARCHIVOS DE CLASE*/
/*ORGANIZACION DE COMPUTADORAS Y ASSEMBLER*/
.data
.align 2


/*PRINTEOS DE PRUEBA QUE ENTRA A LAS ETIQUETAS*/
suma: .asciz "Estas en suma"
multPrint: .asciz "Estas en mult"
potenciaPrint: .asciz "Estas en potencia"
moduloPrint: .asciz "Estas en modulo"
resultadoPrint: .asciz "Estas en resultado"

/*MENSAJE DE ERROR AL INGRESAR AL MENU*/
errorMessage: .asciz "Error caracter invalido"

/*MENU*/
bienvenida:  .asciz "Bienvenido al programa de laboratorio.\nPorfavor escoga una de las siguientes opciones:"
opcion1:     .asciz "+ Para realizar una suma"
opcion2:     .asciz "* Para realizar una multiplicacion"
opcion3:     .asciz "M Para calcular el modulo"
opcion4:     .asciz "P Para realizar una operacion de potencia"
opcion5:     .asciz "= Para mostrar el resultado almacenado"
salirPrograma:     .asciz "q Para salir del programa"

valor: .asciz "Tu numero: %d\n"
ingresoValor: .asciz "%d"
formatoOpcion: .asciz "%s" 
opcionIngreso: .asciz " "

/*Registro que servira como historial*/
numero1: .word 0
numero2: .word 5 /*Solo como prueba para ver si se suma con el valor que ingreso*/


.text
.align 2
.global main
.type main,%function


main:

	stmfd sp!, {lr}	/* SP = R13 link register */
	/* valor1 */
	
	
	

inicio:

	/*PRESENTACION DE OPCIONES */
	ldr r0, =bienvenida
	bl puts
	ldr r0, =opcion1
	bl puts
	ldr r0, =opcion2
	bl puts
	ldr r0, =opcion3
	bl puts
	ldr r0, =opcion4
	bl puts
	ldr r0, =opcion5
	bl puts
	ldr r0, =salirPrograma
	bl puts

	/*INGRESO DE OPCION*/
	ldr r0,=formatoOpcion
	ldr r1,=opcionIngreso
	bl scanf
	
	/*COMPARAR OPCION INGRESADA PARA IR A ETIQUETA CORRESPONDIENTE*/
	
	ldr r1,=opcionIngreso
	ldrb r1,[r1]
	cmp r1,#'+'
	beq sumaLlamado /*Ir a tarea 1*/
	cmp r1,#'*'
	beq multiplicacionLlamado/*Ir a tarea 2*/
	cmp r1,#'M'
	beq moduloLlamado/*Ir a tarea 3*/
	cmp r1,#'P'
	beq potenciaLlamado /*Ir a tarea 4*/
	cmp r1, #'='
	beq resultadoAlmacenadoLlamado
	cmp r1, #'q'
	beq salida    /*Salir del programa*/
	b error
	
error:
	ldr r0, =errorMessage
	bl puts
	b inicio
	
salida:
	/* salida correcta */
	mov r0, #0
	mov r3, #0
	ldmfd sp!, {lr}	/* R13 = SP */
	bx lr

/*A PARTIR DE ACA SE LLAMAN A SUBRUTINAS DENTRO DE CADA ETIQUETA*/
sumaLlamado:
	
	ldr r0, =suma /*PROBANDO QUE SI ENTRE*/
	bl puts
	
	ldr r0, =ingresoValor
	ldr r1, =numero1
	bl scanf
	
	@ compara y salta si r0 es 0 (error)
	cmp r0,#0
	beq error
	
	@ imprime lo que recibio
	ldr r0,=valor
	ldr r1,=numero1
	ldr r1,[r1]
	bl printf 

	ldr r9, =numero2
	ldr r9, [r9]
	
	mov r1,r9 /*dato2*/
	ldr r2, =numero1
	ldr r2, [r2]
	
	mov r3, r2 /*dato1*/
	
	bl sumaH 
	
	mov r9, r1
	
	b inicio
	
multiplicacionLlamado:

	ldr r0, =multPrint  /*PROBANDO QUE SI ENTRE*/
	bl puts
	ldr r0, =ingresoValor
	ldr r1, =numero1
	bl scanf
	
	@ compara y salta si r0 es 0 (error)
	cmp r0,#0
	beq error
	
	@ imprime lo que recibio
	ldr r0,=valor
	ldr r1,=numero1
	ldr r1,[r1]
	bl printf 

	ldr r9, =numero2
	ldr r9, [r9]
	
	mov r1,r9 /*dato2*/
	ldr r2, =numero1
	ldr r2, [r2]
	
	mov r3, r2 /*dato1*/
	
	bl multiplicacionH 
	
	mov r9, r1
	
	b inicio

moduloLlamado:
	ldr r0, =moduloPrint  /*PROBANDO QUE SI ENTRE*/
	bl puts	
	
	ldr r0, =ingresoValor
	ldr r1, =numero1
	bl scanf
	
	@ compara y salta si r0 es 0 (error)
	cmp r0,#0
	beq error
	
	@ imprime lo que recibio
	ldr r0,=valor
	ldr r1,=numero1
	ldr r1,[r1]
	bl printf 

	ldr r9, =numero2
	ldr r9, [r9]
	
	mov r1,r9 /*dato2*/
	ldr r2, =numero1
	ldr r2, [r2]
	
	mov r3, r2 /*dato1*/
	
	bl moduloH 
	
	mov r9, r1
	
	b inicio
	
	

potenciaLlamado:
	ldr r0, =potenciaPrint  /*PROBANDO QUE SI ENTRE*/
	bl puts

	ldr r0, =ingresoValor
	ldr r1, =numero1
	bl scanf
	
	@ compara y salta si r0 es 0 (error)
	cmp r0,#0
	beq error
	
	@ imprime lo que recibio
	ldr r0,=valor
	ldr r1,=numero1
	ldr r1,[r1]
	bl printf 

	ldr r9, =numero2
	ldr r9, [r9]
	
	mov r1,r9 /*dato2*/
	ldr r2, =numero1
	ldr r2, [r2]
	
	mov r3, r2 /*dato1*/
	
	bl potenciaH 
	
	mov r9, r1
	
	b inicio

resultadoAlmacenadoLlamado:
	ldr r0, =resultadoPrint  /*PROBANDO QUE SI ENTRE*/
	bl puts
	
	b inicio
