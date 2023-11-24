//TRUTTXXX JOB 'SORTREC3',CLASS=A,NOTIFY=&SYSUID,TIME=(0,02)            00001000
//STEP01     EXEC PGM=SORT                                              00001100
//SORTIN   DD   DSN=TRUIP.TRAING00.EARQBASE,DISP=SHR                    00001200
//SORTOUT  DD   SYSOUT=*                                                00001300
//SYSOUT   DD   SYSOUT=*                                                00001400
//SYSIN    DD *                                                         00001500
  INREC FIELDS=(01,39,48,01)                                            00001600
  SORT   FIELDS=(01,09,CH,A)                                            00001700
* OUTREC IFTHEN=(WHEN=(40,01,CH,EQ,C'P'),OVERLAY=(40:C'PREMIUM')),      00001803
*        IFTHEN=(WHEN=(40,01,CH,EQ,C'S'),OVERLAY=(40:C'STANDARD')),     00001903
*        IFTHEN=(WHEN=NONE,OVERLAY=(40:C'________'))                    00002003
* DOES THE SAME EFFECT AS THE OVERLAY                                   00002103
  OUTREC FIELDS=(01,39,40,01,CHANGE=(04,C'P',C'PREM',C'S',C'STAN'),     00003003
         NOMATCH=(C'____'),X,01,09)                                     00004003
