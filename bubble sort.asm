JMP main

 array:
    DW 0x02e0
    
 array2:
 	DW 0x02f0

 main:
 	MOV SP, 0x02df
    MOV B, [array]
    MOV D, [array2]
     
 readkey:
    IN 5
    CMP A, 0 
    JE readkey
	IN 6
    CMP A, 0x002a
    JE fillarray
    MOVB [B], AL
    INC B
    JMP readkey
    
 fillarray:
 	MOV D, [array2]
    MOV B, [array]
    
    fillloop:
    MOV A,[B]
    MOVB [D], AH
    CMP B, 0x2EF
    JE quicksort
    INC B
    INC D
    JMP fillloop
 
 
 quicksort:
    MOV D, [array2]
    MOV B, [array]
    
 	loop:
 	PUSHB [D]
    POPB BL
    INC D
    PUSHB [D]
    POPB AL
    CMPB BL, AL
    JA swap
    
 afterswap:
    CMP D,0x2Ff
    JB loop
    JMP callagain
    
 callagain:
 	INC C
    CMP C, 16
    JE halt
    CALL quicksort
        
 swap:
    MOVB [D], BL
    DEC D
    MOVB [D], AL
    INC D
    JMP afterswap
    
 halt:
   HLT
    
   