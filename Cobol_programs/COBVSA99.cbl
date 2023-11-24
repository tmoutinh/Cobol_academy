       IDENTIFICATION                           DIVISION.               00010000
       PROGRAM-ID.   COBVSA99.                                          00020000
      *==========================================                       00030000
      *  AUTOR: TRUTT                                                   00040000
      *  OBJETIVO: CRUD DO ARQUIVO ARQCLI KSDS                          00050000
      *            CONSULTA/GRAVAÇÃO/EXCLUSAO E ALTERACAO               00051000
      *  DATA: 20/11/2023                                               00052000
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
      *                                                                 00065000
       DATA                                     DIVISION.               00066000
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
          05 WRK-ARQCLI-SALDO     PIC 9(06)V99 VALUE ZEROES.            00083400
                                                                        00083501
       01 WRK-AUX.                                                      00083601
          05 WRK-STATUS           PIC X(25) VALUE SPACES.               00083701
          05 WRK-OPEMSG.                                                00083801
             10 WRK-MSG           PIC X(25) VALUE                       00083901
                "A OPERACAO EXECUTADA FOI ".                            00084001
             10 WRK-OPEXEC        PIC X(09) VALUE SPACES.               00084101
             10 WRK-MSG           PIC X(22) VALUE                       00084201
                "DO ELEMENTO COM CHAVE ".                               00084301
                                                                        00084401
       77 WRK-FS-ARQCLI           PIC X(02) VALUE ZEROS.                00085000
       77 WRK-OPERACAO            PIC X(01) VALUE SPACES.               00085100
       77 WRK-OPERACAO-STATUS     PIC X(01) VALUE "S".                  00085200
      ****************************************************              00086200
      ****************************************************              00086300
       PROCEDURE                                DIVISION.               00086400
                                                                        00086500
       0001-PRINCIPAL                            SECTION.               00086600
           PERFORM 0100-INICIALIZAR.                                    00086700
           PERFORM 0200-PROCESSAR.                                      00086800
           PERFORM 0300-FINALIZAR.                                      00086900
           GOBACK.                                                      00087000
       0001-FIM-PRINCIPAL.    EXIT.                                     00087100
      **************************************************                00088000
       0100-INICIALIZAR                          SECTION.               00089000
           OPEN I-O AQL.                                                00090000
           IF WRK-FS-ARQCLI NOT EQUAL "00"                              00100000
             DISPLAY "ERRO NA ABERTURA - STATUS " WRK-FS-ARQCLI         00101000
             GOBACK                                                     00102000
           END-IF.                                                      00103000
       0100-INICIALIZAR-FIM.  EXIT.                                     00104000
      **************************************************                00105000
       0200-PROCESSAR                            SECTION.               00106000
           ACCEPT WRK-OPERACAO.                                         00106100
           ACCEPT WRK-REG-ARQCLI.                                       00106201
           MOVE WRK-REG-ARQCLI      TO REG-ARQCLI.                      00106301
                                                                        00106400
           EVALUATE WRK-OPERACAO                                        00106500
             WHEN "C"                                                   00106600
               PERFORM 0210-CONSULTA                                    00106700
               MOVE "N"             TO WRK-OPERACAO-STATUS              00106801
             WHEN "E"                                                   00106901
               PERFORM 0220-EXCLUSAO                                    00107001
               MOVE "EXCLUSAO"      TO WRK-OPEXEC                       00107101
             WHEN "A"                                                   00107201
               PERFORM 0230-ALTERACAO                                   00107301
               MOVE "ALTERACAO"     TO WRK-OPEXEC                       00107401
             WHEN "I"                                                   00107501
               PERFORM 0240-INCLUSAO                                    00107601
               MOVE "INCLUSAO"      TO WRK-OPEXEC                       00107701
             WHEN OTHER                                                 00107800
               MOVE "N"             TO WRK-OPERACAO-STATUS              00107901
           END-EVALUATE.                                                00108000
       0200-PROCESSAR-FIM.    EXIT.                                     00108100
      **************************************************                00108200
      *              ROTINA DE CONSULTA                *                00108300
      **************************************************                00108400
       0210-CONSULTA                             SECTION.               00108500
           READ AQL.                                                    00108600
           IF WRK-FS-ARQCLI EQUAL ZEROS                                 00108700
             DISPLAY "AGENCIA " REG-ARQCLI-CHAVE(01:04)                 00108800
             DISPLAY "CONTA   " REG-ARQCLI-CHAVE(05:05)                 00108900
             DISPLAY "NOME    " REG-ARQCLI-NOME                         00109000
             DISPLAY "SALDO   " REG-ARQCLI-SALDO                        00109100
           ELSE                                                         00109200
             DISPLAY REG-ARQCLI-CHAVE " NAO ENCONTRADO"                 00109300
           END-IF.                                                      00109400
       0210-CONSULTA-FIM.     EXIT.                                     00109500
      **************************************************                00109600
      *              ROTINA DE EXCLUSAO                *                00109700
      **************************************************                00109800
       0220-EXCLUSAO                             SECTION.               00109901
           DELETE AQL.                                                  00110001
           IF WRK-FS-ARQCLI NOT EQUAL "00"                              00110101
             DISPLAY "CHAVE INEXISTENTE "                               00110201
             MOVE "DID NOT DELETE"  TO WRK-STATUS                       00110301
           END-IF.                                                      00110401
       0220-EXCLUSAO-FIM.     EXIT.                                     00110601
      **************************************************                00110700
      *              ROTINA DE ALTERACAO               *                00110801
      **************************************************                00110900
       0230-ALTERACAO                            SECTION.               00111001
           READ AQL.                                                    00111101
           IF WRK-FS-ARQCLI EQUAL "00"                                  00111201
             REWRITE REG-ARQCLI     FROM WRK-REG-ARQCLI                 00111301
           ELSE                                                         00111401
             DISPLAY "NAO EXISTE CHAVE " WRK-ARQCLI-CHAVE               00111501
             MOVE "DID NOT WRITE"   TO WRK-STATUS                       00111601
           END-IF.                                                      00111701
       0230-ALTERACAO-FIM.    EXIT.                                     00111801
      **************************************************                00111900
      *              ROTINA DE INCLUSAO                *                00112000
      **************************************************                00112100
       0240-INCLUSAO                             SECTION.               00112201
           WRITE REG-ARQCLI                                             00112301
             INVALID KEY                                                00112401
               DISPLAY "REGISTRO DUPLICADO"                             00112501
               MOVE "DID NOT WRITE" TO WRK-STATUS                       00112601
           END-WRITE.                                                   00112701
       0240-INCLUSAO-FIM.     EXIT.                                     00112801
      **************************************************                00112900
       0300-FINALIZAR                            SECTION.               00113000
           CLOSE AQL.                                                   00113100
           IF WRK-FS-ARQCLI NOT EQUAL "00"                              00113200
             DISPLAY "ERRO NO FECHAMENTO - STATUS " WRK-FS-ARQCLI       00113300
           END-IF.                                                      00113400
           IF WRK-OPERACAO-STATUS EQUAL "S"                             00113500
             IF WRK-STATUS EQUAL SPACES                                 00113601
               DISPLAY WRK-OPEMSG WRK-ARQCLI-CHAVE                      00113701
               CALL "COBVSA02" USING WRK-STATUS                         00113801
               DISPLAY WRK-STATUS                                       00113901
             END-IF                                                     00114001
           END-IF.                                                      00114101
       0300-FINALIZAR-FIM.    EXIT.                                     00115001
      **************************************************                00120000
