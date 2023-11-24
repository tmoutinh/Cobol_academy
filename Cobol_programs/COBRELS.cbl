       IDENTIFICATION                           DIVISION.               00010002
       PROGRAM-ID.   COBRELS.                                           00020000
      *==========================================                       00030000
      *  AUTOR: TRUTT                                                   00040000
      *  OBJETIVO: PROGRAMA DE ABERTURA E FECHAMETO DE ARQUIVOS         00050000
      *           COM MOSTRA NO SYSOUT                                  00051000
      *  DATA: 13/11/2023                                               00052000
      *==========================================                       00053000
       ENVIRONMENT                              DIVISION.               00054000
       CONFIGURATION                             SECTION.               00055000
       SPECIAL-NAMES.                                                   00056000
           DECIMAL-POINT IS COMMA.                                      00057001
       INPUT-OUTPUT                              SECTION.               00058000
       FILE-CONTROL.                                                    00059000
           SELECT CLS ASSIGN TO CLIENTES                                00060000
           FILE STATUS IS WRK-FS-CLIENTES.                              00070000
           SELECT RLS ASSIGN TO RELSAI                                  00071000
           FILE STATUS IS WRK-FS-RELSAI.                                00072000
      *                                                                 00080000
       DATA                                     DIVISION.               00081000
       FILE                                      SECTION.               00082000
       FD CLS                                                           00083000
           RECORDING MODE IS F                                          00084000
           RECORD CONTAINS 47 CHARACTERS                                00085000
           BLOCK  CONTAINS 0 RECORDS.                                   00085102
       01 REG-CLIENTES.                                                 00085500
          05 REG-AGENCIA          PIC 9(04).                            00085600
          05 REG-CONTA            PIC 9(05).                            00085700
          05 REG-NOME             PIC X(30).                            00085800
          05 REG-SALDO            PIC 9(06)V99.                         00085900
                                                                        00086000
       FD RLS                                                           00086100
           RECORDING MODE IS F.                                         00086200
       01 REG-RELSAI              PIC X(57).                            00086300
                                                                        00086401
       WORKING-STORAGE                           SECTION.               00086500
      *------------- LAYOUT DO RELATORIO ---------------                00086600
       01 WRK-REGISTRO.                                                 00086700
          05 WRK-AGENCIA          PIC 9(04).                            00086800
          05 FILLER               PIC X(02) VALUE SPACES.               00086900
          05 WRK-CONTA            PIC 9(05).                            00087000
          05 FILLER               PIC X(02) VALUE SPACES.               00087100
          05 WRK-NOME             PIC X(30).                            00087200
          05 FILLER               PIC X(02) VALUE SPACES.               00087300
          05 WRK-SALDO            PIC -ZZZ.ZZ9,99.                      00087400
      *------------ AUXILIARES DE ESCRITA --------------                00087501
       01 WRK-HEADER.                                                   00087600
          05 WRK-HEADER-TITLE     PIC X(41) VALUE                       00087700
             "--------- RELATORIO DE CLIENTES --- PAG: ".               00087800
          05 WRK-HEADER-PAG       PIC 9(04) VALUE 0.                    00087900
                                                                        00088000
       01 WRK-HEADER1.                                                  00088100
          05 WRK-HEADER-SUB       PIC X(50) VALUE                       00088200
             "AGEN  CONTA  NOME                            SALDO".      00088300
                                                                        00088401
       01 WRK-SUBTOTAL.                                                 00088501
          05 WRK-SUBDISP          PIC X(43) VALUE                       00088601
             "SUB-TOTAL................................. ".             00088801
          05 WRK-SALDO-IDE        PIC -Z.ZZZ.ZZ9,99.                    00088901
                                                                        00089001
       01 WRK-TOTAL.                                                    00089101
          05 WRK-TOTDISP          PIC X(41) VALUE                       00089501
             "TOTAL................................... ".               00089601
          05 WRK-TOTSALDO-IDE     PIC -ZZZ.ZZZ.ZZ9,99.                  00089701
                                                                        00089801
       01 WRK-LINE                PIC X(57) VALUE SPACES.               00089901
      *------------ VARIAVEIS DE PROGRAMA --------------                00090401
       77 WRK-FS-CLIENTES         PIC X(02) VALUE ZEROS.                00090501
       77 WRK-FS-RELSAI           PIC X(02) VALUE ZEROS.                00090601
       77 WRK-ACUM-SALDO          PIC 9(07)V99 COMP VALUE ZEROS.        00090701
       77 WRK-TOT-SALDO           PIC 9(09)V99 COMP VALUE ZEROS.        00090801
       77 WRK-CONTADOR            PIC 9(10) COMP VALUE 0.               00091001
       77 WRK-ACUM-LINHAS         PIC 9(02) VALUE 0.                    00091101
       77 WRK-CONTADOR-IDE        PIC -Z.ZZZ.ZZZ.ZZ9.                   00091201
      ****************************************************              00091301
      ****************************************************              00091401
       PROCEDURE                                DIVISION.               00091501
                                                                        00091601
       0001-PRINCIPAL                            SECTION.               00091701
           PERFORM 0100-INICIALIZAR.                                    00091801
           PERFORM 0200-PROCESSAR UNTIL WRK-FS-CLIENTES EQUAL "10".     00091901
           PERFORM 0300-FINALIZAR.                                      00092001
       0001-FIM-PRINCIPAL.    EXIT.                                     00092102
      **************************************************                00092201
       0100-INICIALIZAR                          SECTION.               00092301
           OPEN OUTPUT RLS.                                             00092401
           OPEN INPUT CLS.                                              00092501
             IF WRK-FS-CLIENTES NOT EQUAL "00"                          00092601
               DISPLAY "ERRO NA ABERTURA - STATUS " WRK-FS-CLIENTES     00092701
               GOBACK                                                   00092801
             ELSE                                                       00093001
               READ CLS                                                 00100001
                 IF WRK-FS-CLIENTES EQUAL "10"                          00101001
                   DISPLAY "ARQUIVO VAZIO"                              00102001
                END-IF                                                  00103001
             END-IF.                                                    00104001
       0100-INICIALIZAR-FIM.  EXIT.                                     00105002
      **************************************************                00106000
       0200-PROCESSAR                            SECTION.               00106100
           IF WRK-ACUM-LINHAS GREATER 5 OR WRK-ACUM-LINHAS EQUAL 0      00106200
             PERFORM 0210-PRINT-HED                                     00106301
           END-IF.                                                      00106400
           MOVE  REG-AGENCIA     TO   WRK-AGENCIA.                      00106501
           MOVE  REG-CONTA       TO   WRK-CONTA.                        00106601
           MOVE  REG-NOME        TO   WRK-NOME.                         00106701
           MOVE  REG-SALDO       TO   WRK-SALDO.                        00106801
           WRITE REG-RELSAI      FROM WRK-REGISTRO.                     00106901
           ADD   REG-SALDO       TO   WRK-ACUM-SALDO.                   00107001
           ADD   1               TO   WRK-CONTADOR.                     00108001
           ADD   1               TO   WRK-ACUM-LINHAS.                  00108101
           READ  CLS.                                                   00108201
           IF WRK-FS-CLIENTES   EQUAL "10"                              00108302
             PERFORM 0210-ESTATISTICA                                   00108402
           END-IF.                                                      00108502
       0200-PROCESSAR-FIM.    EXIT.                                     00108602
      **************************************************                00108700
       0210-ESTATISTICA                          SECTION.               00108800
           PERFORM 0220-PRINT-SUBTOT.                                   00108900
           ADD   WRK-ACUM-SALDO  TO   WRK-TOT-SALDO                     00109001
           MOVE  WRK-TOT-SALDO   TO   WRK-TOTSALDO-IDE.                 00109101
           WRITE REG-RELSAI      FROM WRK-LINE.                         00109301
           WRITE REG-RELSAI      FROM WRK-TOTAL.                        00109401
           MOVE  WRK-CONTADOR    TO   WRK-CONTADOR-IDE.                 00110101
           DISPLAY "*=================================*".               00110201
           DISPLAY "FORAM LIDOS :"                                      00110301
                   WRK-CONTADOR-IDE " REGISTOS".                        00110402
       0210-ESTATISTICA-FIM.  EXIT.                                     00110502
      **************************************************                00110600
       0210-PRINT-HED                            SECTION.               00110700
           IF WRK-ACUM-LINHAS GREATER 5                                 00110802
             PERFORM 0220-PRINT-SUBTOT                                  00110902
           END-IF.                                                      00111000
           ADD   WRK-ACUM-SALDO  TO   WRK-TOT-SALDO.                    00111101
           MOVE  0               TO   WRK-ACUM-SALDO.                   00111201
           MOVE  1               TO   WRK-ACUM-LINHAS.                  00111301
           ADD   1               TO   WRK-HEADER-PAG.                   00111401
           WRITE REG-RELSAI      FROM WRK-HEADER AFTER PAGE.            00111601
           WRITE REG-RELSAI      FROM WRK-HEADER1 AFTER 2 LINES.        00111801
       0210-PRINT-HED-FIM.    EXIT.                                     00112002
      **************************************************                00112100
       0220-PRINT-SUBTOT                         SECTION.               00112200
           MOVE  WRK-ACUM-SALDO  TO   WRK-SALDO-IDE.                    00112301
           WRITE REG-RELSAI      FROM WRK-LINE.                         00113001
           WRITE REG-RELSAI      FROM WRK-SUBTOTAL.                     00113101
           WRITE REG-RELSAI      FROM WRK-LINE.                         00113201
       0210-PRINT-SUBTOT-FIM. EXIT.                                     00113402
      **************************************************                00113500
       0300-FINALIZAR                            SECTION.               00113600
           CLOSE CLS.                                                   00113700
           CLOSE RLS.                                                   00113800
           IF WRK-FS-CLIENTES NOT EQUAL "00"                            00113902
             DISPLAY "ERRO NO FECHAMENTO - STATUS " WRK-FS-CLIENTES     00114002
           END-IF.                                                      00114102
           GOBACK.                                                      00114200
       0300-FINALIZAR-FIM.    EXIT.                                     00115002
      **************************************************                00116000
