    .equ SCREEN_WIDTH,640
    .equ SCREEN_HEIGH,480
    .equ BITS_PER_PIXEL,32
	 
	.extern rectangulo
	.extern circulo

    .globl main
    .globl rectangulo
    .globl circulo

main:
	// x0 contiene la direccion base del framebuffer
 	mov x20, x0	// Guarda la dirección base del framebuffer en x20
	//---------------- CODE HERE ------------------------------------

	movz x10, 0xFF00, lsl 16
	movk x10, 0x0000, lsl 00

	mov x2, SCREEN_HEIGH         // Y Size
loop1:
	mov x1, SCREEN_WIDTH         // X Size
loop0:
	stur w10,[x0]  // Colorear el pixel N
	add x0,x0,4	   // Siguiente pixel
	sub x1,x1,1	   // Decrementar contador X
	cbnz x1,loop0  // Si no terminó la fila, salto
	sub x2,x2,1	   // Decrementar contador Y
	cbnz x2,loop1  // Si no es la última fila, salto

	//---------------------Pacman---------------------
	
	movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xCE00, lsl 00		// completo color
    mov x11, 480		// centro x
    mov x12, 330		// centro y
    mov x13, 65		// radio
	bl circulo

	//---------------------HOJALDRE---------------------

	movz w7, 0xFF00, lsl 16		// defino color
	movk w7, 0x0000, lsl 00		// completo color
    mov x11, 470		// centro x
    mov x12, 305		// centro y
    mov x13, 6		// radio
	bl circulo

	//---------------------BOCA---------------------

    mov x29, 410  // x
    mov x21, 310 // y
    mov x28, 20   // Ancho
    mov x27, 50   // Largo
    movz x26, 0x0000
    movk x26, 0xFF00, lsl #16
    bl rectangulo

	mov x29, 420  // x
    mov x21, 315 // y
    mov x28, 20   // Ancho
    mov x27, 40   // Largo
    movz x26, 0x0000
    movk x26, 0xFF00, lsl #16
    bl rectangulo

	mov x29, 430  // x
    mov x21, 320 // y
    mov x28, 20   // Ancho
    mov x27, 30   // Largo
    movz x26, 0x0000
    movk x26, 0xFF00, lsl #16
    bl rectangulo

	mov x29, 440  // x
    mov x21, 325 // y
    mov x28, 20   // Ancho
    mov x27, 20   // Largo
    movz x26, 0x0000
    movk x26, 0xFF00, lsl #16
    bl rectangulo

	mov x29, 450  // x
    mov x21, 330 // y
    mov x28, 20   // Ancho
    mov x27, 10   // Largo
    movz x26, 0x0000
    movk x26, 0xFF00, lsl #16
    bl rectangulo

	//---------------------PARED MEDIO---------------------

	mov x29, 240  // x
    mov x21, 180  // y
    mov x28, 400   // Ancho
    mov x27, 60   // Largo
    movz x26, 0x11FF
    movk x26, 0xFF00, lsl #16
    bl rectangulo

	movz w7, 0xFF00, lsl 16		// defino color
	movk w7, 0x11FF, lsl 00		// completo color
    mov x11, 240		// centro x
    mov x12, 210		// centro y
    mov x13, 30		// radio
	bl circulo

	mov x29, 240  // x
    mov x21, 190  // y
    mov x28, 400   // Ancho
    mov x27, 40   // Largo
    movz x26, 0x0000
    movk x26, 0x0000, lsl #16
    bl rectangulo

	movz w7, 0x0000, lsl 16		// defino color
	movk w7, 0x0000, lsl 00		// completo color
    mov x11, 240		// centro x
    mov x12, 210		// centro y
    mov x13, 20		// radio
	bl circulo

	//---------------------PARED ABAJO---------------------

	mov x29, 0  // x
    mov x21, 420  // y
    mov x28, 640   // Ancho
    mov x27, 60   // Largo
    movz x26, 0x11FF
    movk x26, 0xFF00, lsl #16
    bl rectangulo

	//---------------------COSITOS---------------------

	movz w7, 0xFFF6, lsl 16		// defino color
	movk w7, 0xCAAE, lsl 00		// completo color
    mov x11, 420		// centro x
    mov x12, 330		// centro y
    mov x13, 12		// radio
	bl circulo

	movz w7, 0xFFF6, lsl 16		// defino color
	movk w7, 0xCAAE, lsl 00		// completo color
    mov x11, 350		// centro x
    mov x12, 330		// centro y
    mov x13, 12		// radio
	bl circulo

	movz w7, 0xFFF6, lsl 16		// defino color
	movk w7, 0xCAAE, lsl 00		// completo color
    mov x11, 170		// centro x
    mov x12, 100		// centro y
    mov x13, 12		// radio
	bl circulo

	movz w7, 0xFFF6, lsl 16		// defino color
	movk w7, 0xCAAE, lsl 00		// completo color
    mov x11, 230		// centro x
    mov x12, 100		// centro y
    mov x13, 12		// radio
	bl circulo

	movz w7, 0xFFF6, lsl 16		// defino color
	movk w7, 0xCAAE, lsl 00		// completo color
    mov x11, 290		// centro x
    mov x12, 100		// centro y
    mov x13, 12		// radio
	bl circulo

	movz w7, 0xFFF6, lsl 16		// defino color
	movk w7, 0xCAAE, lsl 00		// completo color
    mov x11, 350		// centro x
    mov x12, 100		// centro y
    mov x13, 12		// radio
	bl circulo

    movz w7, 0xFFF6, lsl 16		// defino color
	movk w7, 0xCAAE, lsl 00		// completo color
    mov x11, 420		// centro x
    mov x12, 100		// centro y
    mov x13, 12		// radio
	bl circulo

	movz w7, 0xFFF6, lsl 16		// defino color
	movk w7, 0xCAAE, lsl 00		// completo color
    mov x11, 500		// centro x
    mov x12, 100		// centro y
    mov x13, 20		// radio
	bl circulo

	 movz w7, 0xFFF6, lsl 16		// defino color
	movk w7, 0xCAAE, lsl 00		// completo color
    mov x11, 580		// centro x
    mov x12, 100		// centro y
    mov x13, 12		// radio
	bl circulo

//---------------------LETRAS Y NUMEROS---------------------

    mov x29, 280 // x
    mov x21, 305 // y
    mov x28, 30   // Ancho
    mov x27, 50   // Largo
    movz x26, 0xCAAE
    movk x26, 0xFFF6, lsl #16
    bl rectangulo

	mov x29, 290 // x
    mov x21, 315 // y
    mov x28, 20   // Ancho
    mov x27, 10   // Largo
    movz x26, 0x0000
    movk x26, 0xFF00, lsl #16
    bl rectangulo

    mov x29, 280 // x
    mov x21, 335 // y
    mov x28, 15   // Ancho
    mov x27, 10   // Largo
    movz x26, 0x0000
    movk x26, 0xFF00, lsl #16
    bl rectangulo

//--------------------------------------------------------

	mov x29, 220 // x
    mov x21, 305 // y
    mov x28, 30   // Ancho
    mov x27, 50   // Largo
    movz x26, 0xCAAE
    movk x26, 0xFFF6, lsl #16
    bl rectangulo

	mov x29, 220 // x
    mov x21, 315 // y
    mov x28, 20   // Ancho
    mov x27, 10   // Largo
    movz x26, 0x0000
    movk x26, 0xFF00, lsl #16
    bl rectangulo

    mov x29, 235 // x
    mov x21, 335 // y
    mov x28, 15   // Ancho
    mov x27, 10   // Largo
    movz x26, 0x0000
    movk x26, 0xFF00, lsl #16
    bl rectangulo

//-------------------------------------------------------

	mov x29, 160 // x
    mov x21, 305 // y
    mov x28, 30   // Ancho
    mov x27, 50   // Largo
    movz x26, 0xCAAE
    movk x26, 0xFFF6, lsl #16
    bl rectangulo

	mov x29, 170 // x
    mov x21, 315 // y
    mov x28, 10   // Ancho
    mov x27, 30   // Largo
    movz x26, 0x0000
    movk x26, 0xFF00, lsl #16
    bl rectangulo

//-------------------------------------------------------

	mov x29, 100 // x
    mov x21, 305 // y
    mov x28, 30   // Ancho
    mov x27, 50   // Largo
    movz x26, 0xCAAE
    movk x26, 0xFFF6, lsl #16
    bl rectangulo

	mov x29, 100 // x
    mov x21, 315 // y
    mov x28, 20   // Ancho
    mov x27, 10   // Largo
    movz x26, 0x0000
    movk x26, 0xFF00, lsl #16
    bl rectangulo

    mov x29, 115 // x
    mov x21, 335 // y
    mov x28, 15   // Ancho
    mov x27, 10   // Largo
    movz x26, 0x0000
    movk x26, 0xFF00, lsl #16
    bl rectangulo


//-------------------------------------------------------

    mov x29, 100 // x
    mov x21, 225 // y
    mov x28, 30   // Ancho
    mov x27, 50   // Largo
    movz x26, 0xCAAE
    movk x26, 0xFFF6, lsl #16
    bl rectangulo

	mov x29, 110 // x
    mov x21, 235 // y
    mov x28, 30   // Ancho
    mov x27, 30   // Largo
    movz x26, 0x0000
    movk x26, 0xFF00, lsl #16
    bl rectangulo

//-------------------------------------------------------
    mov x29, 100 // x
    mov x21, 150 // y
    mov x28, 30   // Ancho
    mov x27, 50   // Largo
    movz x26, 0xCAAE
    movk x26, 0xFFF6, lsl #16
    bl rectangulo

	mov x29, 100 // x
    mov x21, 150 // y
    mov x28, 20   // Ancho
    mov x27, 20   // Largo
    movz x26, 0x0000
    movk x26, 0xFF00, lsl #16
    bl rectangulo

	mov x29, 110 // x
    mov x21, 180 // y
    mov x28, 10   // Ancho
    mov x27, 10   // Largo
    movz x26, 0x0000
    movk x26, 0xFF00, lsl #16
    bl rectangulo

//-------------------------------------------------------

    mov x29, 100 // x
    mov x21, 75 // y
    mov x28, 30   // Ancho
    mov x27, 50   // Largo
    movz x26, 0xCAAE
    movk x26, 0xFFF6, lsl #16
    bl rectangulo

	mov x29, 110 // x
    mov x21, 85 // y
    mov x28, 10   // Ancho
    mov x27, 30   // Largo
    movz x26, 0x0000
    movk x26, 0xFF00, lsl #16
    bl rectangulo

	// Infinite Loop

InfLoop:
	b InfLoop
