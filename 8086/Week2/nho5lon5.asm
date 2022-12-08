;Nhap so
mov ah, 1h
int 21h
;Dieu kien rang buoc
cmp al, 30h; So sanh voi 0
jge Output; >= 0 thi Output
jmp False
cmp al, 39h
jle Output;<=9 thi output
jmp False
Output:
cmp al, 35h
jle Output1; <=5 output 1
jmp Output2
Output1:
mov ah, 2h
mov dl, al
cmp dl, 39h
jl increase
jmp 
int 21h
inc dl
jmp Output1
Output2:
