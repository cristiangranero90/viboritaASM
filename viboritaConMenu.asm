///////////////////////////////////////////////////////////////////
//              TP FINAL ORGANIZACION DEL COMPUTADOR             //  
//	              VIBORITA EN ASSEMBLER			 //
//			    GRUPO 10				 //
///////////////////////////////////////////////////////////////////













////////////
// DATOS  //
////////////



.data

mapa: .asciz "+------------------------------------------------+\n|               ****************                 |\n|               *** VIBORITA ***                 |\n|               ****************                 |\n+------------------------------------------------+\n|                                                |\n|                                                |\n|         @***                                   |\n|                                                |\n|                     M                          |\n|                                                |\n|                                                |\n|                                                |\n|                                                |\n+------------------------------------------------+\n| Puntaje:                      Nivel:           |\n+------------------------------------------------+\n"      @ \n enter
longitud = . - mapa
mapabackup: .asciz "+------------------------------------------------+\n|               ****************                 |\n|               *** VIBORITA ***                 |\n|               ****************                 |\n+------------------------------------------------+\n|                                                |\n|                                                |\n|         @***                                   |\n|                                                |\n|                     M                          |\n|                                                |\n|                                                |\n|                                                |\n|                                                |\n+------------------------------------------------+\n| Puntaje:                      Nivel:           |\n+------------------------------------------------+\n"      
menu: .ascii "                                               "
.ascii " 							\n"
.ascii "             \n"
.ascii " \n"
.ascii " \n"
.ascii " \n"
                                                             
                                                                          
                                                                          
.ascii "\033[35m				────╔╗───────╔╗\033[0m\000\n"
.ascii "\033[35m				────║║──────╔╝╚╗\033[0m\000\n"
.ascii "\033[35m				╔╗╔╦╣╚═╦══╦═╬╗╔╬══╗\033[0m\000\n"
.ascii "\033[35m				║╚╝╠╣╔╗║╔╗║╔╬╣║║╔╗║\033[0m\000\n"
.ascii "\033[35m				╚╗╔╣║╚╝║╚╝║║║║╚╣╔╗║\033[0m\000\n"
.ascii "\033[35m				─╚╝╚╩══╩══╩╝╚╩═╩╝╚╝\033[0m\000\n"

.ascii "  \n"

.ascii "\033[33m────────────╔═╗───╔═╗\n"
.ascii "─╔╦╦╦═╦═╗╔╦╗║╔╝╔╦╗╚╗║\n"
.ascii "─╠╣║║╬║╬╚╣╔╝║║─║║║─║║\n"
.ascii "╔╝╠═╬╗╠══╩╝─║╚╗╠╗║╔╝║\n"
.ascii "╚═╝─╚═╝─────╚═╝╚═╝╚═╝\n"
.ascii " \n"
.ascii "╔═╗────╔╗──╔═╗─────────╔═╗\n"
.ascii "║═╬═╗╔╗╠╬╦╗║╔╝╔═╗╔═╦╦╦╗╚╗║\n"
.ascii "╠═║╬╚╣╚╣║╔╝║║─║╬╚╣║║║║║─║║\n"
.ascii "╚═╩══╩═╩╩╝─║╚╗╚══╩╩═╬╗║╔╝║\n"
.ascii "───────────╚═╝──────╚═╝╚═╝\033[0m\000\n"

.ascii "				╔══╦═╦╦╦═╦═╗╔╗╔═══╗\n"
.ascii "				║╔═╣╬║║║╬║║╠╝║║╔═╗║\n"
.ascii "				║╚╗║╗╣║║╔╣║╠╗║║║║║║\n"
.ascii "				╚══╩╩╩═╩╝╚═╝║║║║║║║\n"
.ascii "				───────────╔╝╚╣╚═╝║\n"






.ascii "                                       \n"

menuLong = .-menu

cls: .asciz "\x1b[H\x1b[2J" 			@borrar la pantalla
lencls=.-cls
mensaje: .ascii " w=subir s=bajar a=izquierda d=derecha q=salir\n"

fila: .word 7   	@punto inicial de la viborita
col:  .word 10	  	@punto inicial de la viborita  
//
filav: .word 7
colv: .word 10
//
cola: .word 15
cadena:  .ascii "  "
//
puntos: .byte 0x30, 0x30 //Cero

gameOver: .ascii "                                            \n"
.ascii "\033[31m			──────────╔╗───╔╗\n"
.ascii "			──────────║║──╔╝╚╗\n"
.ascii "			╔══╦══╦═╦═╝╠╦═╩╗╔╬══╗\n"
.ascii "			║╔╗║║═╣╔╣╔╗╠╣══╣║║║═╣\n"
.ascii "			║╚╝║║═╣║║╚╝║╠══║╚╣║═╣\n"
.ascii "			║╔═╩══╩╝╚══╩╩══╩═╩══╝\n"
.ascii "			║║\n"
.ascii "			╚╝\033[0m\000\n"



.ascii "		╔═╗─────╔╗─────────────────╔╗\n"
.ascii "		║═╬╦╦═╦╦╣╚╦═╗╔╗╔═╗─╔═╦╦╦═╦╦╬╬══╦═╗\n"
.ascii "		╠═║║║╩╣╔╣╔╣╩╣║╚╣╬╚╗║╬║╔╣╬╠║╣║║║║╬╚╗\n"
.ascii "		╚═╩═╩═╩╝╚═╩═╝╚═╩══╝║╔╩╝╚═╩╩╩╩╩╩╩══╝\n"
.ascii "		───────────────────╚╝\n"
.ascii "		╔══╗──────╔╗──╔═╗──────────────────╔╗\n"
.ascii "		║╔═╬╦╦═╗╔═╬╬═╗║═╣╔═╦═╦╦╗─╔╦╦╦═╦═╗╔╦╣║\n"
.ascii "		║╚╗║╔╣╬╚╣═╣║╬╚╬═║║╬║╬║╔╝─╠╣║║╬║╬╚╣╔╣║\n"
.ascii "		╚══╩╝╚══╩═╩╩══╩═╝║╔╩═╩╝─╔╝╠═╬╗╠══╩╝╠╣\n"
.ascii "		─────────────────╚╝─────╚═╝─╚═╝────╚╝\n"


                                             
longGameover= .-gameOver
 //Salida por fin

ganaste:  .ascii "                                            \n"

.ascii "\033[32m			───────────────╔╗\n"
.ascii "			──────────────╔╝╚╗\n"
.ascii "			╔══╦══╦═╗╔══╦═╩╗╔╬══╗\n"
.ascii "			║╔╗║╔╗║╔╗╣╔╗║══╣║║║═╣\n"
.ascii "			║╚╝║╔╗║║║║╔╗╠══║╚╣║═╣\n"
.ascii "			╚═╗╠╝╚╩╝╚╩╝╚╩══╩═╩══╝\n"
.ascii "			╔═╝║\n"
.ascii "			╚══╝\033[0m\000\n"
.ascii "		╔══╗──────╔╗──╔═╗──────────────────╔╗\n"
.ascii "		║╔═╬╦╦═╗╔═╬╬═╗║═╣╔═╦═╦╦╗─╔╦╦╦═╦═╗╔╦╣║\n"
.ascii "		║╚╗║╔╣╬╚╣═╣║╬╚╬═║║╬║╬║╔╝─╠╣║║╬║╬╚╣╔╣║\n"
.ascii "		╚══╩╝╚══╩═╩╩══╩═╝║╔╩═╩╝─╔╝╠═╬╗╠══╩╝╠╣\n"
.ascii "		─────────────────╚╝─────╚═╝─╚═╝────╚╝\n"



longGanaste = .-ganaste
                                                        


posicionColaX: .word 7,7,7,0,0,0,0,0   //Arreglo de posicion X

posicionColaY: .word 11,12,13,0,0,0,0,0 //Arreglo de posicion Y

tamanioCola: .byte 3 //Tamanio de la cola de la vibora, se usa en el ciclo y ademas suma en puntaje

// codigoMovimiento: .byte 0 //0 no se mueve, 1 derecha, 2 izquierda, 3 arriba, 4 abajo (NO SE USA AUN)


///////////
// random//
///////////

manzanaFila: .word 9, 12, 6, 12, 13, 10, 9, 10   
manzanaColumna: .word 21, 5, 32, 4, 20, 5, 8, 43    
indice: .word 0




//////////////
// FUNCIONES//
//////////////

.text

////AGREGARMANZANA///////
//  R0 = MAPA          //
//  R1 = MANZANAFILA   //
//  R2 = MANZANACOLUMNA//
/////////////////////////

agregarManzana:

.fnstart
	push {lr}
	push {r0, r1, r2, r3, r4, r5}

	ldr r4,=indice
	ldr r5,[r4]
	add r5,#4
	strb r5,[r4]

	ldr r0,=mapa

	ldr r3,=indice
	ldr r3,[r3]

	mov r4,#77   
	mov r5,#51   

	ldr r1,=manzanaFila
	add r1,r3		
	ldr r1,[r1]

	ldr r2,=manzanaColumna
	add r2,r3		
	ldr r2,[r2]

	mul r1,r5  	
	add r1,r2  
	add r0,r1

	ldr r1, [r0]
	strb r4,[r0]	


	pop {r0, r1, r2, r3, r4, r5}
	pop {lr}

	bx lr
.fnend


///////////////////////
// SALIDAPORPUNTAJE  //
/////////////////////// 



salidaPorPuntaje:

.fnstart
	push {lr}
	push {r1, r2}
	ldr r1, =puntos //Puntero a puntos
	ldrb r1, [r1]   //Valor de puntos

	cmp r1, #0x35   //Compara con cinco
	bgt gano        //Sale si es mayor

	pop {r1, r2}
	pop {lr}
	bx lr

.fnend


///////////////
// PUNTAJE   //
// R1= PUNTOS//
// R0= MAPA  //
///////////////

puntaje:

.fnstart

	push {lr}
	push {r1,r2,r3,r4,r5}

	ldr r0, =mapa  //Puntero a mapa
	ldr r1, =puntos	//Puntero a puntos
	ldr r2, [r1] //Valor de puntos

	add r2, #0x1 //Suma un punto mas
	add r0, #776 //Posicion del puntaje en el mapa  C12, F15

	strb r2, [r0] //Guarda el nuevo valor en mapa
	strb r2, [r1] //Guarda el nuevo valor en puntos

	add r1, #1    //siguiente posicion de puntos
	ldr r2, [r1]  //Tomo el valor
	add r0, #1    //Una posicion mas en el mapa

	strb r2, [r0] //Guardo en el mapa
	strb r2, [r1] //Guardo en puntos(Segundo valor)

	//Suma cola pa ver que onda
	ldr r0, =tamanioCola
	ldrb r1, [r0]
	
	add r1, #1
	strb r1, [r0]	

	pop {r1, r2, r3, r4, r5}
	pop {lr}

	bx lr

.fnend


////////////////////////////////////////////////
// COMPARACION DE TECLAS PARA MOVIMIENTO      //
////////////////////////////////////////////////

s:
.fnstart
	push {lr}

	ldr r0, =fila		@ creo un acceso a la direccion de memoria de fila
	ldr r4, [r0]		@ cargo el contenido de la direccion de memoria para poder modificarlo
				@ cargo fila vieja para cuerpo de viborita
	ldr r5, =filav
	str r4, [r5]
	add r4, #1		@ sumo una unidad para generar el desplazamiento
	str r4, [r0]		@ guardo la suma en la direccion donde esta fila.
				@ guardamos columna en columna vieja por desfase de fila o columna

	ldr r0, =col		@ creo un acceso a la direccion de memoria de columna
	ldr r4, [r0]		@ cargo el contenido de la direccion de memoria para poder modificarlo

	ldr r5, =colv
	str r4, [r5]


	pop {lr}
	bx lr			@ vuelvo al origen de la llamada
.fnend

a:
.fnstart

	push {lr}

	ldr r0, =col		@ creo un acceso a la direccion de memoria de columna
	ldr r4, [r0]		@ cargo el contenido de la direccion de memoria para poder modificarlo

	ldr r5, =colv
	str r4, [r5]


	sub r4, #1		@ sumo una unidad para generar el desplazamiento
	str r4, [r0]		@ guardo el resultado de la operacion donde apunta la direccion

				@ guardamos fila en fila vieja por desfase de fila o columna

	ldr r0, =fila		@ creo un acceso a la direccion de memoria de columna
	ldr r4, [r0]		@ cargo el contenido de la direccion de memoria para poder modificarlo

	ldr r5, =filav
	str r4, [r5]

	pop {lr}

	bx lr			@ vuelvo al origen de la llamada
.fnend

d:
.fnstart

	push {lr}

	ldr r0, =col		@ creo un acceso a la direccion de memoria de columna
	ldr r4, [r0]		@ cargo el contenido de la direccion de memoria para poder modificarlo

	ldr r5, =colv
	str r4, [r5]


	add r4, #1		@ sumo una unidad para generar el desplazamiento
	str r4, [r0]		@ guardo el resultado de la operacion
				@ guardamos fila en fila vieja por desfase de fila o columna

	ldr r0, =fila		@ creo un acceso a la direccion de memoria de columna
	ldr r4, [r0]		@ cargo el contenido de la direccion de memoria para poder modificarlo

	ldr r5, =filav
	str r4, [r5]

	pop {lr}

	bx lr			@ vuelvo al origen de la llamada
.fnend

w:
.fnstart
	push {lr}

	ldr r0, =fila		@ creo un acceso a la direccion de memoria de columna
	ldr r4, [r0] 		@ cargo el contenido de la direccion de memoria para poder modificarlo

	ldr r5, =filav
	str r4, [r5]


	sub r4, #1		@ resto un valor al contenido
	str r4, [r0]		@ el resultado lo guardo en la direccion que apunta r0

				@ guardamos columna en columna vieja por desfase de fila o columna

	ldr r0, =col		@ creo un acceso a la direccion de memoria de columna
	ldr r4, [r0]		@ cargo el contenido de la direccion de memoria para poder modificarlo

	ldr r5, =colv
	str r4, [r5]

	pop {lr}

	bx lr			@ salida
.fnend

imprimir:
.fnstart
	push {lr}

    	mov r7, #4  		@ Salida por pantalla
    	mov r0, #1  		@ salida cadena
    	mov r2, #1  		@ TamaÃƒÂ±o de la cadena
    	ldr r1, =cadena 	@ Cadena a imprimir
    	swi 0       		@ salida

	pop {lr}
.fnend


//////////////////////////////////////////
// OBTENERNUEVAPOSICION                 //
//					//
// R0= FILA				//
// R1= COL				//
// R3= MAPA				//	
//////////////////////////////////////////


obtenerNuevaPosicion:
.fnstart
	push {lr}


			 	@calculo de fila r0 filas, r1 columnas parametros que recibe
				
	mov r4, #51         	@ en r4 cargamos tamaÃƒÂ±o total de filas de matriz
	mul r4, r0, r4      	@ r4 =numero de fila * tamaÃƒÂ±o de filas
	add r3,r4               @ r3 =puntero a la fila indicada en r0

        			@calculo de columnas

	add r3, r1  		@ r3= puntero a fila + columna

				@comparar con asterisco para hacer mas eficiente el codigo ysaltar todas las comparaciones
	cmp r2, #42
	beq noComparar
	cmp r2, #32 		@ tambien compara el Espacio para no ejecutar sin sentido
	beq noComparar
	haypared:
	ldrb r4, [r3]
	cmp r4,#45
	beq fin
	cmp r4, #124
	beq fin
	haycuerpo:
	cmp r4, #42 @
	beq fin

	haymanzana:
	cmp r4, #77
	bleq agregarManzana
	cmp r4, #77
	bleq puntaje



noComparar:

	strb r2, [r3]		 @ cargo el valor de arroba en r3
	pop {lr}
	bx lr			 @ salto a llamada
.fnend


///////////////////////
// IMPRIMIRMAPA      //
// R1= MAPA	     //
// R2= LONGITUD	     //
///////////////////////



imprimirMapa:
	.fnstart
	push {lr}

	mov r7, #4    			@Salida por pantalla
	mov r0, #1    			@Indicamos a swi que sera una cadena
	ldr r2, =longitud   		@TamaÃƒÂ±o de la cadena
	ldr r1, =mapa   		@Cargamos en r1 la direccion del mensaje
	swi 0   		        @exit

	pop {lr}
	bx lr
	.fnend




///////////////////////
// BORRARMAPA        //
// R1= CLS	     //
// R2= LENCLS	     //
///////////////////////


borrarMapa:

	.fnstart
	push {lr}

	mov r7, #4    			@Salida por pantalla
	mov r0, #1    			@Indicamos a swi que sera una cadena
	ldr r2, =lencls   		@TamaÃƒÂ±o de la cadena
	ldr r1, =cls   			@Cargamos en r1 la direccion del mensaje
	swi 0    			@exit

	pop {lr}
	bx lr
	.fnend




////////////////////////////////
// IMPRIMIRINSTRUCCIONES      //
// R1= MENSAJE	     	      //
// R2= LONGITUDMJE(47)	      //
////////////////////////////////


imprimirInstrucciones:
	.fnstart
	push {lr}
				@Imprimir instrucciones por pantalla
        mov r7, #4  		@ Salida por pantalla
    	mov r0, #1  		@ salida cadena
    	mov r2, #47 		@ TamaÃƒÂ±o de la cadena //Fijar el tamanio porque hace cosas raras
    	ldr r1, =mensaje
    	swi 0       	 	@ exit

	pop {lr}
	bx lr
	.fnend


///////////////////////
// PEDIRLETRA        //
// R1= CADENA	     //
// R2= LONGITUDCNA(2)//
///////////////////////


pedirLetra:
	.fnstart
	push {lr}
	 			@Leer el input del usuario
	mov r7, #3    		@ Lectura x teclado
	mov r0, #0  		@ Ingreso de cadena
	mov r2, #2    		@ Leer # caracteres
	ldr r1, =cadena		@ donde se guarda la cadena ingresada
	swi 0         	        @ salida sistema

	pop {lr}
	bx lr
	.fnend

///////////////////////
// REVISARLETRA      //
// R1= CADENA	     //
// 		     //
///////////////////////


revisarLetra:
	.fnstart
	push {lr}
	push {r1}

	ldr r1, =cadena
	ldrb r1, [r1]			@ cargo la letra tecleada anteriormente


	cmp r1, #97			@ a izquierda
	bleq a
	cmp r1, #115			@ s abajo
	bleq s
	cmp r1, #119			@ w arriba
	bleq w
	cmp r1, #100			@ d derecha
	bleq d
	cmp r1, #0x71			@ q salida
	beq fin

	pop {r1}
	pop {lr}
	bx lr
	.fnend



///////////////////////
// ACTUALIZARCABEZA  //
// R0= FILA	     //
// R1= COL	     //
// R2= SIMBOLO(ARR)  //
// R3= MAPA          //
///////////////////////




actualizarCabeza:
	.fnstart
	push {lr}
	push {r0, r1, r2, r3}
					//cabeza
 	ldr r0, =fila		@ cargo direccion de fila en r0
	ldr r0, [r0]		@ cargo contenido de fila
	ldr r1, =col		@ cargo direccion de columna
	ldr r1, [r1]		@ cargo contenido de columna
	mov r2, #64 		@ en r2 esta el simbolo arroba
	ldr r3, =mapa   	@ Cargo direccion de mapa en r3

	bl obtenerNuevaPosicion

	pop {r0, r1, r2, r3}
	pop {lr}
	bx lr
	.fnend



///////////////////////
// ACTUALIZARCOLA    //
// R0= FILAV	     //
// R1= COLV	     //
// R2= SIMBOLO(AST)  //
// R3= MAPA          //
// R5= TAMANIOCOLA   //
// R9= POSICIONCOLAX //
// R10= POSICIONCOLAY//
///////////////////////


actualizarCuerpo:

	.fnstart
	push {lr}
	push {r0, r1, r2, r3, r5, r6, r8}
				//cuerpo
	
	ldr r5, =tamanioCola
	ldrb r6, [r5]           //Contenido de tamanio en la cola
	mov r8, #0              //Contador para el ciclo

	ldr r0, =filav		@ cargo direccion de fila en r0
	ldr r0, [r0]		@ cargo contenido de fila
	ldr r1, =colv		@ cargo direccion de columna
	ldr r1, [r1]		@ cargo contenido de columna
	mov r2,  #42 		@ en r2 esta el simbolo asterisco //Revisar ACA

	ldr r9, =posicionColaX

	ldr r10, =posicionColaY

	ciclo:
	ldr r3, =mapa // Carga el mapa
	


	cmp r6, r8   //Sale cuando r6 valga cero
	beq salida
	
	bl obtenerNuevaPosicion

	ldrb r7, [r9] //en r7 la posicion de la cola X

	ldrb r11, [r10] //En r11, la posicion de la cola Y

	strb r0, [r9]  //Guarda la posicion vieja en el arreglo poscolaX
	strb r1, [r10] //Guarda la posicion vieja en el arreglo poscolaY

	mov r0, r7     //Copia necesaria para obtener nueva funcion, la de abajo igual
	mov r1, r11

	add r9, #4    //Cambia de posicion WORD, abajo tmb X e Y
	add r10, #4

	subs r6, #1		//Contador del ciclo, para corte

	bal ciclo	        //Vuelta al ciclo

	salida:
	
	mov r2, #32 //Agrega un Espacio para que se elimine el ultimo caracter (REVISAR BIEN QUE FUNCIONE)
	bl obtenerNuevaPosicion  //Ultima llamada para el espacio
	
	pop {r0, r1, r2, r3, r5, r6, r8}
	pop {lr}
	bx lr
	.fnend


///////////////////////
// JUGAR	     //
/////////////////////// 


jugar:
	
	.fnstart
	push {lr}

	bl borrarMapa

	bl imprimirMapa

	bl imprimirInstrucciones

  	bl pedirLetra

	bl revisarLetra

	bl actualizarCabeza

	bl actualizarCuerpo

	bl salidaPorPuntaje

	bal jugar

	pop {lr}
	.fnend

///////////////////////
// MOSTRAR MENU	     //
/////////////////////// 


mostrarMenu:

	.fnstart
	push {lr}

	mov r7, #4 // Salida por pantalla
	mov r0, #1 // Indicamos a SWI que serÃ¡ una cadena
	ldr r2, =menuLong //TamaÃ±o de la cadena
	ldr r1, =menu// Cargamos en r1 la direcciÃ³n del mensaje
	swi 0 // SWI, Software interrupt

	pop {lr}
	bx lr
	.fnend

///////////////////////
//      MAIN	     //
/////////////////////// 

.global main

main:

	bl borrarMapa

	bl mostrarMenu

	bl pedirLetra

verLetra:

        push {r1}

        ldr r1, =cadena
        ldrb r1, [r1]                   @ cargo la letra tecleada anteriormente

        cmp r1, #121                    @ y jugar
        bleq jugar
        cmp r1, #0x71                   @ q salida
        beq fin
	

	bal fin


gano:
	bl borrarMapa
	//Imprime ganaste
        mov r7, #4
        mov r0, #1
        ldr r2, =longGanaste
        ldr r1, =ganaste
        swi 0
	bl salidaSistema

        

fin:
	bl borrarMapa
	//Imprime game over
	mov r7, #4
	mov r0, #1
	ldr r2, =longGameover
	ldr r1, =gameOver
	swi 0

salidaSistema:

	mov r7, #1    @ Salida al sistema
	swi 0

