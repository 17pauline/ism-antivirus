.model tiny
.code

org 100h
HOST:
	; directly to instructions
	MOV AH, 9
	MOV DX, offset HI
	INT 21h

	MOV AX, 4c00h
	INT 21h
	
	
	
	HI db 'Program COM 01!$'


end HOST