# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    COB005.cbl                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tmoutinh <tmoutinh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: Invalid date        by ===========       #+#    #+#              #
#    Updated: 2023/11/12 16:32:42 by tmoutinh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

       77 WRK-NUM1                PIC 9(04) VALUE ZEROS.                00130005
       77 WRK-NUM2                PIC 9(04) VALUE ZEROS.                00140005
       77 WRK-NUM1-COMP           PIC 9(04) COMP VALUE ZEROS.           00150005
       77 WRK-NUM2-COMP           PIC 9(04) COMP VALUE ZEROS.           00160005
       77 WRK-RES-COMP            PIC 9(08) COMP VALUE ZEROS.           00170005
      *                                                                 00180005
       PROCEDURE                                 DIVISION.              00190005
       0001-PRINCIPAL                            SECTION.               00200005
      *----------------------------------------------------             00210005
      *   RETORNA NA SYSOUT OS NUMEROS PASSADOS NO SYSIN                00220005
      *     E APRESENTA A MULTIPLICACAO DELES                           00230005
      *----------------------------------------------------             00240005
           ACCEPT WRK-NUM1 FROM SYSIN.                                  00250005
           ACCEPT WRK-NUM2 FROM SYSIN.                                  00260005
           MOVE WRK-NUM1 TO WRK-NUM1-COMP.                              00270005
           MOVE WRK-NUM2 TO WRK-NUM2-COMP.                              00280005
             COMPUTE                                                    00290005
                WRK-RES-COMP = WRK-NUM1-COMP * WRK-NUM2-COMP.           00300005
      *--------------------- DISPLAY ---------------------              00310005
           DISPLAY "NUMERO 1 : " LENGTH OF WRK-NUM1-COMP.               00320005
           DISPLAY "NUMERO 2 : " LENGTH OF WRK-NUM2-COMP.               00330005
           DISPLAY "RESULTADO: " LENGTH OF WRK-RES-COMP.                00340005
           DISPLAY "*------------------------------*"                   00350005
           DISPLAY "NUMERO 1 : " WRK-NUM1-COMP.                         00360005
           DISPLAY "NUMERO 2 : " WRK-NUM2-COMP.                         00370005
           DISPLAY "RESULTADO: " WRK-RES-COMP.                          00380005
             STOP RUN.                                                  00390005
       0001-FIM-PRINCIPAL. EXIT.                                        00400005