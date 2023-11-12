       IDENTIFICATION                            DIVISION.              00010000
       PROGRAM-ID.   COB016.                                            00020000
      *==========================================                       00030000
      *  AUTOR: TRUTT                                                   00040000
      *  OBJETIVO: PROGRAMA DE APLICACAO DE LOOPS                       00050000
      *  DATA: 07/11/2023                                               00060000
      *==========================================                       00070000
       ENVIRONMENT                              DIVISION.               00080000
       CONFIGURATION                            SECTION.                00081000
       SPECIAL-NAMES.                                                   00082000
            DECIMAL-POINT IS COMMA.                                     00083000
      *                                                                 00084000
       DATA                                     DIVISION.               00085000
       WORKING-STORAGE                          SECTION.                00086000
       77 WRK-APLIC            PIC 9(06)V99 VALUE ZEROES.               00086100
       77 WRK-TAXA             PIC 9(02)V99 VALUE ZEROES.               00086200
       77 WRK-VALORI           PIC 9(06)V99 VALUE ZEROES.               00086300
       77 WRK-CONTADOR         PIC 9 VALUE 1.                           00086400
       77 WRK-VARIE            PIC 9 VALUE 1.                           00086500
       77 WRK-APLIC-IDE        PIC -ZZ.ZZZ.ZZ9,99.                      00086600
      *                                                                 00087000
       PROCEDURE                                DIVISION.               00088000
      *--------------------------------------------------*              00089000
      *                                                  *              00090000
      *--------------------------------------------------*              00100000
       0001-PRINCIPAL                           SECTION.                00101000
           PERFORM 0100-INICIALIZAR.                                    00102000
           DISPLAY "***** WITH TIMES *****".                            00102100
           PERFORM 0200-PROCESSAR 6 TIMES.                              00102200
           DISPLAY "***** WITH UNTIL *****"                             00102400
           MOVE 1 TO WRK-CONTADOR.                                      00102500
           MOVE WRK-VALORI TO WRK-APLIC.                                00102600
           PERFORM 0200-PROCESSAR UNTIL WRK-CONTADOR GREATER 6.         00102700
           DISPLAY "**** WITH VARYING ****"                             00102800
           MOVE WRK-VALORI TO WRK-APLIC.                                00102900
           MOVE 1 TO WRK-CONTADOR.                                      00103001
           PERFORM 0200-PROCESSAR VARYING WRK-VARIE FROM 1 BY 1         00103200
                UNTIL WRK-VARIE GREATER 6                               00103300
           STOP RUN.                                                    00103400
       0001-FIM-PRINCIPAL. EXIT.                                        00104000
      **************************************************                00105000
       0100-INICIALIZAR                         SECTION.                00106000
           ACCEPT WRK-APLIC.                                            00107000
           ACCEPT WRK-TAXA.                                             00107100
           MOVE WRK-APLIC TO WRK-VALORI.                                00107200
           MOVE WRK-APLIC TO WRK-APLIC-IDE.                             00107300
           DISPLAY "VALOR INICIAL : " WRK-APLIC-IDE.                    00107400
       0100-INICIALIZAR-FIM.  EXIT.                                     00108000
      **************************************************                00109000
       0200-PROCESSAR                           SECTION.                00110000
           COMPUTE WRK-APLIC = WRK-APLIC + (WRK-APLIC * WRK-TAXA).      00120000
           MOVE WRK-APLIC TO WRK-APLIC-IDE.                             00121000
           DISPLAY "VALOR AO FIM DE "                                   00122000
             WRK-CONTADOR " MESES E " WRK-APLIC-IDE.                    00123000
           ADD 1 TO WRK-CONTADOR.                                       00124000
       0200-PROCESSAR-FIM.    EXIT.                                     00130000
      **************************************************                00140000
       0300-FINALIZAR                           SECTION.                00150000
                                                                        00160000
       0300-FINALIZAR-FIM.    EXIT.                                     00170000
      **************************************************                00180000
