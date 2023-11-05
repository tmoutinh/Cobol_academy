       IDENTIFICATION                            DIVISION.   
       PROGRAM-ID.   COBOL002.                               
      *===================================================   
      *   AUTHOR: TRUTT                                      
      *   OBJECTIVE: PROGRAMA DE APLICACAO DE INPUT          
      *   DATA: 30/10/2023                                   
      *===================================================   
       ENVIRONMENT                               DIVISION.   
      *                                                      
       DATA                                      DIVISION.   
       WORKING-STORAGE                           SECTION.    
       77 WRK-CURSO               PIC X(04) VALUE SPACES.    
       77 WRK-LINHA               PIC X(30) VALUE SPACES.    
       77 WRK-DATA                PIC X(08) VALUE SPACES.    
      *                                                      
       PROCEDURE                                 DIVISION.   
       0001-PRINCIPAL                            SECTION.    
      *----------------------------------------------------  
      *   RETORNA NA SYSOUT A LITERAL PASSADA NO SYSIN       
      *     E APRESENTA A IDADE EM FORMATO YYYYMMDD          
      *----------------------------------------------------  
           ACCEPT WRK-CURSO FROM SYSIN.                      
           ACCEPT WRK-LINHA FROM SYSIN.                      
           ACCEPT WRK-DATA FROM DATE YYYYMMDD.               
      *--------------------- DISPLAY ---------------------   
           DISPLAY "CURSO "                                  
                   WRK-CURSO.                                
           DISPLAY WRK-LINHA.                                
           DISPLAY "DATA :"                                  
                   WRK-DATA.                                 
             STOP RUN.                                       
       0001-FIM-PRINCIPAL. EXIT.                             