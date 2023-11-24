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
   SORT     FIELDS=(01,09,CH,A)                                         00002500
                                                                        00002800
   OUTFIL FNAMES=PREMIUM,INCLUDE=(48,01,CH,EQ,C'P'),                    00003000
          BUILD=(C'AG/CONTA ',01,04,X,05,05,X,10,30,X,C' PREMIUM')      00003100
   OUTFIL FNAMES=STANDAR,INCLUDE=(48,01,CH,EQ,C'S'),                    00003200
          BUILD=(C'AG/CONTA ',01,04,X,05,05,X,10,30,X,C' STANDARD')     00003300
   OUTFIL FNAMES=SORTOUT,SAVE,                                          00003400
          BUILD=(01,48,C' INCONSISTENTE')                               00003500
                                                                        00003600
