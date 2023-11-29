TR00MTT  DFHMSD TYPE=MAP,MODE=INOUT,LANG=COBOL,CTRL=FREEKB,TIOAPFX=YES,*00010000
               MAPATTS=(COLOR,HILIGHT),DSATTS=(COLOR,HILIGHT)           00020000
CURSOMA  DFHMDI SIZE=(24,80)                                            00030000
*********************************************************************** 00040000
         DFHMDF POS=(1,20),LENGTH=9,ATTRB=ASKIP,                       *00050002
               INITIAL='MENU CICS'                                      00060001
*********************************************************************** 00070000
         DFHMDF POS=(4,20),LENGTH=7,ATTRB=ASKIP,                       *00080000
               INITIAL='CODIGO:',COLOR=PINK                             00090000
CODIGO   DFHMDF POS=(4,28),LENGTH=3,ATTRB=(UNPROT,BRT,FSET,IC,NUM),    *00100000
               PICIN='9(3)',COLOR=TURQUOISE                             00110002
         DFHMDF POS=(4,32),LENGTH=0,ATTRB=ASKIP                         00120000
*********************************************************************** 00130000
         DFHMDF POS=(9,20),LENGTH=7,ATTRB=ASKIP,                       *00140000
               INITIAL='NOME..:',COLOR=PINK                             00150000
NOME     DFHMDF POS=(9,28),LENGTH=20,ATTRB=ASKIP                        00160000
*********************************************************************** 00170000
         DFHMDF POS=(11,20),LENGTH=7,ATTRB=ASKIP,                      X00180000
               INITIAL='EMAIL.:'                                        00190000
EMAIL    DFHMDF POS=(11,28),LENGTH=20,ATTRB=ASKIP                       00200000
*********************************************************************** 00210000
MSG      DFHMDF POS=(20,15),LENGTH=40,ATTRB=ASKIP                       00220000
*********************************************************************** 00230000
        DFHMSD TYPE=FINAL                                               00240000
        END                                                             00250000
