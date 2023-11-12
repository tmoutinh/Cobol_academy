# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    COB009.cbl                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tmoutinh <tmoutinh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: Invalid date        by                   #+#    #+#              #
#    Updated: 2023/11/12 16:33:49 by tmoutinh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

       DATA                                      DIVISION.              00130001
       WORKING-STORAGE                           SECTION.               00140001
       77 WRK-SALACUM               PIC 9(06)V99 VALUE ZEROS.           00150001
       77 WRK-FATURA                PIC 9(06)V99 VALUE ZEROS.           00160001
       77 WRK-SALDO                 PIC S9(06)V99 VALUE ZEROS.          00170001
       77 WRK-SALACUM-IDE           PIC ZZZ.ZZ9,99.                     00180001
       77 WRK-FATURA-IDE            PIC ZZZ.ZZ9,99.                     00190001
       77 WRK-SALDO-IDE             PIC -ZZZ.ZZ9,99.                    00200001
      *                                                                 00210001
       PROCEDURE                                 DIVISION.              00220001
       0001-PRINCIPAL                            SECTION.               00230001
      *----------------------------------------------------             00240001
      *   RETORNA NA SYSOUT O LAYOUT PASSADO NO SYSIN                   00250001
      *         E DEVOLVE COM ALTERACOES                                00260001
      *----------------------------------------------------             00270001
           ACCEPT WRK-SALACUM.                                          00280001
           ACCEPT WRK-FATURA.                                           00290001
      *---------------------- COMPUTE -------------------               00300001
           COMPUTE                                                      00310001
              WRK-SALDO = WRK-SALACUM - WRK-FATURA.                     00320001
      *---------------------- MOVE ----------------------               00330001
           MOVE WRK-SALACUM  TO WRK-SALACUM-IDE.                        00340001
           MOVE WRK-FATURA   TO WRK-FATURA-IDE.                         00350001
           MOVE WRK-SALDO    TO WRK-SALDO-IDE.                          00360001
      *--------------------- DISPLAY ---------------------              00370001
           DISPLAY "SALDO ACUMULADO: " WRK-SALACUM-IDE.                 00380001
           DISPLAY "FATURA A PAGAR : " WRK-FATURA-IDE.                  00390001
           DISPLAY "SALDO FINAL    : " WRK-SALDO-IDE.                   00400001
             STOP RUN.                                                  00410001
       0001-FIM-PRINCIPAL. EXIT.                                        00420001