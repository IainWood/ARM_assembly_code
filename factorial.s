.text
.global factorial
factorial:

	str lr, [sp,#-4]!		//stores the stack pointer, with an offset of -4, into lr
	str r0, [sp,#-4]!		//stores the stack pointer, with an offset of -4, into r0
	
	cmp r0, #0					//compare r0 with 0
	bne positive				//continues only if the number is positive
	mov r0, sp					//loads the first argument with sp
	mov r1, #240				//loads the second argument with 240
	b1 memdump					//calls memdump
	mov r0, #1					//puts 1 in r0
	b stop							//branches to start
	
positive:
	sub r0, r0, #1			//r0 = r0 - 1
	b1 factorial
	
	ldr r1, [sp]				//r1 = pointer of sp
	mul r0, r0, r1			//r0 = r0 * r1 (the actual factorial part)
	
stop:
	add sp, sp, #4			//sp = sp + 4
	ldr lr, [sp], #4		//loads lr with the pointer of sp and an offset of 4
	
	bx lr
