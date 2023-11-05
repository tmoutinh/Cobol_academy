//TRUTTXXX JOB 'COND&EX',CLASS=A,NOTIFY=&SYSUID,TIME=(0,05)
//JOBLIB   DD   DSN=TRUIP.TRAING00.LINKLIB,DISP=SHR        
//*-------------                                           
//STEP01   EXEC PGM=PROGCOND                               
//SYSIN    DD  *                                           
VANTIS                                                     
//*-------------                                           
//STEP02   EXEC PGM=PROGSIS,COND=(200,NE,STEP01)           