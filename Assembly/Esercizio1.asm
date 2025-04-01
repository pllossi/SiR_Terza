; multi-segment executable file template.
; Esercizio 1 somma di 10+20 salvati nei registri AX e BX

data segment
    ; add your data here!
    pkey db "press any key...$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
MOV AX,10
MOV BX,20
ADD BX,AX

MOV AH,10h
MOV BH,20h
ADD AH,BH
    
ends

end start ; set entry point and stop the assembler.
