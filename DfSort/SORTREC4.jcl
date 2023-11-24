//TRUIPXXX JOB 'SORT    ',CLASS=A,NOTIFY=&SYSUID,TIME=(0,02)            00001000
//STEP01     EXEC PGM=SORT                                              00001100
//SORTIN   DD   *                                                       00001200
MISAEL  PORTO                                                           00001300
DARIO   SALVO                                                           00001400
EDUARDO PORTO                                                           00001500
TIAGO   LISBOA                                                          00001600
//SORTOUT  DD   SYSOUT=*                                                00001700
//SYSOUT   DD   SYSOUT=*                                                00001800
//SYSIN    DD *                                                         00001900
* INREC  FIELDS=(01,39,48,01,40,08)                                     00002000
                                                                        00002100
   SORT   FIELDS=COPY                                                   00002200
                                                                        00002300
   OUTREC FIELDS=(01,15,SEQNUM,03,ZD,START=10,INCR=02)                  00002400
