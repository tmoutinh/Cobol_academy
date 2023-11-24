       IDENTIFICATION                           DIVISION.               00010006
       PROGRAM-ID.   COBARQ7A.                                          00020001
      *==========================================                       00030001
      *  AUTOR: TRUTT                                                   00040001
      *  OBJETIVO: PROGRAMA DE ABERTURA E FECHAMETO DE ARQUIVOS         00050004
      *         COM READ E WRITE MELHOR MENSAGEM                        00051004
      *  DATA: 10/11/2023                                               00052001
      *==========================================                       00053001
       ENVIRONMENT                              DIVISION.               00054001
       CONFIGURATION                             SECTION.               00055001
       SPECIAL-NAMES.                                                   00056001
            DECIMAL-POINT IS COMMA.                                     00057001
       INPUT-OUTPUT                              SECTION.               00058001
       FILE-CONTROL.                                                    00059001
           SELECT EAR ASSIGN TO EARQBASE                                00060001
           FILE STATUS IS WRK-FS-EARQBASE.                              00070001
                                                                        00070101
           SELECT SAR ASSIGN TO SARQBASE                                00070201
           FILE STATUS IS WRK-FS-SARQBASE.                              00070301
      *                                                                 00070401
       DATA                                     DIVISION.               00070501
       FILE                                      SECTION.               00070601
       FD EAR                                                           00070701
           RECORDING MODE IS F                                          00070801
           RECORD CONTAINS 48 CHARACTERS                                00070901
           BLOCK  CONTAINS 0 RECORDS.                                   00071006
                                                                        00072001
       COPY "#EARQBSE".                                                 00073001
                                                                        00074001
       FD SAR                                                           00075001
           RECORDING MODE IS F.                                         00076001
       01 REG-SARQBASE             PIC X(48).                           00077006
                                                                        00078001
       WORKING-STORAGE                           SECTION.               00079001
       77 WRK-FS-EARQBASE         PIC X(02) VALUE ZEROS.                00080001
       77 WRK-FS-SARQBASE         PIC X(02) VALUE ZEROS.                00081001
       77 WRK-CONTADOR            PIC 9(10) COMP VALUE 0.               00082001
       77 WRK-CONTADOR-S          PIC 9(10) COMP VALUE 0.               00083001
       77 WRK-CONTADOR-IDE        PIC -Z.ZZZ.ZZZ.ZZ9.                   00084001
                                                                        00085001
       01 WRK-MSG.                                                      00086001
          05 WRK-MSG-ABERTURA-E   PIC X(30) VALUE "ERRO DE ABERTURA E". 00087006
          05 WRK-MSG-FECHO-E      PIC X(30) VALUE "ERRO FECHO E".       00087106
          05 WRK-MSG-ABERTURA     PIC X(30) VALUE "ERRO DE ABERTURA S". 00087206
          05 WRK-MSG-FECHO        PIC X(30) VALUE "ERRO FECHO S".       00087306
          05 WRK-MSG-VAZIO        PIC X(30) VALUE "ARQUIVO VAZIO".      00087406
          05 WRK-MSG-ESCRITA      PIC X(30) VALUE "ERRO DE ESCRITA".    00087506
                                                                        00087603
       01 WRK-TRATAR-ERRO.                                              00087703
          05 WRK-ERRO-SECAO       PIC X(20) VALUE SPACES.               00087803
          05 FILLER               PIC X(01) VALUE SPACE.                00087903
          05 WRK-ERRO-TEXTO       PIC X(30) VALUE SPACES.               00088003
          05 FILLER               PIC X(01) VALUE SPACE.                00088103
          05 WRK-ERRO-STATUS      PIC X(02) VALUE SPACES.               00088203
                                                                        00088303
      ****************************************************              00088403
      ****************************************************              00088503
       PROCEDURE                                DIVISION.               00088603
                                                                        00088703
       0001-PRINCIPAL                            SECTION.               00088803
           PERFORM 0100-INICIALIZAR.                                    00088903
           PERFORM 0200-PROCESSAR UNTIL WRK-FS-EARQBASE EQUAL "10".     00089003
           INITIALIZE WRK-MSG.                                          00089103
           PERFORM 0300-FINALIZAR.                                      00089203
       0001-FIM-PRINCIPAL.    EXIT.                                     00089306
      **************************************************                00089403
       0100-INICIALIZAR                          SECTION.               00089503
           OPEN OUTPUT SAR.                                             00089603
           IF WRK-FS-SARQBASE NOT EQUAL "00"                            00089703
             MOVE "0100-INICIALIZAR"  TO WRK-ERRO-SECAO                 00089806
             MOVE WRK-MSG-ABERTURA-E  TO WRK-ERRO-TEXTO                 00089906
             MOVE WRK-FS-SARQBASE     TO WRK-ERRO-STATUS                00090006
             PERFORM 0300-FINALIZAR                                     00090106
           END-IF.                                                      00090203
                                                                        00090303
           OPEN INPUT EAR.                                              00090403
           IF WRK-FS-EARQBASE NOT EQUAL "00"                            00090503
             MOVE "0100-INICIALIZAR"  TO WRK-ERRO-SECAO                 00090606
             MOVE WRK-MSG-ABERTURA    TO WRK-ERRO-TEXTO                 00090706
             MOVE WRK-FS-EARQBASE     TO WRK-ERRO-STATUS                00090806
             PERFORM 0300-FINALIZAR                                     00090906
           ELSE                                                         00091001
             PERFORM 0110-TESTAR-VAZIO                                  00092006
           END-IF.                                                      00093001
       0100-INICIALIZAR-FIM.  EXIT.                                     00094001
      **************************************************                00095001
       0110-TESTAR-VAZIO                         SECTION.               00096001
           READ EAR                                                     00097001
           IF WRK-FS-EARQBASE EQUAL "10"                                00098001
             MOVE "0110-TESTAR-VAZIO" TO WRK-ERRO-SECAO                 00099006
             MOVE WRK-MSG-VAZIO       TO WRK-ERRO-TEXTO                 00100006
             MOVE WRK-FS-EARQBASE     TO WRK-ERRO-STATUS                00101006
             PERFORM 0300-FINALIZAR                                     00102006
           END-IF.                                                      00104001
       0110-TESTAR-VAZIO-FIM. EXIT.                                     00105001
      **************************************************                00106001
       0200-PROCESSAR                            SECTION.               00107001
           ADD 1                      TO WRK-CONTADOR.                  00108006
           IF REG-NIVEL EQUAL "S"                                       00109001
             MOVE REG-EARQBASE        TO REG-SARQBASE                   00109106
             WRITE REG-SARQBASE                                         00109206
             IF WRK-FS-SARQBASE NOT EQUAL "00"                          00109306
               MOVE "0200-PROCESSAR"  TO WRK-ERRO-SECAO                 00109406
               MOVE WRK-MSG-ESCRITA   TO WRK-ERRO-TEXTO                 00109506
               MOVE WRK-FS-SARQBASE   TO WRK-ERRO-STATUS                00109606
               PERFORM 0300-FINALIZAR                                   00109706
             ELSE                                                       00109906
               ADD 1                  TO WRK-CONTADOR-S                 00110006
             END-IF                                                     00110106
           END-IF.                                                      00110201
           READ EAR.                                                    00110301
           IF WRK-FS-EARQBASE EQUAL "10"                                00110401
             PERFORM 0210-ESTATISTICA.                                  00110506
       0200-PROCESSAR-FIM.    EXIT.                                     00110601
      **************************************************                00110701
       0210-ESTATISTICA                          SECTION.               00110801
           MOVE WRK-CONTADOR          TO WRK-CONTADOR-IDE.              00110906
           DISPLAY "FORAM LIDOS : "                                     00111006
                   WRK-CONTADOR-IDE " REGISTOS".                        00111106
           MOVE WRK-CONTADOR-S        TO WRK-CONTADOR-IDE.              00111206
           DISPLAY "DOS QUAIS   : "                                     00111306
                   WRK-CONTADOR-IDE " FORAM GRAVADOS".                  00111406
       0210-ESTATISTICA-FIM.    EXIT.                                   00111505
      **************************************************                00111601
       0300-FINALIZAR                            SECTION.               00111701
           IF WRK-ERRO-SECAO NOT EQUAL SPACES                           00111802
             PERFORM 9000-ERROR                                         00111906
           END-IF.                                                      00112002
           CLOSE EAR.                                                   00112101
           IF WRK-FS-EARQBASE NOT EQUAL "00"                            00112201
             MOVE "0300-FINALIZAR"    TO WRK-ERRO-SECAO                 00112306
             MOVE WRK-MSG-FECHO-E     TO WRK-ERRO-TEXTO                 00112406
             MOVE WRK-FS-EARQBASE     TO WRK-ERRO-STATUS                00112506
             PERFORM 9000-ERROR                                         00112606
           END-IF.                                                      00112701
           CLOSE SAR.                                                   00112801
           IF WRK-FS-SARQBASE NOT EQUAL "00"                            00112901
             MOVE "0300-FINALIZAR"    TO WRK-ERRO-SECAO                 00113006
             MOVE WRK-MSG-FECHO       TO WRK-ERRO-TEXTO                 00113106
             MOVE WRK-FS-SARQBASE     TO WRK-ERRO-STATUS                00113206
             PERFORM 9000-ERROR                                         00113306
           END-IF.                                                      00113401
           STOP RUN.                                                    00113502
       0300-FINALIZAR-FIM.    EXIT.                                     00113601
      **************************************************                00113701
       9000-ERROR                                SECTION.               00113801
           DISPLAY WRK-TRATAR-ERRO.                                     00113901
       9000-ERROR-FIM.        EXIT.                                     00114006
      **************************************************                00115001
