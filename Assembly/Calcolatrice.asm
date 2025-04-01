 ; multi-segment executable file template.

data segment
    Msg             db "Inserisci un numero terminando premendo invio: $"
    MsgErr          db "Errore:Inserito input non valido $"
    MsgSegn         db "Inserisci + per sommare, - per sottrarre, * per moltiplicare, / per dividere $"
    MsgRis          db "Il risultato e': $" ,
    Cifra           dw 0
    NumIns1         dw 0 
    NumIns2         dw 0
    Segn            dw 0
    Ris             dw 0
    pkey            db "press any key...$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    mov ax, stack
    
    lea dx,Msg 
    call Scrivi
    call NewLine
                   
    call LeggiNumero1
    
    lea dx,Msg 
    call Scrivi
    call NewLine
    mov Cifra,0               
    call LeggiNumero2
    
    lea dx,MsgSegn
    call LeggiSegno
    call NewLine
    
    call ScriviRisultato   
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

LeggiNumero1 proc near
    mov bx,0
Leggi1:
    mov ah,01h
    int 21h
    cmp al,0DH
    je FineInserimento1
    cmp al,30h
    jl Errore1
    cmp al,39h
    jg Errore1
    
    sub al,30h
    mov ah,0h
    mov Cifra,ax
    mov ax,bx
    mov cx,10
    mul cx
    add ax,Cifra
    mov bx,ax
    jmp Leggi1
        
Errore1:         
    lea dx,MsgErr
    call Scrivi
    jmp Leggi1
    
    
FineInserimento1:
    mov NumIns1,bx
    ret

endp

Scrivi proc near
    mov ah,09h
    int 21h
    ret
endp

LeggiNumero2 proc near
    mov bx,0
Leggi2:
    mov ah,01h
    int 21h
    cmp al,0DH
    je FineInserimento2
    cmp al,30h
    jl Errore2
    cmp al,39h
    jg Errore2
    
    sub al,30h
    mov ah,0h
    mov Cifra,ax
    mov ax,bx
    mov cx,10
    mul cx
    add ax,Cifra
    mov bx,ax
    jmp Leggi2
        
Errore2:         
    lea dx,MsgErr
    call Scrivi
    jmp Leggi2
    
    
FineInserimento2:
    mov NumIns2,bx
    ret

endp

LeggiSegno proc near
    mov bx,0
LeggiSegn:
    mov ah,01h
    int 21h
    cmp al,2Ah
    je InserSegn
    cmp al,2Bh
    je InserSegn
    cmp al,2Dh
    je InserSegn
    cmp al,2Fh
    je InserSegn
    jmp ErroreSegn
        
InserSegn:
    mov Segn,bx 
    jmp FineInserimentoSegno
ErroreSegn:         
    lea dx,MsgErr
    call Scrivi
    jmp LeggiSegn
FineInserimentoSegno:
    ret

endp


Calcola proc near
    cmp Segn,2Ah
    je Molt
    cmp Segn,2Bh
    je Somma
    cmp Segn,2Dh
    je Sott
    cmp Segn,2Fh
    je Divs
Somma:
    mov ax,NumIns1
    add ax,NumIns2
    jmp FineCalc
Molt:
    mov ax,NumIns1
    mov bx,NumIns2
    mul bx
    jmp FineCalc
Sott:
    mov ax,NumIns1
    sbb ax,NumIns2
    jmp FineCalc
Divs:
    mov ax,NumIns1
    mov bx,NumIns2
    div bx
    jmp FineCalc
FineCalc:
    mov Ris,ax
    ret
endp

ScriviRisultato proc near
    lea dx,MsgRis
    call Scrivi
    mov dx,Ris
    call Scrivi
    ret
endp  

NewLine proc near
    MOV DL,0Ah 
    MOV AH,02
    INT 21h  
    MOV DL,0Dh 
    INT 21h
    ret
endp
end start ; set entry point and stop the assembler.