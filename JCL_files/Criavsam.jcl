//TRUTTXXX JOB 'CRIAVSA',CLASS=A,NOTIFY=&SYSUID,TIME=(0,05)             00001000
//STEP1 EXEC PGM=IDCAMS                                                 00010000
//SYSPRINT DD SYSOUT=*                                                  00020000
//SYSIN DD *                                                            00030000
 DELETE (TRUTT.TRAING00.ARQCLI.KSDS)  PURGE CLUSTER                     00031000
  IF MAXCC=8 THEN SET MAXCC=0                                           00032000
                                                                        00033000
 DEFINE CLUSTER -                                                       00040000
         (NAME(TRUTT.TRAING00.ARQCLI.KSDS) -                            00050000
                   IXD -                                                00060000
                   VOL(WORK01)-                                         00070000
                   RECORDSIZE(47 47)-                                   00080000
                   FREESPACE(4 4)-                                      00090000
                   SHR(2)-                                              00100000
                   TRK(1 1) -                                           00110000
                   UNIQUE -                                             00120000
                   KEYS(9 0))-                                          00130000
           DATA(NAME(TRUTT.TRAING00.ARQCLI.KSDS.DATA)) -                00140000
           INDEX(NAME(TRUTT.TRAING00.ARQCLI.KSDS.INDEX))                00150000
