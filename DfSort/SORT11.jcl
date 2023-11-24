//TRUTTXXX JOB 'SORT    ',CLASS=A,NOTIFY=&SYSUID,TIME=(0,02)            00001000
//STEP01     EXEC PGM=SORT                                              00001100
//SORTIN   DD   DSN=TRUIP.TRAING00.EARQBASE,DISP=SHR                    00001200
//SORTOUT  DD   SYSOUT=*                                                00001300
//SYSOUT   DD   SYSOUT=*                                                00001400
//SYSIN    DD *                                                         00001500
  INREC  FIELDS=(01,39,48,01)                                           00001600
 SORT   FIELDS=(01,09,CH,A)                                             00001700
  OUTREC FIELDS=(40,01.C' ---------',01,39)                             00001800
