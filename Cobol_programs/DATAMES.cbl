       IDENTIFICATION                            DIVISION.              00010000
       PROGRAM-ID.   DATAMES.                                           00020000
      *===================================================              00030000
      *   AUTHOR: TRUTT                                                 00040000
      *   OBJECTIVE: PROGRAMA DE ESCRITA DE DATA COM MES EXTENSO        00050000
      *   DATA: 13/11/2023                                              00060000
      *===================================================              00070000
       ENVIRONMENT                               DIVISION.              00080000
      *                                                                 00090000
       DATA                                      DIVISION.              00100000
       WORKING-STORAGE                           SECTION.               00101000
       01 MESES.                                                        00102000
          02 FILLER          PIC X(09) VALUE 'JANEIRO  '.               00103000
          02 FILLER          PIC X(09) VALUE 'FEVEREIRO'.               00104000
          02 FILLER          PIC X(09) VALUE 'MARÇO    '.               00105000
          02 FILLER          PIC X(09) VALUE 'ABRIL    '.               00106000
          02 FILLER          PIC X(09) VALUE 'MAIO     '.               00107000
          02 FILLER          PIC X(09) VALUE 'JUNHO    '.               00108000
          02 FILLER          PIC X(09) VALUE 'JULHO    '.               00109000
          02 FILLER          PIC X(09) VALUE 'AGOSTO   '.               00109100
          02 FILLER          PIC X(09) VALUE 'SETEMBRO '.               00109200
          02 FILLER          PIC X(09) VALUE 'OUTUBRO  '.               00109300
          02 FILLER          PIC X(09) VALUE 'NOVEMBRO '.               00109400
          02 FILLER          PIC X(09) VALUE 'DEZEMBRO '.               00109500
       01 GRUPOMES REDEFINES MESES.                                     00109600
          02 MESANO OCCURS 12 TIMES PIC X(09).                          00109700
       01 WRK-DATA.                                                     00109800
          02 WRK-ANO               PIC 9(04) VALUE ZEROS.               00109900
          02 WRK-MES               PIC 99 VALUE ZEROS.                  00110000
          02 WRK-DIA               PIC 99 VALUE ZEROS.                  00110100
       LINKAGE                                   SECTION.               00110201
       01 LNK-COMMAREA.                                                 00110301
          05 LNK-DATA-EXTENSO         PIC X(30).                        00110401
      *                                                                 00111000
       PROCEDURE DIVISION USING LNK-COMMAREA.                           00120001
       0001-PRINCIPAL                            SECTION.               00130000
           ACCEPT WRK-DATA FROM DATE YYYYMMDD                           00140000
             MOVE WRK-DIA TO LNK-DATA-EXTENSO.                          00141001
             MOVE " DE "  TO LNK-DATA-EXTENSO(03:04).                   00142001
             MOVE MESANO(WRK-MES) TO LNK-DATA-EXTENSO(07:09).           00142101
             MOVE " DE "  TO LNK-DATA-EXTENSO(16:04).                   00142201
             MOVE WRK-ANO TO LNK-DATA-EXTENSO(20:04).                   00143001
           GOBACK.                                                      00160000
       0001-FIM-PRINCIPAL. EXIT.                                        00200000
