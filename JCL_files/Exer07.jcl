//TRUTTXXX JOB 'EXER06B,DELETE',CLASS=A,NOTIFY=&SYSUID,
//           TIME=(0,05)                               
//STEP01   EXEC PGM=IEFBR14                            
//DADOS    DD DSN=TRUTT.TRAING00.DADOS,                
//         DISP=(MOD,DELETE,DELETE),                   
//         SPACE=(TRK,(1,1),RLSE)                      