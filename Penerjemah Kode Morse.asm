.model small
.stack 100h

.data
    prompt db 'Teks $'
    msg_judul db 'PENERJEMAH KODE MORSE $'
    msg_morse db 'Kode Morse $'
    line db '================================================================ $'
    newline db 0Ah, 0Dh, '$'
    
    morse_A db '.-', '$'
    morse_B db '-...', '$'
    morse_C db '-.-.', '$'
    morse_D db '-..', '$'
    morse_E db '.', '$'
    morse_F db '..-.', '$'
    morse_G db '--.', '$'
    morse_H db '....', '$'
    morse_I db '..', '$'
    morse_J db '.---', '$'
    morse_K db '-.-', '$'
    morse_L db '.-..', '$'
    morse_M db '--', '$'
    morse_N db '-.', '$'
    morse_O db '---', '$'
    morse_P db '.--.', '$'
    morse_Q db '--.-', '$'
    morse_R db '.-.', '$'
    morse_S db '...', '$'
    morse_T db '-', '$'
    morse_U db '..-', '$'
    morse_V db '...-', '$'
    morse_W db '.--', '$'
    morse_X db '-..-', '$'
    morse_Y db '-.--', '$'
    morse_Z db '--..', '$'
    morse_space db ' ', '$'

    input_buffer db 50, ?, 50 dup('$')

.code
main:
    ; Inisialisasi
    mov ax, @data
    mov ds, ax
    
    ; Tampilkan nama aplikasi 'PENERJEMAH KODE MORSE'
    mov ah, 09h
    lea dx, msg_judul
    int 21h
    
    ; Tampilkan newline
    mov ah, 09h
    lea dx, newline
    int 21h
    
    ; Tampilkan newline
    mov ah, 09h
    lea dx, newline
    int 21h         

    ; Tampilkan prompt untuk input
    mov ah, 09h
    lea dx, prompt
    int 21h
    
    ; Tampilkan newline
    mov ah, 09h
    lea dx, newline
    int 21h        
    
    ; Tampilkan line
    mov ah, 09h
    lea dx, line
    int 21h
  
    ; Tampilkan newline
    mov ah, 09h
    lea dx, newline
    int 21h
    
    ; Ambil input dari pengguna
    lea dx, input_buffer
    mov ah, 0Ah
    int 21h
    
    ; Tampilkan newline
    mov ah, 09h
    lea dx, newline
    int 21h 
    
    ; Tampilkan newline
    mov ah, 09h
    lea dx, newline
    int 21h        
    
    ; Tampilkan line
    mov ah, 09h
    lea dx, line
    int 21h
    
    ; Tampilkan newline
    mov ah, 09h
    lea dx, newline
    int 21h
    
    ; Tampilkan newline
    mov ah, 09h
    lea dx, newline
    int 21h
    
    ; Tampilkan pesan 'Kode Morse'
    mov ah, 09h
    lea dx, msg_morse
    int 21h
    
    ; Tampilkan newline
    mov ah, 09h
    lea dx, newline
    int 21h        
    
    ; Tampilkan line
    mov ah, 09h
    lea dx, line
    int 21h
     
    ; Tampilkan newline
    mov ah, 09h
    lea dx, newline
    int 21h
    
    ; Loop untuk menerjemahkan tiap karakter
    lea si, input_buffer + 2
translate:
    mov al, [si]
    cmp al, 0  ; Cek apakah sudah mencapai akhir input
    je done
    call translate_char
    inc si
    jmp translate

translate_char:   
    ; Konversi huruf kecil ke huruf kapital (mengurangi dengan 20h jika huruf kecil)
    cmp al, 'a'          ; Bandingkan karakter dengan 'a' (huruf kecil pertama)
    jl check_upper_case  ; Jika al < 'a', lompat ke pengecekan huruf kapital
    cmp al, 'z'          ; Bandingkan karakter dengan 'z' (huruf kecil terakhir)
    jg check_upper_case  ; Jika al > 'z', lompat ke pengecekan huruf kapital
    sub al, 20h          ; Jika karakter adalah huruf kecil, ubah menjadi huruf kapital
     
check_upper_case:
    ; Penerjemahan karakter ke kode morse
    cmp al, 'A'
    je print_morse_A
    cmp al, 'B'
    je print_morse_B
    cmp al, 'C'
    je print_morse_C
    cmp al, 'D'
    je print_morse_D
    cmp al, 'E'
    je print_morse_E
    cmp al, 'F'
    je print_morse_F
    cmp al, 'G'
    je print_morse_G
    cmp al, 'H'
    je print_morse_H
    cmp al, 'I'
    je print_morse_I
    cmp al, 'J'
    je print_morse_J
    cmp al, 'K'
    je print_morse_K
    cmp al, 'L'
    je print_morse_L
    cmp al, 'M'
    je print_morse_M
    cmp al, 'N'
    je print_morse_N
    cmp al, 'O'
    je print_morse_O
    cmp al, 'P'
    je print_morse_P
    cmp al, 'Q'
    je print_morse_Q
    cmp al, 'R'
    je print_morse_R
    cmp al, 'S'
    je print_morse_S
    cmp al, 'T'
    je print_morse_T
    cmp al, 'U'
    je print_morse_U
    cmp al, 'V'
    je print_morse_V
    cmp al, 'W'
    je print_morse_W
    cmp al, 'X'
    je print_morse_X
    cmp al, 'Y'
    je print_morse_Y
    cmp al, 'Z'
    je print_morse_Z
    cmp al, ' '  ; Jika spasi
    je print_morse_space
    ret

print_morse_A:
    lea dx, morse_A
    call print_morse
    ret

print_morse_B:
    lea dx, morse_B
    call print_morse
    ret

print_morse_C:
    lea dx, morse_C
    call print_morse
    ret

print_morse_D:
    lea dx, morse_D
    call print_morse
    ret

print_morse_E:
    lea dx, morse_E
    call print_morse
    ret

print_morse_F:
    lea dx, morse_F
    call print_morse
    ret

print_morse_G:
    lea dx, morse_G
    call print_morse
    ret

print_morse_H:
    lea dx, morse_H
    call print_morse
    ret

print_morse_I:
    lea dx, morse_I
    call print_morse
    ret

print_morse_J:
    lea dx, morse_J
    call print_morse
    ret

print_morse_K:
    lea dx, morse_K
    call print_morse
    ret

print_morse_L:
    lea dx, morse_L
    call print_morse
    ret

print_morse_M:
    lea dx, morse_M
    call print_morse
    ret

print_morse_N:
    lea dx, morse_N
    call print_morse
    ret

print_morse_O:
    lea dx, morse_O
    call print_morse
    ret

print_morse_P:
    lea dx, morse_P
    call print_morse
    ret

print_morse_Q:
    lea dx, morse_Q
    call print_morse
    ret

print_morse_R:
    lea dx, morse_R
    call print_morse
    ret

print_morse_S:
    lea dx, morse_S
    call print_morse
    ret

print_morse_T:
    lea dx, morse_T
    call print_morse
    ret

print_morse_U:
    lea dx, morse_U
    call print_morse
    ret

print_morse_V:
    lea dx, morse_V
    call print_morse
    ret

print_morse_W:
    lea dx, morse_W
    call print_morse
    ret

print_morse_X:
    lea dx, morse_X
    call print_morse
    ret

print_morse_Y:
    lea dx, morse_Y
    call print_morse
    ret

print_morse_Z:
    lea dx, morse_Z
    call print_morse
    ret

print_morse_space:
    lea dx, morse_space
    call print_morse
    ret

print_morse:
    ; Menampilkan kode morse
    mov ah, 09h
    int 21h
    ; Menambahkan spasi setelah setiap karakter
    mov dl, ' '
    mov ah, 02h
    int 21h
    ret

done:
    ; Tampilkan newline setelah selesai
    mov ah, 09h
    lea dx, newline
    int 21h  
    mov ah, 09h
    lea dx, newline
    int 21h
    
    ; Tampilkan line
    mov ah, 09h
    lea dx, line
    int 21h

    ; Keluar dari program
    mov ah, 4Ch
    int 21h


