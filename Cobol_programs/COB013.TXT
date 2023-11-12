       IDENTIFICATION                            DIVISION.              00010001
       PROGRAM-ID.   COBOL013.                                          00020001
      *===================================================              00030001
      *   AUTHOR: TRUTT                                                 00040001
      *   OBJECTIVE: PROGRAMA DE OPERACOES ARITMETICAS                  00050001
      *   DATA: 03/11/2023                                              00060001
      *===================================================              00070001
TT001 *   AUTHOR: TRUTT                                                 00080001
TT001 *   OBJECTIVE: INCLUSAO DA OPERACAO DE SUBTRACAO                  00090001
TT001 *   DATA: 06/11/2023                                              00100001
      *===================================================              00110001
TT002 *   AUTHOR: TRUTT                                                 00120001
TT002 *   OBJECTIVE: INCLUSAO DA OPERACAO DE MULTIPLICAO                00130001
TT002 *   DATA: 06/11/2023                                              00140001
      *===================================================              00150001
TT003 *   AUTHOR: TRUTT                                                 00160001
TT003 *   OBJECTIVE: INCLUSAO DA OPERACAO DE DIVISAO                    00170001
TT003 *   DATA: 06/11/2023                                              00180001
      *===================================================              00190001
TT004 *   AUTHOR: TRUTT                                                 00200001
TT004 *   OBJECTIVE: INCLUSAO DA OPERACAO DE COMPUTE                    00210001
TT004 *   DATA: 06/11/2023                                              00220001
      *===================================================              00230001
       ENVIRONMENT                               DIVISION.              00240001
       CONFIGURATION                             SECTION.               00250001
       SPECIAL-NAMES.                                                   00260001
           DECIMAL-POINT IS COMMA.                                      00270001
      *                                                                 00280001
       DATA                                      DIVISION.              00290001
       WORKING-STORAGE                           SECTION.               00300001
      *                                                                 00310001
       77 WRK-NUM1                  PIC S9(02)V99.                      00320001
       77 WRK-NUM2                  PIC S9(02)V99.                      00330001
       77 WRK-RES                   PIC S9(04)V99.                      00340001
       77 WRK-RES-IDE               PIC -Z.ZZ9,99.                      00350001
      *                                                                 00360001
       PROCEDURE                                 DIVISION.              00370001
       0001-PRINCIPAL                            SECTION.               00380001
      *----------------------------------------------------             00390001
      *   RETORNA NA SYSOUT APENAS OS CAMPOS ESSENCIAIS                 00400001
      *----------------------------------------------------             00410001
           ACCEPT WRK-NUM1.                                             00420001
           ACCEPT WRK-NUM2.                                             00430001
           DISPLAY "NUMERO 1: " WRK-NUM1.                               00440001
           DISPLAY "NUMERO 2: " WRK-NUM2.                               00450001
      *-------------------- ADDITION ---------------------              00460001
           ADD WRK-NUM1 WRK-NUM2 GIVING WRK-RES.                        00470001
           MOVE WRK-RES TO WRK-RES-IDE.                                 00480001
           DISPLAY "RESULTADO ADICAO : " WRK-RES-IDE.                   00490001
TT001 *------------------- SUBTRACTION --------------------             00500001
TT001      SUBTRACT WRK-NUM1 FROM WRK-NUM2 GIVING WRK-RES.              00510001
TT001      MOVE WRK-RES TO WRK-RES-IDE.                                 00520001
TT001      DISPLAY "RESULTADO SUBTRACAO : " WRK-RES-IDE.                00530001
TT002 *------------------- MULTIPLICATION --------------------          00540001
TT002      MULTIPLY WRK-NUM1 BY WRK-NUM2 GIVING WRK-RES.                00550001
TT002      MOVE WRK-RES TO WRK-RES-IDE.                                 00560001
TT002      DISPLAY "RESULTADO MULTIPLICACAO : " WRK-RES-IDE.            00570001
TT003 *------------------- DIVISION --------------------                00580001
TT003      DIVIDE WRK-NUM1 BY WRK-NUM2 GIVING WRK-RES                   00590001
TT003          ON SIZE ERROR                                            00600001
TT003             DISPLAY "NAO FOI FEITA DIVISAO"                       00610001
TT003          NOT ON SIZE ERROR                                        00620001
TT003              MOVE WRK-RES TO WRK-RES-IDE                          00630001
TT003              DISPLAY "RESULTADO DIVISAO : " WRK-RES-IDE           00640001
TT003      END-DIVIDE.                                                  00650001
TT004 *------------------- COMPUTE --------------------                 00660001
TT004      COMPUTE WRK-RES = (WRK-NUM1 + WRK-NUM2) / 2.                 00670001
TT004      MOVE WRK-RES TO WRK-RES-IDE.                                 00680001
TT004      DISPLAY "RESULTADO COMPUTE : " WRK-RES-IDE.                  00690001
TT004 *---------------------------------------                          00700001
             STOP RUN.                                                  00710001
       0001-FIM-PRINCIPAL. EXIT.                                        00720001
