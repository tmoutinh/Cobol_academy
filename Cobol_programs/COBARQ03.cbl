       IDENTIFICATION                           DIVISION.               00010006
       PROGRAM-ID.   COBARQ03.                                          00020001
      *==========================================                       00030001
      *  AUTOR: TRUTT                                                   00040001
      *  OBJETIVO: PROGRAMA DE ABERTURA E                               00050001
      *         FECHAMETO DE ARQUIVOS                                   00051001
      *  DATA: 07/11/2023                                               00052001
      *==========================================                       00053001
       ENVIRONMENT                              DIVISION.               00054001
       CONFIGURATION                             SECTION.               00055001
       SPECIAL-NAMES.                                                   00056001
            DECIMAL-POINT IS COMMA.                                     00057001
       INPUT-OUTPUT                              SECTION.               00058001
       FILE-CONTROL.                                                    00059001
           SELECT CLS ASSIGN TO CLIENTES                                00060001
           FILE STATUS IS WRK-FS-CLIENTES.                              00070001
      *                                                                 00080001
       DATA                                     DIVISION.               00081001
       FILE                                      SECTION.               00082001
       FD CLS                                                           00083001
           RECORDING MODE IS F                                          00084001
           RECORD CONTAINS 47 CHARACTERS                                00085001
           BLOCK  CONTAINS 0 RECORDS.                                   00085106
       01 REG-CLIENTES.                                                 00085201
          05 REG-AGENCIA          PIC 9(04).                            00085306
          05 REG-CONTA            PIC 9(05).                            00085406
          05 REG-NOME             PIC X(30).                            00085506
          05 REG-SALDO            PIC 9(06)V99.                         00085606
       WORKING-STORAGE                           SECTION.               00085701
       77 WRK-FS-CLIENTES         PIC X(02) VALUE ZEROS.                00085801
       77 WRK-CONTADOR            PIC 9(10) COMP VALUE 0.               00086001
       77 WRK-SALDO-IDE           PIC -ZZZ.ZZ9,99.                      00086101
       77 WRK-CONTADOR-IDE        PIC -Z.ZZZ.ZZZ.ZZ9.                   00086201
      ****************************************************              00086301
      ****************************************************              00086401
       PROCEDURE                                DIVISION.               00086501
                                                                        00086601
       0001-PRINCIPAL                            SECTION.               00086701
           PERFORM 0100-INICIALIZAR.                                    00086801
           PERFORM 0200-PROCESSAR UNTIL WRK-FS-CLIENTES EQUAL "10".     00086901
           PERFORM 0210-ESTATISTICA.                                    00087003
           PERFORM 0300-FINALIZAR.                                      00088001
           STOP RUN.                                                    00089001
       0001-FIM-PRINCIPAL.    EXIT.                                     00090006
      **************************************************                00100001
       0100-INICIALIZAR                          SECTION.               00101001
           OPEN INPUT CLS.                                              00102001
           IF WRK-FS-CLIENTES NOT EQUAL "00"                            00103001
             DISPLAY "ERRO NA ABERTURA - STATUS " WRK-FS-CLIENTES       00104006
             STOP RUN                                                   00104106
           ELSE                                                         00105001
             READ CLS                                                   00106006
             IF WRK-FS-CLIENTES EQUAL "10"                              00106106
               DISPLAY "ARQUIVO VAZIO"                                  00106206
             END-IF                                                     00106306
           END-IF.                                                      00107001
       0100-INICIALIZAR-FIM.  EXIT.                                     00107101
      **************************************************                00107201
       0200-PROCESSAR                            SECTION.               00107301
           MOVE REG-SALDO    TO WRK-SALDO-IDE.                          00107506
           ADD  1            TO WRK-CONTADOR.                           00107606
           DISPLAY "***********************************"                00107701
           DISPLAY "AGENCIA : " REG-AGENCIA                             00107801
           DISPLAY "CONTA   : " REG-CONTA                               00107901
           DISPLAY "NOME    : " REG-NOME                                00108001
           DISPLAY "SALDO   : " WRK-SALDO-IDE                           00108101
           DISPLAY "***********************************"                00108201
           READ CLS.                                                    00108301
       0200-PROCESSAR-FIM.    EXIT.                                     00108501
      **************************************************                00108603
       0210-ESTATISTICA                          SECTION.               00108703
           MOVE WRK-CONTADOR TO WRK-CONTADOR-IDE.                       00108806
           DISPLAY "FORAM LIDOS :"                                      00108906
                   WRK-CONTADOR-IDE " REGISTOS".                        00109006
       0210-ESTATISTICA-FIM.    EXIT.                                   00109105
      **************************************************                00109201
       0300-FINALIZAR                            SECTION.               00109301
           CLOSE CLS.                                                   00109401
           IF WRK-FS-CLIENTES NOT EQUAL "00"                            00109501
             DISPLAY "ERRO NO FECHAMENTO - STATUS " WRK-FS-CLIENTES     00109606
           END-IF.                                                      00120001
       0300-FINALIZAR-FIM.    EXIT.                                     00130001
      **************************************************                00140001
