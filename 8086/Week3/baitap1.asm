NHAP :
    mov ah, 1h
    int 21h
    sub al, 30h
    cmp al, 0h
    jl False
    cmp al, 4h
    jg False
    je 4cs1
    jmp MAIN
False:
    mov ah, 2h
    mov dl, 'F'
    int 21h
    jmp NHAP
MAIN:
    cmp al, 3h 
    je 3cs1
    cmp al, 2h
    je 2cs1
    mov ah, 1h
    int 21h
    sub al, 30h
    mov bl, al
    int 21h
    sub al, 30h
    mov ah, 2h
    mov dl, bl
    int 21h
    mov dl, al
    int 21h
4cs1:
    mov dl, 10
    
4cs2:
    ret
4cs3:
    RET
4CS4:
    RET