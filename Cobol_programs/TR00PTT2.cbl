       IDENTIFICATION                            DIVISION.              00010001
       PROGRAM-ID.  TR00PTT2.                                           00020001
       DATA                                      DIVISION.              00030001
       WORKING-STORAGE                            SECTION.              00040001
           COPY TR00MTT.                                                00050001
       01 WRK-RETORNO.                                                  00051001
         05 WRK-CHAVE                 PIC 9(03) VALUE ZEROS.            00060001
         05 WRK-NOME                  PIC X(20) VALUE SPACES.           00070001
         05 WRK-EMAIL                 PIC X(20) VALUE SPACES.           00080001
       PROCEDURE                                 DIVISION.              00090001
                                                                        00100001
           EXEC CICS SEND                                               00110001
                MAPSET('TR00MTT')                                       00120001
                MAP('CURSOMA')                                          00130001
                MAPONLY                                                 00140001
                ERASE                                                   00150001
           END-EXEC.                                                    00160001
                                                                        00161001
           EXEC CICS RECEIVE                                            00162001
                MAPSET('TR00MTT')                                       00163001
                MAP('CURSOMA')                                          00164001
                INTO(CURSOMAI)                                          00165001
           END-EXEC.                                                    00166001
                                                                        00167001
           MOVE CODIGOI   TO WRK-CHAVE.                                 00168001
           EXEC CICS READ                                               00169001
                FILE('TR00CLIV')                                        00169101
                RIDFLD(WRK-CHAVE)                                       00169201
                INTO(WRK-RETORNO)                                       00169301
           END-EXEC.                                                    00169401
                                                                        00169501
           MOVE WRK-NOME  TO NOMEO.                                     00169601
           MOVE WRK-EMAIL TO EMAILO.                                    00169701
                                                                        00169801
           EXEC CICS SEND                                               00169901
                MAPSET('TR00MTT')                                       00170001
                MAP('CURSOMA')                                          00170101
                DATAONLY                                                00170201
           END-EXEC.                                                    00170301
                                                                        00170401
           EXEC CICS                                                    00171001
                RETURN                                                  00180001
           END-EXEC.                                                    00190001
