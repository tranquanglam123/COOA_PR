NHAPLAI:
    mov ah, 1h
    int 21h
    mov bh, al
    int 21h
    mov bl, al
DK1:
    cmp bh, 31h
    jl False
    je DK2
    jg TIENXULY
False:
    mov ah, 2h
    mov dl, 46h
    int 21h
    jmp NHAPLAI
DK2:
    cmp bl, 33h
    jge TIENXULY
    jl False
TIENXULY:
    mov ah, 0h
    mov al, bh
    mov dl, 10
    sub al, 30h
    mul dl ;ax = al*dl
    mov cl, al
    mov al, bl
    sub al, 30h
    add cl, al
    mov dl, cl
    dec cl
    mov bl, 2h
CHECKPRIME:
    mov ah, 0h
    mov al, dl
    cmp bl, cl
    jg  PRIME
    div bl; al=ax/bl
    inc bl
    cmp ah, 0h
    je  NONPRIME
    jg CHECKPRIME
PRIME:
    mov ah, 2h
    mov dl, 50h
    int 21h
    jmp exit
NONPRIME:
    mov ah, 2h
    mov dl, 4EH
    int 21h 
exit:
    RET
    
    
    
    
    
