[org 0x7c00]

mov bp, 0x8000
mov sp, bp ; set stack, stack pointer

mov bx, 0x9000
mov dh, 2 ; read 2 sectors

call disk_load

mov dx, [0x9000]
call print_hex
call print_nl

mov dx, [0x9000 + 512] ; load second sector
call print_hex

jmp $

%include "sect_print.asm"
%include "sect_print_hex.asm"
%include "disk.asm"

times 510 - ($-$$) db 0
dw 0xaa55

times 256 dw 0xdada ; sector 2
times 256 dw 0xface ; sector 3
