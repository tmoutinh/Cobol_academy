//TRUTTXXX JOB 'SORT    ',CLASS=A,NOTIFY=&SYSUID,TIME=(0,05)            00001000
//STEP01     EXEC PGM=SORT                                              00001100
//SORTIN   DD   DSN=TRUIP.TRAING00.EARQBASE,DISP=SHR                    00001200
//SORTOUT  DD   SYSOUT=*                                                00001300
//LOGERRO  DD   SYSOUT=*                                                00001400
//SYSOUT   DD   SYSOUT=*                      SS - SEARCH STRING        00001500
//*------- LAYOUT 48 CARACTERES                                         00001600
//* AGENCIA 01,04 - 04                        EQ - EQUAL TO             00001700
//* CONTA   05,09 - 05                        NE - NOT EQUAL TO         00001800
//* NOME    10,39 - 30                        GT - GREATER THAN         00001900
//* SALDO   40,47 - 08                        GE - GREATER THAN OR EQUAL00002000
//* TIPO    48,48 - 01                        LT - LESS THAN            00002100
//* ----------------------                    LE - LESS THAN OR EQUAL   00002200
//SYSIN    DD *                                                         00002300
  SORT     FIELDS=COPY                                                  00002400
                                                                        00002500
  OUTFIL  FNAMES=LOGERRO,INCLUDE=(48,01,SS,EQ,C'S')                     00002601
  OUTFIL  FNAMES=SORTOUT,SAVE                                           00002700
