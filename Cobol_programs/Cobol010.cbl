       IDENTIFICATION                            DIVISION.  
       PROGRAM-ID.   COBOL010.                              
      *===================================================  
      *   AUTHOR: TRUTT                                     
      *   OBJECTIVE: PROGRAMA DE APLICACAO DE FILLER        
      *   DATA: 03/11/2023                                  
      *===================================================  
       ENVIRONMENT                               DIVISION.  
      *                                                     
       DATA                                      DIVISION.  
       WORKING-STORAGE                           SECTION.   
       77 FILLER      PIC X(40) VALUE "-- DATA 1 --".       
       01 WRK-DATA.                                         
          02 WRK-DATA-YEAR        PIC X(02) VALUE SPACES.   
          02 WRK-DATA-MONTH       PIC X(02) VALUE SPACES.   
          02 WRK-DATA-DAY         PIC X(02) VALUE SPACES.   
      *                                                     
       77 FILLER      PIC X(40) VALUE "-- DATA 2 --".       
       01 WRK-DATA-2.                                       
          02 WRK-DATA-DAY         PIC X(02) VALUE SPACES.   
          02 FILLER               PIC X(01) VALUE "/".      
          02 WRK-DATA-MONTH       PIC X(02) VALUE SPACES.   
          02 FILLER               PIC X(03) VALUE "/20".    
          02 WRK-DATA-YEAR        PIC X(02) VALUE SPACES.   
      *                                                     
       77 FILLER      PIC X(40) VALUE "-- DATA 3 --".       
       01 WRK-DATA-3.                                       
          02 WRK-DATA-DAY         PIC X(02) VALUE SPACES.   
          02 FILLER               PIC X(01) VALUE "/".      
          02 WRK-DATA-MONTH       PIC X(02) VALUE SPACES.   
          02 FILLER               PIC X(01) VALUE "/".      
          02 WRK-DATA-YEAR        PIC X(02) VALUE SPACES.   
      *                                                     
       PROCEDURE                                 DIVISION.  
       0001-PRINCIPAL                            SECTION.   
      *----------------------------------------------------   
      *   RETORNA NA SYSOUT A DATA EM FORMATO DD/M/YYYY       
      *----------------------------------------------------   
           ACCEPT WRK-DATA FROM DATE.                         
           MOVE CORR WRK-DATA TO WRK-DATA-2.                  
           MOVE CORR WRK-DATA TO WRK-DATA-3.                  
           DISPLAY "DATA :" WRK-DATA.                         
           DISPLAY "DATA :" WRK-DATA-2.                       
           DISPLAY "DATA :" WRK-DATA-3.                       
             STOP RUN.                                        
       0001-FIM-PRINCIPAL. EXIT.                              