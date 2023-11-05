       IDENTIFICATION                            DIVISION.    
       PROGRAM-ID.   COBOL001.                                
      *===================================================    
      *   AUTHOR: TRUTT                                       
      *   OBJECTIVE: PRIMEIRO PROGRAMA TESTE DE DISPLAY E STOP
      *   DATA: 30/10/2023                                    
      *===================================================    
       ENVIRONMENT                               DIVISION.    
      *                                                       
       DATA                                      DIVISION.    
      *                                                       
       PROCEDURE                                 DIVISION.    
       0001-PRINCIPAL                            SECTION.     
      *----------------------------------------------------   
      *   RETORNA NA SYSOUT A LITERAL PROGRAMA COB001         
      *----------------------------------------------------   
           DISPLAY "PROGRAMA COB001".                         
           DISPLAY "O DISPLAY ESTA AQUI!".                    
             STOP RUN.                                        
       0001-FIM-PRINCIPAL. EXIT.                              