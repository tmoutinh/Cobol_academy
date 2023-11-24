       IDENTIFICATION                           DIVISION.               00010002
       PROGRAM-ID.   COBVSA01.                                          00020000
      *==========================================                       00030000
      *  AUTOR: TRUTT                                                   00040000
      *  OBJETIVO: PROGRAMA DE ABERTURA E FECHAR KSDS                   00050000
      *            LEITURA DE UM REGISTO DIRETO                         00051001
      *  DATA: 16/11/2023                                               00052000
      *==========================================                       00053000
       ENVIRONMENT                              DIVISION.               00054000
       CONFIGURATION                             SECTION.               00055000
       SPECIAL-NAMES.                                                   00056000
           DECIMAL-POINT IS COMMA.                                      00057000
       INPUT-OUTPUT                              SECTION.               00058000
       FILE-CONTROL.                                                    00059000
           SELECT AQL ASSIGN TO ARQCLI                                  00060000
           ORGANIZATION  IS INDEXED                                     00061000
           ACCESS MODE   IS RANDOM                                      00062000
           RECORD KEY    IS REG-ARQCLI-CHAVE                            00063000
           FILE STATUS   IS WRK-FS-ARQCLI.                              00064000
      *                                                                 00080000
       DATA                                     DIVISION.               00081000
       FILE                                      SECTION.               00082000
       FD AQL.                                                          00083000
       01 REG-ARQCLI.                                                   00085200
          05 REG-ARQCLI-CHAVE     PIC X(09).                            00085300
          05 REG-ARQCLI-NOME      PIC X(30).                            00085401
          05 REG-ARQCLI-SALDO     PIC 9(06)V99.                         00085601
                                                                        00085700
       WORKING-STORAGE                           SECTION.               00085800
       77 WRK-FS-ARQCLI           PIC X(02) VALUE ZEROS.                00085900
       77 WRK-ARQCLI-CHAVE        PIC X(09) VALUE SPACES.               00086001
       77 WRK-SALDO-IDE           PIC -ZZZ.ZZ9,99.                      00086100
      ****************************************************              00086300
      ****************************************************              00086400
       PROCEDURE                                DIVISION.               00086500
                                                                        00086600
       0001-PRINCIPAL                            SECTION.               00086700
           PERFORM 0100-INICIALIZAR.                                    00086800
           PERFORM 0200-PROCESSAR.                                      00086900
           PERFORM 0300-FINALIZAR.                                      00087100
           STOP RUN.                                                    00088000
       0001-FIM-PRINCIPAL.    EXIT.                                     00089002
      **************************************************                00090000
       0100-INICIALIZAR                          SECTION.               00100000
           OPEN INPUT AQL.                                              00101000
           IF WRK-FS-ARQCLI NOT EQUAL "00"                              00102002
             DISPLAY "ERRO NA ABERTURA - STATUS " WRK-FS-ARQCLI         00103002
             STOP RUN                                                   00104002
           END-IF.                                                      00106402
       0100-INICIALIZAR-FIM.  EXIT.                                     00106500
      **************************************************                00106600
       0200-PROCESSAR                            SECTION.               00106700
           ACCEPT WRK-ARQCLI-CHAVE.                                     00106801
           MOVE WRK-ARQCLI-CHAVE TO REG-ARQCLI-CHAVE.                   00106901
           READ AQL.                                                    00107001
           IF WRK-FS-ARQCLI EQUAL ZEROS                                 00107102
             DISPLAY "AGENCIA " REG-ARQCLI-CHAVE(01:04)                 00107202
             DISPLAY "CONTA   " REG-ARQCLI-CHAVE(05:05)                 00107302
             DISPLAY "NOME    " REG-ARQCLI-NOME                         00107402
             DISPLAY "SALDO   " REG-ARQCLI-SALDO                        00107502
           ELSE                                                         00107602
             DISPLAY REG-ARQCLI-CHAVE " NAO ENCONTRADO"                 00107702
           END-IF.                                                      00107802
       0200-PROCESSAR-FIM.    EXIT.                                     00107900
      **************************************************                00108400
       0300-FINALIZAR                            SECTION.               00108500
           CLOSE AQL.                                                   00108600
           IF WRK-FS-ARQCLI NOT EQUAL "00"                              00108702
             DISPLAY "ERRO NO FECHAMENTO - STATUS " WRK-FS-ARQCLI       00108802
           END-IF.                                                      00108902
       0300-FINALIZAR-FIM.    EXIT.                                     00109000
      **************************************************                00110000
