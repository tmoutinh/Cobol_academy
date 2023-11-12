       IDENTIFICATION                            DIVISION.              00010005
       PROGRAM-ID.   COBOL007.                                          00020005
      *===================================================              00030005
      *   AUTHOR: TRUTT                                                 00040005
      *   OBJECTIVE: PROGRAMA DE APLICACAO DE INPUT NUMERAL             00050005
      *  E APLICACAO DE MASCARAS                                        00060005
      *   DATA: 02/11/2023                                              00070005
      *===================================================              00080005
       ENVIRONMENT                               DIVISION.              00090005
       CONFIGURATION                             SECTION.               00100005
       SPECIAL-NAMES.                                                   00110005
           DECIMAL-POINT IS COMMA.                                      00120005
      *                                                                 00130005
       DATA                                      DIVISION.              00140005
       WORKING-STORAGE                           SECTION.               00150005
       77 WRK-QEUR                PIC 9(04)V99 VALUE ZEROS.             00160005
       77 WRK-CTRE                PIC 9(08)V99 VALUE ZEROS.             00170005
       77 WRK-QREA                PIC 9(11)V99 COMP-3 VALUE ZEROS.      00180005
       77 WRK-QEUR-DISP           PIC Z.ZZ9,99.                         00190005
       77 WRK-CTRE-DISP           PIC ZZ.ZZZ.ZZ9,99.                    00200005
       77 WRK-QREA-DISP           PIC Z.ZZZ.ZZZ.ZZ9,99.                 00210005
      *                                                                 00220005
       PROCEDURE                                 DIVISION.              00230005
       0001-PRINCIPAL                            SECTION.               00240005
      *----------------------------------------------------             00250005
      *   RETORNA NA SYSOUT OS NUMEROS PASSADOS NO SYSIN                00260005
      *     E APRESENTA A MULTIPLICACAO DELES                           00270005
      *----------------------------------------------------             00280005
           ACCEPT WRK-QEUR FROM SYSIN.                                  00290005
           ACCEPT WRK-CTRE FROM SYSIN.                                  00300005
           COMPUTE                                                      00310005
              WRK-QREA = WRK-QEUR * WRK-CTRE.                           00320005
      *---------------------- MOVE ----------------------               00330005
           MOVE WRK-QEUR TO WRK-QEUR-DISP.                              00340005
           MOVE WRK-CTRE TO WRK-CTRE-DISP.                              00350005
           MOVE WRK-QREA TO WRK-QREA-DISP.                              00360005
      *--------------------- DISPLAY ---------------------              00370005
           DISPLAY "QT EURO     : " LENGTH OF WRK-QEUR-DISP.            00380005
           DISPLAY "CONVERSAO   : " LENGTH OF WRK-CTRE-DISP.            00390005
           DISPLAY "COTACAO REAL: " LENGTH OF WRK-QREA-DISP.            00400005
           DISPLAY "*------------------------------*"                   00410005
           DISPLAY "QT DE EURO  : " WRK-QEUR-DISP " EUROS".             00420005
           DISPLAY "CONVERSAO   : " WRK-CTRE-DISP " EUROS".             00430005
           DISPLAY "COTACAO REAL: " WRK-QREA-DISP " REAIS".             00440005
             STOP RUN.                                                  00450005
       0001-FIM-PRINCIPAL. EXIT.                                        00460005
