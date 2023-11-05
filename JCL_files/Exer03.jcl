//TRUTTXXX JOB 'TRUTT,IKJEFT01',CLASS=A,NOTIFY=TRUTT,TIME=(0,05)
//STEP1    EXEC PGM=IKJEFT01                                    
//SYSTERM  DD DUMMY                                             
//SYSTSPRT DD SYSOUT=*                                          
//SYSTSIN  DD *                                                 
LISTDS 'TRUTT.TRAING00.JCLLIB' MEMBER                           