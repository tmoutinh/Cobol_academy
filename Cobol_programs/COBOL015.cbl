       IDENTIFICATION                            DIVISION.              00010000
       PROGRAM-ID.   COBOL015.                                          00020000
      *===================================================              00030000
      *   AUTHOR: TRUTT                                                 00040000
      *   OBJECTIVE: PROGRAMA DE APLICACAO EVALUATE                     00050000
      *   DATA: 06/11/2023                                              00060000
      *===================================================              00070000
       ENVIRONMENT                               DIVISION.              00080000
       CONFIGURATION                             SECTION.               00090000
       SPECIAL-NAMES.                                                   00100000
            DECIMAL-POINT IS COMMA.                                     00110000
      *                                                                 00120000
       DATA                                      DIVISION.              00130000
       WORKING-STORAGE                           SECTION.               00140000
       01 WRK-DATA.                                                     00150000
          05 WRK-PRODUTO             PIC X(30)    VALUE SPACES.         00160000
          05 WRK-VALOR               PIC 9(08)V99 VALUE ZEROES.         00170000
          05 WRK-REGIAO              PIC X(10) VALUE SPACES.            00180000
       77 WRK-FRETE                  PIC 9(08)V99 VALUE ZEROES.         00190000
       77 WRK-PERFRE                 PIC 999 VALUE ZEROES.              00200000
       77 WRK-FRETE-IDE              PIC ZZ.ZZZ.ZZ9,99.                 00210000
       77 WRK-VALOR-IDE              PIC ZZ.ZZZ.ZZ9,99.                 00220000
      *                                                                 00230000
       PROCEDURE                                 DIVISION.              00240000
       0001-PRINCIPAL                            SECTION.               00250000
      *----------------------------------------------------             00260000
      *   RETORNA NA SYSOUT A LITERAL PASSADA NO SYSIN                  00270000
      *     E APRESENTA A IDADE EM FORMATO YYYYMMDD                     00280000
      *----------------------------------------------------             00290000
           ACCEPT WRK-DATA.                                             00300000
      *--------------------- EVALUATE ---------------------             00310000
           EVALUATE WRK-REGIAO                                          00320000
                WHEN "PORTO"                                            00330000
                  MOVE 010 TO WRK-PERFRE                                00340000
                WHEN "LISBOA"                                           00350000
                  MOVE 015 TO WRK-PERFRE                                00360000
                WHEN OTHER                                              00370000
                  MOVE 000 TO WRK-PERFRE                                00380000
           END-EVALUATE.                                                00390000
      *--------------------- COMPUTE ---------------------              00400000
           COMPUTE WRK-FRETE = (WRK-PERFRE / 100) * WRK-VALOR.          00410000
           MOVE WRK-VALOR TO WRK-VALOR-IDE.                             00420000
      *--------------------- DISPLAY ---------------------              00430000
           DISPLAY "PRODUTO : " WRK-PRODUTO.                            00440000
           DISPLAY "VALOR   : " WRK-VALOR-IDE.                          00450000
           DISPLAY "REGIAO  : " WRK-REGIAO.                             00460000
            IF WRK-PERFRE EQUAL 0                                       00470000
              DISPLAY "REGIAO INVALIDA"                                 00480000
            ELSE                                                        00490000
              MOVE WRK-FRETE TO WRK-FRETE-IDE                           00500000
              DISPLAY "FRETE   : " WRK-FRETE-IDE                        00510000
            END-IF                                                      00520000
             STOP RUN.                                                  00530000
       0001-FIM-PRINCIPAL. EXIT.                                        00540000
