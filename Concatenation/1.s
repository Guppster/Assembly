		AREA question1, CODE, READWRITE
		ENTRY
		
START	ADR		r0, STRINGFinal					;Point at spot to store final concat'ed string		
		LDR		r1, =STRINGFirst				;Loads the pointer of STRING1 to r1		 
		MOV		r4, #0							;Point to the start of the string
		
NEXT	LDRB	r3, [r1, r4]				    ;Loads a single byte from memory into r3 from STRINGFirst
		ADD		r4, r4, #1						;Increments reading counter.
		CMP		r3, r2							;Check for equality between r3 and r2
		BEQ		SWITCH							;if equal branch to SWITCH
		BNE		DATA							;Else branch to DATA

DATA	STRB	r3, [r0, r7]					;Save the byte r3 in r0 at r7
		ADD		r7, r7, #1						;Increment saving counter
		B		NEXT							;Branch back to NEXT

SWITCH	CMP		r6, #0							;checks if r6 is null
		BEQ		CONCAT							;if they are equal branch to CONCAT
		STRB	r2, [r0, r7]					;they they are not equal that means you are at the end and must null terminate the string before ending the program
		B		INF 							;Ends the program
		
CONCAT	ADD		r6, r6, #1						;triggers boolean to state that we are on the second string now
		LDR		r1, =STRINGSecond				;makes r1 point to SECONDString so we can repeat same process 
		B		START							;branch to start
	
INF		B		INF								;Infinate loop

		AREA question1, DATA, READWRITE	
STRINGFirst DCB "This is a test string1" 		;String1
EoS 	DCB 0x00 								;end of string1
STRINGSecond DCB "This is a test string2" 		;String
EoSS 	DCB 0x00 								;end of string2
STRINGFinal space 0xFF
		
		END
		