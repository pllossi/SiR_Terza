; multi-segment executable file template.

data segment
    Msg             db "Inserisci un numero terminando premendo invio: $"
    MsgErr          db "Errore:Inserito input non valido $"
    Cifra           dw 0
    NumIns1         dw 0 
    NumIns2         dw 0
    Segn            dw 0
    pkey db "press any key...$"
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
    
    
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

LeggiNumero1 proc near
    mov bx,0
Leggi1:
    mov ah,01h
    int 21h
    cmp ah,0DH
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
    mov ah,09h
    int 21h
    jmp Leggi
    
    
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
    cmp ah,0DH
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
    mov ah,09h
    int 21h
    jmp Leggi
    
    
FineInserimento2:
    mov NumIns2,bx
    ret

endp

Scrivi proc near
    mov ah,09h
    int 21h
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

LeggiSegno proc near
    mov bx,0
LeggiSegn:
    mov ah,01h
    int 21h
    cmp ah,0DH
    je FineInserimento
    cmp al,30h
    jl Errore
    cmp al,39h
    jg Errore
        
Errore:         
    lea dx,MsgErr
    mov ah,09h
    int 21h
    jmp Leggi
    
    
FineInserimento:
    mov NumIns2,bx
    ret

endp

Scrivi proc near
    mov ah,09h
    int 21h
    ret
endp

end start ; set entry point and stop the assembler.
