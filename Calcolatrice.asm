; multi-segment executable file template.

data segment
    Msg             db "Inserisci un numero terminando premendo invio: $"
    MsgErr          db "Errore:Inserito input non valido $"
    Cifra           dw 0
    NumIns          dw 0
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
    
    call LeggiNumero
    
            
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

LeggiNumero proc near
    mov bx,0
Leggi:
    mov ah,01h
    int 21h
    cmp ah,0DH
    je FineInserimento
    cmp al,30h
    jl Errore
    cmp al,39h
    jg Errore
    
    sub al,30h
        
Errore:         
    lea dx,MsgErr
    mov ah,09h
    int 21h
    jmp Leggi
    
    
FineInserimento:

endp

end start ; set entry point and stop the assembler.
