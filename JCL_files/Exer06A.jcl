//TRUTTXXX JOB 'TRUTT,IEFBR14',CLASS=A,NOTIFY=TRUTT,TIME=(0,05)
//STEP01   EXEC PGM=IEFBR14                                    
//DADOS    DD DSN=TRUTT.TRAING00.DADOS,                        
//         DISP=(NEW,CATLG,DELETE),                            
//         SPACE=(TRK,(1,1),RLSE),                             
//         DCB=(RECFM=FB,LRECL=37,DSORG=PS,BLKSIZE=27972)      