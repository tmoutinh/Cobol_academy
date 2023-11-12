       IDENTIFICATION                            DIVISION.              00010001
       PROGRAM-ID.   COBOL03A.                                          00020001
      *===================================================              00030001
      *   AUTHOR: TRUTT                                                 00040001
      *   OBJECTIVE: PROGRAMA DE APLICACAO DE INPUT                     00050001
      *   DATA: 30/10/2023                                              00060001
      *===================================================              00070001
       ENVIRONMENT                               DIVISION.              00080001
      *                                                                 00090001
       DATA                                      DIVISION.              00100001
       WORKING-STORAGE                           SECTION.               00110001
       77 WRK-CURSO               PIC X(04) VALUE SPACES.               00120001
       77 WRK-LINHA               PIC X(30) VALUE SPACES.               00130001
       01 WRK-DATA.                                                     00140001
          02 WRK-DATA-YEAR        PIC X(04) VALUE SPACES.               00150001
          02 WRK-DATA-MONTH       PIC 9(02) VALUE SPACES.               00160001
          02 WRK-DATA-DAY         PIC X(02) VALUE SPACES.               00170001
       01 WRK-ANO.                                                      00180001
          02 WRK-MESES  PIC X(30) VALUE SPACES OCCURS 12.               00190001
      *                                                                 00200001
       PROCEDURE                                 DIVISION.              00210001
       0001-PRINCIPAL                            SECTION.               00220001
           MOVE "JANEIRO" TO WRK-MESES(01)                              00230001
           MOVE "OUTUBRO" TO WRK-MESES(10)                              00240001
      *----------------------------------------------------             00250001
      *   RETORNA NA SYSOUT A LITERAL PASSADA NO SYSIN                  00260001
      *   E APRESENTA A IDADE EM FORMATO DD / MM / YYYY                 00270001
      *----------------------------------------------------             00280001
           ACCEPT WRK-CURSO FROM SYSIN.                                 00290001
           ACCEPT WRK-LINHA FROM SYSIN.                                 00300001
           ACCEPT WRK-DATA FROM DATE YYYYMMDD.                          00310001
           DISPLAY "CURSO "                                             00320001
                   WRK-CURSO.                                           00330001
           DISPLAY WRK-LINHA.                                           00340001
           DISPLAY "DATA :"                                             00350001
                   WRK-DATA-DAY " DE "                                  00360001
                   WRK-DATA-MONTH "(" WRK-MESES(WRK-DATA-MONTH) ")" "   00370001
                   WRK-DATA-YEAR.                                       00380001
             STOP RUN.                                                  00390001
       0001-FIM-PRINCIPAL. EXIT.                                        00400001
