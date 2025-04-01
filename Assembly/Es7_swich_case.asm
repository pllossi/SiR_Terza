; multi-segment executable file template.

data segment
    Num1 DB 10h
    Num2 DB 05h
    Ris  DW  0h
    Op   DB  1
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
    mov ah,Num1
    mov bh,Num2

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
    add ah,bh
    mov al,ah
    mov ah,00h
    jmp salva
sot:
    sub ah,bh 
    mov al,ah
    mov ah,00h
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
