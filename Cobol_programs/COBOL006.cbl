       IDENTIFICATION                            DIVISION.              00010002
       PROGRAM-ID.   COBOL006.                                          00020002
      *===================================================              00030002
      *   AUTHOR: TRUTT                                                 00040002
      *   OBJECTIVE: PROGRAMA DE APLICACAO DE INPUT NUMERAL             00050002
      *  CONVERSAO E UTILIZACAO DE VARIAVEIS BINARIAS                   00060002
      *   DATA: 31/11/2023                                              00070002
      *===================================================              00080002
       ENVIRONMENT                               DIVISION.              00090002
      *                                                                 00100002
       DATA                                      DIVISION.              00110002
       WORKING-STORAGE                           SECTION.               00120002
       77 WRK-NUM1                PIC 9(04) VALUE ZEROS.                00130002
       77 WRK-NUM2                PIC 9(04) VALUE ZEROS.                00140002
       77 WRK-NUM1-COMP           PIC 9(04) COMP-3 VALUE ZEROS.         00150002
       77 WRK-NUM2-COMP           PIC 9(04) COMP-3 VALUE ZEROS.         00160002
       77 WRK-RES-COMP            PIC 9(08) COMP-3 VALUE ZEROS.         00170002
      *                                                                 00180002
       PROCEDURE                                 DIVISION.              00190002
       0001-PRINCIPAL                            SECTION.               00200002
      *----------------------------------------------------             00210002
      *   RETORNA NA SYSOUT OS NUMEROS PASSADOS NO SYSIN                00220002
      *     E APRESENTA A MULTIPLICACAO DELES                           00230002
      *----------------------------------------------------             00240002
           ACCEPT WRK-NUM1 FROM SYSIN.                                  00250002
           ACCEPT WRK-NUM2 FROM SYSIN.                                  00260002
           MOVE WRK-NUM1 TO WRK-NUM1-COMP.                              00270002
           MOVE WRK-NUM2 TO WRK-NUM2-COMP.                              00280002
             COMPUTE                                                    00290002
                WRK-RES-COMP = WRK-NUM1-COMP * WRK-NUM2-COMP.           00300002
      *--------------------- DISPLAY ---------------------              00310002
           DISPLAY "NUMERO 1 : " LENGTH OF WRK-NUM1-COMP.               00320002
           DISPLAY "NUMERO 2 : " LENGTH OF WRK-NUM2-COMP.               00330002
           DISPLAY "RESULTADO: " LENGTH OF WRK-RES-COMP.                00340002
           DISPLAY "*------------------------------*"                   00350002
           DISPLAY "NUMERO 1 : " WRK-NUM1-COMP.                         00360002
           DISPLAY "NUMERO 2 : " WRK-NUM2-COMP.                         00370002
           DISPLAY "RESULTADO: " WRK-RES-COMP.                          00380002
             STOP RUN.                                                  00390002
       0001-FIM-PRINCIPAL. EXIT.                                        00400002
