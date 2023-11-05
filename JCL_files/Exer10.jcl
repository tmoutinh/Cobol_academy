//TRUTTXXX JOB 'TRUTT,CONCATE',CLASS=A,NOTIFY=TRUTT,TIME=(0,05)
//STEP1    EXEC PGM=SORT                                       
//SORTIN   DD DSN=TRUTT.TRAING00.DADOS,DISP=SHR                
//         DD DSN=TRUIP.TRAING00.DADOS,DISP=SHR                
//*        DD DSN=TRUER.TRAING00.DADOS,DISP=SHR  NO ACCESS     
//SORTOUT  DD SYSOUT=*                                         
//SYSOUT   DD SYSOUT=*                                         
//SYSIN    DD *                                                
 SORT FIELDS=COPY  COPY                                        
//* SORT FIELDS=(1,3,CH,A) COPY AND SORT                       