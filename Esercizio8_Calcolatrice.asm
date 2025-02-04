; multi-segment executable file template.

data segment
    ; add your data here!
    prompt db "Decidi che calcolo fare inserendo un numero da 1 a 4 $"
    pkey db "press any key...$"
ends

stack segment
    Num1 DW 10h
    Num2 DW 20h
    Ris DW 0000h
    Op DW 0000h  
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    MOV ax, data
    MOV ds, ax
   
    lea dx, prompt
    mov ah, 9
    int 21h
     
    mov ah, 1
    int 21h
    sub al, '0'
    MOV Op, ax
   
    MOV ax, Num1
    MOV bx, Num2
    mov Op, 0001h
    CMP Op, 0001h
   
    JE Somma
    CMP Op, 0001h
   
    JE Sottrazione
    CMP Op, 0002h
   
    JE Moltiplicazione
    CMP Op, 0003h
   
    JE Divisione
    CMP Op,0004h
   
Somma:
    ;somma
    ADD ax, bx
    MOV Ris, ax
    JMP Fine
Sottrazione:
    ;sottrazione
    SUB ax, bx
    MOV Ris, ax
    JMP Fine
Moltiplicazione:
    ;moltiplicazione
    MUL bx
    MOV Ris, ax
    JMP FIne

Divisione:
    ;divisione
    div bx
    MOV RIs, ax
    JMP Fine
Fine:
           
    lea dx, prompt
    MOV ah, 9
    int 21h        ; output string at ds:dx
   
    ; wait for any key....    
    MOV ah, 1
    int 21h
   
    MOV ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.