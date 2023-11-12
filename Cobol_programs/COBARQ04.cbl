       IDENTIFICATION                            DIVISION.              00010000
       PROGRAM-ID.   COBARQ04.                                          00020000
      *==========================================                       00030000
      *  AUTOR: TRUTT                                                   00040000
      *  OBJETIVO: PROGRAMA DE ABERTURA E                               00050000
      *         FECHAMETO DE ARQUIVOS                                   00051000
      *  DATA: 08/11/2023                                               00052000
      *==========================================                       00053000
       ENVIRONMENT                              DIVISION.               00054000
       CONFIGURATION                             SECTION.               00055000
       SPECIAL-NAMES.                                                   00056000
            DECIMAL-POINT IS COMMA.                                     00057000
       INPUT-OUTPUT                              SECTION.               00058000
       FILE-CONTROL.                                                    00059000
           SELECT EAR ASSIGN TO EARQ0811                                00060000
           FILE STATUS IS WRK-FS-EARQ0811.                              00070000
      *                                                                 00080000
       DATA                                     DIVISION.               00081000
       FILE                                      SECTION.               00082000
       FD EAR                                                           00083000
           RECORDING MODE IS F                                          00084000
           RECORD CONTAINS 48 CHARACTERS                                00085000
           BLOCK CONTAINS 0 RECORDS.                                    00085100
                                                                        00085203
       COPY "BOOK0811".                                                 00085304
      *01 REG-EARQ0811.                                                 00085404
      *   05 REG-AGENCIA    PIC 9(04).                                  00085504
      *   05 REG-CONTA      PIC 9(05).                                  00085604
      *   05 REG-NOME       PIC X(30).                                  00085704
      *   05 REG-SALDO      PIC 9(06)V99.                               00085804
      *   05 REG-NIVEL      PIC X(01).                                  00085904
                                                                        00086003
       WORKING-STORAGE                           SECTION.               00086100
       77 WRK-FS-EARQ0811         PIC X(02) VALUE ZEROS.                00086200
       77 WRK-CONTADOR            PIC 9(10) COMP VALUE 0.               00086300
       77 WRK-COUNT-PREM          PIC 9(10) COMP VALUE 0.               00086400
       77 WRK-SALDO-PREM          PIC 9(10) COMP VALUE 0.               00086500
       77 WRK-SALDO-IDE           PIC -ZZZ.ZZ9,99.                      00086600
       77 WRK-CONTADOR-IDE        PIC -Z.ZZZ.ZZZ.ZZ9.                   00086700
      ****************************************************              00086800
      ****************************************************              00086900
       PROCEDURE                                DIVISION.               00087000
                                                                        00087100
       0001-PRINCIPAL                            SECTION.               00087200
           PERFORM 0100-INICIALIZAR.                                    00087300
           PERFORM 0200-PROCESSAR UNTIL WRK-FS-EARQ0811 EQUAL "10".     00087400
           PERFORM 0210-ESTATISTICA.                                    00087500
           PERFORM 0300-FINALIZAR.                                      00087600
           STOP RUN.                                                    00088000
       0001-FIM-PRINCIPAL. EXIT.                                        00089000
      **************************************************                00090000
       0100-INICIALIZAR                          SECTION.               00100000
           OPEN INPUT EAR.                                              00101000
           IF WRK-FS-EARQ0811 NOT EQUAL "00"                            00102000
              DISPLAY "ERRO NA ABERTURA - STATUS " WRK-FS-EARQ0811      00103000
              STOP RUN                                                  00104000
           ELSE                                                         00105000
              READ EAR                                                  00106000
              IF WRK-FS-EARQ0811 EQUAL "10"                             00106100
                 DISPLAY "ARQUIVO VAZIO"                                00106200
              END-IF                                                    00106300
           END-IF.                                                      00106400
       0100-INICIALIZAR-FIM.  EXIT.                                     00106500
      **************************************************                00106600
       0200-PROCESSAR                            SECTION.               00106700
           ADD 1 TO WRK-CONTADOR.                                       00106900
           IF REG-NIVEL EQUAL "P"                                       00107001
              MOVE REG-SALDO TO WRK-SALDO-IDE                           00107101
              DISPLAY "***********************************"             00107201
              DISPLAY "AGENCIA : " REG-AGENCIA                          00107301
              DISPLAY "CONTA   : " REG-CONTA                            00107401
              DISPLAY "NOME    : " REG-NOME                             00107501
              DISPLAY "SALDO   : " WRK-SALDO-IDE                        00107601
              DISPLAY "***********************************"             00107701
              PERFORM 0220-PREMIUM                                      00107801
           END-IF.                                                      00107901
           READ EAR.                                                    00108000
       0200-PROCESSAR-FIM.    EXIT.                                     00108100
      **************************************************                00108200
       0210-ESTATISTICA                          SECTION.               00108300
              MOVE WRK-CONTADOR TO WRK-CONTADOR-IDE.                    00108400
              DISPLAY "FORAM LIDOS :"                                   00108500
                  WRK-CONTADOR-IDE " REGISTOS".                         00108602
              MOVE WRK-COUNT-PREM TO WRK-CONTADOR-IDE.                  00108700
              DISPLAY "NUMERO DE PREMIUM LIDOS : "                      00108800
                 WRK-CONTADOR-IDE.                                      00108900
              MOVE WRK-SALDO-PREM TO WRK-SALDO-IDE.                     00109000
              DISPLAY "SALDO PREMIUM TOTAL : "                          00109100
                 WRK-SALDO-IDE.                                         00109200
       0210-FINALIZAR-FIM.    EXIT.                                     00109300
      **************************************************                00109400
       0220-PREMIUM                              SECTION.               00109500
           ADD 1 TO WRK-COUNT-PREM.                                     00109701
           ADD REG-SALDO TO WRK-SALDO-PREM.                             00109801
       0220-PREMIUM-FIM.    EXIT.                                       00109900
      **************************************************                00110000
       0300-FINALIZAR                            SECTION.               00110100
           CLOSE EAR.                                                   00110200
           IF WRK-FS-EARQ0811 NOT EQUAL "00"                            00110300
              DISPLAY "ERRO NO FECHAMENTO - STATUS " WRK-FS-EARQ0811    00110400
           END-IF.                                                      00110500
       0300-FINALIZAR-FIM.    EXIT.                                     00111000
      **************************************************                00120000
