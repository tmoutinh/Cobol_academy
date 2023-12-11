       IDENTIFICATION                         DIVISION.
       PROGRAM-ID. TR00PTT0.
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
       77 WRK-IDFUN         PIC 9(05)      VALUE ZEROS.
       77 WRK-SQLCODE       PIC -999       VALUE ZEROS.
       77 WRK-SALARIO-IDE   PIC ZZZ.ZZ9,99 VALUE ZEROS.
       77 WRK-INDICA-NULO   PIC S9(04)     COMP.
       PROCEDURE                              DIVISION.
      ***************************************************
       0001-PRINCIPAL                          SECTION.
           PERFORM 0100-INICIALIZAR.
           IF SQLCODE EQUAL 0
             PERFORM 0200-PROCESSAR
           END-IF.
           PERFORM 0300-FINALIZAR.
           GOBACK.
       0001-PRINCIPAL-FIM.   EXIT.
      ***************************************************
       0100-INICIALIZAR                        SECTION.
           ACCEPT WRK-IDFUN.
           MOVE WRK-IDFUN     TO DB2-IDFUN.
           PERFORM 0400-LER-REGISTO.
       0100-INICIALIZAR-FIM. EXIT.
      ***************************************************
       0200-PROCESSAR                          SECTION.
           DISPLAY "CODIGO      " DB2-IDFUN.
           DISPLAY "NOME        " DB2-NOMEFUN.
           DISPLAY "ENDERECO    " DB2-ENDERFUN.
      *------------- EDICAO SALARIO -------------------
           MOVE DB2-SALFUN TO WRK-SALARIO-IDE.
           DISPLAY "SALFUN      " WRK-SALARIO-IDE.
           IF WRK-INDICA-NULO EQUAL -1
             DISPLAY "DEPENDENTES --"
           ELSE
             DISPLAY "DEPENDENTES " DB2-DEPFUN
           END-IF.
       0200-PROCESSAR-FIM.   EXIT.
      ***************************************************
       0300-FINALIZAR                          SECTION.
           DISPLAY "FINAL DE EXECUCAO".
       0300-FINALIZAR-FIM.   EXIT.
      ***************************************************
       0400-LER-REGISTO                        SECTION.
           EXEC SQL
             SELECT IDFUN,NOMEFUN,ENDERFUN,SALFUN,DEPFUN
             INTO :DB2-IDFUN,
                  :DB2-NOMEFUN,
                  :DB2-ENDERFUN,
                  :DB2-SALFUN,
                  :DB2-DEPFUN  :WRK-INDICA-NULO
             FROM TRUTT.FUNC
             WHERE IDFUN=:DB2-IDFUN
           END-EXEC.
           EVALUATE SQLCODE
               WHEN 0
                 CONTINUE
               WHEN 100
                 DISPLAY "FUNCIONARIO NAO ENCONTRADO"
               WHEN OTHER
                 MOVE SQLCODE TO WRK-SQLCODE
                 DISPLAY "ERRO SQLCODE" WRK-SQLCODE
           END-EVALUATE.
       0400-LER-REGISTO-FIM. EXIT.
