//TRUTTXXX JOB 'TRUTT,GDBMAKE',CLASS=A,NOTIFY=TRUTT,TIME=(0,05)     
//STEP01   EXEC PGM=IDCAMS                                          
//SYSPRINT DD SYSOUT=*                                              
//SYSIN    DD *                                                     
 DEFINE GDG(NAME(TRUTT.TRAING00.MOVGERAL) LIMIT(3)  NOEMPTY SCRATCH)