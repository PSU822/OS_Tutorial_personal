gdt_start: ; 라벨 제거하지 말것
	; null 8바이트로 시작해야함
	dd 0x0
	dd 0x0


gtd_code:
	dw 0xffff
	dw 0x0
	db 0x0
	db 10011010b
	db 11001111b
	db 0x0

gdt_data:
	dw 0xffff
	dw 0x0
	db 0x0
	db 10010010b
	db 11001111b
	db 0x0

gdt_end:
	
gdt_descriptor:
	dw gdt_end - gdt_start- 1 ; size (16bit), 언제나 크기가 하나 작음
	dd gdt_start ; address, 32bit

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start	; gdt 주소 오프셋
