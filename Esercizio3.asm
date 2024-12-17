; multi-segment executable file template.
; Esercizio 2 Somma di 10+20 salvati in 2 variabili Num1 e Num2 e risultato salvato nella variabile Ris
data segment
    ; add your data here!
    Num1 DW 10h
    Num2 DW 20h
    Ris  DW  0h
    pkey db "press any key...$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
MOV AX,data
MOV DS,AX
MOV AX,Num1    
MOV BX,Num2  
ADD AX,BX


ends

end start ; set entry point and stop the assembler.
