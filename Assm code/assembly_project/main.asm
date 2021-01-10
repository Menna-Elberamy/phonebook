INCLUDE Irvine32.inc


.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO , dwExitCode:DWORD

.data

msg   BYTE   "               Please, Enter your choice number",0            
msg1  BYTE   "1-append contact" ,0
msg2  BYTE   "2-remove contact" ,0
msg3  BYTE   "3-view number",0
msg4  BYTE    "4-view all contacts",0             

wrong  BYTE "wrong choice !!!!!",0
please BYTE "please choose from 1 to 4",0

enter_name BYTE "please enter your name follwed by your number ",0

;your_name  BYTE 20 dup (?)
;NAMES      WORD 10 dup(?)


str1 db "No Contact added      ",0
str2 db "No Contact added      ",0
str3 db "No Contact added      ",0
str4 db "No Contact added      ",0
str5 db "No Contact added      ",0


check_msg  BYTE "Your Contacts",0
added      BYTE "Contact added",0

another_option BYTE "if you need another option press 1 if you donot press 0",0

remove_name BYTE "Enter contanct index to remove",0
removed     Byte "Contact removed",0

view_name BYTE "Enter Contact index to view",0

how_many  BYTE "How many names will you add (max 5)? ",0
anotherNumber  BYTE "enter another number",0



.code
main PROC

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;home list

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

home:
 
 ;starting  messages
 ;;;;;;;;;;;;;;;;;;;;;;

 mov edx,OFFSET msg
 call WriteString
 call crlf

 mov edx,OFFSET msg1
 call WriteString
 call crlf 
  mov edx,OFFSET msg2
 call WriteString
 call crlf

 mov edx,OFFSET msg3
 call WriteString
 call crlf

 mov edx,OFFSET msg4
 call WriteString
 call crlf

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 call ReadInt
     
 cmp eax,1
 je  append
 cmp eax,2
 je  remove
 cmp eax,3
 je  view_number
 cmp eax,4
 je  view_all
 jne wrong_choice 

 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;add contanct but first asking 
;how many numbers wil you add

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  append:

   ;how many numbers?

    mov edx,OFFSET how_many
    call WriteString
    inc edx
    call crlf


    ; take number of contacts you wanna add
   call ReadInt