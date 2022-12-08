org 100h      ;bat dau 

mov ah, 1;nhan du lieu nhap vao, luu vao thanh ghi AL
int 21h; input to al
sub al, 30h; substract so the al equal the real number
mov dl, al; save value into DL reg

mov ah, 1;
int 21h ;
sub al, 30h; num2     
sub dl, al ; DL= DL- AL       substract
;add dl, al         addition
add dl, 30h

mov ah, 2 ;WRITE output from DL
int 21h     ;after, AL = DL