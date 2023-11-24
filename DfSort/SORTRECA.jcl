//TRUTTXXX JOB 'SORTREC1',CLASS=A,NOTIFY=&SYSUID,TIME=(0,02)            00001000
//STEP01     EXEC PGM=SORT                                              00001100
//SORTIN   DD   DSN=TRUTT.TRAING00.CLIENTES,DISP=SHR                    00001200
//SORTOUT  DD   SYSOUT=*                                                00001300
//SYSOUT   DD   SYSOUT=*                                                00001400
//SYSIN    DD *                                                         00001500
  SORT   FIELDS=(01,09,CH,A)                                            00001600
   OUTREC OVERLAY=(52:01,40)                                            00001700
