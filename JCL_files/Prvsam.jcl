//TRUTTXXX JOB 'PRVSAM',CLASS=A,NOTIFY=&SYSUID,TIME=(0,05)              00001000
//STEP1 EXEC PGM=IDCAMS                                                 00002000
//SYSPRINT DD SYSOUT=*                                                  00003000
//*------------------------------*                                      00003100
//ARQCLI   DD DSN=TRUTT.TRAING00.ARQCLI.KSDS,DISP=SHR                   00003200
//SAIDA    DD SYSOUT=*                                                  00003300
//*------------------------------*                                      00003400
//SYSIN    DD *                                                         00003500
 PRINT IFILE(ARQCLI) OFILE(SAIDA) CHAR                                  00003600
