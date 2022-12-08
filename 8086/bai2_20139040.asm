nhapx:
mov ah,1
int 21h
cmp al,0Dh
je decimal
inc cl
cmp al,30h
jl inf
cmp al,31h
jg inf
jmp check
inf:
mov dl,'F'
mov ah,2
int 21h
jmp nhapX
check:
mov ah,0 
sub ax,30h
push ax
cmp cl,16
mov ch,cl
je decimal
jmp nhapx
decimal:
mov dx,0
pop dx 
or bx,dx
ror bx,1
cmp cl,0
dec cl
je dich
jmp decimal
dich:
mov al,16
sub al,ch
mov cl,al
shr bx,cl
;mov ax,bx
;
;mov dl,0 
;dshr:
;shr ax,1
;jc tong 
;cmp ax,0
;je intong
;jmp dshr
;tong:
;inc dl
;jmp dshr   
;intong:
;mov al,dl
;mov cl,10
;div cl
;mov ch,ah
;mov dl,al
;add dl,30h
;mov ah,2
;int 21h
;mov dl,ch
;add dl,30h
;mov ah,2
;int 21h
mov ax,bx
mov cx,10
mov bx,0
chia:
mov dx,0
div cx
push dx
inc bl
cmp ax,0
je xuat
jmp chia
xuat:
mov dx,0
pop dx 
add bh,dl
add dl,30h  
mov ah,2 
int 21h 
cmp bl,0 
dec bl
je exit
jmp xuat
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



