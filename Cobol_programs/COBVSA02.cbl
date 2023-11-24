       IDENTIFICATION                           DIVISION.               00010005
       PROGRAM-ID.   COBVSA02.                                          00020000
      *==========================================                       00030000
      *  AUTOR: TRUTT                                                   00040000
      *  OBJETIVO: PROGRAMA DE ABERTURA E FECHO DE  KSDS                00050000
      *         DISPLAY DO CONTEUDO                                     00051000
      *  DATA: 16/11/2023                                               00052000
TT01  *=================================================                00053001
.     *  DATA: 17/11/2023                                               00053101
.     *  AUTOR: TRUTT                                                   00053201
.     *  ALTERACOES: ADICAO DE LINKAGE SECTION                          00053301
.     *              ADICAO DE MENSAGEM DE ERRO                         00053401
.     *              CONVERSAO PARA MODULO                              00053501
      *==================================================               00053601
      * DDNAME      I/O         BOOK                                    00053703
      *                                                                 00053801
      * ARQCLI       I          -----                                   00053901
      *==================================================               00054001
                                                                        00054201
       ENVIRONMENT                              DIVISION.               00054300
       CONFIGURATION                             SECTION.               00055000
       SPECIAL-NAMES.                                                   00056000
           DECIMAL-POINT IS COMMA.                                      00057000
       INPUT-OUTPUT                              SECTION.               00058000
       FILE-CONTROL.                                                    00059000
           SELECT AQL    ASSIGN TO ARQCLI                               00059102
           ORGANIZATION  IS INDEXED                                     00059200
           ACCESS MODE   IS SEQUENTIAL                                  00059300
           RECORD KEY    IS REG-ARQCLI-CHAVE                            00059400
           FILE STATUS   IS WRK-FS-ARQCLI.                              00059500
                                                                        00059600
      *                                                                 00080000
       DATA                                     DIVISION.               00081000
       FILE                                      SECTION.               00082000
       FD AQL.                                                          00083000
       01 REG-ARQCLI.                                                   00085200
          05 REG-ARQCLI-CHAVE.                                          00085300
             10 REG-ARQCLI-AGENCIA PIC X(04).                           00085400
             10 REG-ARQCLI-CONTA   PIC X(05).                           00085500
          05 REG-ARQCLI-NOME       PIC X(30).                           00085600
          05 REG-ARQCLI-SALDO      PIC 9(06)V99.                        00085700
       WORKING-STORAGE                           SECTION.               00085800
       77 WRK-FS-ARQCLI            PIC X(02) VALUE ZEROS.               00085900
       77 WRK-CONTADOR             PIC 9(10) COMP VALUE 0.              00086000
       77 WRK-CONTADOR-IDE         PIC -Z.ZZZ.ZZZ.ZZ9.                  00086200
                                                                        00086301
TT01   01 WRK-MSG-ERROR.                                                00086401
TT01      05 WRK-MSG-OPEN          PIC X(25) VALUE                      00086501
TT01         "ERROR OPENING STATUS".                                    00086601
TT01      05 WRK-MSG-CLOSE         PIC X(25) VALUE                      00086701
TT01         "ERROR CLOSING STATUS".                                    00086801
TT01      05 WRK-MSG-SUCESS        PIC X(25) VALUE                      00086901
TT01         "LISTAGEM BEM SUCEDIDA".                                   00087004
TT01   LINKAGE                                   SECTION.               00087101
TT01   01 LNK-COMMAREA.                                                 00087201
TT01      05 LNK-STATUS            PIC X(25).                           00087301
      ****************************************************              00087400
      ****************************************************              00087500
TT01   PROCEDURE                                DIVISION                00087601
TT01                                  USING LNK-COMMAREA.               00087701
       0001-PRINCIPAL                            SECTION.               00087800
           PERFORM 0100-INICIALIZAR.                                    00087900
           PERFORM 0200-PROCESSAR UNTIL WRK-FS-ARQCLI EQUAL "10".       00088000
           PERFORM 0210-ESTATISTICA.                                    00088100
           PERFORM 0300-FINALIZAR.                                      00088200
TT01       GOBACK.                                                      00088301
       0001-FIM-PRINCIPAL.    EXIT.                                     00089005
      **************************************************                00090000
       0100-INICIALIZAR                          SECTION.               00100000
           OPEN INPUT AQL.                                              00101000
           IF WRK-FS-ARQCLI NOT EQUAL "00"                              00102005
TT01         MOVE WRK-MSG-OPEN  TO LNK-STATUS                           00102105
TT01         MOVE WRK-FS-ARQCLI TO LNK-STATUS(22:02)                    00102205
TT01         GOBACK                                                     00104005
           ELSE                                                         00105005
             READ AQL                                                   00106005
           END-IF.                                                      00106405
       0100-INICIALIZAR-FIM.  EXIT.                                     00106500
      **************************************************                00106600
       0200-PROCESSAR                            SECTION.               00106700
           ADD 1 TO WRK-CONTADOR.                                       00106900
           DISPLAY REG-ARQCLI-AGENCIA "  " REG-ARQCLI-CONTA "  "        00107000
                   REG-ARQCLI-NOME "  " REG-ARQCLI-SALDO.               00107100
           READ AQL.                                                    00107600
       0200-PROCESSAR-FIM.    EXIT.                                     00107700
      **************************************************                00107800
       0210-ESTATISTICA                          SECTION.               00107900
           MOVE WRK-CONTADOR    TO WRK-CONTADOR-IDE.                    00108005
           DISPLAY "FORAM LIDOS :"                                      00108100
                   WRK-CONTADOR-IDE " REGISTOS".                        00108200
       0210-ESTATISTICA-FIM.  EXIT.                                     00108305
      **************************************************                00108400
       0300-FINALIZAR                            SECTION.               00108500
           CLOSE AQL.                                                   00108600
           IF WRK-FS-ARQCLI NOT EQUAL "00"                              00108705
TT01         MOVE WRK-MSG-CLOSE TO LNK-STATUS                           00108805
TT01         MOVE WRK-FS-ARQCLI TO LNK-STATUS(22:02)                    00108905
TT01         GOBACK                                                     00109005
           END-IF.                                                      00109205
TT01       MOVE WRK-MSG-SUCESS  TO LNK-STATUS.                          00109305
       0300-FINALIZAR-FIM.    EXIT.                                     00109400
      **************************************************                00110000
