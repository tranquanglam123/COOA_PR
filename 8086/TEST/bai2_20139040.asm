nhap:
    mov ah,1
    int 21h
    cmp al,0Dh;enter thi ketthuc
    je decimal
    inc cl
    cmp al,30h
    jl False
    cmp al,31h
    jg False
    jmp Condition1
Condition1:   ;Kiem tra 16kitu
    mov ah,0 
    sub ax,30h
    push ax   ; luu gia tri thap phan vao stack
    cmp cl,10h;xem du 16 kitu chua
    mov ch,cl; luu lai dung sau 
    je decimal
    jmp nhap
decimal:  ;Luu gia tri thap phan vao thanhghi
    mov dx,0
    pop dx  ;xuat input 
    or bx,dx ;cong gtri dx vao bx
    ror bx,1 ; dich sang phai 1 bit de cong tiep
    cmp cl,0 ;check con bnh so ?
    dec cl
    je shift
    jmp decimal
shift:
    mov al,16
    sub al,ch
    mov cl,al
    shr bx,cl; bao nhieu so dich bay nhieu bit
    mov ax,bx
mov cx,0ah
mov bx,0
division:     ;chia 10 push stack de in
    mov dx,0
    div cx
    push dx ; day phan du vao, dung de in
    inc bl
    cmp ax,0
    je DecSum
    jmp division
DecSum:
    mov dx,0
    pop dx 
    add bh,dl ; tinh tong cac so tahp phan
    add dl,30h  
    mov ah,2 
    int 21h 
    cmp bl,0 
    dec bl
    je exit
    jmp DecSum
False:
    mov cl, 0
    mov dl,'F'
    mov ah,2
    int 21h
    jmp nhap
exit: 
    mov ah,0
    mov al,bh
    div cl
    mov bh,ah
    mov dl,al
    add dl,30h
    mov ah,2
    int 21h
    mov dl,bh 
    add dl,30h
    mov ah,2
    int 21h 



