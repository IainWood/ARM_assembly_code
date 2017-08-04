.text
.global bubble
bubble:
  push {r4-r9, fp, lr}  //pushes registers onto the stack
  
  sub r5, r0, #1        //r5 = r0 - 1
  mov r4, r1            //moves r1(array) onto r4
  mov r6, #0            //moves 0 to r6 (initialization)
  
  loop:
    ldr r7, [r4], #4		//loads r7 with the pointer r4 by an offset of 4
		ldr r8, [r4]				//loads r8 with the pointer r4 NOT offset
												//r7 and r8 are now the next two elements
		cmp r7, r8					//compares these two elements to determine if a switch is necessary
		ble dont_switch			//if switch is not necessary, branch ahead
		
		mov r6, #1					//increments r6 by 1
		sub r4, r4, #4			//r4 = r4 - 4		the next element becomes the first element
		swp r8, r8, [r4]		//swaps r8 with r8 offset of the pointer of r4
		str r8, [r4, #4]		//stores r8 with the pointer r4 and offset 4
		
	dont_switch:
		subs r5, r5, #1			//r5 = r5 - 1
		bne loop						//branch if not equal
		
		cmp r6, #0					//compares r6 to 0
		beq finished				//branches to the end if finished
		
		mov r6, #0					//moves 0 to r6
		mov r4, r1					//moves r1 to r4
		sub r5, r0, #1			//r5 = r0 - 1
		b loop							//infinite loop, if finished is not branched to then it just keeps going
		
		finished:
		pop {r4-r9, fp, pc}	//pops(returns) the result
