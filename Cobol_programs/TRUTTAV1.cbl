       IDENTIFICATION                           DIVISION.               00010011
       PROGRAM-ID.   TRUTTAV1.                                          00020000
      *==========================================                       00030000
      *  AUTOR     : TRUTT                                              00040016
      *  OBJETIVO  : PROGRAMA DE AVALIACAO 1                            00050016
      *  DATA      : 16/11/2023                                         00060016
      *  EMPRESA   : NATIXIS                                            00061017
      *==========================================                       00070000
TT01  *  AUTOR     : TRUTT                                              00070115
.     *  ALTERACAO : MOVIMENTACAO DO GOBACK PARA LIDAR COM WARNING      00070215
.     *              ALTERACAO DO GO TO PARA PERFORM                    00070315
.     *  DATA      : 20/11/2023                                         00070417
TT01  *  EMPRESA   : NATIXIS                                            00070517
      *==========================================                       00071015
TT02  *  AUTOR     : TRUTT                                              00072017
.     *  ALTERACAO : ADICAO DE DATA NO LOG DE ERRO                      00073017
.     *              ADICAO DE FILLERS NAS VARIAVEIS                    00074017
.     *  DATA      : 24/11/2023                                         00075017
TT02  *  EMPRESA   : NATIXIS                                            00076017
      *==========================================                       00077017
       ENVIRONMENT                              DIVISION.               00080000
       CONFIGURATION                             SECTION.               00081012
       SPECIAL-NAMES.                                                   00082000
           DECIMAL-POINT IS COMMA.                                      00083000
       INPUT-OUTPUT                              SECTION.               00084000
       FILE-CONTROL.                                                    00085000
           SELECT API ASSIGN TO ARQPECAS                                00086000
           FILE STATUS IS WRK-FS-API.                                   00087000
           SELECT PCO ASSIGN TO PECACOMP                                00087100
           FILE STATUS IS WRK-FS-PCO.                                   00087200
      *                                                                 00088000
       DATA                                     DIVISION.               00089000
       FILE                                      SECTION.               00089100
       FD API                                                           00089200
           RECORDING MODE IS F                                          00089304
           RECORD CONTAINS 50 CHARACTERS                                00089404
           BLOCK  CONTAINS 0 RECORDS.                                   00089511
                                                                        00089604
       COPY "#ARQPEC".                                                  00089700
                                                                        00089800
       FD PCO                                                           00089900
           RECORDING MODE IS F.                                         00090004
       01 REG-ORDER               PIC X(10).                            00090105
      *                                                                 00090400
       WORKING-STORAGE                           SECTION.               00090611
      *-------------------------------------------------*               00090901
      *                  ERROR HANDLING                 *               00091001
      *-------------------------------------------------*               00091101
TT02   77 FILLER                  PIC X(36) VALUE                       00091217
TT02         "---------- ERROR HANDLING ----------".                    00091317
       01 WRK-ERROR.                                                    00091400
TT02      05 WRK-ERROR-DATA       PIC X(08) VALUE SPACES.               00091517
TT02      05 FILLER               PIC X(04) VALUE " -- ".               00091617
TT02      05 WRK-ERROR-MODULE     PIC X(08) VALUE                       00091717
TT02         "TRUTTAV1".                                                00091817
TT02      05 FILLER               PIC X(04) VALUE " -- ".               00092017
          05 WRK-ERROR-FUNCTION   PIC X(20) VALUE SPACES.               00092117
          05 FILLER               PIC X(02) VALUE SPACES.               00092217
          05 WRK-ERROR-MESSAGE    PIC X(22) VALUE SPACES.               00092317
          05 FILLER               PIC X(02) VALUE SPACES.               00092417
          05 WRK-ERROR-STATUS     PIC X(02) VALUE SPACES.               00092517
                                                                        00092617
       01 WRK-ERROR-MESSAGES.                                           00092717
          05 WRK-ERROR-FILE       PIC X(01) VALUE ZERO.                 00092817
          05 WRK-OPEN-INPUT       PIC X(21) VALUE                       00092917
             "ERROR OPENING IN FILE".                                   00093017
          05 WRK-OPEN-OUTPUT      PIC X(22) VALUE                       00093117
             "ERROR OPENING OUT FILE".                                  00093217
          05 WRK-CLOSE-INPUT      PIC X(21) VALUE                       00093317
             "ERROR CLOSING IN FILE".                                   00093417
          05 WRK-CLOSE-OUTPUT     PIC X(22) VALUE                       00093517
             "ERROR CLOSING OUT FILE".                                  00093617
          05 WRK-EMPTY-FILE       PIC X(22) VALUE                       00093717
             "ERROR EMPTY INPUT FILE".                                  00093817
      *-------------------------------------------------*               00093917
      *                  WORK VARIABLES                 *               00094017
      *-------------------------------------------------*               00094117
TT02   77 FILLER                  PIC X(36) VALUE                       00094217
TT02         "---------- WORK VARIABLES ----------".                    00094317
       01 WRK-MIRROR.                                                   00094417
          05 COD-PECA             PIC 9(05) VALUE ZEROS.                00094517
          05 FORN-PECA            PIC 9(03) VALUE ZEROS.                00094617
          05 QUANT-COMPRA         PIC 9(02) VALUE ZEROS.                00094717
                                                                        00094817
       77 WRK-FS-API              PIC X(02).                            00094917
       77 WRK-FS-PCO              PIC X(02).                            00095017
       77 WRK-ACUM-LIDOS          PIC 9(09) COMP VALUE ZEROS.           00095117
       77 WRK-ACUM-GRAVA          PIC 9(09) COMP VALUE ZEROS.           00096004
      *-------------------------------------------------*               00097001
      *                  STAT VARIABLES                 *               00098001
      *-------------------------------------------------*               00099001
TT02   77 FILLER                  PIC X(36) VALUE                       00099117
TT02         "---------- STAT VARIABLES ----------".                    00099217
       01 WRK-STAT.                                                     00099301
          05 WRK-LIDOS.                                                 00099401
             10 WRK-TEXTO         PIC X(20) VALUE                       00099502
                "ARQUIVOS LIDOS".                                       00099601
             10 WRK-LIDOS-IDE     PIC ZZZ.ZZZ.ZZ9.                      00099707
          05 WRK-GRAVA.                                                 00099808
             10 WRK-TEXTO         PIC X(20) VALUE                       00099902
                "ARQUIVOS GRAVADOS".                                    00100001
             10 WRK-GRAVA-IDE     PIC ZZZ.ZZZ.ZZ9.                      00100102
      *                                                                 00100200
       PROCEDURE                                DIVISION.               00101000
      *--------------------------------------------------*              00102000
      *                 MAIN FUNCTION                    *              00102102
      *--------------------------------------------------*              00102200
       0001-PRINCIPAL                            SECTION.               00102311
           PERFORM 0100-INICIALIZAR.                                    00102400
           PERFORM 0200-PROCESSAR UNTIL WRK-FS-API EQUAL "10".          00102500
           PERFORM 0300-FINALIZAR.                                      00102600
           GOBACK.                                                      00102715
       0001-FIM-PRINCIPAL.    EXIT.                                     00102910
      **************************************************                00103000
       0100-INICIALIZAR                          SECTION.               00103111
TT02       ACCEPT WRK-ERROR-DATA FROM DATE YYYYMMDD.                    00103217
           OPEN OUTPUT PCO.                                             00103300
           IF WRK-FS-PCO NOT EQUAL "00"                                 00103411
             MOVE "0100-INICIALIZAR"   TO WRK-ERROR-FUNCTION            00103517
             MOVE WRK-OPEN-OUTPUT      TO WRK-ERROR-MESSAGE             00103617
             MOVE WRK-FS-PCO           TO WRK-ERROR-STATUS              00103717
             MOVE "O"                  TO WRK-ERROR-FILE                00103817
TT01         PERFORM 0300-FINALIZAR                                     00103915
TT01         GOBACK                                                     00104015
           END-IF.                                                      00104111
           OPEN INPUT API.                                              00104200
           IF WRK-FS-API NOT EQUAL "00"                                 00104311
             MOVE "0100-INICIALIZAR"   TO WRK-ERROR-FUNCTION            00104417
             MOVE WRK-OPEN-INPUT       TO WRK-ERROR-MESSAGE             00104517
             MOVE WRK-FS-API           TO WRK-ERROR-STATUS              00104617
             MOVE "I"                  TO WRK-ERROR-FILE                00104717
TT01         PERFORM 0300-FINALIZAR                                     00104815
TT01         GOBACK                                                     00104915
           ELSE                                                         00105011
             PERFORM 0110-TESTAR-VAZIO                                  00105111
           END-IF.                                                      00105311
       0100-INICIALIZAR-FIM.  EXIT.                                     00105400
      **************************************************                00105500
       0110-TESTAR-VAZIO                         SECTION.               00105611
           READ API.                                                    00105700
           IF WRK-FS-API EQUAL "10"                                     00105811
             MOVE "0110-TESTAR-VAZIO"  TO WRK-ERROR-FUNCTION            00105917
             MOVE WRK-EMPTY-FILE       TO WRK-ERROR-MESSAGE             00106017
             MOVE WRK-FS-API           TO WRK-ERROR-STATUS              00106117
TT01         PERFORM 0300-FINALIZAR                                     00106215
TT01         GOBACK                                                     00106315
           END-IF.                                                      00106411
       0110-TESTAR-VAZIO-FIM. EXIT.                                     00106710
      **************************************************                00106800
       0200-PROCESSAR                            SECTION.               00106911
           ADD 1 TO WRK-ACUM-LIDOS.                                     00107001
           IF QUANT-PECA LESS 20                                        00107103
             PERFORM 0210-CONSISTIR                                     00107203
           END-IF.                                                      00107301
           READ API.                                                    00107401
           IF WRK-FS-API EQUAL "10"                                     00107501
             PERFORM 0220-ESTATISTICA                                   00107601
           END-IF.                                                      00107701
       0200-PROCESSAR-FIM.    EXIT.                                     00107810
      **************************************************                00107901
       0210-CONSISTIR                            SECTION.               00108011
           IF FORN-PECA OF REG-PECA IS NUMERIC                          00108106
             MOVE CORR REG-PECA        TO   WRK-MIRROR                  00108213
             SUBTRACT  QUANT-PECA      FROM 20 GIVING QUANT-COMPRA      00108313
             WRITE     REG-ORDER       FROM WRK-MIRROR                  00108513
             ADD 1                     TO WRK-ACUM-GRAVA                00108613
           ELSE                                                         00108701
             DISPLAY COD-PECA  OF REG-PECA                              00108817
                     FORN-PECA OF REG-PECA                              00108913
           END-IF.                                                      00109001
       0210-CONSISTIR-FIM.    EXIT.                                     00109110
      **************************************************                00109201
       0220-ESTATISTICA                          SECTION.               00109311
           MOVE WRK-ACUM-GRAVA TO WRK-GRAVA-IDE.                        00109404
           MOVE WRK-ACUM-LIDOS TO WRK-LIDOS-IDE.                        00109504
           DISPLAY WRK-LIDOS.                                           00109608
           DISPLAY WRK-GRAVA.                                           00109708
       0220-ESTATISTICA-FIM.  EXIT.                                     00110010
      **************************************************                00110101
       0300-FINALIZAR                            SECTION.               00110211
           IF WRK-ERROR-MESSAGE NOT EQUAL SPACES                        00110301
             DISPLAY WRK-ERROR                                          00110412
           END-IF.                                                      00110501
           IF WRK-ERROR-FILE EQUAL "0"                                  00111111
             CLOSE API                                                  00111312
             IF WRK-FS-API NOT EQUAL "00"                               00111412
               MOVE "0300-FINALIZAR"   TO WRK-ERROR-FUNCTION            00111512
               MOVE WRK-CLOSE-INPUT    TO WRK-ERROR-MESSAGE             00111612
               MOVE WRK-FS-API         TO WRK-ERROR-STATUS              00111712
               DISPLAY WRK-ERROR                                        00111812
             END-IF                                                     00111912
           END-IF.                                                      00112009
           IF WRK-ERROR-FILE EQUAL "I" OR WRK-ERROR-FILE EQUAL "0"      00112111
             CLOSE PCO                                                  00112312
             IF WRK-FS-PCO NOT EQUAL "00"                               00112412
               MOVE "0300-FINALIZAR"   TO WRK-ERROR-FUNCTION            00112512
               MOVE WRK-CLOSE-OUTPUT   TO WRK-ERROR-MESSAGE             00112612
               MOVE WRK-FS-PCO         TO WRK-ERROR-STATUS              00112712
               DISPLAY WRK-ERROR                                        00112812
             END-IF                                                     00112912
           END-IF.                                                      00113009
       0300-FINALIZAR-FIM.    EXIT.                                     00120010
      **************************************************                00130000
