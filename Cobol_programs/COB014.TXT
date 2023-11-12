       IDENTIFICATION                            DIVISION.              00010001
       PROGRAM-ID.   COBOL014.                                          00020001
      *===================================================              00030001
      *   AUTHOR: TRUTT                                                 00040001
      *   OBJECTIVE: PROGRAMA DE APLICACAO DE IFS                       00050001
      *   DATA: 06/11/2023                                              00060001
      *===================================================              00070001
       ENVIRONMENT                               DIVISION.              00080001
      *                                                                 00090001
       DATA                                      DIVISION.              00100001
       WORKING-STORAGE                           SECTION.               00110001
       77 WRK-NUM1                PIC X(02) VALUE ZEROES.               00120001
       77 WRK-NUM2                PIC X(02) VALUE ZEROES.               00130001
      *                                                                 00140001
       PROCEDURE                                 DIVISION.              00150001
       0001-PRINCIPAL                            SECTION.               00160001
      *----------------------------------------------------             00170001
      *   RETORNA NA SYSOUT O MAIOR NUMERO ENTRE OS PASSADOS            00180001
      *----------------------------------------------------             00190001
           ACCEPT WRK-NUM1.                                             00200001
           ACCEPT WRK-NUM2.                                             00210001
           DISPLAY "OS NUMEROS SAO : " WRK-NUM1 " E " WRK-NUM2          00220001
             IF WRK-NUM1 GREATER WRK-NUM2                               00230001
              DISPLAY "O MAIOR E WRK-NUM1 : " WRK-NUM1                  00240001
             ELSE                                                       00250001
               IF WRK-NUM2 GREATER WRK-NUM1                             00260001
                DISPLAY "O MAIOR E WRK-NUM2 : " WRK-NUM2                00270001
               ELSE                                                     00280001
                DISPLAY "SAO IGUAIS"                                    00290001
               END-IF                                                   00300001
             END-IF.                                                    00310001
             STOP RUN.                                                  00320001
       0001-FIM-PRINCIPAL. EXIT.                                        00330001
