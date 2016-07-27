		AREA question1, CODE, READONLY
		ENTRY
			
		LDR 	r0, =UPC			;Load UPC from memory into register 0
		MOV 	r1, #0				;Move 0 into r1 to use as a pointer to move through r0
		
PARSE								    ;A label for the loop 
		LDRB 	r3, [r0, r1]	;Load the byte at index r1 from r0(The UPC)and store it in r3
		SUB 	r3,r3,#48			;Convert the number and removes 0x30 to make it into decimal
		ADD 	r5,r5,r3			;Add the number retireved from UCP to the running total for the odd numbers 
			
		ADD 	r1,r1,#1			;Increment the counter
	
		CMP 	r1, #11				;Sets the register 1 and the decimal number 11 to be compared by following statements
		BEQ 	ENDOFSTRING		;If r1 equals 11 than branch to the ENDOFSTRING label
	
		LDRB 	r4, [r0, r1]	;Load the byte at index r1 from r0(The UPC) and store it in r4
		SUB 	r4,r4,#48			;Convert the number and removes 0x30 to make it into decimal
		ADD 	r6,r6,r4			;Add the number retireved from UCP to the running total for the even numbers 

		ADD 	r1,r1,#1			;Increment the counter
		
		b		PARSE				    ;Branch to PARSE because loop is not at the end of the string yethghs
		
ENDOFSTRING							;A label for the loop

		LDRB 	r3, [r0, r1]	  ;Load the byte at index r1 from r0 (The UPC) and store it in r3
		SUB 	r3,r3,#48			  ;Convert the number and removes 0x30 to make it into decimal
		ADD 	r5, r5, LSL#1		;Multiplies r5 by 3 and stores it again in r5
		ADD 	r5, r5, r6			;Add the odd sum times 3 and the even sum to get total before division
		SUB 	r5, r5, #1			;Subtract 1 from r5 (Outlined step to check)
		b		DIVIDE				    ;Branch to divide for next step
		
DIVIDE								  ;A label for the loop
		CMP 	r5, #9				;Sets the register 5 and the decimal number 9 to be compared by following statements
		SUBGT 	r5, r5, #10	;If r5 is greater than 9 then Subtract 10 from r5 to get it to become lower than 10 
		MOVLE	r7, #1				;If r5 is less than or equal to 9 then store the number 1 inside of register 7 
		CMP 	r7, #1				;Sets the register 7 and the number 1 to be compared by the following statements
		BNE 	DIVIDE				;If register 7 is not equal to the number 1 then branch back to the DIVIDE label
		
		RSB 	r7,r7,#9			;Subract the result of DIVIDE stored in r7 from 9 and store the result back in r7
		
		MOV 	r0, #0				;Set the default condition, if not changed then the check digit does not match and it is an invalid UPC
		
		CMP 	r3, r7				;Sets the register 3 and the register 7 to be compared by the following statements
		MOVEQ 	r0, #1			;If the computed checksum is the same as the one in the UPC then set register 0 to 1 
		
loop	b 		loop				;Infinate loop to end the project
		
		AREA question1, CODE, READWRITE
		
UPC 	DCB "013800150738" 			;UPC string
EoS		DCB 0x00

		END							;End of program
