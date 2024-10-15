ORG 100h           ; Origin, to specify that the program starts at 100h (COM file format)

; Display message "Enter the first digit: "
MOV DX, OFFSET msg_input1  ; Load the address of the first input message
MOV AH, 09h                ; Function 09h of INT 21h is used to display a string
INT 21h                    ; Call DOS interrupt to print the message

; Read the first digit from the user
MOV AH, 01h        ; Function 01h of INT 21h is used to read a character
INT 21h            ; Call DOS interrupt to get the character
SUB AL, '0'        ; Convert ASCII to integer by subtracting '0'
MOV BL, AL         ; Store the first digit in BL

; Display message "Enter the second digit: "
MOV DX, OFFSET msg_input2  ; Load the address of the second input message
MOV AH, 09h                ; Function 09h of INT 21h is used to display a string
INT 21h                    ; Call DOS interrupt to print the message

; Read the second digit from the user
MOV AH, 01h        ; Function 01h of INT 21h is used to read a character
INT 21h            ; Call DOS interrupt to get the character
SUB AL, '0'        ; Convert ASCII to integer by subtracting '0'
MOV BH, AL         ; Store the second digit in BH

; Perform subtraction: BL - BH
SUB BL, BH         ; Subtract the second digit (BH) from the first (BL)

; Print the message "The result of subtraction is: "
MOV DX, OFFSET msg_output  ; Load the address of the output message
MOV AH, 09h                ; Function 09h of INT 21h is used to display a string
INT 21h                    ; Call DOS interrupt to print the output message

; Check if the result is negative
CMP BL, 0         ; Compare the result with 0
JGE PositiveResult ; Jump to PositiveResult if the result is non-negative

; Negative result, print the negative sign
MOV DL, '-'        ; Load the ASCII value for the negative sign '-'
MOV AH, 02h        ; Function 02h of INT 21h is used to print a single character
INT 21h            ; Call DOS interrupt to print the negative sign

; Convert the negative result to positive for display
NEG BL             ; Negate the value to convert it to a positive

PositiveResult:
; Convert the result to ASCII
ADD BL, '0'        ; Convert the result back to ASCII

; Print the result of subtraction
MOV DL, BL         ; Move the result to DL
MOV AH, 02h        ; Function 02h of INT 21h is used to print a single character
INT 21h            ; Call DOS interrupt to print the character

EndProgram:
; Terminate the program
MOV AH, 4Ch        ; Function 4Ch of INT 21h terminates the program
INT 21h            ; Call DOS interrupt to exit

; Data Section
msg_input1  DB 'Enter the first digit: $'              ; Input prompt for the first digit
msg_input2  DB 0Dh, 0Ah, 'Enter the second digit: $'   ; Input prompt for the second digit
msg_output DB 0Dh, 0Ah, 'The result of subtraction is: $' ; Output message

END                ; End of program