; programma che ci permette di aggiungere un numero determinate volte

data segment
    ; add your data here!
    Num1 DW 10h
    Num2 DW 10h
    ris  DW  0h
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

    ; add your code here
    mov ax,Num1
    mov bx,Num2
    dec bx
    inizioCiclo:
    cmp bx,0h
    je fine
    add ax,Num1
    dec bx
    cmp bx,0h
    jne inizioCiclo
    fine:
    mov ris,ax    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
