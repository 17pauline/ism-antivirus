.model small 
.stack 10h 	; ask for a 16B stack (default = 128B)
.data 
	; define global variables
	a DB 14		; 14 in decimal
	b DB 14h 	; 14 in hexa ~ 20 in decimal = 14 + 1*6
	result DB ? ; residual variable; instead of initializing with 0
	x DW 1234h	; 2B
	y DD 33445566h	; 4B
	z DQ 1122112211221122h	; 8B
	w DT 0	; 10B
	; word - 2 bytes
	; paragraph - 16 bytes
	; segment - 64 kilobytes
.code
the_main:	
	; instructions
	; you can define variables here but the processor might interpret them as instructions
	; recommended that you define variables at the end of .code
	; Intel x8086 = 16 bit processor --> 16 bit registers
	MOV AX, @data	; copy data into AX (generic purpose register) --> tell the processor the address of the data 
	MOV DS, AX 		; you can't put a value into a DS segment directly
	
	;push AX			; --> push the variable into the stack

	XOR AX, AX 		; fastest way to clear your register (faster than MOV AX, 0)
	; instead of AX, specify AL or AH, otherwise you will get a mismatched operand error
	MOV AL, a
	ADD AL, b 
	MOV result, AL 
	
	MOV AX, 4C00h	; 4C function (terminate the program with return code 00 -->return 0;)
	INT 21h			; we call INT 21h (library) containing 4C 
the_end:
	MOV AX, offset the_end 
end the_main		; the processor will now start at the_main; label gives the offset of the main function relative to the beginning of the stack, giving away the size 