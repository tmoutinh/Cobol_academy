//TRUTTXXX JOB 'EXER08,CREATE&DELETE',CLASS=A,NOTIFY=&SYSUID, 
//           TIME=(0,05)                                      
//*_________-DELETE IF EXIST-__________                       
//STEP01   EXEC PGM=IEFBR14                                   
//DELZZZ   DD DSN=TRUTT.TRAING00.ZZZ,                         
//         DISP=(MOD,DELETE,DELETE),                          
//         SPACE=(TRK,(1,1),RLSE)                             
//SYSUDUMP DD DUMMY                                           
//*_________-CREATE FILE-______________                       
//STEP02   EXEC PGM=IEFBR14                                   
//ADDZZZ   DD DSN=TRUTT.TRAING00.ZZZ,                         
//         DISP=(NEW,CATLG,DELETE),                           
//         SPACE=(TRK,(1,1),RLSE),                            
//         DCB=(RECFM=FB,LRECL=80,DSORG=PS,BLKSIZE=27920)     
//SYSUDUMP DD DUMMY                                           