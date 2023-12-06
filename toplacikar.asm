;Klavyeden iki sayı alarak karşılaştırınız. 2.si büyükse çıkarma işlemi, değilse toplama işlemi yapınız.

islem segment 
a proc far 
assume cs:islem,ds:islem
mov ax,0
push ds ax 
mov ax,islem
mov ds,ax

mov ah,09h
lea dx,m1
int 21h

mov ah,01h
int 21h

sub al,30h

mov bl,al

mov ah,09h
lea dx,m2
int 21h

mov ah,01h
int 21h

sub al,30h ;al=2. sayı bl 1.sayı

cmp al,bl

ja cikar ;jump above al bl den büyükse c ye git yerine jg de olur

add bl,al
mov ah,09h
lea dx,m4
int 21h

mov ah,02h
mov dl,bl

add dl,30h
int 21h

jmp bitir
cikar:
sub al,bl
mov ah,09h
lea dx,m3
int 21h

mov ah,02h
mov dl,al

add dl,30h
int 21h

bitir:
ret
m1 db 10,13, 'Birinci sayiyi gir:$'
m2 db 10,13, 'İkinci sayiyi gir:$'
m3 db 10,13, 'Sayilarin farkı=$'
m4 db 10,13, 'Sayilarin toplamı=$'

a endp
islem ends
end