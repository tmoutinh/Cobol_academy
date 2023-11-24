       IDENTIFICATION                           DIVISION.               00010006
       PROGRAM-ID.   COBARQ07.                                          00020001
      *==========================================                       00030000
      *  AUTOR: TRUTT                                                   00040000
      *  OBJETIVO: PROGRAMA DE ABERTURA E                               00050000
      *         FECHAMETO DE ARQUIVOS COM READ E WRITE                  00051001
      *  DATA: 10/11/2023                                               00052001
      *==========================================                       00053000
       ENVIRONMENT                              DIVISION.               00054000
       CONFIGURATION                             SECTION.               00055000
       SPECIAL-NAMES.                                                   00056000
            DECIMAL-POINT IS COMMA.                                     00057000
       INPUT-OUTPUT                              SECTION.               00058000
       FILE-CONTROL.                                                    00059000
           SELECT EAR ASSIGN TO EARQBASE                                00060000
           FILE STATUS IS WRK-FS-EARQBASE.                              00070000
                                                                        00070100
           SELECT SAR ASSIGN TO SARQBASE                                00071000
           FILE STATUS IS WRK-FS-SARQBASE.                              00072000
      *                                                                 00080000
       DATA                                     DIVISION.               00081000
       FILE                                      SECTION.               00082000
       FD EAR                                                           00083000
           RECORDING MODE IS F                                          00084000
           RECORD CONTAINS 48 CHARACTERS                                00085000
           BLOCK  CONTAINS 0 RECORDS.                                   00085106
                                                                        00085200
       COPY "#EARQBSE".                                                 00085300
                                                                        00085400
       FD SAR                                                           00085500
           RECORDING MODE IS F.                                         00085600
       01 REG-SARQBASE            PIC X(48).                            00085706
                                                                        00086500
       WORKING-STORAGE                           SECTION.               00086600
       77 WRK-FS-EARQBASE         PIC X(02) VALUE ZEROS.                00086700
       77 WRK-FS-SARQBASE         PIC X(02) VALUE ZEROS.                00086800
       77 WRK-CONTADOR            PIC 9(10) COMP VALUE 0.               00086900
       77 WRK-CONTADOR-S          PIC 9(10) COMP VALUE 0.               00087200
       77 WRK-CONTADOR-IDE        PIC -Z.ZZZ.ZZZ.ZZ9.                   00087300
                                                                        00087400
       01 WRK-MSG.                                                      00087500
          05 WRK-MSG-ABERTURA     PIC X(30) VALUE "ERRO DE ABERTURA".   00087606
          05 WRK-MSG-FECHO        PIC X(30) VALUE "ERRO FECHO ".        00087706
          05 WRK-MSG-VAZIO        PIC X(30) VALUE "ARQUIVO VAZIO".      00087806
          05 WRK-MSG-ESCRITA      PIC X(30) VALUE "ERRO DE ESCRITA".    00087906
                                                                        00088000
       01 WRK-TRATAR-ERRO.                                              00088100
          05 WRK-ERRO-SECAO       PIC X(20) VALUE SPACES.               00088200
          05 FILLER               PIC X(01) VALUE SPACE.                00088300
          05 WRK-ERRO-TEXTO       PIC X(30) VALUE SPACES.               00088400
          05 FILLER               PIC X(01) VALUE SPACE.                00088500
          05 WRK-ERRO-STATUS      PIC X(02) VALUE SPACES.               00088600
                                                                        00088700
      ****************************************************              00088800
      ****************************************************              00088900
       PROCEDURE                                DIVISION.               00089000
                                                                        00089100
       0001-PRINCIPAL                            SECTION.               00089200
           PERFORM 0100-INICIALIZAR.                                    00089300
           PERFORM 0200-PROCESSAR UNTIL WRK-FS-EARQBASE EQUAL "10".     00089400
           PERFORM 0300-FINALIZAR.                                      00089600
           STOP RUN.                                                    00089700
       0001-FIM-PRINCIPAL.    EXIT.                                     00089806
      **************************************************                00089900
       0100-INICIALIZAR                          SECTION.               00090000
           OPEN OUTPUT SAR.                                             00090100
           IF WRK-FS-SARQBASE NOT EQUAL "00"                            00090200
             MOVE "0100-INICIALIZAR"   TO WRK-ERRO-SECAO                00090306
             MOVE WRK-MSG-ABERTURA     TO WRK-ERRO-TEXTO                00090406
             MOVE WRK-FS-SARQBASE      TO WRK-ERRO-STATUS               00090506
             PERFORM 9000-ERROR                                         00090606
             STOP RUN                                                   00090706
           END-IF.                                                      00090800
                                                                        00090900
           OPEN INPUT EAR.                                              00091000
           IF WRK-FS-EARQBASE NOT EQUAL "00"                            00091100
             MOVE "0100-INICIALIZAR"  TO WRK-ERRO-SECAO                 00091206
             MOVE WRK-MSG-ABERTURA    TO WRK-ERRO-TEXTO                 00091306
             MOVE WRK-FS-EARQBASE     TO WRK-ERRO-STATUS                00091406
             PERFORM 9000-ERROR                                         00091506
             STOP RUN                                                   00091606
           ELSE                                                         00092000
             PERFORM 0110-TESTAR-VAZIO                                  00103006
           END-IF.                                                      00104000
       0100-INICIALIZAR-FIM.  EXIT.                                     00105000
      **************************************************                00106000
       0110-TESTAR-VAZIO                         SECTION.               00106103
           READ EAR                                                     00107903
           IF WRK-FS-EARQBASE EQUAL "10"                                00108003
             MOVE "0110-TESTAR-VAZIO" TO WRK-ERRO-SECAO                 00108106
             MOVE WRK-MSG-VAZIO       TO WRK-ERRO-TEXTO                 00108206
             MOVE WRK-FS-EARQBASE     TO WRK-ERRO-STATUS                00108306
             PERFORM 9000-ERROR                                         00108406
             STOP RUN                                                   00108506
           END-IF.                                                      00108603
       0110-TESTAR-VAZIO-FIM. EXIT.                                     00108803
      **************************************************                00108903
       0200-PROCESSAR                            SECTION.               00109003
           ADD 1 TO WRK-CONTADOR.                                       00109103
           IF REG-NIVEL EQUAL "S"                                       00109203
              MOVE REG-EARQBASE TO REG-SARQBASE                         00109303
              WRITE REG-SARQBASE                                        00109403
              IF WRK-FS-SARQBASE NOT EQUAL "00"                         00109503
                MOVE "0200-PROCESSAR" TO WRK-ERRO-SECAO                 00109606
                MOVE WRK-MSG-ESCRITA  TO WRK-ERRO-TEXTO                 00109706
                MOVE WRK-FS-SARQBASE  TO WRK-ERRO-STATUS                00109806
                PERFORM 9000-ERROR                                      00109906
                STOP RUN                                                00110006
              ELSE                                                      00110103
                 ADD 1                TO WRK-CONTADOR-S                 00110206
              END-IF                                                    00110303
           END-IF.                                                      00110403
           READ EAR.                                                    00110503
           IF WRK-FS-EARQBASE EQUAL "10"                                00110603
              PERFORM 0210-ESTATISTICA.                                 00110703
       0200-PROCESSAR-FIM.    EXIT.                                     00110803
      **************************************************                00110903
       0210-ESTATISTICA                          SECTION.               00111003
           MOVE WRK-CONTADOR          TO WRK-CONTADOR-IDE.              00111106
           DISPLAY "FORAM LIDOS : "                                     00111206
                   WRK-CONTADOR-IDE " REGISTOS".                        00111306
           MOVE WRK-CONTADOR-S        TO WRK-CONTADOR-IDE.              00111406
           DISPLAY "DOS QUAIS   : "                                     00111506
                      WRK-CONTADOR-IDE " FORAM GRAVADOS".               00111603
       0210-ESTATISTICA-FIM.  EXIT.                                     00111706
      **************************************************                00111803
       0300-FINALIZAR                            SECTION.               00111903
           CLOSE EAR.                                                   00112003
           IF WRK-FS-EARQBASE NOT EQUAL "00"                            00112103
             MOVE "0300-FINALIZAR"    TO WRK-ERRO-SECAO                 00112206
             MOVE WRK-MSG-FECHO       TO WRK-ERRO-TEXTO                 00112306
             MOVE WRK-FS-EARQBASE     TO WRK-ERRO-STATUS                00112406
             PERFORM 9000-ERROR                                         00112506
           END-IF.                                                      00112603
           CLOSE SAR.                                                   00112703
           IF WRK-FS-SARQBASE NOT EQUAL "00"                            00112803
             MOVE "0300-FINALIZAR"    TO WRK-ERRO-SECAO                 00112906
             MOVE WRK-MSG-FECHO       TO WRK-ERRO-TEXTO                 00113006
             MOVE WRK-FS-SARQBASE     TO WRK-ERRO-STATUS                00113106
             PERFORM 9000-ERROR                                         00113206
           END-IF.                                                      00113303
       0300-FINALIZAR-FIM.    EXIT.                                     00113403
      **************************************************                00113503
       9000-ERROR                                SECTION.               00113603
           DISPLAY WRK-TRATAR-ERRO.                                     00114000
       9000-ERROR-FIM.        EXIT.                                     00115006
      **************************************************                00116000
