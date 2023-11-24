//TRUTTXXX JOB 'SORTREC1',CLASS=A,NOTIFY=&SYSUID,TIME=(0,02)            00001001
//STEP01     EXEC PGM=SORT                                              00001100
//SORTIN   DD   DSN=TRUIP.TRAING00.EARQBASE,DISP=SHR                    00001200
//SORTOUT  DD   SYSOUT=*                                                00001300
//SYSOUT   DD   SYSOUT=*                                                00001400
//SYSIN    DD *                                                         00001500
 SORT   FIELDS=(01,09,CH,A)                                             00001700
  OUTREC FIELDS=(C'TIPO: ',48,01,X,C'AGENCIA: ',01,04,X,C'CONTA: ',     00001800
  05,05,X,C'NOME: ',10,30,X,C'SALDO: ',40,08,89:C'(S/N)')               00001903
