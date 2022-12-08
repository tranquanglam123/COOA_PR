.model small
.stack 100h
.data 
.CODE 
    ; LAY DU LIEU TU DATA  VAO DS
  MOV AX, @DATA
  MOV DS,AX

   
  
  ;nhap so thu nhat 
   MOV AH, 1H
   INT 21H
   SUB AL, 30H
   MOV cl, AL

   
   ;nhap so thu 2 
   MOV AH, 1H
   INT 21H
   SUB AL, 30H
   MOV ch, AL

   Add cl,ch
   mov ch,0H 
   mov ax,cx
   mov dl,10
   div dl  
   
   mov bl,ah
   
 
   mov ah, 2H  
   add al,30H
   mov dl,al
   int 21h 
	
	mov ah, 2 
	add bl,30H
    mov dl,bl
	int 21h

   
   
   MOV AH, 4CH
   INT 21H
   END

