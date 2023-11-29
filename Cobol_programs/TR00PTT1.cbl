       IDENTIFICATION                         DIVISION.
       PROGRAM-ID. TR00PTT1.
      *==========================================
      *  AUTOR: TRUTT
      *  OBJETIVO: PROGRAMA DE LEITURA DE TABELA
      *            DB2 COM CURSOR
      *  DATA: 28/11/2023
      *==========================================
       ENVIRONMENT                            DIVISION.
       CONFIGURATION                           SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA                                   DIVISION.
       WORKING-STORAGE                         SECTION.
           EXEC SQL
             INCLUDE "BOOKFUNC"
           END-EXEC.
           EXEC SQL
             INCLUDE SQLCA
           END-EXEC.
           EXEC SQL
             DECLARE CURSORFUNC CURSOR FOR
               SELECT IDFUN,NOMEFUN,ENDERFUN,SALFUN,DEPFUN
                 FROM TRUTT.FUNC
           END-EXEC.
       77 WRK-IDFUN         PIC 9(05)      VALUE ZEROS.
       77 WRK-SQLCODE       PIC -999       VALUE ZEROS.
       77 WRK-SALARIO-IDE   PIC ZZZ.ZZ9,99 VALUE ZEROS.
       77 WRK-INDICA-NULO   PIC S9(04)     COMP.
       77 WRK-STATS         PIC 999        VALUE ZEROS.
       77 WRK-STATS-NULO    PIC 999        VALUE ZEROS.
       PROCEDURE                              DIVISION.
      ***************************************************
       0001-PRINCIPAL                          SECTION.
           PERFORM 0100-INICIALIZAR.
           PERFORM 0200-PROCESSAR UNTIL SQLCODE EQUAL 100.
           PERFORM 0300-FINALIZAR.
           GOBACK.
       0001-PRINCIPAL-FIM.   EXIT.
      ***************************************************
       0100-INICIALIZAR                        SECTION.
           EXEC SQL
             OPEN CURSORFUNC
           END-EXEC.
           EVALUATE SQLCODE
               WHEN 0
                 PERFORM 0400-LER-REGISTO
               WHEN 100
                 DISPLAY "TABELA VAZIA"
               WHEN OTHER
                 MOVE SQLCODE TO WRK-SQLCODE
                 DISPLAY "ERRO SQLCODE" WRK-SQLCODE
                 GOBACK
           END-EVALUATE.
       0100-INICIALIZAR-FIM. EXIT.
      ***************************************************
       0200-PROCESSAR                          SECTION.
           ADD 1              TO WRK-STATS.
           DISPLAY "CODIGO      " DB2-IDFUN.
           DISPLAY "NOME        " DB2-NOMEFUN.
           DISPLAY "ENDERECO    " DB2-ENDERFUN.
      *------------- EDICAO SALARIO -------------------
           MOVE DB2-SALFUN    TO WRK-SALARIO-IDE.
           DISPLAY "SALFUN      " WRK-SALARIO-IDE.
           IF WRK-INDICA-NULO EQUAL -1
             ADD 1            TO WRK-STATS-NULO
             DISPLAY "DEPENDENTES --"
           ELSE
             DISPLAY "DEPENDENTES " DB2-DEPFUN
           END-IF.
           PERFORM 0400-LER-REGISTO.
       0200-PROCESSAR-FIM.   EXIT.
      ***************************************************
       0300-FINALIZAR                          SECTION.
           DISPLAY "FORAM LIDOS " WRK-STATS.
           DISPLAY "FORAM ENCONTRADOS "
                   WRK-STATS-NULO " NULOS".
           DISPLAY "FINAL DE EXECUCAO".
       0300-FINALIZAR-FIM.   EXIT.
      ***************************************************
       0400-LER-REGISTO                        SECTION.
           EXEC SQL
             FETCH CURSORFUNC
             INTO :DB2-IDFUN,
                  :DB2-NOMEFUN,
                  :DB2-ENDERFUN,
                  :DB2-SALFUN,
                  :DB2-DEPFUN  :WRK-INDICA-NULO
           END-EXEC.
           EVALUATE SQLCODE
               WHEN 0
                 CONTINUE
               WHEN 100
                 DISPLAY "FINAL DA TABELA"
               WHEN OTHER
                 MOVE SQLCODE TO WRK-SQLCODE
                 DISPLAY "ERRO SQLCODE" WRK-SQLCODE
                 GOBACK
           END-EVALUATE.
       0400-LER-REGISTO-FIM. EXIT.
