       IDENTIFICATION                            DIVISION.      
       PROGRAM-ID.   COBOL011.                                  
      *===================================================      
      *   AUTHOR: TRUTT                                         
      *   OBJECTIVE: PROGRAMA DE UTILIZACAO DE OVERWRITE FILLER 
      *   DATA: 03/11/2023                                      
      *===================================================      
       ENVIRONMENT                               DIVISION.      
      *                                                         
       DATA                                      DIVISION.      
       WORKING-STORAGE                           SECTION.       
       01 WRK-DATA.                                             
           02 WRK-CODIGO            PIC 9(05) VALUE ZEROS.      
           02 WRK-NOME              PIC X(15) VALUE ZEROS.      
           02 FILLER                PIC X(10).                  
           02 WRK-CARGO             PIC X(15) VALUE SPACES.     
           02 FILLER                PIC X(15).                  
      *                                                         
       PROCEDURE                                 DIVISION.      
       0001-PRINCIPAL                            SECTION.       
      *----------------------------------------------------     
      *   RETORNA NA SYSOUT APENAS OS CAMPOS ESSENCIAIS         
      *----------------------------------------------------     
           ACCEPT WRK-DATA.                                     
      *-------------------- DISPLAY ---------------------       
           DISPLAY "CODIGO : " WRK-CODIGO.                      
           DISPLAY "NOME   : " WRK-NOME.                        
           DISPLAY "CARGO  : " WRK-CARGO.                       
             STOP RUN.                                          
       0001-FIM-PRINCIPAL. EXIT.                                