mov dl, 0ah
input11:
    mov ah, 1h
    int 21h
Dk1:
    cmp al, 30h
    jl  input11
    cmp al, 39h
    jg input11
input12:
    sub al, 30h
    and ax, 0fh
    mul dl
    mov cx, bx
    int 21h
    add cl, al
input21:
    mov ah, 1h
    int 21h
Dk2:
    cmp al, 30h
    jl input21
    cmp al, 39h
    jg input21
input22:    
    sub al, 30h
    and ax, 0fh
    mul dl
    mov bx, ax
    int 21h
    add bl, al
Addition:
    mov dx, bx
    add dx, cx
    mov ah, 2h
    int 21h
Comp:
    cmp bx, cx
    jle Subtract1
    jg Subtract2
Subtract1:
    mov dx, cx
    sub dx, bx
    mov ah, 2h
    int 21h
    jmp OT
Subtract2:
    mov dx, bx
    sub dx, cx 
    mov ah, 2h
    int 21h
OT:
    RET