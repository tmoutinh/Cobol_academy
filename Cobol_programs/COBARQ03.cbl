# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    COBARQ03.cbl                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tmoutinh <tmoutinh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: Invalid date        by ===========       #+#    #+#              #
#    Updated: 2023/11/12 16:36:58 by tmoutinh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

       INPUT-OUTPUT                              SECTION.               00058001
       FILE-CONTROL.                                                    00059001
           SELECT CLS ASSIGN TO CLIENTES                                00060001
           FILE STATUS IS WRK-FS-CLIENTES.                              00070001
      *                                                                 00080001
       DATA                                     DIVISION.               00081001
       FILE                                      SECTION.               00082001
       FD CLS                                                           00083001
           RECORDING MODE IS F                                          00084001
           RECORD CONTAINS 47 CHARACTERS                                00085001
           BLOCK CONTAINS 0 RECORDS.                                    00085101
       01 REG-CLIENTES.                                                 00085201
          05 REG-AGENCIA    PIC 9(04).                                  00085301
          05 REG-CONTA      PIC 9(05).                                  00085401
          05 REG-NOME       PIC X(30).                                  00085501
          05 REG-SALDO      PIC 9(06)V99.                               00085601
       WORKING-STORAGE                           SECTION.               00085701
       77 WRK-FS-CLIENTES         PIC X(02) VALUE ZEROS.                00085801
       77 WRK-CONTADOR            PIC 9(10) COMP VALUE 0.               00086001
       77 WRK-SALDO-IDE           PIC -ZZZ.ZZ9,99.                      00086101
       77 WRK-CONTADOR-IDE        PIC -Z.ZZZ.ZZZ.ZZ9.                   00086201
      ****************************************************              00086301
      ****************************************************              00086401
       PROCEDURE                                DIVISION.               00086501
                                                                        00086601
       0001-PRINCIPAL                            SECTION.               00086701
           PERFORM 0100-INICIALIZAR.                                    00086801
           PERFORM 0200-PROCESSAR UNTIL WRK-FS-CLIENTES EQUAL "10".     00086901
           PERFORM 0210-ESTATISTICA.                                    00087003
           PERFORM 0300-FINALIZAR.                                      00088001
           STOP RUN.                                                    00089001
       0001-FIM-PRINCIPAL. EXIT.                                        00090001
      **************************************************                00100001
       0100-INICIALIZAR                          SECTION.               00101001
           OPEN INPUT CLS.                                              00102001
           IF WRK-FS-CLIENTES NOT EQUAL "00"                            00103001
              DISPLAY "ERRO NA ABERTURA - STATUS " WRK-FS-CLIENTES      00104001
              STOP RUN                                                  00104101
           ELSE                                                         00105001
              READ CLS                                                  00106001
              IF WRK-FS-CLIENTES EQUAL "10"                             00106102
                 DISPLAY "ARQUIVO VAZIO"                                00106202
              END-IF                                                    00106302
           END-IF.                                                      00107001
       0100-INICIALIZAR-FIM.  EXIT.                                     00107101
      **************************************************                00107201
       0200-PROCESSAR                            SECTION.               00107301
           MOVE REG-SALDO TO WRK-SALDO-IDE.                             00107501
           ADD 1 TO WRK-CONTADOR.                                       00107601
           DISPLAY "***********************************"                00107701
           DISPLAY "AGENCIA : " REG-AGENCIA                             00107801
           DISPLAY "CONTA   : " REG-CONTA                               00107901
           DISPLAY "NOME    : " REG-NOME                                00108001
           DISPLAY "SALDO   : " WRK-SALDO-IDE                           00108101
           DISPLAY "***********************************"                00108201
           READ CLS.                                                    00108301
       0200-PROCESSAR-FIM.    EXIT.                                     00108501
      **************************************************                00108603
       0210-ESTATISTICA                          SECTION.               00108703
              MOVE WRK-CONTADOR TO WRK-CONTADOR-IDE.                    00108803
              DISPLAY "FORAM LIDOS :"                                   00108903
                  WRK-CONTADOR-IDE " REGISTOS".                         00109004
       0210-FINALIZAR-FIM.    EXIT.                                     00109103
      **************************************************                00109201
       0300-FINALIZAR                            SECTION.               00109301
           CLOSE CLS.                                                   00109401
           IF WRK-FS-CLIENTES NOT EQUAL "00"                            00109501
              DISPLAY "ERRO NO FECHAMENTO - STATUS " WRK-FS-CLIENTES    00109601
           END-IF.                                                      00120001
       0300-FINALIZAR-FIM.    EXIT.                                     00130001
      **************************************************                00140001