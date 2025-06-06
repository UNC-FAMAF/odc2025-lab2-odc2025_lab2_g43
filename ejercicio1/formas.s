.equ SCREEN_WIDTH,   640
.equ SCREEN_HEIGH,   480

.globl rectangulo
.globl circulo

//...............................RECTANGULO.....................................................................
rectangulo:

        // x29 offset  eje x
        // x21 offset  eje y
        // x28 Anchura
        // x27 Altura
        // x26 color

        mov w10, w26// color
        mov x0, x20// offset (dirección del framebuffer)
        add x0, x0, x29, lsl #2// ajustar la posición en x según el offset

        mov x2, x21// posición inicial eje y
        mov x9, 640// cargar SCREEN_WIDTH en un registro
        mul x2, x2, x9// multiplicar por SCREEN_WIDTH
        add x0, x0, x2, lsl #2// ajustar la posición en y según el offset

loop_r:

        mov x1, x28// ancho rectángulo

loop_iner:

        str w10, [x0]// dibuja un píxel
        add x0, x0, 4// siguiente píxel
        sub x1, x1, 1// resta al contador de píxeles restantes de la fila
        cbnz x1, loop_iner// si no se completó la fila vuelve a arrancar

        sub x27, x27, 1// resta al contador de filas restantes
        mov x16, x9
        add x0, x0, x16, lsl #2// mover al inicio de la siguiente fila
        sub x0, x0, x28, lsl #2
        cbnz x27, loop_r// si no se terminaron de dibujar todas las filas continúa

        ret

circulo:
    	mov x0, x20		// vuelvo a la posición base del framebuffer
    	mul x14, x13, x13	// r^2
    	mov x15, 0		// coordenada Y del píxel que se está evaluando.
circle_y_loop:
    	mov x16, 0		// coordenada X del píxel que se está evaluando.
circle_x_loop:
    	sub x17, x16, x11	// x17 = x16 - 160
    	mul x17, x17, x17	// x17 = (x16 - 160)^2
    	sub x18, x15, x12	// x18 = x15 - 200
    	mul x18, x18, x18	// x18 = (x15 - 200)^2
    	add x19, x17, x18	// x19 = (x16 - 160)^2 + (x15 - 200)^2
    	cmp x19, x14		// FLAGS = [(x16 - 160)^2 + (x15 - 200)^2] - 60^2
    	b.ge skip_pixel
    	mov x21, SCREEN_WIDTH	// x21 = 640
    	mul x22, x15, x21	// x21 = x15 * 640
    	add x22, x22, x16	// x21 = (x15 * 640) + x16
    	lsl x22, x22, 2		// x21 = [(x15 * 640) + x16] * 4
    	add x0, x20, x22	// x0 = x0 + [(x15 * 640) + x16] * 4
    	str w7, [x0]		// pinto x0
skip_pixel:
    	add x16, x16, 1		// x16 = x16 + 1
    	cmp x16, SCREEN_WIDTH	// FLAGS = x16 - 640
    	b.lt circle_x_loop
    	add x15, x15, 1		// x15 = x15 + 1
    	cmp x15, SCREEN_HEIGH	// FLAGS = x15 - 480
    	b.lt circle_y_loop
	ret




