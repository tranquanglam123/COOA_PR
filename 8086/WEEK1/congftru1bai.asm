;Nhap so thu nhat vao thanh ghi Cl
    ;Nhap hang chuc va nhan len 10
mov ah,1H
int 21h
mov ah,0H
sub al,30h
mov dl ,10
mul  dl   ; ax = al * dl
mov cl,al
     ;Nhap hang don vi va cong vao 
mov ah,1H
int 21h 
mov ah,0H
sub al,30h
add cl,al   

;nhap so thu hai vao thanh ghi Bl
mov ah,1H
int 21h
mov ah,0H
sub al,30h
mov dl ,10
mul  dl 
mov bl,al

mov ah,1H
int 21h 
mov ah,0H
sub al,30h
add bl,al        

;Tinh tong, hieu
mov al, cl
sub cl, bl   ; hieu
add bl, al   ; tong
;In hieu
mov al, cl
mov ah, 0h
div dl
mov cl, ah; phan don vi

mov ah, 2h
add cl, 30h
mov dl, cl
int 21h

mov ah, 2h
add al, 30h
mov dl, al
int 21h
;In Tong
mov ah, 0h
mov al, bl

div dl
mov cl, ah
add cl, 30h

mov ah, 2h
mov dl, cl
int 21h

mov ah, 2h
add al, 30h
mov dl, al
int 21h