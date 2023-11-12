 IDENTIFICATION                            DIVISION.              00010000
       PROGRAM-ID.   COBOL001.                                          00020000
      *===================================================              00030000
      *   AUTHOR: TRUTT                                                 00040000
      *   OBJECTIVE: PRIMEIRO PROGRAMA TESTE DE DISPLAY E STOP          00050000
      *   DATA: 30/10/2023                                              00060000
      *===================================================              00070000
       ENVIRONMENT                               DIVISION.              00080000
      *                                                                 00090000
       DATA                                      DIVISION.              00100000
      *                                                                 00110000
       PROCEDURE                                 DIVISION.              00120000
       0001-PRINCIPAL                            SECTION.               00130000
      *----------------------------------------------------             00140000
      *   RETORNA NA SYSOUT A LITERAL PROGRAMA COB001                   00150000
      *----------------------------------------------------             00160000
           DISPLAY "PROGRAMA COB001".                                   00170000
           DISPLAY "O DISPLAY ESTA AQUI!".                              00180000
             STOP RUN.                                                  00190000
       0001-FIM-PRINCIPAL. EXIT.                                        00200000