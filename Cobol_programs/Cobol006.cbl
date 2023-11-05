       IDENTIFICATION                            DIVISION.      
       PROGRAM-ID.   COBOL006.                                  
      *===================================================      
      *   AUTHOR: TRUTT                                         
      *   OBJECTIVE: PROGRAMA DE APLICACAO DE INPUT NUMERAL     
      *  CONVERSAO E UTILIZACAO DE VARIAVEIS BINARIAS           
      *   DATA: 31/11/2023                                      
      *===================================================      
       ENVIRONMENT                               DIVISION.      
      *                                                         
       DATA                                      DIVISION.      
       WORKING-STORAGE                           SECTION.       
       77 WRK-NUM1                PIC 9(04) VALUE ZEROS.        
       77 WRK-NUM2                PIC 9(04) VALUE ZEROS.        
       77 WRK-NUM1-COMP           PIC 9(04) COMP-3 VALUE ZEROS. 
       77 WRK-NUM2-COMP           PIC 9(04) COMP-3 VALUE ZEROS. 
       77 WRK-RES-COMP            PIC 9(08) COMP-3 VALUE ZEROS. 
      *                                                         
       PROCEDURE                                 DIVISION.      
       0001-PRINCIPAL                            SECTION.       
      *----------------------------------------------------     
      *   RETORNA NA SYSOUT OS NUMEROS PASSADOS NO SYSIN        
      *     E APRESENTA A MULTIPLICACAO DELES                   
      *----------------------------------------------------     
           ACCEPT WRK-NUM1 FROM SYSIN.                          
           ACCEPT WRK-NUM2 FROM SYSIN.                          
           MOVE WRK-NUM1 TO WRK-NUM1-COMP.                      
           MOVE WRK-NUM2 TO WRK-NUM2-COMP.                      
             COMPUTE                                            
                WRK-RES-COMP = WRK-NUM1-COMP * WRK-NUM2-COMP.   
      *--------------------- DISPLAY ---------------------      
           DISPLAY "NUMERO 1 : " LENGTH OF WRK-NUM1-COMP.       
           DISPLAY "NUMERO 2 : " LENGTH OF WRK-NUM2-COMP.       
           DISPLAY "RESULTADO: " LENGTH OF WRK-RES-COMP.        
           DISPLAY "*------------------------------*"           
                      DISPLAY "NUMERO 1 : " WRK-NUM1-COMP.          
           DISPLAY "NUMERO 2 : " WRK-NUM2-COMP.          
           DISPLAY "RESULTADO: " WRK-RES-COMP.           
             STOP RUN.                                   
       0001-FIM-PRINCIPAL. EXIT.                         