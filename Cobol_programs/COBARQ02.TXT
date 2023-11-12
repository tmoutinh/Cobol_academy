       IDENTIFICATION                            DIVISION.              00010000
       PROGRAM-ID.   COBARQ02.                                          00020000
      *==========================================                       00030000
      *  AUTOR: TRUTT                                                   00040000
      *  OBJETIVO: PROGRAMA DE ABERTURA E                               00050000
      *         FECHAMETO DE ARQUIVOS                                   00051000
      *  DATA: 07/11/2023                                               00052000
      *==========================================                       00053000
       ENVIRONMENT                              DIVISION.               00054000
       CONFIGURATION                             SECTION.               00055000
       SPECIAL-NAMES.                                                   00056000
            DECIMAL-POINT IS COMMA.                                     00057000
       INPUT-OUTPUT                              SECTION.               00058000
       FILE-CONTROL.                                                    00059000
           SELECT CLS ASSIGN TO CLIENTES                                00060000
           FILE STATUS IS WRK-FS-CLIENTES.                              00070000
      *                                                                 00080000
       DATA                                     DIVISION.               00081000
       FILE                                      SECTION.               00082000
       FD CLS                                                           00083000
           RECORDING MODE IS F                                          00084000
           RECORD CONTAINS 47 CHARACTERS                                00085000
           BLOCK CONTAINS 0 RECORDS.                                    00085100
       01 REG-CLIENTES.                                                 00085201
          05 REG-AGENCIA    PIC 9(04).                                  00085301
          05 REG-CONTA      PIC 9(05).                                  00085401
          05 REG-NOME       PIC X(30).                                  00085501
          05 REG-SALDO      PIC 9(06)V99.                               00085601
       WORKING-STORAGE                           SECTION.               00085700
       77 WRK-FS-CLIENTES         PIC X(02) VALUE ZEROS.                00085800
       77 WRK-SALDO-IDE           PIC -ZZZ.ZZ9,99.                      00085901
      ****************************************************              00086000
      ****************************************************              00086100
       PROCEDURE                                DIVISION.               00086200
                                                                        00086300
       0001-PRINCIPAL                            SECTION.               00086400
           PERFORM 0100-INICIALIZAR.                                    00087000
           IF WRK-FS-CLIENTES EQUAL "00"                                00088000
              PERFORM 0200-PROCESSAR                                    00089000
              PERFORM 0300-FINALIZAR                                    00090000
           ELSE                                                         00100000
              DISPLAY "JUMP OFF"                                        00101000
           END-IF.                                                      00102000
           STOP RUN.                                                    00103000
       0001-FIM-PRINCIPAL. EXIT.                                        00104000
      **************************************************                00105000
       0100-INICIALIZAR                          SECTION.               00106000
           OPEN INPUT CLS.                                              00107000
           IF WRK-FS-CLIENTES EQUAL "00"                                00107100
              DISPLAY "ARQUIVO ABERTO"                                  00107200
           ELSE                                                         00107300
              DISPLAY "ERRO NA ABERTURA - STATUS " WRK-FS-CLIENTES      00107400
           END-IF.                                                      00107500
       0100-INICIALIZAR-FIM.  EXIT.                                     00107600
      **************************************************                00107700
       0200-PROCESSAR                            SECTION.               00107800
           READ CLS.                                                    00107901
           MOVE REG-SALDO TO WRK-SALDO-IDE.                             00108001
           IF WRK-FS-CLIENTES EQUAL TO "00"                             00108101
              DISPLAY "AGENCIA : " REG-AGENCIA                          00108201
              DISPLAY "CONTA   : " REG-CONTA                            00108301
              DISPLAY "NOME    : " REG-NOME                             00108401
              DISPLAY "SALDO   : " WRK-SALDO-IDE                        00108501
           ELSE                                                         00108601
              DISPLAY "IMPOSSIVEL DE LER"                               00108701
           END-IF.                                                      00108801
       0200-PROCESSAR-FIM.    EXIT.                                     00108901
      **************************************************                00109001
       0300-FINALIZAR                            SECTION.               00109101
           CLOSE CLS.                                                   00110000
           IF WRK-FS-CLIENTES EQUAL "00"                                00120000
              DISPLAY "ARQUIVO FECHADO"                                 00130000
           ELSE                                                         00140000
              DISPLAY "ERRO NO FECHAMENTO - STATUS " WRK-FS-CLIENTES    00150000
           END-IF.                                                      00160000
       0300-FINALIZAR-FIM.    EXIT.                                     00170000
      **************************************************                00180000
