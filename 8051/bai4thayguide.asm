start:
	mov 30h, p2
	mov 40h, 30h;backup
	anl 30h, #00001111B;lay gia tri 4 bit dau cho a
	mov a, 40h;lay gia tri switch
	anl a, #11110000B; lay 4 bit sau, b
	swap a; doi 4 bit dau thanh 4 bit sau
	add a, 30h
mov 30h, #0C0H
mov 31h, #0F9H
mov 32h, #0A4H
mov 33h, #0B0H
mov 34h, #099H
mov 35h, #092H
mov 36h, #082H
mov 37h, #08FH
mov 38h, #080H
mov 39h, #090H
	mov b, #0AH
	div AB; a= thuong,b=sodu
	mov R0, #30h;luu dia chi 30h 
	MOV R2, a
	add a, R0
	mov R0, a
	mov p1, @R0
	mov a, b
	mov p3, #0001000h
	mov R0, #30h;luu dia chi 30h 
	MOV R2, a
	add a, R0
	mov R0, a
	mov p1, @R0
sjmp start
