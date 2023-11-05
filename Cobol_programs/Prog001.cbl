 IDENTIFICATION                   DIVISION.               
 PROGRAM-ID. TESTE.                                       
******************************************                
*     TESTE AMBIENTE VANTIS              *                
******************************************                
*                                                         
 ENVIRONMENT                     DIVISION.                
*                                                         
 DATA                            DIVISION.                
 WORKING-STORAGE                 SECTION.                 
 77 WRK-VAR1            PIC X(30) VALUE 'CURSO MAINFRAME'.
 PROCEDURE                       DIVISION.                
 0001-INICIO                     SECTION.                 
     DISPLAY WRK-VAR1.                                    
     STOP RUN.                                            