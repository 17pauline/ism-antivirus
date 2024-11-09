.model large
.stack 10h

; void strcpy/memcpy (char* dat, char* src, ...)

Exit_dos MACRO
	MOV AX, 4C00h
	INT 21h
ENDM



SRCSEG SEGMENT
	src DB 'ASM x86 on bits$'
	dimsrc DW $-src
SRCSEG ENDS



DSTSEG SEGMENT
	dst DB '111111111111111$'
	dimdst DW $-dst 
DSTSEG ENDS

MainProgSEG SEGMENT
ASSUME CS: MainProgSEG, DS: SRCSEG, ES: DSTSEG
start:
	MOV AX, SEG src 		; segmentul lui src oricare ar fi el, in loc de @data
	MOV DS, AX
	
	MOV AX, SEG dst 		
	MOV ES, AX				; sursa in DS, destinatia in ES
	
	CLD
	MOV SI, offset src 
	MOV DI, offset dst 
	MOV CX, dimsrc 
	
	REP movsb
	; label_while:
	; 	movsb
	; loop label_while 
	
	
	
	Exit_dos
MainProgSEG ENDS
end start