       IDENTIFICATION                           DIVISION.               00010004
       PROGRAM-ID.   COBARQ01.                                          00020001
      *==========================================                       00030001
      *  AUTOR: TRUTT                                                   00040001
      *  OBJETIVO: PROGRAMA DE ABERTURA E                               00050001
      *         FECHAMETO DE ARQUIVOS                                   00051001
      *  DATA: 07/11/2023                                               00060001
      *==========================================                       00070001
       ENVIRONMENT                              DIVISION.               00080004
       CONFIGURATION                             SECTION.               00081001
       SPECIAL-NAMES.                                                   00082001
            DECIMAL-POINT IS COMMA.                                     00083001
       INPUT-OUTPUT                              SECTION.               00083101
       FILE-CONTROL.                                                    00083201
           SELECT CLS ASSIGN TO CLIENTES                                00083301
           FILE STATUS IS WRK-FS-CLIENTES.                              00083401
      *                                                                 00084001
       DATA                                     DIVISION.               00085004
       FILE                                      SECTION.               00085101
       FD CLS                                                           00085201
           RECORDING MODE IS F                                          00085301
           RECORD CONTAINS 47 CHARACTERS                                00085401
           BLOCK CONTAINS 0 RECORDS.                                    00085501
       01 REG-CLIENTES             PIC X(47).                           00085604
       WORKING-STORAGE                           SECTION.               00086001
       77 WRK-FS-CLIENTES          PIC X(02) VALUE ZEROS.               00086104
                                                                        00086201
      ****************************************************              00089001
      ****************************************************              00090001
       PROCEDURE                                DIVISION.               00091004
                                                                        00100001
       0001-PRINCIPAL                            SECTION.               00101001
           PERFORM 0100-INICIALIZAR.                                    00102001
           IF WRK-FS-CLIENTES EQUAL "00"                                00102101
             PERFORM 0200-PROCESSAR                                     00102204
             PERFORM 0300-FINALIZAR                                     00102304
           ELSE                                                         00102401
             DISPLAY "JUMP OFF"                                         00102504
           END-IF.                                                      00102601
           STOP RUN.                                                    00103001
       0001-FIM-PRINCIPAL. EXIT.                                        00104001
      **************************************************                00105001
       0100-INICIALIZAR                          SECTION.               00106001
           OPEN INPUT CLS.                                              00107001
           IF WRK-FS-CLIENTES EQUAL "00"                                00107101
             DISPLAY "ARQUIVO ABERTO"                                   00107204
           ELSE                                                         00107301
             DISPLAY "ERRO NA ABERTURA - STATUS " WRK-FS-CLIENTES       00107404
           END-IF.                                                      00107501
       0100-INICIALIZAR-FIM.  EXIT.                                     00108001
      **************************************************                00109001
       0200-PROCESSAR                            SECTION.               00110001
       0200-PROCESSAR-FIM.    EXIT.                                     00130001
      **************************************************                00140001
       0300-FINALIZAR                            SECTION.               00150001
           CLOSE CLS.                                                   00151001
           IF WRK-FS-CLIENTES EQUAL "00"                                00152001
             DISPLAY "ARQUIVO FECHADO"                                  00153004
           ELSE                                                         00154001
             DISPLAY "ERRO NO FECHAMENTO - STATUS " WRK-FS-CLIENTES     00155004
           END-IF.                                                      00156001
       0300-FINALIZAR-FIM.    EXIT.                                     00170001
      **************************************************                00180001
