       IDENTIFICATION                            DIVISION.
       PROGRAM-ID.   COBOL015.
      *===================================================
      *   AUTHOR: TRUTT
      *   OBJECTIVE: PROGRAMA DE APLICACAO EVALUATE
      *   DATA: 06/11/2023
      *===================================================
       ENVIRONMENT                               DIVISION.
       CONFIGURATION                             SECTION.
       SPECIAL-NAMES.
            DECIMAL-POINT IS COMMA.
      *
       DATA                                      DIVISION.
       WORKING-STORAGE                           SECTION.
       01 WRK-DATA.
          05 WRK-PRODUTO             PIC X(30)    VALUE SPACES.
          05 WRK-VALOR               PIC 9(08)V99 VALUE ZEROES.
          05 WRK-REGIAO              PIC X(10) VALUE SPACES.
       77 WRK-FRETE                  PIC 9(08)V99 VALUE ZEROES.
       77 WRK-PERFRE                 PIC 999 VALUE ZEROES.
       77 WRK-FRETE-IDE              PIC ZZ.ZZZ.ZZ9,99.
       77 WRK-VALOR-IDE              PIC ZZ.ZZZ.ZZ9,99.
      *
       PROCEDURE                                 DIVISION.
       0001-PRINCIPAL                            SECTION.
      *----------------------------------------------------
      *   RETORNA NA SYSOUT A LITERAL PASSADA NO SYSIN
      *     E APRESENTA A IDADE EM FORMATO YYYYMMDD
      *----------------------------------------------------
           ACCEPT WRK-DATA.
      *--------------------- EVALUATE ---------------------
           EVALUATE WRK-REGIAO
                WHEN "PORTO"
                  MOVE 010 TO WRK-PERFRE
                WHEN "LISBOA"
                  MOVE 015 TO WRK-PERFRE
                WHEN OTHER
                  MOVE 000 TO WRK-PERFRE
           END-EVALUATE.
      *--------------------- COMPUTE ---------------------
           COMPUTE WRK-FRETE = (WRK-PERFRE / 100) * WRK-VALOR.
           MOVE WRK-VALOR TO WRK-VALOR-IDE.
      *--------------------- DISPLAY ---------------------
           DISPLAY "PRODUTO : " WRK-PRODUTO.
           DISPLAY "VALOR   : " WRK-VALOR-IDE.
           DISPLAY "REGIAO  : " WRK-REGIAO.
            IF WRK-PERFRE EQUAL 0
              DISPLAY "REGIAO INVALIDA"
            ELSE
              MOVE WRK-FRETE TO WRK-FRETE-IDE
              DISPLAY "FRETE   : " WRK-FRETE-IDE
            END-IF
             STOP RUN.
       0001-FIM-PRINCIPAL. EXIT.