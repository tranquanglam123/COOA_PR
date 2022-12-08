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
;Tinh tong hieu
mov al, bl
add bl, cl ; bl = addition
cmp al, cl
jle Bless
jg Blarge
Bless:
sub         

