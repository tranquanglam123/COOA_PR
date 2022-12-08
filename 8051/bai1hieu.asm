input:
mov p1, p2;gan gia tri sw qua led
mov a, p2;gan gtri sw qua thanh ghi a
cpl a;dao nguoc thanh ghi a
mov b, a; gan a cho b
anl a,#11110000b; 
swap a
anl b, #00001111b
add a, b
cpl a
mov p1, a
