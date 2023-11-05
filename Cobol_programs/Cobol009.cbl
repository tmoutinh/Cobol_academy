       IDENTIFICATION                            DIVISION.    
       PROGRAM-ID.   COBOL009.                                
      *===================================================    
      *   AUTHOR: TRUTT                                       
      *   OBJECTIVE: EXERCICIO A INPUT E CALCULO COM SINAL    
      *   DATA: 02/11/2023                                    
      *===================================================    
       ENVIRONMENT                               DIVISION.    
       CONFIGURATION                             SECTION.     
       SPECIAL-NAMES.                                         
           DECIMAL-POINT IS COMMA.                            
      *                                                       
       DATA                                      DIVISION.    
       WORKING-STORAGE                           SECTION.     
       77 WRK-SALACUM               PIC 9(06)V99 VALUE ZEROS. 
       77 WRK-FATURA                PIC 9(06)V99 VALUE ZEROS. 
       77 WRK-SALDO                 PIC S9(06)V99 VALUE ZEROS.
       77 WRK-SALACUM-IDE           PIC ZZZ.ZZ9,99.           
       77 WRK-FATURA-IDE            PIC ZZZ.ZZ9,99.           
       77 WRK-SALDO-IDE             PIC -ZZZ.ZZ9,99.          
      *                                                       
       PROCEDURE                                 DIVISION.    
       0001-PRINCIPAL                            SECTION.     
      *----------------------------------------------------   
      *   RETORNA NA SYSOUT O LAYOUT PASSADO NO SYSIN         
      *         E DEVOLVE COM ALTERACOES                      
      *----------------------------------------------------   
           ACCEPT WRK-SALACUM.                                
           ACCEPT WRK-FATURA.                                 
      *---------------------- COMPUTE -------------------     
           COMPUTE                                            
              WRK-SALDO = WRK-SALACUM - WRK-FATURA.           
      *---------------------- MOVE ----------------------     
           MOVE WRK-SALACUM  TO WRK-SALACUM-IDE.              
           MOVE WRK-FATURA   TO WRK-FATURA-IDE.               
                      MOVE WRK-SALDO    TO WRK-SALDO-IDE.              
      *--------------------- DISPLAY ---------------------  
           DISPLAY "SALDO ACUMULADO: " WRK-SALACUM-IDE.     
           DISPLAY "FATURA A PAGAR : " WRK-FATURA-IDE.      
           DISPLAY "SALDO FINAL    : " WRK-SALDO-IDE.       
             STOP RUN.                                      
       0001-FIM-PRINCIPAL. EXIT.                            