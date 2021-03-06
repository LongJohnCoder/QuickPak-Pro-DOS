;********** EdHelp7.Asm - dedicated routine to process load text in QEdit7

;Copyright (c) 1988 Ethan Winer


;This routine stores the help screen for QEdit7 in the code segment to
;avoid taking string space from a BASIC program.  Besides storing the
;help messages, it also loads the text into a string array.  Understand
;this is NOT a general purpose routine to be added to your programs,
;though the technique is certainly useful in this type of situation.

;calling syntax - REDIM Help(34) AS STRING * 57
;       CALL LoadHelp7(BYVAL VARSEG(Help(1)), BYVAL VARPTR(Help(1)))


.Model Medium,BASIC
.Code

NumLines   Equ 34         ;the help text is fifteen lines
LineLength Equ 57         ;and each help line is 57 characters

LoadHelp7 Proc Uses DS ES SI DI, ArrayAdr:DWord

    Les  DI,ArrayAdr      ;point ES:DI to the Help() array
    Push CS               ;put CS into DS for Movsb below
    Pop  DS
    Mov  SI,Offset Help   ;now DS:SI points to the start of the help text
    Cld                   ;insure that the string moves below are forward
    Mov  CX,NumLines * LineLength    ;calculate how many characters to copy
    Rep  Movsb            ;copy the data from the code segment into Help()
    Ret                   ;return to BASIC

LoadHelp7 Endp


Help DB "浜様様様様様様様様様様様� Help 突様様様様様様様様様様様融"
     DB "� Home/End        - Move cursor to start/end of line    �"
     DB "� Ctrl-Home/End   - Move cursor to top/bottom of screen �"
     DB "� PgUp/PgDn       - Display previous/next page          �"
     DB "� Ctrl-PgUp/PgDn  - Display first/last page             �"
     DB "� Ctrl-Left/Right - Move cursor by whole words          �"
     DB "� Ctrl-Y          - Delete the current line             �"
     DB "� Ctrl-N          - Insert a new line above             �"
     DB "� Escape          - Exit edit window                    "
     DB "藩様様様様様様� Press Escape to exit help 突様様様様様様�"

     DB "�                                                       �"
     DB "� Use the Shift-Cursor keys to begin a block operation. �"
     DB "� To mark a column use Shift-Right and then Shift-Down. �"
     DB "� Once a block has been marked, pressing Ctrl Ins will  �"
     DB "� capture it into the Paste buffer.  If Shift Delete is �"
     DB "� pressed, the block will be captured and then deleted. �"
     DB "� Use Shift-Ins to paste the block at a new location.   �"
     DB "�                                                       "

     DB "�                                                       �"
     DB "� To mark a block with the mouse, simply position the   �"
     DB "� mouse cursor at the beginning of the block and press  �"
     DB "� the left button.  While the button is down the cursor �"
     DB "� may be moved in any direction.  If the mouse is first �"
     DB '� moved up or down, marking is in "sentence" mode.  To  �'
     DB "� mark a block in column mode move left or right first. �"
     DB "�                                                       "

     DB "� The text may be scrolled either by sliding the scroll �"
     DB "� bar diamonds at the bottom and right, or by pressing  �"
     DB "� on the arrow icons near the bottom right corner.  The �"
     DB "� window may be resized by pressing on the lower right  �"
     DB "� or top left corners, and then moving the mouse.  The  �"
     DB "� right margin may be changed by pressing on the right  �"
     DB "� margin icon at the top of the screen, and then moving �"
     DB "� it to the desired new position.                       "

End
