# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    COB010.cbl                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tmoutinh <tmoutinh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: Invalid date        by                   #+#    #+#              #
#    Updated: 2023/11/12 16:34:07 by tmoutinh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

       01 WRK-DATA.                                                     00130001
          02 WRK-DATA-YEAR        PIC X(02) VALUE SPACES.               00140001
          02 WRK-DATA-MONTH       PIC X(02) VALUE SPACES.               00150001
          02 WRK-DATA-DAY         PIC X(02) VALUE SPACES.               00160001
      *                                                                 00170001
       77 FILLER      PIC X(40) VALUE "-- DATA 2 --".                   00180001
       01 WRK-DATA-2.                                                   00190001
          02 WRK-DATA-DAY         PIC X(02) VALUE SPACES.               00200001
          02 FILLER               PIC X(01) VALUE "/".                  00210001
          02 WRK-DATA-MONTH       PIC X(02) VALUE SPACES.               00220001
          02 FILLER               PIC X(03) VALUE "/20".                00230001
          02 WRK-DATA-YEAR        PIC X(02) VALUE SPACES.               00240001
      *                                                                 00250001
       77 FILLER      PIC X(40) VALUE "-- DATA 3 --".                   00260001
       01 WRK-DATA-3.                                                   00270001
          02 WRK-DATA-DAY         PIC X(02) VALUE SPACES.               00280001
          02 FILLER               PIC X(01) VALUE "/".                  00290001
          02 WRK-DATA-MONTH       PIC X(02) VALUE SPACES.               00300001
          02 FILLER               PIC X(01) VALUE "/".                  00310001
          02 WRK-DATA-YEAR        PIC X(02) VALUE SPACES.               00320001
      *                                                                 00330001
       PROCEDURE                                 DIVISION.              00340001
       0001-PRINCIPAL                            SECTION.               00350001
      *----------------------------------------------------             00360001
      *   RETORNA NA SYSOUT A DATA EM FORMATO DD/M/YYYY                 00370001
      *----------------------------------------------------             00380001
           ACCEPT WRK-DATA FROM DATE.                                   00390001
           MOVE CORR WRK-DATA TO WRK-DATA-2.                            00400001
           MOVE CORR WRK-DATA TO WRK-DATA-3.                            00410001
           DISPLAY "DATA :" WRK-DATA.                                   00420001
           DISPLAY "DATA :" WRK-DATA-2.                                 00430001
           DISPLAY "DATA :" WRK-DATA-3.                                 00440001
             STOP RUN.                                                  00450001
       0001-FIM-PRINCIPAL. EXIT.                                        00460001
