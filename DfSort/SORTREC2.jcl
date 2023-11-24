//TRUTTXXX JOB 'SORTREC2',CLASS=A,NOTIFY=&SYSUID,TIME=(0,02)            00001000
//STEP01     EXEC PGM=SORT                                              00001100
//SORTIN   DD   DSN=TRUIP.TRAING00.EARQBASE,DISP=SHR                    00001200
//SORTOUT  DD   SYSOUT=*                                                00001300
//SYSOUT   DD   SYSOUT=*                                                00001400
//SYSIN    DD *                                                         00001500
  INREC FIELDS=(01,39,48,01)                                            00001600
  SORT   FIELDS=(01,09,CH,A)                                            00001700
  OUTREC FIELDS=(C'TIPO: ',40,01,X,C'AGENCIA: ',01,04,X,C'CONTA: ',     00001801
  05,05,X,C'NOME: ',10,30,75:C'__________')                             00001901
