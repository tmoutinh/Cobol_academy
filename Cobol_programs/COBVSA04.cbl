       IDENTIFICATION                           DIVISION.               00010000
       PROGRAM-ID.   COBVSA04.                                          00020000
      *==========================================                       00030000
      *  AUTOR: TRUTT                                                   00040000
      *  OBJETIVO: PROGRAMA DE ABERTURA E FECHAR KSDS                   00050000
      *            EXCLUSAO DE 1 REGISTO                                00051000
      *  DATA: 17/11/2023                                               00052000
      *==================================================               00053000
      * DDNAME      I/O         BOOK                                    00053100
      *                                                                 00053200
      * ARQCLI      I-O         -----                                   00053300
      *==================================================               00053400
       ENVIRONMENT                              DIVISION.               00053500
       CONFIGURATION                             SECTION.               00053600
       SPECIAL-NAMES.                                                   00053700
           DECIMAL-POINT IS COMMA.                                      00053800
       INPUT-OUTPUT                              SECTION.               00053900
       FILE-CONTROL.                                                    00054000
           SELECT AQL ASSIGN TO ARQCLI                                  00055000
           ORGANIZATION  IS INDEXED                                     00056000
           ACCESS MODE   IS DYNAMIC                                     00057000
           RECORD KEY    IS REG-ARQCLI-CHAVE                            00058000
           FILE STATUS   IS WRK-FS-ARQCLI.                              00059000
      *                                                                 00060000
       DATA                                     DIVISION.               00061000
      *------------------- CHAVE                                        00062000
      * AGENCIA 04                                                      00063000
      * CONTA   05                                                      00064000
      *------------------- CHAVE                                        00065000
       FILE                                      SECTION.               00066000
       FD AQL.                                                          00067000
       01 REG-ARQCLI.                                                   00068000
          05 REG-ARQCLI-CHAVE     PIC X(09).                            00069000
          05 REG-ARQCLI-NOME      PIC X(30).                            00070000
          05 REG-ARQCLI-SALDO     PIC 9(06)V99.                         00080000
                                                                        00081000
       WORKING-STORAGE                           SECTION.               00082000
       01 WRK-REG-ARQCLI.                                               00083000
          05 WRK-ARQCLI-CHAVE     PIC X(09) VALUE SPACES.               00083100
          05 WRK-ARQCLI-NOME      PIC X(30) VALUE SPACES.               00083200
          05 WRK-ARQCLI-SALDO     PIC 9(06)V99 VALUE ZEROES.            00083300
       77 WRK-FS-ARQCLI           PIC X(02) VALUE ZEROS.                00083400
       77 WRK-STATUS              PIC X(25) VALUE SPACES.               00083500
       77 WRK-SALDO-IDE           PIC -ZZZ.ZZ9,99.                      00083600
      ****************************************************              00083700
      ****************************************************              00083800
       PROCEDURE                                DIVISION.               00083900
                                                                        00084000
       0001-PRINCIPAL                            SECTION.               00085000
           PERFORM 0100-INICIALIZAR.                                    00086000
           PERFORM 0200-PROCESSAR.                                      00086100
           PERFORM 0300-FINALIZAR.                                      00086200
       0001-FIM-PRINCIPAL.    EXIT.                                     00086300
      **************************************************                00086400
       0100-INICIALIZAR                          SECTION.               00086500
           OPEN I-O   AQL.                                              00086600
           IF WRK-FS-ARQCLI NOT EQUAL "00"                              00086700
             DISPLAY "ERRO NA ABERTURA - STATUS " WRK-FS-ARQCLI         00086800
             GOBACK                                                     00086900
           END-IF.                                                      00087000
       0100-INICIALIZAR-FIM.  EXIT.                                     00088000
      **************************************************                00089000
       0200-PROCESSAR                            SECTION.               00090000
           ACCEPT WRK-REG-ARQCLI.                                       00100000
           MOVE WRK-REG-ARQCLI     TO REG-ARQCLI.                       00101001
           DELETE AQL.                                                  00102000
           IF WRK-FS-ARQCLI NOT EQUAL "00"                              00103000
             DISPLAY "CHAVE INEXISTENTE "                               00104001
             MOVE "DID NOT DELETE" TO WRK-STATUS                        00105001
           END-IF.                                                      00106000
       0200-PROCESSAR-FIM.    EXIT.                                     00107000
      **************************************************                00107100
       0300-FINALIZAR                            SECTION.               00107200
           CLOSE AQL.                                                   00107300
           IF WRK-FS-ARQCLI NOT EQUAL "00"                              00107400
             DISPLAY "ERRO NO FECHAMENTO - STATUS " WRK-FS-ARQCLI       00107500
           END-IF.                                                      00107600
           IF WRK-STATUS EQUAL SPACES                                   00107700
             CALL "COBVSA02" USING WRK-STATUS                           00107800
             DISPLAY WRK-STATUS                                         00107900
           END-IF.                                                      00108000
           GOBACK.                                                      00108100
       0300-FINALIZAR-FIM.    EXIT.                                     00108200
      **************************************************                00108300
