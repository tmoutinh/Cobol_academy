# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    COB012.cbl                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tmoutinh <tmoutinh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: Invalid date        by                   #+#    #+#              #
#    Updated: 2023/11/12 16:34:42 by tmoutinh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

           02 WRK-NOME              PIC X(15) VALUE ZEROS.              00130000
           02 WRK-RUA               PIC X(15) VALUE ZEROS.              00140000
           02 WRK-NUMERO            PIC X(04) VALUE ZEROS.              00150000
           02 WRK-DISTRITO          PIC X(15) VALUE SPACES.             00160000
           02 FILLER                PIC X(20).                          00170000
      *                                                                 00180000
       01 WRK-DATA-RED    REDEFINES WRK-DATA.                           00190000
           02 WRK-NOME-RED          PIC X(15).                          00200000
           02 WRK-ENDERECO-RED      PIC X(34).                          00210000
           02 FILLER                PIC X(20).                          00220000
      *                                                                 00230000
       PROCEDURE                                 DIVISION.              00240000
       0001-PRINCIPAL                            SECTION.               00250000
      *----------------------------------------------------             00260000
      *   RETORNA NA SYSOUT APENAS OS CAMPOS ESSENCIAIS                 00270000
      *----------------------------------------------------             00280000
           ACCEPT WRK-DATA.                                             00290000
      *-------------------- DISPLAY ---------------------               00300000
           DISPLAY "NOME     : " WRK-NOME-RED.                          00310000
           DISPLAY "ENDERECO : " WRK-ENDERECO-RED.                      00320000
             STOP RUN.                                                  00330000
       0001-FIM-PRINCIPAL. EXIT.                                        00340000