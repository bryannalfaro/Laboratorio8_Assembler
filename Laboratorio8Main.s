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

formatoOpcion: .asciz "%s" 
opcionIngreso: .asciz " "

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
	b inicio

multiplicacionLlamado:
	ldr r0, =multPrint  /*PROBANDO QUE SI ENTRE*/
	bl puts	
	b inicio

moduloLlamado:
	ldr r0, =moduloPrint  /*PROBANDO QUE SI ENTRE*/
	bl puts	
	b inicio

potenciaLlamado:
	ldr r0, =potenciaPrint  /*PROBANDO QUE SI ENTRE*/
	bl puts	
	b inicio

resultadoAlmacenadoLlamado:
	ldr r0, =resultadoPrint  /*PROBANDO QUE SI ENTRE*/
	bl puts
	
	b inicio
