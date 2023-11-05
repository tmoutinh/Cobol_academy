       IDENTIFICATION                            DIVISION.         
       PROGRAM-ID.   COBOL007.                                     
      *===================================================         
      *   AUTHOR: TRUTT                                            
      *   OBJECTIVE: PROGRAMA DE APLICACAO DE INPUT NUMERAL        
      *  E APLICACAO DE MASCARAS                                   
      *   DATA: 02/11/2023                                         
      *===================================================         
       ENVIRONMENT                               DIVISION.         
       CONFIGURATION                             SECTION.          
       SPECIAL-NAMES.                                              
           DECIMAL-POINT IS COMMA.                                 
      *                                                            
       DATA                                      DIVISION.         
       WORKING-STORAGE                           SECTION.          
       77 WRK-QEUR                PIC 9(04)V99 VALUE ZEROS.        
       77 WRK-CTRE                PIC 9(08)V99 VALUE ZEROS.        
       77 WRK-QREA                PIC 9(11)V99 COMP-3 VALUE ZEROS. 
       77 WRK-QEUR-DISP           PIC Z.ZZ9,99.                    
       77 WRK-CTRE-DISP           PIC ZZ.ZZZ.ZZ9,99.               
       77 WRK-QREA-DISP           PIC Z.ZZZ.ZZZ.ZZ9,99.            
      *                                                            
       PROCEDURE                                 DIVISION.         
       0001-PRINCIPAL                            SECTION.          
      *----------------------------------------------------        
      *   RETORNA NA SYSOUT OS NUMEROS PASSADOS NO SYSIN           
      *     E APRESENTA A MULTIPLICACAO DELES                      
      *----------------------------------------------------        
           ACCEPT WRK-QEUR FROM SYSIN.                             
           ACCEPT WRK-CTRE FROM SYSIN.                             
           COMPUTE                                                 
              WRK-QREA = WRK-QEUR * WRK-CTRE.                      
      *---------------------- MOVE ----------------------          
           MOVE WRK-QEUR TO WRK-QEUR-DISP.                         
           MOVE WRK-CTRE TO WRK-CTRE-DISP.                         
                  MOVE WRK-QREA TO WRK-QREA-DISP.                      
      *--------------------- DISPLAY ---------------------      
           DISPLAY "QT EURO     : " LENGTH OF WRK-QEUR-DISP.    
           DISPLAY "CONVERSAO   : " LENGTH OF WRK-CTRE-DISP.    
           DISPLAY "COTACAO REAL: " LENGTH OF WRK-QREA-DISP.    
           DISPLAY "*------------------------------*"           
           DISPLAY "QT DE EURO  : " WRK-QEUR-DISP " EUROS".     
           DISPLAY "CONVERSAO   : " WRK-CTRE-DISP " EUROS".     
           DISPLAY "COTACAO REAL: " WRK-QREA-DISP " REAIS".     
             STOP RUN.                                          
       0001-FIM-PRINCIPAL. EXIT.                                    