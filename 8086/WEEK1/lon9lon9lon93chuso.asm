;Nhap so thu nhat
mov ah,1H
int 21h
mov ah,0H
sub al,30h
mov dl ,10
mul  dl   ; ax = al * dl
mov cl,al

mov ah,1H
int 21h 
mov ah,0H
sub al,30h
add cl,al   

;nhap so thu hai
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

;Cong 2 so > 9
add bx,cx  
mov ax,0H
add ax,bx

div dl
mov cl,ah  ;phan don vi
mov ah,0H
div dl     
mov bl,ah   ;phan chuc


mov ah,2H
mov dl,al     ;phan tram  
add dl,30H
int 21h 

mov ah,2H
mov dl,bl   
add dl,30H
int 21h

mov ah,2H
mov dl,cl   
add dl,30H
int 21h






