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
   
;enter name
     mov edx,OFFSET enter_name
    call WriteString
    inc edx
    call crlf
 
 cmp eax,1
 je  add1
 cmp eax,2
 je  add2
 cmp eax,3
 je  add3
 cmp eax,4
 je  add4
 cmp eax,5
 je  add5
 jne no_space


 ; if1
 add1:   
     mov edx,OFFSET str1
     mov ecx ,(LENGTHOF str1)-1
     call ReadString
     call crlf
   
   ;message (contact added)
   mov edx,OFFSET added
    call WriteString
    call crlf

    jmp again


  ; if two
   add2:
     mov edx,OFFSET str1
     mov ecx ,(LENGTHOF str1)-1  
     call ReadString
     call crlf

     mov edx,OFFSET anotherNumber
    call WriteString
     call crlf
     
    mov edx,OFFSET str2
    mov ecx ,(LENGTHOF str2)-1
     call ReadString
     call crlf

     mov edx,OFFSET added
    call WriteString
    call crlf
    jmp again


;if 3
add3:
   mov edx,OFFSET str1
     mov ecx ,(LENGTHOF str1)-1
     call ReadString
     call crlf

      mov edx,OFFSET anotherNumber
    call WriteString
     call crlf

    mov edx,OFFSET str2
    mov ecx ,(LENGTHOF str2)-1
     call ReadString
     call crlf

      mov edx,OFFSET anotherNumber
    call WriteString
     call crlf

      mov edx,OFFSET str3
     mov ecx ,(LENGTHOF str3)-1
     call ReadString
     call crlf

     mov edx,OFFSET added
    call WriteString
    call crlf
      
      jmp again

   


      ;if 4
     add4:
      mov edx,OFFSET str1
     mov ecx ,(LENGTHOF str1)-1
     call ReadString
     call crlf

      mov edx,OFFSET anotherNumber
    call WriteString
     call crlf

    mov edx,OFFSET str2
    mov ecx ,(LENGTHOF str2)-1
     call ReadString
     call crlf

      mov edx,OFFSET anotherNumber
    call WriteString
     call crlf

     mov edx,OFFSET str3
    mov ecx ,(LENGTHOF str2)-1
     call ReadString
     call crlf
     
     mov edx,OFFSET anotherNumber
    call WriteString
     call crlf

      mov edx,OFFSET str4
     mov ecx ,(LENGTHOF str4)-1
     call ReadString
     call crlf

     mov edx,OFFSET added
    call WriteString
    call crlf
        jmp again

    

      ;if 5
   add5:
     mov edx,OFFSET str1
     mov ecx ,(LENGTHOF str1)-1
     call ReadString
     call crlf

      mov edx,OFFSET anotherNumber
    call WriteString
     call crlf

    mov edx,OFFSET str2
    mov ecx ,(LENGTHOF str2)-1
     call ReadString
     call crlf

      mov edx,OFFSET anotherNumber
    call WriteString
     call crlf

     mov edx,OFFSET str3
    mov ecx ,(LENGTHOF str2)-1
     call ReadString
     call crlf

      mov edx,OFFSET anotherNumber
    call WriteString
     call crlf

      mov edx,OFFSET str4
     mov ecx ,(LENGTHOF str4)-1
     call ReadString
     call crlf

      mov edx,OFFSET anotherNumber
    call WriteString
     call crlf

     mov edx,OFFSET str5
     mov ecx ,(LENGTHOF str5)-1
     call ReadString
     call crlf

    mov edx,OFFSET added
    call WriteString
    call crlf
    jmp again

   
 ;if more than 5 
no_space:
    jmp again


 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 ; REMOVE NUMBER by its index

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
 remove:
    mov edx,OFFSET remove_name
    call WriteString
    call crlf



  ; take number of contacts you wanna add
   call ReadInt
     
 cmp eax,1
 je  remove1
 cmp eax,2
 je  remove2
 cmp eax,3
 je  remove3
 cmp eax,4
 je  remove4
 cmp eax,5
 je  remove5
 jne again


 remove1:

push edi           ;save registers
push es
push ds
mov ax,0
mov ecx,1
mov edi,OFFSET str1
pop es               ;load ES with DS
rep stosw            ;clear str1
pop es               ;restore registers
pop edi

 mov edx,OFFSET removed
    call WriteString
    call crlf
    jmp again
    

	 remove2:

push edi            ;save registers
push es
push ds
mov ax,0
mov ecx,1
mov edi,OFFSET str2
pop es              ;load ES with DS
rep stosw           ;clear Buffer
pop es              ;restore registers
pop edi

 mov edx,OFFSET removed
    call WriteString
    call crlf

    jmp again




remove3:

push edi           ;save registers
push es
push ds
mov ax,0
mov ecx,1
mov edi,OFFSET str3
pop es            ;load ES with DS
rep stosw         ;clear Buffer
pop es            ;restore registers
pop edi

 mov edx,OFFSET removed
    call WriteString
    call crlf

jmp again

remove4:

push edi             ;save registers
push es
push ds
mov ax,0
mov ecx,1
mov edi,OFFSET str4
pop es               ;load ES with DS
rep stosw            ;clear Buffer
pop es               ;restore registers
pop edi
  
 mov edx,OFFSET removed
    call WriteString
    call crlf

    jmp again

remove5:

push edi               ;save registers
push es
push ds
mov ax,0
mov ecx,1
mov edi,OFFSET str5
pop es                ;load ES with DS
rep stosw             ;clear Buffer
pop es                ;restore registers
pop edi
jmp again

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;message says removed

    mov edx,OFFSET removed
    call WriteString
    call crlf




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 ;view one contanct by entering its index 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

view_number:

    mov edx,OFFSET view_name
    call WriteString
    call crlf 

 ;give number by index
 ;;;;;;;;;;;;;;;;;;;;;;;;
 
 call ReadInt
   
    
 cmp eax,1
 je  view1
 cmp eax,2
 je  view2
 cmp eax,3
 je  view3
 cmp eax,4
 je  view4
 cmp eax,5
 je  view5
 jne again
view1:
    mov edx,OFFSET str1   
    call WriteString
    call crlf
    jmp again

  
  view2:
   mov edx,OFFSET str2   
    call WriteString
    call crlf
    jmp again

  
  view3:
   mov edx,OFFSET str3   
    call WriteString
    call crlf
    jmp again


    view4:
   mov edx,OFFSET str4  
    call WriteString
    call crlf
    jmp again


    view5:
   mov edx,OFFSET str5   
    call WriteString
    call crlf
    jmp again

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;view all contacts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

view_all:

  mov edx,OFFSET check_msg
   call WriteString
   call crlf

    mov edx,OFFSET str1   
    call WriteString
    call crlf
  
     mov edx,OFFSET str2    
    call WriteString
    call crlf
  
    mov edx,OFFSET str3 
    call WriteString
    call crlf

    mov edx,OFFSET str4    
    call WriteString
    call crlf

    mov edx,OFFSET str5   
    call WriteString
    call crlf
    jmp again

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;wrong choice message

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 wrong_choice:
   mov edx,OFFSET wrong
   call WriteString
   call crlf

    mov edx,OFFSET please
    call WriteString
    call crlf
    call crlf
    
    jmp home

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; go to home list again

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

again:
mov edx,OFFSET another_option
    call WriteString
    call crlf

    call ReadInt
     cmp eax,1
      je home 
      cmp eax,0
      je close

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;terminate the program

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
 close:
    INVOKE ExitProcess,0 
 INVOKE ExitProcess,0 
main ENDP
end main
