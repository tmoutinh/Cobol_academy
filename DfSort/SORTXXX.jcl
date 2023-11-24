//TRUTTXXX JOB 'SORT    ',CLASS=A,NOTIFY=&SYSUID,TIME=(0,02)            00001000
//STEP01     EXEC PGM=SORT                                              00002000
//SORTIN   DD   DSN=TRUJL.TRAING00.ARQBASE,DISP=SHR                     00004000
//*        DD   DSN=TRUDL.TRAING00.ARQBASE,DISP=SHR                     00005000
//         DD   DSN=TRUER.TRAING00.ARQBASE,DISP=SHR                     00006000
//         DD   DSN=TRUGS.TRAING00.ARQBASE,DISP=SHR                     00007000
//         DD   DSN=TRUJF.TRAING00.ARQBASE,DISP=SHR                     00008000
//         DD   DSN=TRUJS.TRAING00.ARQBASE,DISP=SHR                     00009000
//         DD   DSN=TRUMO.TRAING00.ARQBASE,DISP=SHR                     00010000
//*        DD   DSN=TRUMC.TRAING00.ARQBASE,DISP=SHR                     00020000
//         DD   DSN=TRUMS.TRAING00.ARQBASE,DISP=SHR                     00030000
//         DD   DSN=TRUMI.TRAING00.ARQBASE,DISP=SHR                     00031000
//         DD   DSN=TRUTT.TRAING00.ARQBASE,DISP=SHR                     00032000
//         DD   DSN=TRUNC.TRAING00.ARQBASE,DISP=SHR                     00033000
                                                                        00033100
//SORTOUT  DD   DSN=TRUTT.TRAING00.ARQBASE,DISP=SHR                     00034000
//SYSOUT   DD   SYSOUT=*                                                00035000
//SYSIN    DD *                                                         00036000
 SORT FIELDS=(01,09,CH,A)                                               00037000
  SUM FIELDS=NONE                                                       00038000
