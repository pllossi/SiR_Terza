; multi-segment executable file template.

data segment
    Num1 DW 100h
    Num2 DW  20h
    Ris  DW   0h
    Op   DB   4
    pkey db "press any key...$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds,ax
    mov ax,Num1
    mov bx,Num2

    ; add your code here
   
    cmp Op,1
    je sum
    cmp Op,2
    je sot
    cmp Op,3
    je mol
    cmp Op,4
    je divs
    
sum:
    add ax,bx
    jmp salva
sot:
    sub ax,bx
    jmp salva
mol:
    mul bx
    jmp salva
divs:
    div bx
    jmp salva
salva:
    mov Ris,ax

    
      
ends

end start ; set entry point and stop the assembler.
