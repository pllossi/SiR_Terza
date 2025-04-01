name "Selezione if"
; Programma che se il primo num e' maggiore o e' uguale effettua la sottrazione alrementi li addiziona. Risultato va in ris

data segment
    ; add your data here!
    Num1 DW 2A00h
    Num2 DW 1A00h
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
    jge salta
    add ax,bx
    
    jmp fine
    ; add your code here
salta:
    sub ax,bx
 
fine:    
    mov ris,ax       
    
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
