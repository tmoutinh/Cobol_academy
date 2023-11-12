# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    COB011.cbl                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tmoutinh <tmoutinh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: Invalid date        by                   #+#    #+#              #
#    Updated: 2023/11/12 16:34:24 by tmoutinh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

           02 WRK-CODIGO            PIC 9(05) VALUE ZEROS.              00130001
           02 WRK-NOME              PIC X(15) VALUE ZEROS.              00140001
           02 FILLER                PIC X(10).                          00150001
           02 WRK-CARGO             PIC X(15) VALUE SPACES.             00160001
           02 FILLER                PIC X(15).                          00170001
      *                                                                 00180001
       PROCEDURE                                 DIVISION.              00190001
       0001-PRINCIPAL                            SECTION.               00200001
      *----------------------------------------------------             00210001
      *   RETORNA NA SYSOUT APENAS OS CAMPOS ESSENCIAIS                 00220001
      *----------------------------------------------------             00230001
           ACCEPT WRK-DATA.                                             00240001
      *-------------------- DISPLAY ---------------------               00250001
           DISPLAY "CODIGO : " WRK-CODIGO.                              00260001
           DISPLAY "NOME   : " WRK-NOME.                                00270001
           DISPLAY "CARGO  : " WRK-CARGO.                               00280001
             STOP RUN.                                                  00290001
       0001-FIM-PRINCIPAL. EXIT.                                        00300001