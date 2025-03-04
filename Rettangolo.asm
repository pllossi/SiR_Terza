name "Rettangolo"

data segment
    base    db 0h
    altezza db 0h
    msgBase db "Inserisci la base: $"
    msgAlt  db "Inserisci l'altezza: $"
ends


stack segment
    dw   128  dup(0)
ends

code segment
start:
    mov ax, data
    mov ds, ax
    lea dx,msgbase
    call StampaStringa
    call LeggiNumero
    mov base, ax
    call NewLine
    lea dx,msgAlt
    call StampaStringa
    call LeggiNumero
    mov altezza, ax
    call NewLine

    mov bx, altezza
NuovaRiga:
    dec bx
Inizio:
    mov ax, base
    cmp ax,0
    je NuovaRiga
    call StampaRett
    dec ax
    jmp Inizio
ends

StampaStringa proc near 
    MOV AH, 9                                 
    INT 21h        
    RET
endp  

LeggiNumero proc near
    MOV BX,0 
 Leggi:    
    MOV AH, 01H     
    INT 21H
    CMP AL,0DH 
    JE FineInserimento                                      
    CMP AL, 30H
    JL Errore     
    CMP AL, 39H
    JG Errore     
    SUB AL, 30H     
    MOV AH, 0H
    MOV Cifra, AX
    MOV AX, BX   
    MOV CX, 10
    MUL CX       
    MOV BX, AX
    ADD BX, Cifra  
    JMP Leggi      

Errore:
    LEA DX, MsgErrore  
    MOV AH,09h
    INT 21H
    JMP Leggi           
    
FineInserimento:    
    MOV AX, BX   
    RET
endp

NewLine proc near 
    MOV DL,0Ah 
    MOV AH,02
    INT 21h  
    MOV DL,0Dh 
    INT 21h
    RET
endp

StampaRett proc near
    mov dx,42h
    call StampaStringa
    ret
endp

end start
