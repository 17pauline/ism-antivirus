.model small
.stack 32
.data
	sum 		DW 0
	filter 		DW 10
	filteredSum DW 0
	array		DW 13, 7, 6, 24
	anotherArray	DW 100 DUP (1)	; duplicate 1 for 100 times 
	msg 		DB 'Hello$'			; $ is a temrinator - the print function will stop
	vb 			DB 'How are you$'
.code
	MOV AX, @data
	MOV DS, AX
	
	MOV AL, msg 	; copy ascii code of H
	MOV AX, word ptr vb		; copy Ho	; used (word ptr) to cast the offset
	
	MOV AH, 09h
	MOV DX, offset msg
	INT 21h
	
	XOR AX, AX 		; use AX for computing the sum
	XOR BX, BX		; another general purpose register, we'll use it for the filtered sum
	
	MOV SI, offset array			; MOV SI, 6
	MOV CX, 4		; we have 4 elements
do_iteration:
	ADD AX, [SI]	; add into AX the first value (the offset) of the array
	
	MOV DX, [SI]
	CMP DX, filter 	; compare does virtual substraction
	JL ignore		; you jump if you don't want to do the addition
	ADD BX, [SI]
ignore:
	INC SI
	INC SI			; ADD SI, 2 (increment is faster)
	LOOP do_iteration
	
	MOV sum, AX
	MOV filteredSum, BX 
	
	MOV AX, 4C00h
	INT 21h
end