       IDENTIFICATION                            DIVISION.              00010002
       PROGRAM-ID.   COBOL008.                                          00020002
      *===================================================              00030002
      *   AUTHOR: TRUTT                                                 00040002
      *   OBJECTIVE: EXERCICIO A REUNIR TUDO O QUE FOI                  00050002
      *            DADO ATE AO MOMENTO                                  00060002
      *   DATA: 02/11/2023                                              00070002
      *===================================================              00080002
       ENVIRONMENT                               DIVISION.              00090002
       CONFIGURATION                             SECTION.               00100002
       SPECIAL-NAMES.                                                   00110002
           DECIMAL-POINT IS COMMA.                                      00120002
      *                                                                 00130002
       DATA                                      DIVISION.              00140002
       WORKING-STORAGE                           SECTION.               00150002
       01 WRK-DATA.                                                     00160002
         02 WRK-CODE                PIC 9(04) VALUE ZEROS.              00170002
         02 WRK-NAME                PIC X(30) VALUE SPACES.             00180002
         02 WRK-CONT                PIC X(02) VALUE SPACES.             00190002
         02 WRK-PAY                 PIC 9(08)V99 VALUE ZEROS.           00200002
       77 WRK-CODE-COMP             PIC 9(05) COMP VALUE ZEROS.         00210002
       77 WRK-CODE-NEW              PIC 9(05) COMP VALUE ZEROS.         00220002
       77 WRK-PAY-IDE               PIC ZZ.ZZZ.ZZ9,99.                  00230002
       77 WRK-CODE-IDE              PIC ZZZZ9.                          00240002
      *                                                                 00250002
       PROCEDURE                                 DIVISION.              00260002
       0001-PRINCIPAL                            SECTION.               00270002
      *----------------------------------------------------             00280002
      *   RETORNA NA SYSOUT O LAYOUT PASSADO NO SYSIN                   00290002
      *         E DEVOLVE COM ALTERACOES                                00300002
      *----------------------------------------------------             00310002
           ACCEPT WRK-DATA.                                             00320002
      *---------------------- MOVE ----------------------               00330002
           MOVE WRK-CODE TO WRK-CODE-COMP.                              00340002
           MOVE WRK-PAY  TO WRK-PAY-IDE.                                00350002
      *---------------------- COMPUTE -------------------               00360002
           COMPUTE                                                      00370002
              WRK-CODE-NEW = WRK-CODE-COMP + 1000.                      00380002
              MOVE WRK-CODE-NEW TO WRK-CODE-IDE.                        00390002
      *--------------------- DISPLAY ---------------------              00400002
           DISPLAY "CODIGO      : " WRK-CODE.                           00410002
           DISPLAY "NOME        : " WRK-NAME.                           00420002
           DISPLAY "PAIS        : " WRK-CONT.                           00430002
           DISPLAY "SALARIO     : " WRK-PAY-IDE " EUROS".               00440002
           DISPLAY "CODIGO NOVO : " WRK-CODE-IDE.                       00450002
             STOP RUN.                                                  00460002
       0001-FIM-PRINCIPAL. EXIT.                                        00470002
