//TRUTTXXX JOB 'CATVSAM',CLASS=A,NOTIFY=&SYSUID,TIME=(0,05)             00001000
//STEP1 EXEC PGM=IDCAMS                                                 00002000
//SYSPRINT DD SYSOUT=*                                                  00003000
//SYSIN DD *                                                            00004000
 LISTCAT ENT (TRUTT.TRAING00.ARQCLI.KSDS) ALL                           00005000
