//TRUTTXXX JOB 'SORTDATA',CLASS=A,NOTIFY=&SYSUID,TIME=(0,03)            00001000
//* SE A DATA ESTIVER NO FORMATO DDMMYYYY                               00001100
//* FORMATAR COM O INREC PARA YYYYMMDD                                  00001200
//* ----------------------------------------------------------          00001300
//STEP01     EXEC PGM=SORT                                              00001400
//SORTIN   DD   *                                                       00001500
DARIO              20102023                                             00001600
MARCIO             23112023                                             00001700
PAULA              22102023                                             00001800
//SORTOUT  DD   DSN=&&TEMP,DISP=(NEW,PASS),SPACE=(TRK,(1,1))            00001900
//SYSOUT   DD   SYSOUT=*                                                00002000
//SYSIN    DD *                                                         00002100
   INREC   FIELDS=(01,19,24,04,22,02,20,02)                             00002200
   SORT    FIELDS=COPY                                                  00002300
//* RECEBE NO ARQUIVO TEMP OS DADOS EM FORMATO YYYYMMDD                 00002400
//* APLICA A CONSTANTE DATE 1                                           00002500
//* ----------------------------------------------------------          00002600
//STEP02     EXEC PGM=SORT                                              00002700
//SORTIN   DD   DSN=&&TEMP,DISP=SHR                                     00002800
//SORTOUT  DD   SYSOUT=*                                                00002900
//SYSOUT   DD   SYSOUT=*                                                00003000
//SYSIN    DD *                                                         00003100
                                                                        00003200
                                                                        00003300
   INCLUDE COND=(20,08,CH,EQ,DATE1)                                     00003400
   SORT    FIELDS=COPY                                                  00003500
                                                                        00004000
