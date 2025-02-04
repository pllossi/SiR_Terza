; multi-segment executable file template.

data segment
    Num1 dw 503h
    Dden dw 5h
    Quoz dw 0h
    Rest dw 0h
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

    mov ax,Num1
inizio_ciclo:
    cmp ax,Dden
    jl fine
    inc Quoz
    sub ax,Dden
    jmp inizio_ciclo
    
fine: 
     mov Rest,ax   
ends

end start ; set entry point and stop the assembler.
