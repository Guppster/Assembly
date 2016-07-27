#UPC Validator

Most goods sold in U.S. and Canadian stores are marked with a Universal Product Code (UPC).
The meanings of the digits underneath the bar code (from left to right) are:
• First digit: type of item,
• First group of five digits: manufacturer,
• Second group of five digits: product, and
• Final digit: check digit, used to help identify an error in the preceding digits.

To compute the check digit,
• Add the first, third, fifth, seventh, ninth, and eleventh digits
• Add the second, fourth, sixth, eighth, and tenth digits
• Multiply the first sum by 3 and add it to the second sum
• The check digit is the digit which, when added to the above sum, produces a sum that is multiple of 10
• Subtract 1 from the total
• Compute the remainder when the adjusted total is divided by 10
• Subtract the remainder from 9

Example for UPC 0 13800 15073 8:
• First sum: 0 + 3 + 0 + 1 + 0 + 3 = 7
• Second sum: 1 + 8 + 0 + 5 + 7 = 21
• Multiplying the first sum by 3 and adding the second yields 42
• Subtracting 1 gives 41
• Remainder upon dividing by 10 is 1
• Remainder is subtracted from 9
• Result is 8 

Draw a detailed flowchart and write an ARM assembly language program to determine whether a string of 12 ASCII
encoded digits stored in memory is a valid UPC or not. If valid, you should store 1 in R0, if not, you should store 0 in R0.
You code should be highly optimized, i.e., use as few number of instructions as possible.
You may want to define the UPC string as follow:

UPC DCB "013800150738" ;UPC string
EoS DCB 0x00 ;end of string

To test your program, you can use the following UPCs:
0 60383 75557 7
0 65633 45471 2

You can also get more UPC code from your own kitchen items.

HINT 1: You can implement the division operation using repeated subtraction.
HINT 2: To calculate 3 × Z, you can do so using only one ADD instruction with LSL#1 shift.
HINT 3: To load a byte to a register, use LDRB not LDR.
