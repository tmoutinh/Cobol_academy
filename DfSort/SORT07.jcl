//TRUTTXXX JOB 'SORT06',CLASS=A,NOTIFY=&SYSUID,TIME=(0,02)
//********** CLASSIFICA POR 2 REGRAS AGENCIA - CONTA 01 - 10
//*                 E TRANSACAO 39
//STEP01   EXEC PGM=SORT
//SORTIN   DD   DSN=TRUTT.TRAING00.SORTLANC,DISP=SHR
//SORTOUT  DD   SYSOUT=*
//SYSOUT   DD   SYSOUT=*
//SYSIN    DD   *
 SORT FIELDS=(39,01,CH,A,01,10,CH,A)
