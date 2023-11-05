       IDENTIFICATION                            DIVISION.   
       PROGRAM-ID.   COBOL004.                               
      *===================================================   
      *   AUTHOR: TRUTT                                      
      *   OBJECTIVE: PROGRAMA DE APLICACAO DE INPUT NUMERAL  
      *   DATA: 30/10/2023                                   
      *===================================================   
       ENVIRONMENT                               DIVISION.   
      *                                                      
       DATA                                      DIVISION.   
       WORKING-STORAGE                           SECTION.    
       77 WRK-NUM1                PIC 9(04) VALUE ZEROS.     
       77 WRK-NUM2                PIC 9(04) VALUE ZEROS.     
       77 WRK-RES                 PIC 9(08) VALUE ZEROS.     
      *                                                      
       PROCEDURE                                 DIVISION.   
       0001-PRINCIPAL                            SECTION.    
      *----------------------------------------------------  
      *   RETORNA NA SYSOUT OS NUMEROS PASSADOS NO SYSIN     
      *     E APRESENTA A MULTIPLICACAO DELES                
      *----------------------------------------------------  
           ACCEPT WRK-NUM1 FROM SYSIN.                       
           ACCEPT WRK-NUM2 FROM SYSIN.                       
             COMPUTE WRK-RES = WRK-NUM1 * WRK-NUM2.          
      *--------------------- DISPLAY ---------------------   
           DISPLAY "NUMERO 1 : " WRK-NUM1.                   
                                                             
           DISPLAY "NUMERO 2 : " WRK-NUM2.                   
           DISPLAY "RESULTADO: " WRK-RES.                    
             STOP RUN.                                       
       0001-FIM-PRINCIPAL. EXIT.                             