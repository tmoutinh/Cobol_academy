//TRUTTXXX JOB 'SORTREC5',CLASS=A,NOTIFY=&SYSUID,TIME=(0,02)            00001000
//STEP01   EXEC PGM=SORT                                                00001100
//SORTIN   DD   DSN=TRUIP.TRAING00.EARQBASE,DISP=SHR                    00001200
//SORTOUT  DD   SYSOUT=*                                                00001300
//SYSOUT   DD   SYSOUT=*                                                00001400
//SYSIN    DD *                                                         00001500
  INREC  FIELDS=(01,47)                                                 00001600
                                                                        00001700
   SORT   FIELDS=COPY                                                   00001800
                                                                        00001900
 OUTREC FIELDS=(01,39,40,08,ZD,MUL,+2,EDIT=(IIIITTTTT))                 00002000
*                                            /T = 9 COBOL PIC           00003000
*                                            /I = Z COBOL PIC           00004000
