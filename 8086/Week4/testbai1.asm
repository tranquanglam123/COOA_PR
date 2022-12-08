Nhap: mov ah, 1h
        mov dl, 0ah
        int 21h
        sub al, 30h; tru di 30 
        mov ah, 0h
        mul dl; nhan cho 10
        mov bx, ax;1 so
        mov ah, 1h
        int 21h
        sub al, 30h
        mov ah, 0h
        add ax, bx
        mul dl; nhan cho 10 lan 2
        mov bx, ax; 2 so
        mov ah, 1h
        int 21h
        sub al, 30h
        mov ah, 0h              
        add ax, bx
        mul dl
        mov bx, ax; 3 so
        mov ah, 1h
        int 21h
        sub al, 30h
        mov ah, 0h
        add bx, ax; so thu 4
DieuKien1:
    cmp bx, 3E7h
    jle False
    cmp bx, 270Fh
    jge False
    dec bx
    mov cx, 2h; bien chay tinh SNT
    jmp DieuKien2
DieuKien2:
    mov dx, 0h
    mov ax, bx ; gan ax = so input
    inc ax
    cmp cx, bx ; so sanh so chia voi input-1
    jg  True
    div cx; ax=ax/cx, dx = remainder
    inc cx
    cmp dx, 0h
    je False
    jg DieuKien2
True:
    mov ah, 2h
    mov dl, 'T'
    int 21h
    inc bx; bx= input
    mov cl, 16
Binary:
    dec cl
    cmp cl, 0h
    jl exit
    shl bx, 1
    jc Output
    mov ah, 2h
    mov dl, 30h
    int 21h
    jmp Binary
Output:
    mov dl, 31h
    mov ah, 2h
    int 21h
    jmp Binary 
False:
    mov ah, 2h
    mov dl, 'F'
    int 21h
    jmp Nhap
exit: RET        
        
        