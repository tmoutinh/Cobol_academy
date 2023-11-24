//TRUTTXXX JOB 'SORT10',CLASS=A,NOTIFY=&SYSUID,TIME=(0,02)              00001000
//STEP01     EXEC PGM=SORT                                              00001100
//SORTIN   DD  DSN=TRUIP.TRAING00.ARQVAR,DISP=SHR                       00001200
//SORTOUT  DD  SYSOUT=*                                                 00002300
//SYSOUT   DD  SYSOUT=*                                                 00002400
//*PULAR 04 BYTES NO INICIO DO ARQUIVO (TAM), PRIMEIRAS POSICOES        00002500
//*SAO PARA REGISTAR O TAMANHO DE CADA LINHA;                           00002600
//SYSIN    DD *                                                         00002700
 SORT FIELDS=(05,04,CH,A)                                               00002800
