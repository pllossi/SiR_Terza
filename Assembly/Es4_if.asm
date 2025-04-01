name "Selezione if"
; Programma che se 2 num sono uguali non camba il ris,altrementi scrive in ris la somma

data segment
    ; add your data here!
    Num1 DW 1A3Ch
    Num2 DW 1A3Ch
    ris  DW 0000h
    
    Stringa db "press any key...$"
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
    
    mov ax,Num1
    mov bx,Num2
    
    cmp ax,bx
    je salta
    add ax,bx
    mov ris,ax
    ; add your code here
salta:    
            
    lea dx, Stringa
    mov ah, 9h
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1h
    int 21h
    
    mov ah, 4Ch ; exit to operating system.
    int 21h          
ends

end start ; set entry point and stop the assembler.
