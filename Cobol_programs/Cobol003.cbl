       IDENTIFICATION                            DIVISION.         
       PROGRAM-ID.   COBOL003.                                     
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
       01 WRK-DATA.                                                
          02 WRK-DATA-YEAR        PIC X(04) VALUE SPACES.          
          02 WRK-DATA-MONTH       PIC X(02) VALUE SPACES.          
          02 WRK-DATA-DAY         PIC X(02) VALUE SPACES.          
      *                                                            
       PROCEDURE                                 DIVISION.         
       0001-PRINCIPAL                            SECTION.          
      *----------------------------------------------------        
      *   RETORNA NA SYSOUT A LITERAL PASSADA NO SYSIN             
      *   E APRESENTA A IDADE EM FORMATO DD / MM / YYYY            
      *----------------------------------------------------        
           ACCEPT WRK-CURSO FROM SYSIN.                            
           ACCEPT WRK-LINHA FROM SYSIN.                            
           ACCEPT WRK-DATA FROM DATE YYYYMMDD.                     
           DISPLAY "CURSO "                                        
                   WRK-CURSO.                                      
           DISPLAY WRK-LINHA.                                      
           DISPLAY "DATA :"                                        
                   WRK-DATA-DAY " DE "                             
                   WRK-DATA-MONTH " DE "                           
                   WRK-DATA-YEAR.                                  
             STOP RUN.  
       0001-FIM-PRINCIPAL. EXIT.                                                