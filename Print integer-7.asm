ORG 100h           ; Origin, to specify that the program starts at 100h (COM file format)


MOV DX, OFFSET msg_input  ; Load the address of the message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the message

; Read a single character from the user
MOV AH, 01h        ; Function 01h of INT 21h is used to read a character
INT 21h            ; Call DOS interrupt to get the character
MOV BL, AL         ; Store the input character in BL


MOV DX, OFFSET msg_output  ; Load the address of the output message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the output message


MOV DL, BL         ; Move the  BL to DL
MOV AH, 02h        ; Function 02h of INT 21h is used to print a single character
INT 21h            ; Call DOS interrupt to print the character
JMP EndProgram     ; Jump to the end of the program

NotDigit:
; If the input is not an uppercase letter, display an error message
MOV DX, OFFSET msg_error  ; Load the address of the error message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the error message

EndProgram:
; Terminate the program
MOV AH, 4Ch        ; Function 4Ch of INT 21h terminates the program
INT 21h            ; Call DOS interrupt to exit

msg_input  DB 'Enter a digit: $'
msg_output DB 0Dh, 0Ah, 'The entered digit is: $'  ; Output message
msg_error  DB 0Dh, 0Ah, 'Error: Not a digit! $'  ; Error message

END                ; End of program