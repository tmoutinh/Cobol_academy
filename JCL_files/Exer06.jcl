//TRUTTXXX JOB 'TRUTT,CREATE',CLASS=A,NOTIFY=TRUTT,TIME=(0,05)
//STEP01   EXEC PGM=IEFBR14                                   
//CLIENTES DD   DSN=TRUTT.TRAING00.CLIENTES,                  
//         DISP=(NEW,CATLG,DELETE),                           
//         SPACE=(TRK,(1,1),RLSE),                            
//         DCB=(RECFM=FB,LRECL=80,DSORG=PS,BLKSIZE=27920)     