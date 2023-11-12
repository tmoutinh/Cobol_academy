IDENTIFICATION                            DIVISION.              00010001
       PROGRAM-ID.   COBOL003.                                          00020001
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
          02 WRK-DATA-MONTH       PIC X(02) VALUE SPACES.               00160001
          02 WRK-DATA-DAY         PIC X(02) VALUE SPACES.               00170001
      *                                                                 00180001
       PROCEDURE                                 DIVISION.              00190001
       0001-PRINCIPAL                            SECTION.               00200001
      *----------------------------------------------------             00210001
      *   RETORNA NA SYSOUT A LITERAL PASSADA NO SYSIN                  00220001
      *   E APRESENTA A IDADE EM FORMATO DD / MM / YYYY                 00230001
      *----------------------------------------------------             00240001
           ACCEPT WRK-CURSO FROM SYSIN.                                 00250001
           ACCEPT WRK-LINHA FROM SYSIN.                                 00260001
           ACCEPT WRK-DATA FROM DATE YYYYMMDD.                          00270001
           DISPLAY "CURSO "                                             00280001
                   WRK-CURSO.                                           00290001
           DISPLAY WRK-LINHA.                                           00300001
           DISPLAY "DATA :"                                             00310001
                   WRK-DATA-DAY " DE "                                  00320001
                   WRK-DATA-MONTH " DE "                                00330001
                   WRK-DATA-YEAR.                                       00340001
             STOP RUN.                                                  00350001
       0001-FIM-PRINCIPAL. EXIT.                                        00360001