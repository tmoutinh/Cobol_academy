//TRUTTXXX JOB 'TRUTT,IEFBR14',CLASS=A,NOTIFY=&SYSUID,TIME=(0,05) 
//STEP01   EXEC PGM=IEFBR14                                       
//SYSOUT   DD SYSOUT=*                                            
//SYSUDUMP DD DUMMY                                               
//PROCLIB  DD   DSN=TRUTT.TRAING00.PROCLIB,                       
//         DISP=(NEW,CATLG,DELETE),                               
//         SPACE=(TRK,(2,5,10),RLSE),                             
//         DCB=(RECFM=FB,LRECL=80,DSORG=PO,BLKSIZE=27920)         