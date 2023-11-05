       IDENTIFICATION                            DIVISION.     
       PROGRAM-ID.   COBOL013.                                 
      *===================================================     
      *   AUTHOR: TRUTT                                        
      *   OBJECTIVE: PROGRAMA DE OPERACOES ARITMETICAS         
      *   DATA: 03/11/2023                                     
      *===================================================     
       ENVIRONMENT                               DIVISION.     
       CONFIGURATION                             SECTION.      
       SPECIAL-NAMES.                                          
           DECIMAL-POINT IS COMMA.                             
      *                                                        
       DATA                                      DIVISION.     
       WORKING-STORAGE                           SECTION.      
      *                                                        
       77 WRK-NUM1                  PIC 9(02)V99 VALUE 10.     
       77 WRK-NUM2                  PIC 9(02)V99 VALUE 05.     
       77 WRK-RES                   PIC 9(04)V99 COMP VALUE 05.
       77 WRK-RES-IDE               PIC -Z.ZZ9,99.             
      *                                                        
       PROCEDURE                                 DIVISION.     
       0001-PRINCIPAL                            SECTION.      
      *----------------------------------------------------    
      *   RETORNA NA SYSOUT APENAS OS CAMPOS ESSENCIAIS        
      *----------------------------------------------------    
           ACCEPT WRK-NUM1.                                    
           ACCEPT WRK-NUM2.                                    
           DISPLAY "NUMERO 1: " WRK-NUM1.                      
           DISPLAY "NUMERO 2: " WRK-NUM2.                      
      *-------------------- ADDITION ---------------------     
           ADD WRK-NUM1 WRK-NUM2 GIVING WRK-RES.               
           MOVE WRK-RES TO WRK-RES-IDE.                        
           DISPLAY "RESULTADO ADICAO : " WRK-RES-IDE.          
      *------------------- SUBTRACTION --------------------    
           SUBTRACT WRK-NUM1 FROM WRK-NUM2 GIVING WRK-RES.     
           MOVE WRK-RES TO WRK-RES-IDE.                        
           DISPLAY "RESULTADO SUBTRACAO : " WRK-RES-IDE.       
      *------------------- MULTIPLICATION -------------------- 
           MULTIPLY WRK-NUM1 BY WRK-NUM2 GIVING WRK-RES.       
           MOVE WRK-RES TO WRK-RES-IDE.                        
           DISPLAY "RESULTADO MULTIPLICACAO : " WRK-RES-IDE.   
      *------------------- DIVISION --------------------       
           DIVIDE WRK-NUM1 BY WRK-NUM2 GIVING WRK-RES.         
           MOVE WRK-RES TO WRK-RES-IDE.                        
           DISPLAY "RESULTADO DIVISAO : " WRK-RES-IDE.         
      *------------------- COMPUTE --------------------        
           COMPUTE WRK-RES = (WRK-NUM1 + WRK-NUM2) / 2.        
           MOVE WRK-RES TO WRK-RES-IDE.                        
           DISPLAY "RESULTADO COMPUTE : " WRK-RES-IDE.         
      *---------------------------------------                 
             STOP RUN.                                         
       0001-FIM-PRINCIPAL. EXIT.                               