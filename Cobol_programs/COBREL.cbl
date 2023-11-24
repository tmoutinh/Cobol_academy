       IDENTIFICATION                           DIVISION.               00010008
       PROGRAM-ID.   COBREL.                                            00020000
      *==========================================                       00030000
      *  AUTOR: TRUTT                                                   00040000
      *  OBJETIVO: PROGRAMA DE ABERTURA E FECHAMETO DE ARQUIVOS         00050000
      *           COM MOSTRA NO SYSOUT                                  00051000
      *  DATA: 13/11/2023                                               00052004
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
           BLOCK  CONTAINS 0 RECORDS.                                   00085108
       01 REG-CLIENTES.                                                 00085200
          05 REG-AGENCIA          PIC 9(04).                            00085307
          05 REG-CONTA            PIC 9(05).                            00085407
          05 REG-NOME             PIC X(30).                            00085507
          05 REG-SALDO            PIC 9(06)V99.                         00085607
       WORKING-STORAGE                           SECTION.               00085700
      *------------- LAYOUT DO RELATORIO ---------------                00085801
       01 WRK-REGISTRO.                                                 00085901
          05 WRK-AGENCIA          PIC 9(04).                            00086007
          05 FILLER               PIC X(02) VALUE SPACES.               00086107
          05 WRK-CONTA            PIC 9(05).                            00086207
          05 FILLER               PIC X(02) VALUE SPACES.               00086307
          05 WRK-NOME             PIC X(30).                            00086407
          05 FILLER               PIC X(02) VALUE SPACES.               00086507
          05 WRK-SALDO            PIC -ZZZ.ZZ9,99.                      00086607
                                                                        00086702
       01 WRK-HEADER.                                                   00086802
          05 WRK-HEADER-TITLE     PIC X(41) VALUE                       00086907
             "--------- RELATORIO DE CLIENTES --- PAG: ".               00087002
          05 WRK-HEADER-PAG       PIC 9(04) VALUE 0.                    00087107
                                                                        00087202
       01 WRK-HEADER1.                                                  00087303
          05 WRK-HEADER-SUB       PIC X(50) VALUE                       00087407
             "AGEN  CONTA  NOME                            SALDO".      00087503
                                                                        00087603
       77 WRK-ACUM-SALDO          PIC 9(07)V99 COMP VALUE ZEROS.        00087703
       77 WRK-TOT-SALDO           PIC 9(09)V99 COMP VALUE ZEROS.        00087803
       77 WRK-FS-CLIENTES         PIC X(02) VALUE ZEROS.                00087903
       77 WRK-CONTADOR            PIC 9(10) COMP VALUE 0.               00088003
       77 WRK-ACUM-LINHAS         PIC 9(02) VALUE 0.                    00088103
       77 WRK-CONTADOR-IDE        PIC -Z.ZZZ.ZZZ.ZZ9.                   00088203
       77 WRK-SALDO-IDE           PIC -Z.ZZZ.ZZ9,99.                    00088303
       77 WRK-TOTSALDO-IDE        PIC -ZZZ.ZZZ.ZZ9,99.                  00088403
      ****************************************************              00088503
      ****************************************************              00088603
       PROCEDURE                                DIVISION.               00088703
                                                                        00088803
       0001-PRINCIPAL                            SECTION.               00088903
           PERFORM 0100-INICIALIZAR.                                    00089003
           PERFORM 0200-PROCESSAR UNTIL WRK-FS-CLIENTES EQUAL "10".     00089103
           PERFORM 0300-FINALIZAR.                                      00089303
       0001-FIM-PRINCIPAL.    EXIT.                                     00089408
      **************************************************                00090000
       0100-INICIALIZAR                          SECTION.               00100000
           OPEN INPUT CLS.                                              00101000
           IF WRK-FS-CLIENTES NOT EQUAL "00"                            00102000
             DISPLAY "ERRO NA ABERTURA - STATUS " WRK-FS-CLIENTES       00103008
             GOBACK                                                     00104008
           ELSE                                                         00105000
             READ CLS                                                   00106008
             IF WRK-FS-CLIENTES EQUAL "10"                              00106108
               DISPLAY "ARQUIVO VAZIO"                                  00106208
             END-IF                                                     00106308
           END-IF.                                                      00106400
       0100-INICIALIZAR-FIM.  EXIT.                                     00106500
      **************************************************                00106600
       0200-PROCESSAR                            SECTION.               00106700
           IF WRK-ACUM-LINHAS GREATER 5 OR WRK-ACUM-LINHAS EQUAL 0      00106806
             PERFORM 0210-PRINT-HED                                     00106908
           END-IF.                                                      00107006
           MOVE REG-AGENCIA   TO WRK-AGENCIA.                           00107808
           MOVE REG-CONTA     TO WRK-CONTA.                             00107908
           MOVE REG-NOME      TO WRK-NOME.                              00108008
           MOVE REG-SALDO     TO WRK-SALDO.                             00108108
           DISPLAY WRK-REGISTRO.                                        00108203
           ADD  REG-SALDO     TO WRK-ACUM-SALDO.                        00108308
           ADD  1             TO WRK-CONTADOR.                          00108408
           ADD  1             TO WRK-ACUM-LINHAS.                       00108508
           READ CLS.                                                    00108603
           IF WRK-FS-CLIENTES EQUAL "10"                                00108708
             PERFORM 0210-ESTATISTICA                                   00108908
           END-IF.                                                      00109008
       0200-PROCESSAR-FIM.    EXIT.                                     00109103
      **************************************************                00109203
       0210-ESTATISTICA                          SECTION.               00109303
           PERFORM 0220-PRINT-SUBTOT.                                   00109406
           ADD WRK-ACUM-SALDO TO WRK-TOT-SALDO                          00109506
           MOVE WRK-TOT-SALDO TO WRK-TOTSALDO-IDE.                      00109606
           DISPLAY "   ".                                               00109706
           DISPLAY "*=================================*".               00109806
           DISPLAY "   ".                                               00109906
           DISPLAY "TOTAL................."                             00110006
                 ".................. " WRK-TOTSALDO-IDE.                00110106
           MOVE WRK-CONTADOR  TO WRK-CONTADOR-IDE.                      00110207
           DISPLAY "   ".                                               00110306
           DISPLAY "*=================================*".               00110406
           DISPLAY "FORAM LIDOS :"                                      00110506
               WRK-CONTADOR-IDE " REGISTOS".                            00110606
       0210-ESTATISTICA-FIM.    EXIT.                                   00110703
      **************************************************                00110803
       0210-PRINT-HED                            SECTION.               00110903
           IF WRK-ACUM-LINHAS GREATER 5                                 00111006
              PERFORM 0220-PRINT-SUBTOT                                 00111106
           END-IF.                                                      00111206
           ADD WRK-ACUM-SALDO TO WRK-TOT-SALDO.                         00111606
           MOVE 0             TO WRK-ACUM-SALDO.                        00111707
           MOVE 1             TO WRK-ACUM-LINHAS.                       00111807
           ADD 1              TO WRK-HEADER-PAG.                        00111907
           DISPLAY "  ".                                                00112006
           DISPLAY WRK-HEADER.                                          00112106
           DISPLAY "  ".                                                00112206
           DISPLAY WRK-HEADER1.                                         00112306
           DISPLAY "  ".                                                00112406
       0210-PRINT-HED-FIM.    EXIT.                                     00112603
      **************************************************                00112703
       0220-PRINT-SUBTOT                         SECTION.               00112806
           MOVE WRK-ACUM-SALDO TO WRK-SALDO-IDE.                        00113107
           DISPLAY "    ".                                              00113207
           DISPLAY "SUB-TOTAL................."                         00113307
                   "................ " WRK-SALDO-IDE.                   00113408
       0210-PRINT-SUBTOT-FIM.  EXIT.                                    00114608
      **************************************************                00114706
       0300-FINALIZAR                            SECTION.               00114806
           CLOSE CLS.                                                   00114906
           IF WRK-FS-CLIENTES NOT EQUAL "00"                            00115006
              DISPLAY "ERRO NO FECHAMENTO - STATUS " WRK-FS-CLIENTES    00115106
           END-IF.                                                      00115206
           GOBACK.                                                      00115306
       0300-FINALIZAR-FIM.    EXIT.                                     00116006
      **************************************************                00120000
