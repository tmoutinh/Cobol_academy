//TRUTTXXX JOB 'SORT    ',CLASS=A,NOTIFY=&SYSUID,TIME=(0,02)            00001000
//STEP01     EXEC PGM=SORT                                              00001100
//SORTIN   DD   DSN=TRUIP.TRAING00.EARQBASE,DISP=SHR                    00001200
//SORTOUT  DD   SYSOUT=*                                                00001300
//SYSOUT   DD   SYSOUT=*                                                00001400
//*------- LAYOUT 48 CARACTERES                                         00001500
//* AGENCIA 01,04 - 04                                                  00001600
//* CONTA   05,09 - 05                                                  00001700
//* NOME    10,39 - 30                                                  00001800
//* SALDO   40,47 - 08                                                  00001900
//* TIPO    48,48 - 01                                                  00002000
//* ----------------------                                              00002100
//SYMNAMES DD *                                                         00002200
AGENCIA,01,04,CH                                                        00002300
CONTA,05,05,CH                                                          00002400
NOME,10,30,CH                                                           00002500
SALDO,40,08,CH                                                          00002600
TIPO,48,01,CH                                                           00002800
TIPO2,40,01,CH                                                          00002900
//SYSIN    DD *                                                         00003000
  INREC FIELDS=(AGENCIA,CONTA,NOME,TIPO)                                00003100
  INCLUDE COND=(TIPO,EQ,C'P')                                           00003200
  SORT  FIELDS=(NOME,A)                                                 00003300
  OUTREC FIELDS=(TIPO2,X,NOME)                                          00003400
