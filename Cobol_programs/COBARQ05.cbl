       IDENTIFICATION                            DIVISION.              00010000
       PROGRAM-ID.   COBARQ05.                                          00020000
      *==========================================                       00030000
      *  AUTOR: TRUTT                                                   00040000
      *  OBJETIVO: PROGRAMA DE ABERTURA E                               00050000
      *         FECHAMETO DE ARQUIVOS APLICACAO DE BOOKS                00051001
      *  DATA: 09/11/2023                                               00052000
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
                                                                        00085200
      *COPY "BOOK0811".                                                 00085300
       01 REG-EARQ0811.                                                 00085400
          05 REG-AGENCIA    PIC 9(04).                                  00085500
          05 REG-CONTA      PIC 9(05).                                  00085600
          05 REG-NOME       PIC X(30).                                  00085700
          05 REG-SALDO      PIC 9(06)V99.                               00085800
          05 REG-NIVEL      PIC X(01).                                  00085900
                                                                        00086000
       WORKING-STORAGE                           SECTION.               00086100
       77 WRK-FS-EARQ0811         PIC X(02) VALUE ZEROS.                00086200
       77 WRK-CONTADOR            PIC 9(10) COMP VALUE 0.               00086300
       77 WRK-COUNT-PREM          PIC 9(10) COMP VALUE 0.               00086400
       77 WRK-SALDO-PREM          PIC 9(10) COMP VALUE 0.               00086500
       77 WRK-SALDO-IDE           PIC -ZZZ.ZZ9,99.                      00086600
       77 WRK-CONTADOR-IDE        PIC -Z.ZZZ.ZZZ.ZZ9.                   00086700
                                                                        00086800
       01 WRK-MSG.                                                      00086900
          05 WRK-MSG-ABERTURA  PIC X(30) VALUE "ERRO DE ABERTURA".      00087000
          05 WRK-MSG-FECHO     PIC X(30) VALUE "ARQUIVO VAZIO".         00087100
                                                                        00087300
       01 WRK-TRATAR-ERRO.                                              00087400
          05 WRK-ERRO-SECAO       PIC X(20) VALUE SPACES.               00087500
          05 FILLER               PIC X(01) VALUE SPACE.                00087600
          05 WRK-ERRO-TEXTO       PIC X(30) VALUE SPACES.               00087700
          05 FILLER               PIC X(01) VALUE SPACE.                00087800
          05 WRK-ERRO-STATUS      PIC X(02) VALUE SPACES.               00087900
                                                                        00088000
      ****************************************************              00088100
      ****************************************************              00088200
       PROCEDURE                                DIVISION.               00088300
                                                                        00088400
       0001-PRINCIPAL                            SECTION.               00088500
           PERFORM 0100-INICIALIZAR.                                    00088600
           PERFORM 0200-PROCESSAR UNTIL WRK-FS-EARQ0811 EQUAL "10".     00088700
           PERFORM 0210-ESTATISTICA.                                    00088800
           PERFORM 0300-FINALIZAR.                                      00088900
           STOP RUN.                                                    00089000
       0001-FIM-PRINCIPAL. EXIT.                                        00089100
      **************************************************                00089200
       0100-INICIALIZAR                          SECTION.               00089300
           OPEN INPUT EAR.                                              00089400
           IF WRK-FS-EARQ0811 NOT EQUAL "00"                            00090000
              MOVE "0100-INICIALIZAR" TO WRK-ERRO-SECAO                 00091000
              MOVE WRK-MSG-ABERTURA TO WRK-ERRO-TEXTO                   00100000
              MOVE WRK-FS-EARQ0811 TO WRK-ERRO-STATUS                   00100100
              PERFORM 9000-ERROR                                        00100200
              STOP RUN                                                  00101000
           ELSE                                                         00102000
              READ EAR                                                  00103000
              IF WRK-FS-EARQ0811 EQUAL "10"                             00104000
                 DISPLAY "ARQUIVO VAZIO"                                00105000
              END-IF                                                    00106000
           END-IF.                                                      00106100
       0100-INICIALIZAR-FIM.  EXIT.                                     00106200
      **************************************************                00106300
       0200-PROCESSAR                            SECTION.               00106400
           ADD 1 TO WRK-CONTADOR.                                       00106500
           IF REG-NIVEL EQUAL "P"                                       00106600
              MOVE REG-SALDO TO WRK-SALDO-IDE                           00106700
              DISPLAY "***********************************"             00106800
              DISPLAY "AGENCIA : " REG-AGENCIA                          00106900
              DISPLAY "CONTA   : " REG-CONTA                            00107000
              DISPLAY "NOME    : " REG-NOME                             00107100
              DISPLAY "SALDO   : " WRK-SALDO-IDE                        00107200
              DISPLAY "***********************************"             00107300
              PERFORM 0220-PREMIUM                                      00107400
           END-IF.                                                      00107500
           READ EAR.                                                    00107600
       0200-PROCESSAR-FIM.    EXIT.                                     00107700
      **************************************************                00107800
       0210-ESTATISTICA                          SECTION.               00107900
              MOVE WRK-CONTADOR TO WRK-CONTADOR-IDE.                    00108000
              DISPLAY "FORAM LIDOS :"                                   00108100
                  WRK-CONTADOR-IDE " REGISTOS".                         00108200
              MOVE WRK-COUNT-PREM TO WRK-CONTADOR-IDE.                  00108300
              DISPLAY "NUMERO DE PREMIUM LIDOS : "                      00108400
                 WRK-CONTADOR-IDE.                                      00108500
              MOVE WRK-SALDO-PREM TO WRK-SALDO-IDE.                     00108600
              DISPLAY "SALDO PREMIUM TOTAL : "                          00108700
                 WRK-SALDO-IDE.                                         00108800
       0210-FINALIZAR-FIM.    EXIT.                                     00108900
      **************************************************                00109000
       0220-PREMIUM                              SECTION.               00109100
           ADD 1 TO WRK-COUNT-PREM.                                     00109200
           ADD REG-SALDO TO WRK-SALDO-PREM.                             00109300
       0220-PREMIUM-FIM.    EXIT.                                       00109400
      **************************************************                00109500
       0300-FINALIZAR                            SECTION.               00109600
           CLOSE EAR.                                                   00109700
           IF WRK-FS-EARQ0811 NOT EQUAL "00"                            00109800
              MOVE "0300-FINALIZAR" TO WRK-ERRO-SECAO                   00109900
              MOVE WRK-MSG-FECHO    TO WRK-ERRO-TEXTO                   00110000
              MOVE WRK-FS-EARQ0811  TO WRK-ERRO-STATUS                  00110100
              PERFORM 9000-ERROR                                        00110200
           END-IF.                                                      00110400
       0300-FINALIZAR-FIM.    EXIT.                                     00111000
      **************************************************                00112000
       9000-ERROR                                SECTION.               00113000
           DISPLAY WRK-TRATAR-ERRO.                                     00114000
       9000-ERROR-FIM.    EXIT.                                         00118000
      **************************************************                00119000
