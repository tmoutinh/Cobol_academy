//TRUTTXXX JOB 'TRUTT,CONC&SAVEPS',CLASS=A,NOTIFY=TRUTT, 
//            TIME=(0,05)                                
//STEP1    EXEC PGM=SORT                                 
//SORTIN   DD DSN=TRUTT.TRAING00.DADOS,DISP=SHR          
//         DD DSN=TRUIP.TRAING00.DADOS,DISP=SHR          
//*--------------                                        
//SORTOUT  DD DSN=TRUTT.TRAING00.RESULT,                 
//         DISP=(NEW,CATLG,DELETE),                      
//         SPACE=(TRK,(1,1),RLSE),                       
//         DCB=(RECFM=FB,LRECL=37,DSORG=PS,BLKSIZE=27972)
//SYSOUT   DD SYSOUT=*                                   
//SYSIN    DD *                                          
 SORT FIELDS=COPY                                        