IDEAL
MODEL small
STACK 100h
DATASEG
bunny db "               /\ /|",13,10
      db "              |||| |",13,10
      db "     ________ |||| |",13,10
      db "    /        \ \ | \ ",13,10
      db "   /  _       \/  @ @",13,10
      db "  /    \          =&gt;X&lt;=",13,10
      db "/|      |         /",13,10
      db "\|     /________| |_",13,10
      db "  \________\    \___\ ",13,10,'$'
owl db "/\_/\ ",13,10
    db "((@v@))",13,10
    db "():::()",13,10
    db "VV-VV",13,10,'$'	  
CODESEG
proc buny
	mov ax,@data
	mov ds,ax
	mov ah,9h
	mov dx,offset bunny
	int 21h
	mov ah,0h
	int 16h
	ret
endp buny
proc owul
	mov ax,@data
	mov ds,ax
	mov ah,9h
	mov dx,offset owl
	int 21h
	mov ah,0h
	int 16h
	ret
endp owul
start:
	call buny
	call owul
exit :
    mov ax, 4C00h
    int 21h
END start
CODSEG ends
