//TRUTTXXX JOB 'SORT CLI',CLASS=A,NOTIFY=&SYSUID,TIME=(0,05)            00010000
//STEP01   EXEC PGM=SORT                                                00010100
//SORTIN   DD DSN=TRUTT.TRAING00.CLIENTES,DISP=SHR                      00010200
//SORTOUT  DD DSN=TRUTT.TRAING00.CLIENTES,DISP=OLD                      00010300
//SYSOUT   DD SYSOUT=*                                                  00010400
//SYSIN    DD *                                                         00010500
 SORT FIELDS=(01,09,CH,A)                                               00010600
 SUM FIELDS=NONE                                                        00010700
