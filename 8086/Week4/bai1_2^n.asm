Nhap: mov ah, 1h
        int 21h
        sub al, 30h
cmp al, 3h
jle Nhap
cmp al, 10h
jge Nhap
mov cl, al
mov dl, 00000001b
shl dx, cl
mov bx, 0ah
mov cx, 0h
mov ax, dx 
PushinP: ;chia de push vao stack
    mov dx,0 ;gan dx = 0, khi loop khong lo co sai so
    div bx 
    add dx, 30h 
    push dx; pushinp to stack
    inc cx ;increase : tang cx 1 don vi
    cmp ax,0
    jne PushinP
Display:  
    pop dx ;popinswing ra so dau tien
    mov ah,2
    int 21h  
    dec cx
    cmp cx,0 
    je OT
    jmp Display
OT:    RET