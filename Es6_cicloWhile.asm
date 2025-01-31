; Sviluppare un programma in assembly, in cui vengono definiti due numeri a 16 bit, Num1 e Num2.
; Il programma dovrà sommare Num1 con se stesso, tante volte quanto vale la variabile Num2. 
; Il risultato andrà salvato nella variabile Ris sempre a 16 bit.

data segment
    ; add your data here!
    Num1 DW  1h
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
    jmp inizioCiclo
    fine:
    mov ris,ax    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assemble