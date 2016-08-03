Draw a detailed flowchart and write an ARM assembly language program to concatenate two stings (STRING1 and
STRING2) and store the result in a null terminated STRING3. Assume that the length of STRING1 + the length of
STRING2 ≤ 255.

You code should be highly optimized, i.e., use as few number of instructions as possible.
You may want to define the strings as follow:

STRING1 DCB "This is a test string1" ;String1
EoS DCB 0x00 ;end of string1
STRING2 DCB "This is a test string2" ;String
EoS DCB 0x00 ;end of string2
STRING3 space 0xFF
