//TRUTTXXX JOB 'SORT REL',CLASS=A,NOTIFY=&SYSUID,TIME=(0,10)            00001000
//STEP01     EXEC PGM=SORT                                              00001100
//SORTIN   DD   DSN=TRUIP.TRAING00.EARQBASE,DISP=SHR                    00001200
//SORTOUT  DD   SYSOUT=*                                                00001300
//SYSOUT   DD   SYSOUT=*                                                00001400
//SYSIN    DD *                                                         00001500
 INREC FIELDS=(01,48,20X)                                               00001600
                                                                        00001700
 SORT FIELDS=(01,09,CH,A)                                               00001800
                                                                        00001900
 OUTFIL FNAMES=SORTOUT,LINES=18,                                        00002000
                                                                        00003000
 HEADER1=(19:' - EMPRESA NATIXIS - ',41:'DATA ',DATE=(DM4/),2/,         00004001
          15:'------------------------------',2/,                       00005001
          15:'---- RELATORIO DE EMPRESA ----',2/,                       00005101
          15:'------------------------------',2/),                      00005201
 HEADER2=(2/,1:'--- RELATORIO DE LANCAMENTOS ---',43:'PAGINA ',PAGE,    00005301
          2/,01:'AGE',06:'CONTA',12:'NOME',43:'SALDO',52:'TIPO'),       00005401
                                                                        00005501
 OUTREC=(01,04,X,04,05,X,10,30,X,40,08,X,48,01,X,49,19),                00006001
                                                                        00007000
 TRAILER1=(4/,32:'SOMA TOTAL ',TOT=(40,08,ZD,EDIT=(TTTTTTTT))),         00008001
                                                                        00008100
 TRAILER2=(/,32:'SOMA ',6X,TOT=(40,08,ZD,EDIT=(TTTTTTTT)))              00008201
                                                                        00009000
                                                                        00010000
