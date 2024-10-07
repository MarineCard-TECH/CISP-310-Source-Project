; Example assembly language program -- adds two numbers
; Author:  R. Detmer
; Date:    6/2013

.586
.MODEL FLAT

INCLUDE io.h                                    ; header file for input/output

.STACK 4096                                     ; Reserve this much memory for the stack

 .DATA
    number1 DWORD   ?                           ;Store first number
    number2 DWORD   ?                           ;Store second number

    prompt1 BYTE    "Enter first number", 0     ;Prompt the first number
    prompt2 BYTE    "Enter second number", 0    ;Prompt the second number

    string  BYTE    40 DUP (?)                  ;This is used to store the user input

    resultLbl BYTE  "The sum is", 0             ;   Label to display the output
    sum     BYTE    11 DUP (?), 0               ;   Store the sum of adding numbers 1 and 2

.CODE
_MainProc PROC

        input   prompt1, string, 40      ; read ASCII characters
        atod    string          ; convert to integer
        mov     number1, eax    ; store in memory

        input   prompt2, string, 40      ; repeat for second number
        atod    string
        mov     number2, eax

        mov     eax, number1             ; first number to EAX
        add     eax, number2             ; add second number
        dtoa    sum, eax                 ; convert to ASCII characters
        output  resultLbl, sum           ; output label and sum

        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code