Nhap:
    mov cl, 0ah
    mov ah, 1h
    nhap_sub:
        int 21h
        cmp al, '='
        je PushinP
        cmp 30h
        jl Nhap
        cmp 39h
        jg Nhap
        sub al 30h
        mul cl
        mov bx, al
        mov ah, 0h
        add bx, ax
       
cmp bx, 04D2h
jl Nhap
