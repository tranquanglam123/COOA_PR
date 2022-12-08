start:
	mov 30h, p2
	mov 40h, 30h;backup
	anl 30h, #00001111B;lay gia tri 4 bit dau cho a
	mov a, 40h;lay gia tri switch
	anl a, #11110000B; lay 4 bit sau, b
	swap a; doi 4 bit dau thanh 4 bit sau
	add a, 30h
	cpl a
	mov p1, a	
sjmp start