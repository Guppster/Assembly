		AREA question2, CODE, READWRITE
		ENTRY
		
		MOV		r11, #0								;Initialize register 11 to store the number 0
		MOV		r12, #0								;Initialize register 12 to store the number 0
		ADR		r0, K								;Create an array to store each letter of the string input
			
		LDR		r2, =STRING							;Load the string in from memory and store it in register r2
		
LL		MOV		r9, #0								;Reset register 9 to be used internally in loop:(if(r1>91@@r1<96))		
		LDRB	r1, [r2], #1						;Load the next byte from string stored in r2 and store in register 1
		CMP		r1, #0								;Sets the register 1 and the decimal number 0 to be compared by following statements
		BEQ		Eos									;If the register is empty, that means the byte read in is null, so reset the loop 
		
;if(r1>65||r1<122)
		SUBS	r10, r1, #65						;Confirm if byte is a letter
		BLT		LL									;If it is not a letter loop back to start
		SUBS	r10, r1, #122						;Confirm if byte is a letter
		BGT		LL									;If it is not a letter loop back to start
;Endif

;if(r1>91@@r1<96)		
		SUBS	r10, r1, #91						;for ascii codes 91-96 in between the capital and lowercase letters
		MOVGE	r9, #1								;If conditional flags are greater than or equal to eachother than move the number 1 into register 9
		SUBS	r10, r1, #96						;Sets conditional flags with register 10, register 1, and decimal number 96
		ADDLE	r9, r9, #1							;If register 9 is less than or equal to register 1 then store decimal number 1 in register 9
		CMP		r9, #2								;Sets the register 9 and the decimal number 2 to be compared by following statements
		BEQ		LL									;If register 9 is storing a 2, then go back to the start
;EndIf		
		ADD		r11, r11, #4						;At this point we have confirmed it is a letter, so we add one to the counter
		SUBS	r10, r1, #94						;If the letter is lower case convert it into a capital
		ANDGT	r1, r1, #2_11011111					;If greater than, add to register one to convert it into a capital letter to prepare for comparison
		STR		r1, [r0, r12]						;Store the confirmed capital letter into the array, ready to be compared
		ADD		r12, #4								;Increment counter to work with next byte in STRING
		BAL		LL									;Loops back to start again
		
;EndLL		
Eos		MOV		r12, #0								;Stores 0 in register 12 to be used as a counter

check	SUBS	r11, r11, #4						;Subtracts once from counter that holds the length of the letters in STRING
		BLT		Done								;If r11 is negative this means it has successully checked all letters and STRING is a palindrome
	
		LDR		r3, [r0, r12]						;Loads the 2 letters to be checked into registers
		LDR		r4, [r0, r11]
		ADD		r12, r12, #4						;Increments counter for next letter
		CMP		r3, r4								;Compares the letters
		BEQ		check								;Checks if letters are the same
		
		MOV		r0, #0								;If letters are not the same I set r0 to 0 to answer question
Done	CMP		r0, #0								;If all letters are the same r0 will not be set to 0 so then I set r0 to 1
		MOVNE	r0, #1
		
infin	B		infin

		AREA question2, DATA, READWRITE	
STRING  DCB 	"Was it a car or a cat I saw" 		;String to be tested
EoS 	DCB 	0x00 								;end of string
K		DCD		0,0,0,0,0,0,0,0,0,0,0,0				;array to hold string
		END
