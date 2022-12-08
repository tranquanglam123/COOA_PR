mov ah, 1h
int 21h
mov dl, al
cmp dl, 35h
jle TH1
jge TH2
TH1:
    cmp dl, 39h
    jg exit
    mov ah, 2h
    int 21h 
    inc dl
    jmp TH1
TH2:
    cmp dl, 30h
    jl exit
    mov ah, 2h
    int 21h
    dec dl
    jmp TH2
exit:
    RET
    