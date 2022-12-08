;nhap so thu nhat
mov ah, 1h
int 21h
sub al, 30h
mov cl, al
;nhap so thu hai
mov ah, 1h
int 21h
sub al, 30h        q
mov ch, al
;Tinh toan
add cl, ch; cl = cl +ch
mov ch, 0h
mov ax, cx

mov dl ,10
div dl; al = ax/bl, ah remainder

mov bl, ah

mov ah, 2h
add al, 30h
mov dl, al
int 21h

mov ah, 2
add bl ,30h
mov dl, bl
int 21h
