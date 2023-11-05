//TRUTTXXX JOB 'TRUTT,GDG',CLASS=A,NOTIFY=TRUTT,          
//            TIME=(0,05)                                 
//STEP1    EXEC PGM=ICEGENER                              
//*-------INPUT-------                                    
//SYSPRINT DD SYSOUT=*                                    
//SYSUT1   DD DSN=TRUTT.TRAING00.MOVGERAL(0),DISP=SHR     
//         DD DSN=TRUIP.TRAING00.MOV002,DISP=SHR          
//*-------OUTPUT------                                    
//SYSUT2   DD DSN=TRUTT.TRAING00.MOVGERAL(+1),            
//         DISP=(NEW,CATLG,DELETE),                       
//         SPACE=(TRK,(1,1),RLSE),                        
//         DCB=(RECFM=FB,LRECL=43,DSORG=PS,BLKSIZE=27950) 