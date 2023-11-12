# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    COB02A.cbl                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tmoutinh <tmoutinh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: Invalid date        by                   #+#    #+#              #
#    Updated: 2023/11/12 16:38:17 by tmoutinh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

       77 WRK-LINHA               PIC X(30) VALUE SPACES.               00130003
       01 WRK-DATA.                                                     00140003
          02 WRK-DATA-YEAR        PIC X(04) VALUE SPACES.               00150003
          02 WRK-DATA-MONTH       PIC X(02) VALUE SPACES.               00160003
          02 WRK-DATA-DAY         PIC X(02) VALUE SPACES.               00170003
      *                                                                 00180003
       PROCEDURE                                 DIVISION.              00190003
       0001-PRINCIPAL                            SECTION.               00200003
      *----------------------------------------------------             00210003
      *   RETORNA NA SYSOUT A LITERAL PROGRAMA COB001                   00220003
      *----------------------------------------------------             00230003
           ACCEPT WRK-CURSO FROM SYSIN.                                 00240003
           ACCEPT WRK-LINHA FROM SYSIN.                                 00250003
           ACCEPT WRK-DATA FROM DATE YYYYMMDD.                          00260003
           DISPLAY "CURSO "                                             00270003
                   WRK-CURSO.                                           00280003
           DISPLAY WRK-LINHA.                                           00290003
           DISPLAY "DATA :"                                             00300003
                   WRK-DATA-DAY "/"                                     00310003
                   WRK-DATA-MONTH "/"                                   00320003
                   WRK-DATA-YEAR.                                       00330003
             STOP RUN.                                                  00340003
       0001-FIM-PRINCIPAL. EXIT.                                        00350003