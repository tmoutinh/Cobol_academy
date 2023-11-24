       IDENTIFICATION                           DIVISION.               00010003
       PROGRAM-ID.   COBVSA03.                                          00020000
      *==========================================                       00030000
      *  AUTOR: TRUTT                                                   00040000
      *  OBJETIVO: PROGRAMA DE ABERTURA E FECHAR KSDS                   00050000
      *            GRAVACAO DE 1 REGISTO                                00051000
      *  DATA: 17/11/2023                                               00052000
      *==================================================               00053100
      * DDNAME      I/O         BOOK                                    00053200
      *                                                                 00053300
      * ARQCLI      I-O         -----                                   00053406
      *==================================================               00053500
       ENVIRONMENT                              DIVISION.               00054000
       CONFIGURATION                             SECTION.               00055000
       SPECIAL-NAMES.                                                   00056000
           DECIMAL-POINT IS COMMA.                                      00057000
       INPUT-OUTPUT                              SECTION.               00058000
       FILE-CONTROL.                                                    00059000
           SELECT AQL ASSIGN TO ARQCLI                                  00060000
           ORGANIZATION  IS INDEXED                                     00061000
           ACCESS MODE   IS DYNAMIC                                     00062000
           RECORD KEY    IS REG-ARQCLI-CHAVE                            00063000
           FILE STATUS   IS WRK-FS-ARQCLI.                              00064000
      *                                                                 00065000
       DATA                                     DIVISION.               00066000
      *------------------- CHAVE                                        00066101
      * AGENCIA 04                                                      00066201
      * CONTA   05                                                      00066301
      *------------------- CHAVE                                        00066401
       FILE                                      SECTION.               00067000
       FD AQL.                                                          00068000
       01 REG-ARQCLI.                                                   00069000
          05 REG-ARQCLI-CHAVE     PIC X(09).                            00070000
          05 REG-ARQCLI-NOME      PIC X(30).                            00080000
          05 REG-ARQCLI-SALDO     PIC 9(06)V99.                         00081000
                                                                        00082000
       WORKING-STORAGE                           SECTION.               00083000
       01 WRK-REG-ARQCLI.                                               00083100
          05 WRK-ARQCLI-CHAVE     PIC X(09) VALUE SPACES.               00083200
          05 WRK-ARQCLI-NOME      PIC X(30) VALUE SPACES.               00083300
          05 WRK-ARQCLI-SALDO     PIC 9(06)V99 VALUE ZEROES.            00083401
       77 WRK-FS-ARQCLI           PIC X(02) VALUE ZEROS.                00084000
       77 WRK-STATUS              PIC X(25) VALUE SPACES.               00086101
       77 WRK-SALDO-IDE           PIC -ZZZ.ZZ9,99.                      00086203
      ****************************************************              00086300
      ****************************************************              00086400
       PROCEDURE                                DIVISION.               00086500
                                                                        00086600
       0001-PRINCIPAL                            SECTION.               00086700
           PERFORM 0100-INICIALIZAR.                                    00086800
           PERFORM 0200-PROCESSAR.                                      00086900
           PERFORM 0300-FINALIZAR.                                      00087000
       0001-FIM-PRINCIPAL.    EXIT.                                     00087102
      **************************************************                00088000
       0100-INICIALIZAR                          SECTION.               00089000
           OPEN I-O   AQL.                                              00090001
           IF WRK-FS-ARQCLI NOT EQUAL "00"                              00100004
             DISPLAY "ERRO NA ABERTURA - STATUS " WRK-FS-ARQCLI         00101004
             GOBACK                                                     00102004
           END-IF.                                                      00103004
       0100-INICIALIZAR-FIM.  EXIT.                                     00104000
      **************************************************                00105000
       0200-PROCESSAR                            SECTION.               00106000
           ACCEPT WRK-REG-ARQCLI.                                       00106102
           MOVE WRK-REG-ARQCLI      TO REG-ARQCLI.                      00106202
           WRITE REG-ARQCLI                                             00106303
             INVALID KEY                                                00106403
               DISPLAY "REGISTRO DUPLICADO"                             00106501
               MOVE "DID NOT WRITE" TO WRK-STATUS                       00107002
           END-WRITE.                                                   00107503
       0200-PROCESSAR-FIM.    EXIT.                                     00107600
      **************************************************                00107700
       0300-FINALIZAR                            SECTION.               00107800
           CLOSE AQL.                                                   00107900
           IF WRK-FS-ARQCLI NOT EQUAL "00"                              00108004
             DISPLAY "ERRO NO FECHAMENTO - STATUS " WRK-FS-ARQCLI       00108104
           END-IF.                                                      00108204
           IF WRK-STATUS EQUAL SPACES                                   00108302
             CALL "COBVSA02" USING WRK-STATUS                           00108401
             DISPLAY WRK-STATUS                                         00108501
           END-IF.                                                      00108701
           GOBACK.                                                      00108802
       0300-FINALIZAR-FIM.    EXIT.                                     00108900
      **************************************************                00109000
