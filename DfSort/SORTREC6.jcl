//TRUTTXXX JOB 'SORT    ',CLASS=A,NOTIFY=&SYSUID,TIME=(0,05)            00001000
//STEP01     EXEC PGM=SORT                                              00001100
//SORTIN   DD   DSN=TRUIP.TRAING00.EARQBASE,DISP=SHR                    00001200
//SORTOUT  DD   SYSOUT=*                                                00001300
//PREMIUM  DD   SYSOUT=*                                                00001400
//STANDAR  DD   SYSOUT=*                                                00001500
//SYSOUT   DD   SYSOUT=*                                                00001600
//*------- LAYOUT 48 CARACTERES           EQ - EQUAL                    00001700
//* AGENCIA 01,04 - 04                    NE - NOT EQUAL                00001800
//* CONTA   05,09 - 05                    GT - GREATER THAN             00001900
//* NOME    10,39 - 30                    GE - GREATER THAN OR EQUAL    00002000
//* SALDO   40,47 - 08                    LT - LESS THAN                00002100
//* TIPO    48,48 - 01                    LE - LESS THAN OR EQUAL       00002200
//* ----------------------                                              00002300
//SYSIN    DD *                                                         00002400
   SORT     FIELDS=(01,09,CH,A)                                         00002600
*  INCLUDE  COND=(48,01,CH,EQ,C'P')                                     00002700
*  OMIT     COND=(48,01,CH,EQ,C'P')                                     00002800
                                                                        00002900
*  OUTFIL FNAMES=(PREMIUM,STANDAR)                                      00003000
   OUTFIL FNAMES=PREMIUM,INCLUDE=(48,01,CH,EQ,C'P')                     00003100
   OUTFIL FNAMES=STANDAR,INCLUDE=(48,01,CH,EQ,C'S')                     00003200
   OUTFIL FNAMES=SORTOUT,SAVE                                           00003300
                                                                        00004000
