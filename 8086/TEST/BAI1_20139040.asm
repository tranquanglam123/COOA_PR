nhap:
    mov cx,0ah
    mov ah,1h
    int 21h
    and ax,0fh
    mul cx
    mov bx,ax
    mov ah,1h
    int 21h
    and ax,0fh
    add ax,bx
    mul cx
    mov bx,ax
    mov ah,1h
    int 21h
    and ax,0fh
    add ax,bx
    mul cx 
    mov bx,ax
    mov ah,1h
    int 21h
    and ax,0fh
    add ax,bx 
    mov bx,ax
    mov cx,2h 
    cmp ax,3e7h
    jle false 
    cmp ax,270fh
    jge false
prime:
    mov ax,bx
    mov dx,0h 
    div cx
    inc cx                          
    cmp dx,0h
    je  false
    cmp bx,cx
    jl  prime
    mov dl,'T'
    mov ah,2h
    int 21h
    mov cl,16 
binary:
    dec cl
    cmp cl,0h
    jl  exit
    shl bx,1  
    jc  output
    mov ah,2h
    mov dl,30h
    int 21h
    jmp binary
output:
    mov dl,31h 
    mov ah,2h
    int 21h
    jmp binary
false:
    mov ah,2h
    mov dl,'F'
    int 21h
    jmp nhap
exit: 
    ret
