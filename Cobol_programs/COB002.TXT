       IDENTIFICATION                            DIVISION.              00010003
       PROGRAM-ID.   COBOL002.                                          00020003
      *===================================================              00030003
      *   AUTHOR: TRUTT                                                 00040003
      *   OBJECTIVE: PROGRAMA DE APLICACAO DE INPUT                     00050003
      *   DATA: 30/10/2023                                              00060003
      *===================================================              00070003
       ENVIRONMENT                               DIVISION.              00080003
      *                                                                 00090003
       DATA                                      DIVISION.              00100003
       WORKING-STORAGE                           SECTION.               00110003
       77 WRK-CURSO               PIC X(04) VALUE SPACES.               00120003
       77 WRK-LINHA               PIC X(30) VALUE SPACES.               00130003
       77 WRK-DATA                PIC X(08) VALUE SPACES.               00140003
      *                                                                 00150003
       PROCEDURE                                 DIVISION.              00160003
       0001-PRINCIPAL                            SECTION.               00170003
      *----------------------------------------------------             00180003
      *   RETORNA NA SYSOUT A LITERAL PASSADA NO SYSIN                  00190003
      *     E APRESENTA A IDADE EM FORMATO YYYYMMDD                     00200003
      *----------------------------------------------------             00210003
           ACCEPT WRK-CURSO FROM SYSIN.                                 00220003
           ACCEPT WRK-LINHA FROM SYSIN.                                 00230003
           ACCEPT WRK-DATA FROM DATE YYYYMMDD.                          00240003
      *--------------------- DISPLAY ---------------------              00250003
           DISPLAY "CURSO "                                             00260003
                   WRK-CURSO.                                           00270003
           DISPLAY WRK-LINHA.                                           00280003
           DISPLAY "DATA :"                                             00290003
                   WRK-DATA.                                            00300003
             STOP RUN.                                                  00310003
       0001-FIM-PRINCIPAL. EXIT.                                        00320003
