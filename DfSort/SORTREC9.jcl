//TRUTTXXX JOB 'SORTMERGE',CLASS=A,NOTIFY=&SYSUID,TIME=(0,02)           00001000
//STEP01     EXEC PGM=SORT                                              00001100
//SORTIN1  DD   *                                                       00001200
0003 PORTO2                                                             00001300
0004 SALVO2                                                             00001400
0005 LISBOA2                                                            00001500
0006 SETUBAL2                                                           00001800
0008 LEIXOES2                                                           00001900
//SORTIN2  DD   *                                                       00002000
0003 PORTO                                                              00002100
0004 SALVO                                                              00002200
0005 LISBOA                                                             00002300
0006 SETUBAL                                                            00002600
0008 LEIXOES                                                            00002700
//SORTOUT  DD   SYSOUT=*                                                00002900
//SYSOUT   DD   SYSOUT=*                                                00003000
//SYSIN    DD *                                                         00003200
  MERGE  FIELDS=(01,04,CH,A)   O MERGE PRECISA QUE OS FICHEIROS         00004000
                               ESTEJAM ORDENADOS/CLASSIFICADOS          00005000
