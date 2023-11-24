//TRUTTXXX JOB 'SORT    ',CLASS=A,NOTIFY=&SYSUID,TIME=(0,02)            00001000
//STEP01   EXEC PGM=ICETOOL                                             00001100
//TOOLMSG  DD SYSOUT=*                                                  00001200
//DFSMSG   DD SYSOUT=*                                                  00001300
//OUTPUT   DD SYSOUT=*                                                  00001400
//TEMP     DD DSN=&TEMP,DISP=(,PASS),SPACE=(CYL,1)                      00001500
//INPUT    DD DSN=TRUIP.TRAING00.EARQBASE,DISP=SHR                      00001600
//TOOLIN   DD *                                                         00001700
 SORT  FROM(INPUT) TO(TEMP) USING(CART)                                 00001800
                                                                        00001900
 DISPLAY FROM(TEMP) LIST(OUTPUT) BLANK-                                 00002000
 TITLE('- RELATORIO DE CLIENTES -') DATE(DM4/) TIME PAGE -              00002100
                                                                        00002200
 HEADER('AG/CONTA')   ON(1,09,CH)-                                      00002300
 HEADER('NOME ') ON(10,30,CH)-                                          00002400
 HEADER('SALDO') ON(40,08,ZD,E'99999999')-                              00002500
 HEADER('TIPO ') ON(48,01,CH)-                                          00002600
                                                                        00002700
                                                                        00002800
 BTITLE('CHAVE') BTOTAL('TOTAL') BAVERAGE('MEDIA') BREAK(48,01,CH) -    00002900
 STATLEFT-                                                              00003000
                                                                        00003100
 TOTAL('TOTAL') -                                                       00003200
 AVERAGE('AVERAGE') -                                                   00003300
 COUNT('QUANT..: ') -                                                   00003400
                                                                        00003500
 LINES(10)                                                              00003600
                                                                        00003700
                                                                        00003800
//CARTCNTL  DD  *                                                       00003900
  SORT FIELDS=(48,01,CH,A)                                              00004000
                                                                        00004100
                                                                        00004200
                                                                        00004300
                                                                        00004400
                                                                        00004500
                                                                        00004600
                                                                        00004700
                                                                        00004800
