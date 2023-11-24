//TRUTTXXX JOB 'SORTREC5',CLASS=A,NOTIFY=&SYSUID,TIME=(0,02)            00001000
//STEP01   EXEC PGM=SORT                                                00001100
//SORTIN   DD   DSN=TRUIP.TRAING00.EARQBASE,DISP=SHR                    00001200
//SORTOUT  DD   SYSOUT=*                                                00001700
//SYSOUT   DD   SYSOUT=*                                                00001800
//SYSIN    DD *                                                         00001900
  INREC  FIELDS=(01,47)                                                 00002000
                                                                        00002100
   SORT   FIELDS=COPY                                                   00002200
                                                                        00002300
 OUTREC FIELDS=(01,39,40,08,ZD,MUL,+2,EDIT=(IIIITTTTT))                 00002400
*                                            /T = 9 COBOL PIC           00003501
*                                            /I = Z COBOL PIC           00004001
