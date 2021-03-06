; CheckSum - Copyright (c) 1989 by Chris May         (3/1/1989)
;旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
;� Function to obtain the twos complement checksum of string  �
;�                                                            �
;� DECLARE FUNCTION CheckSum%(Strg$)                          �
;� Sum% = CheckSum(Strg$)                                     �
;읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

.MODEL medium

.CODE

Public CheckSum
CheckSum Proc Far

   Push   BP
   Mov    BP,SP
   Mov    SI,[BP+06]          ;get address of Strg$
   Mov    CX,[SI]             ;put length of Strg$ into CX
   Jcxz   Invalid             ;Strg$ is invalid if of length zero
   Mov    SI,[SI+02]          ;load first character address of Strg$
   Xor    BX,BX               ;clear BX for saving complement
   Cld                        ;string moves will be in the forward direction

More:

   Lodsb                      ;load the character
   Sub    BL,AL               ;subtract it from the total
   Loop   More                ;still more

   Mov    AX,BX               ;put twos complement in AX

Invalid:

   Pop    BP
   Ret    2          
 
CheckSum EndP
End

