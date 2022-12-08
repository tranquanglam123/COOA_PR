start:
	mov 30h, p2
	mov 40h, 30h;backup
	anl 30h, #00001111B;lay gia tri 4 bit dau cho a
	mov a, 40h;lay gia tri switch
	anl a, #11110000B; lay 4 bit sau, b
	swap a; doi 4 bit dau thanh 4 bit sau
	add a, 30h
	cpl a
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
	mov @R0, 30h
	add a, @R0
	mov p1, a
sjmp start