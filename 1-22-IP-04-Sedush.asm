.386
.model flat, stdcall
option casemap :none
include \masm32\include\masm32rt.inc
.data?
buff db 128 dup(?)
buffD db 32 dup(?)
buffDNeg db 32 dup(?)
buffE db 32 dup(?)
buffENeg db 32 dup(?)
buffF db 32 dup(?)
buffFNeg db 32 dup(?)
.data
MsgBoxCaption db "Седуш Михайло лаб1", 0
numbers db "Hb = %s",10,
"A = %d",10,"-A = %d",10,
"B = %d",10,"-B = %d",10,
"C = %d",10,"-C = %d",10,
"D = %s",10,"-D = %s",10,
"E = %s",10,"-E = %s",10,
"F = %s",10,"-F = %s",0

Hb db "2608003", 0

AByte db 26
AByteNeg db -26
A2Byte dw 26
A2ByteNeg dw -26
A4Byte dd 26
A4ByteNeg dd -26
A8Byte dq 26
A8ByteNeg dq -26

B2Byte dw 2608
B2ByteNeg dw -2608
B4Byte dd 2608
B4ByteNeg dd -2608
B8Byte dq 2608
B8ByteNeg dq -2608

C4Byte dd 26082003
C4ByteNeg dd -26082003
C8Byte dq 26082003
C8ByteNeg dq -26082003

D4Byte dd 0.0611 
D4ByteNeg dd -0.061
D8Byte dq 0.061 
D8ByteNeg dq -0.061

E8Byte dq 6.165
E8ByteNeg dq -6.165 

F8Byte dq 61659.582
F8ByteNeg dq -61659.582
F10Byte dt 61659.582
F10ByteNeg dt -61659.582
.code
Main:
invoke FloatToStr2, D8Byte, addr buffD
invoke FloatToStr2, D8ByteNeg, addr buffDNeg
invoke FloatToStr2, E8Byte, addr buffE
invoke FloatToStr2, E8ByteNeg, addr buffENeg
invoke FloatToStr2, F8Byte, addr buffF
invoke FloatToStr2, F8ByteNeg, addr buffFNeg
invoke wsprintf, addr buff, addr numbers, addr Hb, A4Byte,A4ByteNeg, B4Byte, B4ByteNeg,
 C4Byte, C4ByteNeg,
 addr buffD, addr buffDNeg, addr buffE, addr buffENeg, addr buffF, addr buffFNeg
invoke MessageBox, 0, addr buff, addr MsgBoxCaption, 0
invoke ExitProcess, 0
end Main