       IDENTIFICATION                            DIVISION.              00010001
       PROGRAM-ID.   COBARQ06.                                          00020001
      *==========================================                       00030001
      *  AUTOR: TRUTT                                                   00040001
      *  OBJETIVO: PROGRAMA DE ABERTURA E                               00050001
      *         FECHAMETO DE ARQUIVOS COM ESCRITA                       00051001
      *  DATA: 09/11/2023                                               00052001
      *==========================================                       00053001
       ENVIRONMENT                              DIVISION.               00054001
       CONFIGURATION                             SECTION.               00055001
       SPECIAL-NAMES.                                                   00056001
            DECIMAL-POINT IS COMMA.                                     00057001
       INPUT-OUTPUT                              SECTION.               00058001
       FILE-CONTROL.                                                    00059001
           SELECT ARS ASSIGN TO ARQSAI                                  00060001
           FILE STATUS IS WRK-FS-ARQSAI.                                00070001
      *                                                                 00080001
       DATA                                     DIVISION.               00081001
       FILE                                      SECTION.               00082001
       FD ARS                                                           00083001
           RECORDING MODE IS F.                                         00084001
                                                                        00085201
       01 REG-ARQSAI.                                                   00085401
          05 REG-ID               PIC X(05).                            00085502
          05 REG-NOME             PIC X(20).                            00085602
                                                                        00086001
       WORKING-STORAGE                           SECTION.               00086101
       77 WRK-FS-ARQSAI           PIC X(02) VALUE ZEROS.                00086201
                                                                        00086302
       01 WRK-REG-ARQSAI.                                               00086402
          05 WRK-REG-ID           PIC X(05) VALUE SPACES.               00086502
          05 WRK-REG-NOME         PIC X(20) VALUE SPACES.               00086602
                                                                        00086801
       01 WRK-MSG.                                                      00086901
          05 WRK-MSG-ABERTURA  PIC X(30) VALUE "ERRO DE ABERTURA".      00087001
          05 WRK-MSG-FECHO     PIC X(30) VALUE "ARQUIVO VAZIO".         00087101
          05 WRK-MSG-ESCRITA   PIC X(30) VALUE "ERRO NA ESCRITA".       00087201
                                                                        00087301
       01 WRK-TRATAR-ERRO.                                              00087401
          05 WRK-ERRO-SECAO       PIC X(20) VALUE SPACES.               00087501
          05 FILLER               PIC X(01) VALUE SPACE.                00087601
          05 WRK-ERRO-TEXTO       PIC X(30) VALUE SPACES.               00087701
          05 FILLER               PIC X(01) VALUE SPACE.                00087801
          05 WRK-ERRO-STATUS      PIC X(02) VALUE SPACES.               00087901
                                                                        00088001
      ****************************************************              00088101
      ****************************************************              00088201
       PROCEDURE                                DIVISION.               00088301
                                                                        00088401
       0001-PRINCIPAL                            SECTION.               00088501
           PERFORM 0100-INICIALIZAR.                                    00088601
           PERFORM 0200-PROCESSAR.                                      00088701
           PERFORM 0300-FINALIZAR.                                      00088901
           STOP RUN.                                                    00089001
       0001-FIM-PRINCIPAL. EXIT.                                        00089101
      **************************************************                00089201
       0100-INICIALIZAR                          SECTION.               00089301
           OPEN OUTPUT ARS.                                             00089401
           IF WRK-FS-ARQSAI NOT EQUAL "00"                              00089501
              MOVE "0100-INICIALIZAR" TO WRK-ERRO-SECAO                 00089601
              MOVE WRK-MSG-ABERTURA TO WRK-ERRO-TEXTO                   00089701
              MOVE WRK-FS-ARQSAI TO WRK-ERRO-STATUS                     00089801
              PERFORM 9000-ERROR                                        00089901
              STOP RUN                                                  00090001
           END-IF.                                                      00104001
       0100-INICIALIZAR-FIM.  EXIT.                                     00105001
      **************************************************                00106001
       0200-PROCESSAR                            SECTION.               00106101
           MOVE "00205" TO WRK-REG-ID.                                  00106202
           MOVE "TIAGO TEIXEIRA" TO WRK-REG-NOME.                       00106302
           WRITE REG-ARQSAI FROM WRK-REG-ARQSAI.                        00106402
           IF WRK-FS-ARQSAI NOT EQUAL "00"                              00106501
              MOVE "0200-PROCESSAR" TO WRK-ERRO-SECAO                   00106601
              MOVE WRK-MSG-ESCRITA  TO WRK-ERRO-TEXTO                   00106701
              MOVE WRK-FS-ARQSAI TO WRK-ERRO-STATUS                     00106801
              PERFORM 9000-ERROR                                        00106901
           END-IF.                                                      00107001
       0200-PROCESSAR-FIM.    EXIT.                                     00107401
      **************************************************                00109201
       0300-FINALIZAR                            SECTION.               00109301
           CLOSE ARS.                                                   00109401
           IF WRK-FS-ARQSAI NOT EQUAL "00"                              00109501
              MOVE "0300-FINALIZAR" TO WRK-ERRO-SECAO                   00109601
              MOVE WRK-MSG-FECHO    TO WRK-ERRO-TEXTO                   00109701
              MOVE WRK-FS-ARQSAI    TO WRK-ERRO-STATUS                  00109801
              PERFORM 9000-ERROR                                        00109901
           END-IF.                                                      00110001
       0300-FINALIZAR-FIM.    EXIT.                                     00111001
      **************************************************                00112001
       9000-ERROR                                SECTION.               00113001
           DISPLAY WRK-TRATAR-ERRO.                                     00114001
       9000-ERROR-FIM.    EXIT.                                         00115001
      **************************************************                00116001
