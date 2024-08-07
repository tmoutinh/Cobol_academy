       IDENTIFICATION                            DIVISION.              00010001
       PROGRAM-ID.   COBOL004.                                          00020001
      *===================================================              00030001
      *   AUTHOR: TRUTT                                                 00040001
      *   OBJECTIVE: PROGRAMA DE APLICACAO DE INPUT NUMERAL             00050001
      *   DATA: 30/10/2023                                              00060001
      *===================================================              00070001
       ENVIRONMENT                               DIVISION.              00080001
      *                                                                 00090001
       DATA                                      DIVISION.              00100001
       WORKING-STORAGE                           SECTION.               00110001
       77 WRK-NUM1                PIC 9(04) VALUE ZEROS.                00120001
       77 WRK-NUM2                PIC 9(04) VALUE ZEROS.                00130001
       77 WRK-RES                 PIC 9(08) VALUE ZEROS.                00140001
      *                                                                 00150001
       PROCEDURE                                 DIVISION.              00160001
       0001-PRINCIPAL                            SECTION.               00170001
      *----------------------------------------------------             00180001
      *   RETORNA NA SYSOUT OS NUMEROS PASSADOS NO SYSIN                00190001
      *     E APRESENTA A MULTIPLICACAO DELES                           00200001
      *----------------------------------------------------             00210001
           ACCEPT WRK-NUM1 FROM SYSIN.                                  00220001
           ACCEPT WRK-NUM2 FROM SYSIN.                                  00230001
             COMPUTE WRK-RES = WRK-NUM1 * WRK-NUM2.                     00240001
      *--------------------- DISPLAY ---------------------              00250001
           DISPLAY "NUMERO 1 : " WRK-NUM1.                              00260001
                                                                        00270001
           DISPLAY "NUMERO 2 : " WRK-NUM2.                              00280001
           DISPLAY "RESULTADO: " WRK-RES.                               00290001
             STOP RUN.                                                  00300001
       0001-FIM-PRINCIPAL. EXIT.                                        00310001
