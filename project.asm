    .MODEL SMALL
    .STACK 100H

    .DATA
        HEAD DB '_____College Courses_____','$'
        MSG1 DB  ' Enter the year of study (1, 2, 3, 4):$'
        MSG2 DB  ' Choose the department (1. IT, 2. CS, 3. IS): ','$'
        MSG3 DB  ' Year not found!','$'
        MSG4 DB  ' Department not found!','$'
        input_buffer db 6, '$'
        number dw 0
        
        FIRST_YEAR DB ' Introduction to Programming ,Mathematics ,Discrete Mathematics, physics, introduction to computer scince, english, is, it, OOP, logic, probability','$'
        SECOND_YEAR DB ' Operating Systems1 ,Data Base ,Web Development ,Computer Graphics, Data Structures,electronic, data communication, probability2','$'
        
        IT_THIRD_YEAR DB ' electronic2 ,Computer Networks ,database2,research method,software engineering','$'
        IT_FOURTH_YEAR DB ' Software Engineering ,Network Security, Artificial Intelligence', '$'
        
        CS_THIRD_YEAR DB ' Operating Systems,Algorithms ,Computer Networks,Software Engineering , software engineering, assembly, logic, SW2, OS2, AI1', '$'
        CS_FOURTH_YEAR DB ' NLP ,IOT , DISTRIBUTED SYSTEM, COMPILER, ARABIZATION, EMBESSES SYSTEM', '$'
        
        IS_THIRD_YEAR DB ' Information Security, Computer Networks , Web Development , Project Management,software engineering', '$'
        IS_FOURTH_YEAR DB ' Knowledge Management , Big Data Analytics , E-Commerce, support system, project management, ', '$'

    .CODE
        MAIN PROC
        .startup
            
    start:
            ; Display prompt for user input
            MOV AH, 09H
            LEA DX, HEAD
            INT 21H
            
            MOV DL, 0AH   ; Line feed
            MOV AH, 02H
            INT 21H
            MOV AH, 09H
            LEA DX, MSG1
            INT 21H
            
            MOV DL, 0AH   ; Line feed
            MOV AH, 02H
            INT 21H
            
            ; Read user input
            MOV AH, 01H
            INT 21H
            SUB AL, 30H   ; Convert ASCII to numeric value
            
            ; Check the entered number and display the message
            CMP AL, 1
            JE FIRSTYEAR
            
            CMP AL, 2
            JE SECONDYEAR
            
            CMP AL, 3
            JE THIRDYEAR
            
            CMP AL, 4
            JE FOURTHYEAR
            
            displayInvalid:
                MOV AH, 09H
                MOV DX, offset MSG3
                INT 21H

                JMP start

            FIRSTYEAR:
                MOV AH, 09H
                LEA DX, FIRST_YEAR
                INT 21H
                
                JMP exitProgram
            
            SECONDYEAR:
                MOV AH, 09H
                LEA DX, SECOND_YEAR
                INT 21H
                
                JMP exitProgram
            
            THIRDYEAR:
                LEA DX,MSG2
                MOV AH,09H
                INT 21H
                
                MOV DL, 0AH   ; Line feed
                MOV AH, 02H
                INT 21H

                ; Read user input
                MOV AH, 01H
                INT 21H
                SUB AL, 30H 
                
                CMP AL, 1
                JE ITTHIRDYEAR
                
                CMP AL, 2
                JE CSTHIRDYEAR
                
                CMP AL, 3
                JE ISTHIRDYEAR
                
            Department_Not_Found_THIRDYEAR:
                MOV AH, 09H
                MOV DX, offset MSG4
                INT 21H

                JMP THIRDYEAR

                
                
            FOURTHYEAR:
                LEA DX,MSG2
                MOV AH,09H
                INT 21H
                
                 MOV DL, 0AH   ; Line feed
                 MOV AH, 02H
                INT 21H

                ; Read user input
                MOV AH, 01H
                INT 21H
                SUB AL, 30H 
                
                CMP AL, 1
                JE ITFOURTHYEAR
                
                CMP AL, 2
                JE CSFOURTHYEAR
                
                CMP AL, 3
                JE ISFOURTHYEAR
                
                Department_Not_Found_FOURTHYEAR:
                MOV AH, 09H
                MOV DX, offset MSG4
                INT 21H

                JMP FOURTHYEAR 
       
            ITTHIRDYEAR:
                
                 MOV AH, 09H
                LEA DX, IT_THIRD_YEAR
                INT 21H
                
                JMP exitProgram
                
            CSTHIRDYEAR:
             
              MOV AH, 09H
              LEA DX, CS_THIRD_YEAR
              INT 21H
              
              JMP exitProgram
              
              
            ISTHIRDYEAR:
             
              MOV AH, 09H
              LEA DX, IS_THIRD_YEAR
              INT 21H
              
              JMP exitProgram
              
              
          ITFOURTHYEAR:
             
              MOV AH, 09H
              LEA DX, IT_FOURTH_YEAR
              INT 21H

              JMP exitProgram
              
              
          CSFOURTHYEAR:
             
              MOV AH, 09H
              LEA DX, CS_FOURTH_YEAR
              INT 21H
              
              JMP exitProgram
              
              
          ISFOURTHYEAR:
             
              MOV AH, 09H
              LEA DX, IS_FOURTH_YEAR
              INT 21H
                
               
            exitProgram:
                MOV AH, 4CH     
                INT 21H
                
        MAIN ENDP
        END MAIN