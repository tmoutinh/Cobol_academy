       IDENTIFICATION                            DIVISION.  
       PROGRAM-ID.   COBOL012.                              
      *===================================================  
      *   AUTHOR: TRUTT                                     
      *   OBJECTIVE: PROGRAMA DE UTILIZACAO DE REDEFINE     
      *   DATA: 03/11/2023                                  
      *===================================================  
       ENVIRONMENT                               DIVISION.  
      *                                                     
       DATA                                      DIVISION.  
       WORKING-STORAGE                           SECTION.   
       01 WRK-DATA.                                         
           02 WRK-NOME              PIC X(15) VALUE ZEROS.  
           02 WRK-RUA               PIC X(15) VALUE ZEROS.  
           02 WRK-NUMERO            PIC X(04) VALUE ZEROS.  
           02 WRK-DISTRITO          PIC X(15) VALUE SPACES. 
           02 FILLER                PIC X(20).              
      *                                                     
       01 WRK-DATA-RED    REDEFINES WRK-DATA.               
           02 WRK-NOME-RED          PIC X(15).              
           02 WRK-ENDERECO-RED      PIC X(34).              
           02 FILLER                PIC X(20).              
      *                                                     
       PROCEDURE                                 DIVISION.  
       0001-PRINCIPAL                            SECTION.   
      *---------------------------------------------------- 
      *   RETORNA NA SYSOUT APENAS OS CAMPOS ESSENCIAIS     
      *---------------------------------------------------- 
           ACCEPT WRK-DATA.                                 
      *-------------------- DISPLAY ---------------------   
           DISPLAY "NOME     : " WRK-NOME-RED.              
           DISPLAY "ENDERECO : " WRK-ENDERECO-RED.          
             STOP RUN.                                      
       0001-FIM-PRINCIPAL. EXIT.                            