       IDENTIFICATION                            DIVISION.              00010001
       PROGRAM-ID.   COBOL011.                                          00020001
      *===================================================              00030001
      *   AUTHOR: TRUTT                                                 00040001
      *   OBJECTIVE: PROGRAMA DE UTILIZACAO DE OVERWRITE FILLER         00050001
      *   DATA: 03/11/2023                                              00060001
      *===================================================              00070001
       ENVIRONMENT                               DIVISION.              00080001
      *                                                                 00090001
       DATA                                      DIVISION.              00100001
       WORKING-STORAGE                           SECTION.               00110001
       01 WRK-DATA.                                                     00120001
           02 WRK-CODIGO            PIC 9(05) VALUE ZEROS.              00130001
           02 WRK-NOME              PIC X(15) VALUE ZEROS.              00140001
           02 FILLER                PIC X(10).                          00150001
           02 WRK-CARGO             PIC X(15) VALUE SPACES.             00160001
           02 FILLER                PIC X(15).                          00170001
      *                                                                 00180001
       PROCEDURE                                 DIVISION.              00190001
       0001-PRINCIPAL                            SECTION.               00200001
      *----------------------------------------------------             00210001
      *   RETORNA NA SYSOUT APENAS OS CAMPOS ESSENCIAIS                 00220001
      *----------------------------------------------------             00230001
           ACCEPT WRK-DATA.                                             00240001
      *-------------------- DISPLAY ---------------------               00250001
           DISPLAY "CODIGO : " WRK-CODIGO.                              00260001
           DISPLAY "NOME   : " WRK-NOME.                                00270001
           DISPLAY "CARGO  : " WRK-CARGO.                               00280001
             STOP RUN.                                                  00290001
       0001-FIM-PRINCIPAL. EXIT.                                        00300001
