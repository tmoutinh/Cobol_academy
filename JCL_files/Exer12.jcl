//TRUTTXXX JOB 'IF&ELSEEX',CLASS=A,NOTIFY=&SYSUID,TIME=(0,05)
//JOBLIB  DD   DSN=TRUIP.TRAING00.LINKLIB,DISP=SHR           
//*-------------                                             
//STEP01  EXEC PGM=PROGCOND                                  
//SYSIN   DD  *                                              
VANTIS                                                       
//*-------------                                             
//IF01    IF STEP01.RC EQ 200 THEN                           
//STEP02  EXEC PGM=PROGSIS                                   
//        ELSE                                               
//STEP03  EXEC PGM=IEFBR14                                   
//IF01    ENDIF                                              