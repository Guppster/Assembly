Draw a detailed flowchart and write an ARM assembly language program to determine whether a string of printable
ASCII encoded characters stored in memory is a palindrome (i.e., the letters in the string are the same from left to right as
from right to left) or not. If palindrome, you should store 1 in R0, if not, you should store 0 in R0. You code should be
highly optimized, i.e., use as few number of instructions as possible. 

Ignore all characters that are not letters. You should also treat capital and small letters the same. For example, “madam”,
“deleveled”, “Noon”, “He lived as a devil, eh?”, and “Was it a car or a cat I saw?” are palindrome strings. However,
“madam, I am Adam.” is not a palindrome string.

A string can have even or odd number of characters and ends with character 0x00 (the ASCII code of the null character).

You may want to define the string as follow:
UPC DCB "He lived as a devil, eh?" ; string
EoS DCB 0x00 ;end of string
