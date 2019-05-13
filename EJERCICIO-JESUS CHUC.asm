
; LENGUAJE DE INTERFAZ
; ELABORADO POR:MIGUEL TUZ CAHUM
; FECHA:25/03/2019
; PRACTICA 5

.MODEL SMALL

.stack 64 


.DATA 

    mj1 db "MENU DE OPERACIONES","$"
    mj2 db "[1] SUMA","$"
    mj3 db "[2] COMPARACION","$"

    mj6 db "SELECCIONE UNA OPCION:","$"    
    
    msj1 db 0ah,0dh, "Ingrese Tres digito del 0 al 9 : ", "$"
msj2 db 0ah,0dh, "Primer Digito: ", "$"
msj3 db 0ah,0dh, "Segundo Digito: ", "$"
msj4 db 0ah,0dh, "Tercer Digito: ", "$"
Mayor db 0ah,0dh, "El Digito Mayor Es: ", "$"

Digito1 db 100 dup("$")
Digito2 db 100 dup("$")
Digito3 db 100 dup("$")

salto db 13,10,"",13,10,"$" ;salto de linea


numero1 db 00
numero2 db 00
suma db 00
resta db 00
multiplicacion db 00
division db 00
modulo db 00

  
C1 DB 'OPERACIONES ARITMETICAS','$'
msgn1 db 'ingresa el primer valor:','$'
msgn2 db 'ingresa el segundo valor:','$'
   
msg1 db 016,'SUMA=','$'  
msg2 db 016,'RESTA=','$' 
msg3 db 016,'Multiplicacion=','$' 
msg4 db 016,'Division=','$' 


.CODE 
     
     MOV AX,@DATA
     MOV DS,AX  
      
     inicio:
     
     
     MOV AX,0600H   
     MOV BH,2FH   
     MOV CX,0000H                                   
     MOV DX,184FH
     INT 10H
     

;    ------------

   

;    ------------   ( FONDO NEGRO )
     
     MOV AX,0600H   
     MOV BH,0FH   
     MOV CX,030AH                                   
     MOV DX,0446H
     INT 10H  
;    ------------   ( FONDO AZUL )     
     
     MOV AX,0600H   
     MOV BH,1FH   
     MOV CX,060AH                                   
     MOV DX,1446H
     INT 10H
     
     

;    ------------  CURSOR MJ1
     
     MOV AH,02H
     MOV BH,0   ;   
     MOV DH,04H
     MOV DL,20H
     INT 10H 
  
     
     MOV AH,09H
     LEA DX,mj1
     INT 21H 
     
;    ------------  CURSOR MJ2
     
     MOV AH,02H
     MOV BH,0   ;   
     MOV DH,07H
     MOV DL,0DH
     INT 10H 
  
     
     MOV AH,09H
     LEA DX,mj2
     INT 21H 

;    ------------  CURSOR MJ3 

     MOV AH,02H
     MOV BH,0   ;   
     MOV DH,0AH
     MOV DL,0DH
     INT 10H 
  
     
     MOV AH,09H
     LEA DX,mj3
     INT 21H

   
;    ------------  CURSOR MJ6  

     MOV AH,02H
     MOV BH,0   ;   
     MOV DH,16H
     MOV DL,31H
     INT 10H 
  
     
     MOV AH,09H
     LEA DX,mj6
     INT 21H 
     

     
     
;----------------------------


     MOV AH,0H
     INT 16H   
     
     CMP AL,49
     JE SUMAS
     
     CMP AL,50
     JE RESTAS 

     
     fin:
     mov ax,4c00h       ;funcion que termina el programa
     int 21h
     
     SUMAS:
     
     MOV AH,05H
     MOV AL,0
     INT 10H

    
     MOV AX,0600H
     MOV BH,04FH
     MOV CX,0000H
     MOV DX,1950H
     INT 10H 

     
     MOV AH,02H
     MOV BH,0
     MOV DX,051EH
     INT 10H 
     
     MOV AH,09H
     LEA DX,C1
     INT 21H 
     
    
     
     ;Posicionar Cursor
     
     MOV AH,02H
     MOV BH,0
     MOV DX,070BH
     INT 10H
     
     ;lEER DATOS
     MOV AH,09H
     LEA DX,msgn1
     INT 21H


    ;Leer teclado
    mov ah,01
    int 21h
    ;
    sub al,30h ;para obtener el numero
    mov numero1,al ; guardo en variable  
    
          
     ;Posicionar Cursor
     
     MOV AH,02H
     MOV BH,0
     MOV DX,090bH
     INT 10H
             
     ;lEER DATOS
     MOV AH,09H
     LEA DX,msgn2
     INT 21H
     
    mov ah,01
    int 21h
    sub al,30h
    mov numero2,al
    
    ;suma
    
    mov al,numero1
    add al,numero2
    mov suma,al 
               
    ;resta           
    mov al,numero1
    sub al,numero2
    mov resta,al 
    
    ;multiplicacion
    
    mov al,numero1
    mul numero2
    mov multiplicacion,al
    
    ;division
    
    mov al,numero1
    div numero2
    mov division,al
    
    ;modulo
    
    mov al,numero1
    div numero2
    mov modulo,al 
    
 
    
    ;Mostrar en pantalla suma 
    
    ;POSICIONAR EL CURSOR 
    
    MOV AH,02H
    MOV BH,0
    MOV DX,0D0BH
    INT 10h
    
    mov ah,09h
    lea dx,msg1 
    int 21h
            
    MOV AL,SUMA       
    AAM
     MOV BX,AX
     MOV AH,02H
     MOV DL,BH
     ADD DL,30H
     INT 21H
     
     MOV AH,02H
     MOV DL,BL
     ADD DL,30H
     INT 21H          
    ;mov dl,suma
    ;add dl,30h
    ;mov ah,02
    ;int 21h        
 
     
     
           
    ;Mostrar en pantalla resta 
    
    ;POSICIONAR EL CURSOR 
    
    MOV AH,02H
    MOV BH,0
    MOV DX,0E0BH
    INT 10h
      
    mov ah,09h
    lea dx,msg2 
    int 21h
          MOV AL,RESTA       
    AAM
     MOV BX,AX
     MOV AH,02H
     MOV DL,BH
     ADD DL,30H
     INT 21H
     
     MOV AH,02H
     MOV DL,BL
     ADD DL,30H
     INT 21H
     
      
    ;Mostrar en pantalla multiplicacion
    
    
    ;POSICIONAR EL CURSOR 
    
    MOV AH,02H
    MOV BH,0
    MOV DX,0F0BH
    INT 10h 
    
    mov ah,09h
    lea dx,msg3 
    int 21h
          MOV AL,MULTIPLICACION       
    AAM
     MOV BX,AX
     MOV AH,02H
     MOV DL,BH
     ADD DL,30H
     INT 21H
     
     MOV AH,02H
     MOV DL,BL
     ADD DL,30H
     INT 21H 
     
     
    ;Mostrar en pantalla division 
    
    
    ;POSICIONAR EL CURSOR 
    
    MOV AH,02H
    MOV BH,0
    MOV DX,100BH
    INT 10h 
    
    mov ah,09h
    lea dx,msg4 
    int 21h
    mov dl,division
    add dl,30h
    mov ah,02
    int 21h

     MOV AH,0H
     INT 16H
     
     CMP AL,08
     JE inicio 
     
     JMP fin
     
     
     RESTAS:
     
     MOV AH,05H
     MOV AL,0
     INT 10H
     
     mov ax,0600h
     mov bh,5fh
     mov cx,0000h
     mov dx,1950h
     int 10h
inicio1:

mov si,0
mov ax,@data
mov ds,ax

mov ah,02h
mov bh,0
mov dx,59h
int 10h

mov ah,09
mov dx,offset msj1 ;Imprimimos el msj1
int 21h

call saltodelinea;llamamos el metodo saltodelinea.

call pedircaracter ;llamamos al metodo

mov Digito1,al ;lo guardado en AL a digito1

call saltodelinea

call pedircaracter

mov Digito2,al

call saltodelinea

call pedircaracter

mov Digito3,al

call saltodelinea

;*******************************COMPARAR*****************************************

mov ah,digito1
mov al,digito2
cmp ah,al ;compara primero con el segundo
ja compara-1-3 ;si es mayor el primero, ahora lo compara con el tercero
jmp compara-2-3 ;si el primero no es mayor,ahora compara el 2 y 3 digito
compara-1-3:
mov al,digito3 ;ah=primer digito, al=tercer digito
cmp ah,al ;compara primero con tercero
ja mayor1 ;si es mayor que el tercero, entonces el primero es mayor que los 3

compara-2-3:
mov ah,digito2
mov al,digito3
cmp ah,al ;compara 2 y 3, YA NO es necesario compararlo con el 1,porque ya sabemos que el 1 no es mayor que el 2
ja mayor2 ;Si es mayor el 2,nos vamos al metodo para imprimirlo
jmp mayor3 ;Si el 2 no es mayor, obvio el 3 es el mayor

 
mayor1:

call MensajeMayor ;llama al metodo que dice: El digito mayor es:

mov dx, offset Digito1 ;Imprir El Digito 1 es mayor
mov ah, 9
int 21h
jmp exit

mayor2:
call MensajeMayor

mov dx, offset Digito2 ;Salto de linea
mov ah, 9
int 21h
jmp exit

mayor3:
call MensajeMayor

mov dx, offset Digito3 ;Salto de linea
mov ah, 9
int 21h
jmp exit

;********************************METODOS*****************************************

MensajeMayor:
mov dx, offset Mayor ;El digito Mayor es:
mov ah, 9
int 21h

ret
pedircaracter:
mov ah,01h; pedimos primer digito
int 21h
ret

saltodelinea:
mov dx, offset salto ;Salto de linea
mov ah, 9
int 21h
ret

exit:
mov ax, 4c00h;utilizamos el servicio 4c de la interrupcion 21h
int 21h ;para termianr el programa
ends

     
     MOV AH,0H
     INT 16H
     
     CMP AL,08
     JE inicio 

     JMP fin    
    
     
     
     ;MOV AH,4CH
     ;INT 21H        
    

END