//TRUTTXXX JOB 'SORT    ',CLASS=A,NOTIFY=&SYSUID,TIME=(0,02)            00001000
//STEP01   EXEC PGM=SORT                                                00001101
//SORTIN   DD   *                                                       00001200
0001;00032;NELSON;01000                                                 00001300
012;00045;MADALENA;01100                                                00001400
12233;00052;ANA;02000                                                   00001500
//SORTOUT  DD   DSN=&&TEMP,DISP=(NEW,PASS),SPACE=(TRK,(1,1))            00001700
//SYSOUT   DD   SYSOUT=*                                                00001800
//SYSIN    DD   *                                                       00001900
   INREC PARSE=(%00=(ENDBEFR=C';',FIXLEN=04),                           00002000
                %01=(ENDBEFR=C';',FIXLEN=05),                           00002100
                %02=(ENDBEFR=C';',FIXLEN=30),                           00002201
                %03=(ENDBEFR=C';',FIXLEN=08)),                          00002300
             BUILD=(%00,%01,%02,%03)                                    00002400
                                                                        00002500
   SORT   FIELDS=COPY                                                   00002600
//***************************                                           00002700
//STEP02   EXEC PGM=SORT                                                00002802
//SORTIN   DD   DSN=&&TEMP,DISP=SHR                                     00003002
//SORTOUT  DD   DSN=&&TMP,DISP=(NEW,PASS),SPACE=(TRK,(1,1))             00003102
//SYSOUT   DD   SYSOUT=*                                                00003202
//SYSIN    DD *                                                         00003302
  MERGE  FIELDS=COPY                                                    00003402
  OUTREC FIELDS=(01,04,ZD,EDIT=(TTTT),05,05,ZD,EDIT=(TTTTT),10,30,      00003502
                40,08,ZD,EDIT=(TTTTTTTT))                               00003602
//***************************                                           00003702
//STEP03   EXEC PGM=SORT                                                00003802
//SORTIN1  DD   DSN=TRUTT.TRAING00.CLIENTES,DISP=SHR                    00003901
//SORTIN2  DD   DSN=&&TMP,DISP=SHR                                      00004002
//SORTOUT  DD   SYSOUT=*                                                00005000
//SYSOUT   DD   SYSOUT=*                                                00006000
//SYSIN    DD *                                                         00007000
  MERGE  FIELDS=(01,04,CH,A)                                            00040002
