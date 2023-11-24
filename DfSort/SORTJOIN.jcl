//TRUTTXXX JOB 'SORTJOIN',CLASS=A,NOTIFY=&SYSUID,TIME=(0,10)            00001000
//STEP01     EXEC PGM=SORT                                              00001100
//SORTJNF1 DD   *                                                       00001200
12345 MADALENA                                                          00001300
23456 NELSON                                                            00001400
34567 MARTHA                                                            00001500
45689 EDUARDO                                                           00001600
//SORTJNF2 DD   *                                                       00001700
23456 CHEQUE                                                            00001800
56787 CONTACORRENTE                                                     00001900
34567 CUSTODIA                                                          00002000
//SORTOUT  DD   SYSOUT=*                                                00002100
//IGUAL    DD   SYSOUT=*                                                00002200
//FILE1    DD   SYSOUT=*                                                00002300
//FILE2    DD   SYSOUT=*                                                00002400
//SYSOUT   DD   SYSOUT=*                                                00002500
//SYSIN    DD *                                                         00002600
                                                                        00002700
                                                                        00002800
   JOINKEYS FILE=F1,FIELDS=(01,05,A)                                    00002900
   JOINKEYS FILE=F2,FIELDS=(01,05,A)                                    00003000
*   JOIN UNPAIRED,F1,ONLY                                               00003100
*   JOIN UNPAIRED,F2,ONLY                                               00003200
*   JOIN UNPAIRED,F1,F2                                                 00003301
    REFORMAT FIELDS=(F1:01,15,F2:07,13)                                 00003401
                                                                        00003500
*   OUTFIL FNAMES=IGUAL,INCLUDE=(01,01,CH,EQ,C'B'),BUILD=(02,25)        00003601
*   OUTFIL FNAMES=FILE1,INCLUDE=(01,01,CH,EQ,C'1'),BUILD=(01,15)        00003700
*   OUTFIL FNAMES=FILE2,INCLUDE=(01,01,CH,EQ,C'2'),BUILD=(17,13)        00003800
                                                                        00003900
                                                                        00004000
   OPTION COPY                                                          00005000
