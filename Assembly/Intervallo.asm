name "Intervallo"

data segment
    max     dw 0
    min     dw 0
    number  dw 0
    msgMin  db "Inserisci il valore minimo: $"
    msgMax  db "Inserisci il valore massimo: $"
    msgNum  db "Inserisci un valore intero: $"
    msgDen  db "Il valore inserito e' compreso tra il minimo e il massimo$"
    msgNon  db "Il valore inserito non e' compreso tra il minimo e il massimo$"
    pkey    db "press any key...$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    lea dx, msgMin
    call StampaStringa
    call LeggiNumero
    mov min, ax
    lea dx, msgMax
    call StampaStringa
    call LeggiNumero
    mov max, ax
    lea dx, msgNum
    call StampaStringa
    call LeggiNumero
    mov number, ax
    cmp ax,max
    jg nonCompreso
    cmp ax,min
    jl nonCompreso
    jmp compreso
nonCompreso:
    lea dx, msgNon
    call StampaStringa
    jmp fine
compreso:
    lea dx, msgDen
    call StampaStringa
fine:
    mov ah, 4Ch
    int 21h
     
ends

NewLine proc near 
    MOV DL,0Ah 
    MOV AH,02
    INT 21h  
    MOV DL,0Dh 
    INT 21h
    RET
endp   

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

end start