       IDENTIFICATION                            DIVISION.      
       PROGRAM-ID.   COBOL008.                                  
      *===================================================      
      *   AUTHOR: TRUTT                                         
      *   OBJECTIVE: EXERCICIO A REUNIR TUDO O QUE FOI          
      *            DADO ATE AO MOMENTO                          
      *   DATA: 02/11/2023                                      
      *===================================================      
       ENVIRONMENT                               DIVISION.      
       CONFIGURATION                             SECTION.       
       SPECIAL-NAMES.                                           
           DECIMAL-POINT IS COMMA.                              
      *                                                         
       DATA                                      DIVISION.      
       WORKING-STORAGE                           SECTION.       
       01 WRK-DATA.                                             
         02 WRK-CODE                PIC 9(04) VALUE ZEROS.      
         02 WRK-NAME                PIC X(30) VALUE SPACES.     
         02 WRK-CONT                PIC X(02) VALUE SPACES.     
         02 WRK-PAY                 PIC 9(08)V99 VALUE ZEROS.   
       77 WRK-CODE-COMP             PIC 9(05) COMP VALUE ZEROS. 
       77 WRK-CODE-NEW              PIC 9(05) COMP VALUE ZEROS. 
       77 WRK-PAY-IDE               PIC ZZ.ZZZ.ZZ9,99.          
       77 WRK-CODE-IDE              PIC ZZZZ9.                  
      *                                                         
       PROCEDURE                                 DIVISION.      
       0001-PRINCIPAL                            SECTION.       
      *----------------------------------------------------     
      *   RETORNA NA SYSOUT O LAYOUT PASSADO NO SYSIN           
      *         E DEVOLVE COM ALTERACOES                        
      *----------------------------------------------------     
           ACCEPT WRK-DATA.                                     
      *---------------------- MOVE ----------------------       
           MOVE WRK-CODE TO WRK-CODE-COMP.                      
           MOVE WRK-PAY  TO WRK-PAY-IDE.                        
                 *---------------------- COMPUTE -------------------   
           COMPUTE                                          
              WRK-CODE-NEW = WRK-CODE-COMP + 1000.          
              MOVE WRK-CODE-NEW TO WRK-CODE-IDE.            
      *--------------------- DISPLAY ---------------------  
           DISPLAY "CODIGO      : " WRK-CODE.               
           DISPLAY "NOME        : " WRK-NAME.               
           DISPLAY "PAIS        : " WRK-CONT.               
           DISPLAY "SALARIO     : " WRK-PAY-IDE " EUROS".   
           DISPLAY "CODIGO NOVO : " WRK-CODE-IDE.           
             STOP RUN.                                      
       0001-FIM-PRINCIPAL. EXIT.                            