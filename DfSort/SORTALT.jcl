//TRUTTXXX JOB 'SORTREC3',CLASS=A,NOTIFY=&SYSUID,TIME=(0,02)            00001000
//STEP01   EXEC PGM=SORT                                                00001100
//SORTIN   DD   DSN=TRUIP.TRAING00.EARQBASE,DISP=SHR                    00001200
//SORTOUT  DD   SYSOUT=*                                                00001300
//SYSOUT   DD   SYSOUT=*                                                00001400
//SYSIN    DD *                                                         00001500
  SORT   FIELDS=COPY                                                    00001700
  ALTSEQ CODE=(406D,7A6D)                                               00001800
  OUTREC FIELDS=(01,39,TRAN=ALTSEQ)                                     00002200
