IDEAL
MODEL small
STACK 100h
DATASEG
bunny db 13,10,"               /\ /|",13,10
      db "              |||| |",13,10
      db "     ________ |||| |",13,10
      db "    /        \ \ | \ ",13,10
      db "   /  _       \/  @ @",13,10
      db "  /    \          = ^=",13,10
      db "/|      |         /",13,10
      db "\|     /________| |_",13,10
      db "  \________\    \ __\ ",13,10,'$'
owl db 13,10,"/\_/\ ",13,10
    db "((@v@))",13,10
    db "():::()",13,10
    db "VV-VV",13,10,'$'
hart db 13,10,"     __              __",13,10 
     db "   -     -        -      -",13,10  
	 db " /          \   /          \ ",13,10
	 db "(             V             )",13,10
	 db "|                           |",13,10
	 db "|                           |",13,10
	 db " \                         /",13,10
	 db "   \ _                 _ /",13,10
	 db "       - _         _ - ",13,10
	 db "           ', _ ,'",13,10,'$'	
message db " _______________________",13,10
        db "|_pictures_|_operations_|",13,10               
		db "| BANNY-1  | EXIT-0     |",13,10
		db "| OWL-2    |            |",13,10
		db "| HEART-3  |            |",13,10
		db " -----------------------",13,10,'$'  
CODESEG
proc buny		
	mov ax,@data
	mov ds,ax
	mov ah,9h
	mov dx,offset bunny
	int 21h
	inc bx
	ret
endp buny
proc owul
	mov ax,@data
	mov ds,ax
	mov ah,9h
	mov dx,offset owl
	int 21h
	inc bx
	ret
endp owul
proc heart
    mov ax,@data
	mov ds,ax
	mov ah,9h
	mov dx,offset hart
	int 21h
	inc bx
	ret
endp heart 
proc massage 
    mov ax,@data
	mov ds,ax
	mov ah,9h
	mov dx,offset message
	int 21h
	ret
endp massage
    
start:
    xor bx,bx
    mov ah, 0
	mov al, 2
	int 10h
	call massage
	lup:
	    cmp bx,2
		JE callm
		mov ah,1
		int 21h
		sub al,30h
		cmp al,0
		JE exit
		cmp al,1
		JE callb
		cmp al,2
		JE callo
		cmp al,3
		JE callh
		jmp lup
		callb:
			call buny
			jmp lup
		callo:
			call owul
			jmp lup
		callh:
			call heart
			jmp lup
		callm:
			call massage
			xor bx,bx
			jmp lup
    exit:
        mov ax, 4C00h
		int 21h
END start
CODSEG ends
