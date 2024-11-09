.model small

Add2 MACRO op1, op2, Sum
	MOV AX, op1
	ADD AX, op2
	MOV Sum, AX
ENDM

exit_dos MACRO
	MOV AX, 4C00h
	INT 21h
ENDM

.stack 10h

.data
	a DW 9
	b DW -2
	S DW ?

.code
start:
	MOV AX, @data
	MOV DS, AX
	
	Add2 a, b, S 

	exit_dos
end start