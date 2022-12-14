C====================================================
C TREK7   MODULE E
C  CONVERTED TO PC BY: DAN GAHLINGER
C ENTIRE MODULE TYPE-EXACT CHECK 04/27/2000 BY: D.G.
C
C  C-O SHIP OPERATIONS
C
C ATACK   MORDOR  PIKE    DOOMVE  EDIBLE  MNERVA
C ASIMOV  NIVEN   WODEN   ALPHA   SIMAK   LEGUIN
C
C====================================================

C              -- DONALD ECCLESTONE SUBPROGRAM FOR     T R E K 7
C
C  CONVERTED TO PC BY: DAN GAHLINGER
C TYPE-EXACT CHECK 04/27/2000 BY: D.G.
C
C                 AAA     TTTTT   AAA   CCC K   K
C                A   A      T    A   A C    K  K
C                AAAAA      T    AAAAA C    KKK
C                A   A      T    A   A C    K  K
C                A   A      T    A   A  CCC K   K
C
      SUBROUTINE ATACK
      LOGICAL MORDOR
        integer itzro,itvl1
        real rtzro,rtvl1
      COMMON /C/L,A,B,I,NA,IV,I7,I8,N,DISTP,AJUST,MIN,ISTAT,JTK,KOENIG,
     *IGNORE,IO,IGOL(80)
      COMMON /D/DFLCT(4),DFLCK(8),DFLCB(2)
      COMMON /I/IONK(8),ISPOK(8),ION(4),ISPOT(4)
      COMMON /K/IWHO(8),DIST(8),KILLZ,KILLR,KILLD,KILLG,IGOCO(8)
      COMMON /L/IENTR(4),IENTC(4),IKLNR(8),IKLNC(8),IGLER(25),IGLEC(25),
     *IBASR(2),IBASC(2),LI2(4),LI2R(5),LI2C(5),IGO(4),MINES
      COMMON /M/MAP(60,60),IBLK,IENM1(8),IEE(4),IGLE,IM(4),III,ISTAR
      COMMON /N/INAME(3,4),IENM2(4,8),ISIDE(3,2),IBASE(2)
      COMMON /Q/IARMZ(6),INDUZ,IXRYZ,IMAGZ,IMAGRZ,IABSZ,ISTAZ,INVIZ(4),
     *ICLOZ,IONNO,IPLANZ,IRUNZ,IDEVZ,IDRIZ,IMAXZ
      COMMON /T/ICHOE(4),ICHOS(8),ICHOB(2)
      COMMON /U/LAUNCH,NUMOUT,NUME(2)
      COMMON /V/IWEB(2),IWEBZ,INVIS(4)
        COMMON /TOM/ITOM
      DO 1000 I=1,8
      N=4
      DIST(I)=100.
      IF(ICHOS(I).NE.1)GO TO 1000
      IF(IWEB(1).EQ.I+4)GO TO 1000
      IF(IWEB(2).EQ.I+4)GO TO 1000
      IF(IO.EQ.1)TYPE 1970,I
1970  FORMAT(' BEGIN ATACK I=',I)
      IF(MORDOR(MM,MN,RAD,BERNG))GO TO 1000
      IF(I.EQ.5.OR.I.EQ.6)GO TO 10100
      GO TO 1010
1010  N=4
10100 BERNG=BERNG*3.14159265/180.
      AJUST=0.0
      IGNORE=0
      IV=I+4
      IF(IONNO.EQ.1.AND.I.EQ.6)IGNORE=1
        itzro=0
10101 CALL HORTA(IKLNR(I),IKLNC(I),MM,MN,RAD,BERNG,
     *itzro,AJUST,IGNORE,DIST(I),itzro)
      IF(IO.EQ.1)TYPE 1972,MIN,I7,I8,DISTP
1972  FORMAT(' MIN=',I,' I7=',I,' I8=',I,' DISTP=',F)
      IF(MIN.LT.5)GO TO 101
      IF(MIN.LT.15)GO TO 100
      IF(MIN.LT.19)GO TO 103
      IF(MIN.EQ.19)GO TO 102
      IF(MIN.EQ.21)GO TO 106
100   IF(I.GT.3)GO TO 106
      AJUST=AJUST+0.2617993
      IF(AJUST.GT.6.283184)GO TO 107
      IONK(I)=0
      IGNORE=0
      GO TO 10101
106   RAD=RAD-DISTP+1.42
      IVV=0
      IF(IONNO.EQ.1.AND.I.EQ.6)IGNORE=1
1060  IVVV=N
      N=2
10801 I81=I8
      I71=I7
        rtzro=0.0
        itvl1=1
        rtvl1=1.5
      CALL HORTA(I71,I81,IKLNR(I),IKLNC(I),
     *rtvl1,rtzro,itzro,rtzro,itvl1,rtzro,itzro)
      IF(MIN.NE.I+4.AND.MIN.NE.19.AND.MIN.LT.21)GO TO 10801
1080  MAP(IKLNR(I),IKLNC(I))=IBLK
      IF(ISPOK(I).EQ.1)MAP(IKLNR(I),IKLNC(I))=III
      ISPOK(I)=0
      IKLNR(I)=I7
      IKLNC(I)=I8
      IF(MAP(I7,I8).EQ.III)ISPOK(I)=1
      IF(IVV.EQ.1)GO TO 10093
      IF(IVV.EQ.2)GO TO 10101
      N=IVVV
      AJUST=AJUST+0.7653981
      IF(AJUST.GT.10.)GO TO 10093
      GO TO 10101
101   IF(N.EQ.5)GO TO 106
      IF(N.EQ.6)GO TO 1061
      IVV=1
      GO TO 1060
102   RAD=(RAD-DISTP)/2.
      IONK(I)=1
      IGNORE=1
      IVV=2
      GO TO 1080
107   IVV=1
      GO TO 1060
103   CALL MNERVA(I)
      IVV=1
      MAP(I7,I8)=IBLK
      GO TO 1080
108   IVV=1
      GO TO 1080
1061  DO 535 IV=1,4
      IF(ICHOE(IV).EQ.0)GO TO 535
      L=IV+4
      WRITE(L,1062)(INAME(IQ0,MIN),IQ0=1,3)
1062  FORMAT(' THE KZINTI WARSHIP HAS RAMMED THE ',3A4)
535   CONTINUE
      MAP(I7,I8)=IBLK
      MAP(IKLNR(6),IKLNC(6))=IBLK
      IF(ISPOK(6).EQ.1)MAP(IKLNR(6),IKLNC(6))=III
      DFLCT(MIN)=-1.
      DFLCK(6)=-1.
      ISTAT=2
      RETURN
10093 IF(I.NE.6)GO TO 1063
      CALL NIVEN
      GO TO 1000
1063  CALL ASIMOV(MAP(IKLNR(I),IKLNC(I)),I)
      IF(I.NE.2)GO TO 1029
1205  N=DFLCK(I)/5.
      IF(N.EQ.0)GO TO 672
      CALL RANDO(J,1,N)
      IF(J.GT.1)GO TO 1029
672   DO 536 IV=1,4
      IF(ICHOE(IV).NE.1)GO TO 536
      L=IV+4
      INVIS(IV)=1
      WRITE(L,1030)
1030  FORMAT(' THERE HAS BEEN A BREAKDOWN IN THE ROMULAN WARSHIP''S CLO
     *AKNG DEVICE'/' AND THE SHIP CAN NOW BE PICKED UP BY OUR SENSORS')
536   CONTINUE
1029  MAP(I7,I8)=IENM1(I)
1000  CONTINUE
      IF(ICHOS(8).EQ.0.AND.NUMOUT.EQ.0)RETURN
      KOENIG=1
      CALL ALPHA
      RETURN
      END


C DONALD ECCLESTONE SUBPROGRAM FOR        T R E K 7 --
C  CONVERTED TO PC BY: DAN GAHLINGER
C TYPE-EXACT CHECK 04/27/2000 BY: D.G.
C
C - MORDOR
C
C -WHERE THE SHADOWS LIE
      LOGICAL FUNCTION MORDOR(MM,MN,RAD,BERNG)
      COMMON /C/L,A,B,I,NA,IV,I7,I8,N,DISTP,AJUST,MIN,ISTAT,JTK,KOENIG,
     *IGNORE,IO,IGOL(80)
      COMMON /D/DFLCT(4),DFLCK(8),DFLCB(2)
      COMMON /I/IONK(8),ISPOK(8),ION(4),ISPOT(4)
      COMMON /K/IWHO(8),DIST(8),KILLZ,KILLR,KILLD,KILLG,IGOCO(8)
      COMMON /L/IENTR(4),IENTC(4),IKLNR(8),IKLNC(8),IGLER(25),IGLEC(25),
     *IBASR(2),IBASC(2),LI2(4),LI2R(5),LI2C(5),IGO(4),MINES
      COMMON /Q/IARMZ(6),INDUZ,IXRYZ,IMAGZ,IMAGRZ,IABSZ,ISTAZ,INVIZ(4),
     *ICLOZ,IONNO,IPLANZ,IRUNZ,IDEVZ,IDRIZ,IMAXZ
      COMMON /R/IBPSC(4),IBPSB(8),IBPSS(2),IBPSE(25)
      COMMON /T/ICHOE(4),ICHOS(8),ICHOB(2)
      COMMON /V/IWEB(2),IWEBZ,INVIS(4)
        COMMON /TOM/ITOM
      MORDOR=.TRUE.
      CALL PIKE(IKLNR(I),IKLNC(I),IBPSB(I))
      IF(MIN.EQ.0)GO TO 1000
      DIST(I)=DISTP
      IWHO(I)=MIN
      IF(I.EQ.8)GO TO 1000
      IF(MIN.GT.4)GO TO 500
      MM=IENTR(MIN)
      MN=IENTC(MIN)
      A=DFLCT(MIN)
      GO TO 501
500   IF(MIN.GT.6)GO TO 502
      I7=MIN-4
      MM=IBASR(I7)
      MN=IBASC(I7)
      A=DFLCB(I7)
      GO TO 501
502   IF(MIN.GT.14)GO TO 503
      I7=MIN-6
      MM=IKLNR(I7)
      MN=IKLNC(I7)
      A=DFLCK(I7)
      GO TO 501
503   I7=MIN-14
      MM=IGLER(I7)
      MN=IGLEC(I7)
      A=0
501   AJUST=0.
      IONK(I)=0
      GO TO (1006,1001,1002,1007,1011,110,1012),I
1006  CALL RANDO(J,7,9)
      IF(DIST(I).LE.1.5)GO TO 1000
      RAD=FLOAT(J)
1005  AJUST=0.0
1009  IF(IBPSB(I).EQ.0.OR.IGOCO(I).EQ.0)GO TO 600
      DISTP=100.
      IVV=0
      DO 601 IV=1,4
      IF(ICHOE(IV).NE.1.OR.(IBPSC(IV)+1)/2.NE.IBPSB(I))GO TO 601
      B=DI(IKLNR(I),IKLNC(I),IENTR(IV),IENTC(IV))
      IF(B.GT.DISTP)GO TO 601
      IVV=IV
      DISTP=B
601   CONTINUE
      IF(IVV.EQ.0)GO TO 600
      MM=IENTR(IVV)
      MN=IENTC(IVV)
      AJUST=0.
      N=4
600   IV=MM-IKLNR(I)
      IVV=MN-IKLNC(I)
      BERNG=ANG(IV,IVV)
1101  BERNG=BERNG+AJUST
      IF(BERNG.LT.0)BERNG=BERNG+360.
      IF(BERNG.GT.360.)BERNG=BERNG-360.
      DO 504 I7=1,4
      IF(ICHOE(I7).NE.1)GO TO 504
      CALL DUNSEL(IKLNR(I),IKLNC(I),RAD,BERNG)
504   CONTINUE
      MORDOR=.FALSE.
1000  RETURN
1001  CALL RANDO(J,7,9)
      RAD=FLOAT(J)
      IV=KILLR
      DO 10010 J=1,4
10010 INVIS(J)=0
      IF(DISTP.LE.10..OR.KILLR.NE.1)KILLR=2
      IF(A-DFLCK(2).GT.20.)KILLR=3
      IV=IV-KILLR
      I71=MIN+4
      GO TO (1003,10031,1004),KILLR
1003  CALL RANDO(J,1,360)
      BERNG=FLOAT(J)
      GO TO 1009
10031 CALL RANDO(J,-90,90)
      AJUST=FLOAT(J)
      IF(MIN.LT.5.AND.IV.NE.0)WRITE(I71,10032)
10032 FORMAT(' ROMULAN SHIP ATTACKING')
      GO TO 1009
1004  CALL RANDO(J,90,270)
      AJUST=FLOAT(J)
      IF(MIN.LT.5.AND.IV.NE.0)WRITE(I71,10033)
10033 FORMAT(' ROMULAN SHIP RETREATING')
      GO TO 1009
1002  IF(DISTP.LE.8.)GO TO 1000
      CALL RANDO(J,5,10)
      RAD=FLOAT(J)
      IF(DISTP-8..LT.RAD)RAD=DISTP-6.5
      GO TO 1005
1007  RAD=11.
      KILLG=1
      IF(DFLCK(4)-A.LT.25.)KILLG=2
      IF(KILLG.EQ.1)GO TO 1005
1008  AJUST=180.
      GO TO 1009
1011  RAD=12.
123   AJUST=ABS(ATAN(1.1/DISTP))*180./3.14159265
      N=5
      GO TO 1009
110   RAD=IMAXZ
      N=4
      IF(IDRIZ.EQ.1)ISTAT=11
      IF(KILLZ.EQ.100)GO TO 124
      IF(DISTP.LE.KILLZ)GO TO 125
      CALL RANDO(I7,1,360)
      AJUST=I7
      GO TO 1009
125   KILLZ=100
124   GO TO (121,122,123),IPLANZ
121   AJUST=0.
      IF(A-DFLCK(6).GT.IRUNZ)AJUST=180.
      CALL RANDO(I7,-IDEVZ,IDEVZ)
      AJUST=AJUST+I7
      GO TO 1009
122   AJUST=0.
      N=6
      GO TO 1009
1012  CALL DOOMVE(MM,MN)
      GO TO 1000
      END


C -- DONALD ECCLESTONE SUBPROGRAM FOR T R E K
C  CONVERTED TO PC BY: DAN GAHLINGER
C TYPE-EXACT CHECK 04/27/2000 BY: D.G.
C
C - PIKE -
C
      SUBROUTINE PIKE(J1,J2,J3)
      COMMON /A/IT,IS,II(2),IJ(2),I3,JS,ISHAK,NOSTOP
      COMMON /C/L,A,B,I,NA,IV,I7,I8,N,DISTP,AJUST,MIN,ISTAT,JTK,KOENIG,
     *IGNORE,IO,IGOL(80)
      COMMON /L/IENTR(4),IENTC(4),IKLNR(8),IKLNC(8),IGLER(25),IGLEC(25),
     *IBASR(2),IBASC(2),LI2(4),LI2R(5),LI2C(5),IGO(4),MINES
      COMMON /Q/IARMZ(6),INDUZ,IXRYZ,IMAGZ,IMAGRZ,IABSZ,ISTAZ,INVIZ(4),
     *ICLOZ,IONNO,IPLANZ,IRUNZ,IDEVZ,IDRIZ,IMAXZ
      COMMON /R/IBPSC(4),IBPSB(8),IBPSS(2),IBPSE(25)
      COMMON /T/ICHOE(4),ICHOS(8),ICHOB(2)
      COMMON /U/LAUNCH,NUMOUT,NUME(2)
      COMMON /V/IWEB(2),IWEBZ,INVIS(4)
      DISTP=100.
      MIN=0
      DO 1 IVV=1,4
      IF(ICHOE(IVV).EQ.0.OR.ICHOE(IVV).EQ.3)GO TO 1
      IF(J3.EQ.(IBPSC(IVV)+1)/2)GO TO 1
      AJUST=DI(J1,J2,IENTR(IVV),IENTC(IVV))
      IF(AJUST.GE.DISTP)GO TO 1
      IF(AJUST.EQ.0)GO TO 1
      DISTP=AJUST
      MIN=IVV
1     CONTINUE
      DO 2 IVV=1,2
      IF(ICHOB(IVV).EQ.0)GO TO 2
      IF(J3.EQ.IBPSS(IVV))GO TO 2
      AJUST=DI(J1,J2,IBASR(IVV),IBASC(IVV))
      IF(AJUST.GE.DISTP)GO TO 2
      IF(AJUST.EQ.0)GO TO 2
      IF(J3.EQ.0.AND.IJ(IBPSS(IVV)).EQ.0)GO TO 2
      DISTP=AJUST
      MIN=IVV+4
2     CONTINUE
      DO 3 IVV=1,8
      IF(ICHOS(IVV).NE.1)GO TO 3
      IF(J3.EQ.IBPSB(IVV))GO TO 3
      AJUST=DI(J1,J2,IKLNR(IVV),IKLNC(IVV))
      IF(AJUST.GE.DISTP)GO TO 3
      IF(AJUST.EQ.0)GO TO 3
      IF(IVV.NE.2)GO TO 10
      IF(INVIS(2*J3-1)+INVIS(2*J3).EQ.0.OR.AJUST.GT.5)GO TO 3
      GO TO 11
10    IF(IVV.NE.6.OR.IARMZ(5).EQ.0)GO TO 11
      IF(INVIZ(2*J3-1)+INVIZ(2*J3).EQ.0.OR.AJUST.GT.ICLOZ)GO TO 3
11    DISTP=AJUST
      MIN=IVV+6
3     CONTINUE
4     IF(NUMOUT.EQ.0)RETURN
      DO 5 IVV=1,LAUNCH
      IF(IGLER(IVV).EQ.0)GO TO 5
      IF(J3.EQ.IBPSE(IVV))GO TO 5
      AJUST=DI(J1,J2,IGLER(IVV),IGLEC(IVV))
      IF(AJUST.GE.DISTP)GO TO 5
      IF(AJUST.EQ.0)GO TO 5
      DISTP=AJUST
      MIN=IVV+14
5     CONTINUE
      RETURN
      END


C          DONALD ECCLESTONE SUBPROGRAM FOR T R E K 7
C              CONVERTED TO PC BY: DAN GAHLINGER
C TYPE-EXACT CHECK 04/27/2000 BY: D.G.
C
C                - DOOMVE -
C
      SUBROUTINE DOOMVE(MM,MN)
      INTEGER EDIBLE
      COMMON /C/L,A,B,I,NA,IV,I7,I8,N,DISTP,AJUST,MIN,ISTAT,JTK,KOENIG,
     *IGNORE,IO,IGOL(80)
      COMMON /D/DFLCT(4),DFLCK(8),DFLCB(2)
      COMMON /I/IONK(8),ISPOK(8),ION(4),ISPOT(4)
      COMMON /K/IWHO(8),DIST(8),KILLZ,KILLR,KILLD,KILLG,IGOCO(8)
      COMMON /L/IENTR(4),IENTC(4),IKLNR(8),IKLNC(8),IGLER(25),IGLEC(25),
     *IBASR(2),IBASC(2),LI2(4),LI2R(5),LI2C(5),IGD(4),MINES
      COMMON /M/MAP(60,60),IBLK,IENM1(8),IEE(4),IGLE,IM(4),III,ISTAR
      COMMON /N/INAME(3,4),IENM2(4,8),ISIDE(3,2),IBASE(2)
      COMMON /T/ICHOE(4),ICHOS(8),ICHOB(2)
      COMMON /V/IWEB(2),IWEBZ,INVIS(4)
        COMMON /TOM/ITOM
1012  IGNORE=IFIX(DISTP)
      DO 506 N=I,IGNORE
      IVVV=IKLNR(7)-N+1
      IVV=IKLNR(7)+N-1
      I71=IKLNC(7)-N
      I81=IKLNC(7)+N
      IF(IVVV.LT.1)IVVV=1
      IF(I71.LT.1)I71=1
      IF(IVV.GT.60)IVV=60
      IF(I81.GT.60)I81=60
      I7=IKLNR(7)-N
      IF(I7.LT.1)GO TO 507
      DO 508 I8=I71,I81
      J=EDIBLE(MM,MN)
      IF(J.GT.0)GO TO 510
508   CONTINUE
507   I7=IKLNR(7)+N
      IF(I7.GT.60)GO TO 509
      DO 511 I8=I71,I81
      J=EDIBLE(MM,MN)
      IF(J.GT.0)GO TO 510
511   CONTINUE
509   I8=IKLNC(7)-N
      IF(I8.LT.1)GO TO 512
      DO 513 I7=IVVV,IVV
      J=EDIBLE(MM,MN)
      IF(J.GT.0)GO TO 510
513   CONTINUE
512   I8=IKLNC(7)+N
      IF(I8.GT.60)GO TO 506
      DO 515 I7=IVVV,IVV
      J=EDIBLE(MM,MN)
      IF(J.GT.0)GO TO 510
515   CONTINUE
506   CONTINUE
      I7=MM
      I8=MN
      GO TO 517
510   IV=IKLNC(7)
      IVV=IKLNR(7)
      MAP(IVV,IV)=IBLK
      IF(ISPOK(7).EQ.1)MAP(IVV,IV)=III
      ISPOK(7)=0
      IKLNC(7)=I8
      IKLNR(7)=I7
      MAP(I7,I8)=IENM1(7)
      GO TO (514,516,517),J
514   DO 518 IV=1,5
      IF(I7.NE.LI2R(IV))GO TO 516
      IF(I8.NE.LI2C(IV))GO TO 516
      LI2C(IV)=0
      LI2R(IV)=0
      GO TO 1000
518   CONTINUE
      DO 519 IV=1,2
      IF(I7.NE.IBASR(IV))GO TO 519
      IF(I8.NE.IBASC(IV))GO TO 519
529   DFLCB(IV)=-1.
      ISTAT=2
      DO 5190 IVV=1,4
      IF(ICHOE(IVV).EQ.0)GO TO 5190
      I71=IVV+4
      WRITE(I71,521)(ISIDE(IQ0,IV),IQ0=1,3),IBASE(IV)
521   FORMAT(' THE DOOMSDAY MACHINE HAS EATEN ',3A4,' STARBASE',I3)
5190  CONTINUE
519   CONTINUE
      GO TO 1000
516   CALL RANDO(IV,1,7)
      IF(IV.GT.2)GO TO 520
      DO 522 J=1,4
      IF(ICHOE(J).EQ.0)GO TO 522
      IV=J+4
      WRITE(IV,523)
523   FORMAT(' THE DOOMSDAY MACHINE HAS JUST EATEN A MINE - NO DAMAGE')
522   CONTINUE
      GO TO 1000
520   CALL MNERVA(7)
      GO TO 1000
517   ISTAT=2
      IF(MIN.GT.4)GO TO 525
      DFLCT(MIN)=-1.
      DO 526 IVV=1,4
      IF(ICHOE(IVV).EQ.0)GO TO 526
      IV=IVV+4
      WRITE(IV,527)(INAME(IQ0,MIN),IQ0=1,3)
527   FORMAT(' THE DOOMSDAY MACHINE HAS EATEN THE ',3A4)
526   CONTINUE
      GO TO 1000
525   IF(MIN.GT.6)GO TO 528
      IV=MIN-4
      GO TO 529
528   IF(MIN.GT.14)GO TO 530
      MIN=MIN-6
      DFLCK(MIN)=-1.
      DO 531 IVV=1,4
      IF(ICHOE(IVV).EQ.0)GO TO 531
      IV=IVV+4
      WRITE(IV,532)(IENM2(J,MIN),J=1,4)
532   FORMAT(' THE DOOMSDAY MACHINE HAS EATEN THE ',4A4)
531   CONTINUE
      GO TO 1000
530   MIN=MIN-14
      CALL BOOM(MIN)
      DO 533 IVV=1,4
      IF(ICHOE(IVV).EQ.0)GO TO 533
      IV=IVV+4
      WRITE(IV,534)MIN
534   FORMAT(' THE DOOMSDAY MACHINE HAS EATEN EAGLE',I3)
533   CONTINUE
      GO TO 1000
1000  RETURN
      END


C       -- DONALD ECCLESTONE SUBPROGRAM FOR     T R E K 7 --
C  CONVERTED TO PC BY: DAN GAHLINGER
C TYPE-EXACT CHECK 04/27/2000 BY: D.G.
C
C                       - EDIBLE -
C
      INTEGER FUNCTION EDIBLE(MM,MN)
      COMMON /A/IT,IS,II(2),IJ(2),I3,JS,ISHAK,NOSTOP
      COMMON /C/L,A,B,I,NA,IV,I7,I8,N,DISTP,AJUST,MIN,ISTAT,JTK,KOENIG,
     *IGNORE,IO,IGOL(80)
      COMMON /L/IENTR(4),IENTC(4),IKLNR(8),IKLNC(8),IGLER(25),IGLEC(25),
     *IBASR(2),IBASC(2),LI2(4),LI2R(5),LI2C(5),IGO(4),MINES
      COMMON /M/MAP(60,60),IBLK,IENM1(8),IEE(4),IGLE,IM(4),III,ISTAR
      COMMON /R/IBPSC(4),IBPSB(8),IBPSS(2),IBPSE(25)
      EDIBLE=0
      NA=MAP(I7,I8)
      IF(NA.EQ.IBLK.OR.NA.EQ.III)RETURN
      IF(NA.NE.ISTAR)GO TO 1
      DO 3 IK=1,2
      IF(MM.EQ.IBASR(IK).AND.MN.EQ.IBASC(IK).AND.IJ(IBPSS(IK)).EQ.0)
     *RETURN
3     CONTINUE
      EDIBLE=1
      RETURN
1     IF(NA.LT.'1'.OR.NA.GT.'4')GO TO 2
      EDIBLE=2
      RETURN
2     IF(MM.NE.I7)RETURN
      IF(MN.EQ.I8)EDIBLE=3
      RETURN
      END


C -- DONALD ECCLESTONE SUBPROGRAM FOR T R E K 7 --
C  CONVERTED TO PC BY: DAN GAHLINGER
C TYPE-EXACT CHECK 04/27/2000 BY: D.G.
C
C - MNERVA -
C
      SUBROUTINE MNERVA(J)
      COMMON /C/L,A,B,I,NA,IV,I7,I8,N,DISTP,AJUST,MIN,ISTAT,JTK,KOENIG,
     *IGNORE,IO,IGOL(80)
      COMMON /D/DFLCT(4),DFLCK(8),DFLCB(2)
      COMMON /L/IENTR(4),IENTC(4),IKLNR(8),IKLNC(8),IGLER(25),IGLEC(25),
     *IBASR(2),IBASC(2),LI2(4),LI2R(5),LI2C(5),IEE(4),MINES
      COMMON /N/INAME(3,4),IENM2(4,8),ISIDE(3,2),IBASE(2)
      COMMON /T/ICHOE(4),ICHOS(8),ICHOB(2)
        COMMON /TOM/ITOM
      CALL RANDO(IV,10,100)
      IVV=IFIX(ALOG((101.-DFLCK(J))*IV+10.)/0.700619195-1.8185)
      DO 141 IV=1,4
      IF(ICHOE(IV).EQ.0)GO TO 141
      L=IV+4
      WRITE(L,401)(IENM2(N,J),N=1,4)
401   FORMAT(1X,4A4,' HAS COLLIDED WITH A MINE - DAMAGE REPORT-')
141   CONTINUE
      CALL GRUP3(IVV,J)
      MINES=MINES-1
      RETURN
      END


C -- DONALD ECCLESTONE SUBPROGRAM FOR T R E K
C  CONVERTED TO PC BY: DAN GAHLINGER
C TYPE-EXACT CHECK 04/27/2000 BY: D.G.
C
C - ASIMOV -
C

      SUBROUTINE ASIMOV(NA,K)
      COMMON /I/IONK(8),ISPOK(8),ION(4),ISPOT(4)
      COMMON /M/MAP(60,60),IBLK,IENM1(8),IEE(4),IGLE,IM(4),III,ISTAR
      IF(NA.NE.III)RETURN
      IONK(K)=1
      ISPOK(K)=1
      RETURN
      END


C -- DONALD ECCLESTONE SUBPROGRAM FOR T R E K 7 --
C  CONVERTED TO PC BY: DAN GAHLINGER
C TYPE-EXACT CHECK 04/27/2000 BY: D.G.
C
C - NIVEN -
C
      SUBROUTINE NIVEN
      LOGICAL WODEN
      COMMON /C/L,A,B,I,NA,IV,I7,I8,N,DISTP,AJUST,MIN,ISTAT,JTK,KOENIG,
     *IGNORE,IO,IGOL(80)
      COMMON /L/IENTR(4),IENTC(4),IKLNR(8),IKLNC(8),IGLER(25),IGLEC(25),
     *IBASR(2),IBASC(2),LI2(4),LI2R(5),LI2C(5),IGD(4),MINES
      COMMON /M/MAP(60,60),IBLK,IENM1(8),IEE(4),IGLE,IM(4),III,ISTAR
      COMMON /Q/IARMZ(6),INDUZ,IXRYZ,IMAGZ,IMAGRZ,IABSZ,ISTAZ,INVIZ(4),
     *ICLOZ,IONNO,IPLANZ,IRUNZ,IDEVZ,IDRIZ,IMAXZ
        COMMON /TOM/ITOM
85    IF(IARMZ(4).EQ.0)GO TO 81
      IF(IMAGZ.EQ.0)GO TO 81
      MIN=0
      DO 86 N=1,IMAGZ
87    CALL RANDO(IV,-IMAGRZ,IMAGRZ)
      CALL RANDO(IVV,-IMAGRZ,IMAGRZ)
      MIN=MIN+1
      IF(MIN.GT.20)GO TO 81
      IV=IKLNR(6)+IV
      IVV=IKLNC(6)+IVV
      IF(.NOT.WODEN(IV,IVV,MAP(IV,IVV)))GO TO 87
      MIN=0
86    MAP(IV,IVV)=IENM1(6)
      DO 83 MIN = 1,20
      CALL RANDO(IV,IKLNR(6)-3,IKLNR(6)+3)
      CALL RANDO(IVV,IKLNC(6)-3,IKLNC(6)+3)
      IF(.NOT.WODEN(IV,IVV,MAP(IV,IVV)))GO TO 83
      IKLNR(6)=IV
      IKLNC(6)=IVV
      GO TO 88
83    CONTINUE
88    CALL ASIMOV(MAP(IKLNR(6),IKLNC(6)),6)
81    MAP(IKLNR(6),IKLNC(6))=IENM1(6)
      RETURN
      END

C -- DONALD ECCLESTONE SUBPROGRAM FOR T R E K 7 --
C  CONVERTED TO PC BY: DAN GAHLINGER
C TYPE-EXACT CHECK 04/27/2000 BY: D.G.
C
C - WODEN -
C
      LOGICAL FUNCTION WODEN(I,J,NA)
      LOGICAL CYRANO
      COMMON /M/MAP(60,60),IBLK,IENM1(8),IEE(4),IGLE,IM(4),III,ISTAR
      WODEN=.FALSE.
      IF(CYRANO(I,J))RETURN
      IF(NA.NE.IBLK.AND.NA.NE.III.AND.NA.NE.IENM1(6))RETURN
      WODEN=.TRUE.
      RETURN
      END

C       -- DONALD ECCLESTONE SUBPROGRAM FOR T R E K 7
C  CONVERTED TO PC BY: DAN GAHLINGER
C checked type-exact 04/24/2000 by DG
C
C               - ALPHA -
C

      SUBROUTINE ALPHA
        integer itzro,itvl1
        real rtzro,rtvl1
      COMMON /C/L,A,B,I,NA,IV,I7,I8,N,DISTP,AJUST,MIN,ISTAT,JTK,KOENIG,
     *IGNORE,IO,IGOL(80)
      COMMON /L/IENMR(4),IENTC(4),IKLNR(8),IKLNC(8),IGLER(25),IGLEC(25),
     *IBASR(2),IBASC(2),LI2(4),LI2R(5),LI2C(5),IGO(4),MINES
      COMMON /M/MAP(60,60),IBLK,IENM1(8),IEE(4),IGLE,IM(4),III,ISTAR
      COMMON /T/ICHOE(4),ICHOS(8),ICHOB(2)
      COMMON /U/LAUNCH,NUMOUT,NUME(2)
      CALL SIMAK(J1,J2)
      ISTAT=0
      I=0
      IV=0
      BDIS=DI(J1,J2,IKLNR(8),IKLNC(8))
      IF(IO.EQ.1)TYPE 1978,J1,J2,BDIS
1978  FORMAT(' BEGIN ALPHA J1=',I5,' J2=',I5,' BDIS=',F)
      DO 2 IVV=1,LAUNCH
      IF(IGLER(IVV).EQ.0)GO TO 2
      RAD=2.9
      I7=J1-IGLER(IVV)
      I8=J2-IGLEC(IVV)
      IF(BDIS.LE.5.)GO TO 18
      IF(IABS(I7).LE.3.AND.IABS(I8).LE.3)GO TO 2
18    BERNG=ANG(I7,I8)*3.14159265/180.
      AJUST=0.0
7     N=4
      IGNORE=0
        itzro=0
      CALL HORTA(IGLER(IVV),IGLEC(IVV),
     *itzro,itzro,RAD,BERNG,itzro,AJUST,IGNORE,itzro,itzro)
      IF(IO.EQ.1)TYPE 1979,IVV,MIN,I7,I8
1979  FORMAT(' =#=',I3,' MIN=',I5,' I7=',I5,' I8=',I5)
      IF(MIN.GE.15.AND.MIN.LE.18)GO TO 5
      IF(MIN.EQ.21)GO TO 10
      I=1
      RAD=RAD-DISTP+1.42
      AJUST=AJUST+0.785398163
      IF(AJUST.GT.7.)GO TO 2
      N=2
      I4=0
6     I71=I7
      I81=I8
      IGNORE=0
      I4=I4+1
        rtzro=0.0
        itzro=0
        rtvl1=1.5
      CALL HORTA(I71,I81,IGLER(IVV),IGLEC(IVV),
     *rtvl1,rtzro,itzro,rtzro,IGNORE,itzro,itzro)
1981  IF(MIN.EQ.14.AND.I7.EQ.IGLER(IVV).AND.I8.EQ.IGLEC(IVV))GO TO 11
      IF(MIN.LT.21)GO TO 6
11    MAP(IGLER(IVV),IGLEC(IVV))=IBLK
      MAP(I7,I8)=IGLE
      IGLER(IVV)=I7
      IGLEC(IVV)=I8
      IF(I.EQ.1)GO TO 7
      GO TO 2
5     DO 12 I71=1,4
      IF(ICHOE(I71).EQ.0)GO TO 12
      I81=I71+4
      WRITE(I81,8)IVV
8     FORMAT(' EAGLE',I3,' DESTROYED ON COLLISION WITH A MINE')
12    CONTINUE
      MAP(I7,I8)=IBLK
      CALL BOOM(IVV)
      MINES=MINES-1
      GO TO 2
10    I=0
      GO TO 11
2     CONTINUE
      IF(LAUNCH.LT.25.AND.ICHOS(8).NE.0)CALL LEGUIN(J1,J2)
      RETURN
      END


C DONALD ECCLESTONE SUBPROGRAM FOR T R E K 7 --
C  CONVERTED TO PC BY: DAN GAHLINGER
C TYPE-EXACT CHECK 04/27/2000 BY: D.G.
C
C - SIMAK -
C
      SUBROUTINE SIMAK(J1,J2)
      COMMON /C/L,A,B,I,NA,IV,I7,I8,N,DISTP,AJUST,MIN,ISTAT,JTK,KOENIG,
     *IGNORE,IO,IGOL(80)
      COMMON /L/IENTR(4),IENTC(4),IKLNR(8),IKLNC(8),IGLER(25),IGLEC(25),
     *IBASR(2),IBASC(2),LI2(4),LI2R(5),LI2C(5),IGO(4),MINES
      COMMON/T/ICHOE(4),ICHOS(8),ICHOB(2)
      COMMON /U/LAUNCH,NUMOUT,NUME(2)
      I71=IKLNR(8)
      I81=IKLNC(8)
      DO 13 I=1,LAUNCH
      IF(IGLER(I).EQ.0)GO TO 13
      I71=IGLER(I)
      I81=IGLEC(I)
      GO TO 14
13    CONTINUE
14    AJUST=100.
      JTK=0
      DO 15 I7=1,4
      IF(ICHOE(I7).EQ.0)GO TO 15
      DISTP=DI(IENTR(I7),IENTC(I7),I71,I81)
      IF(DISTP.GT.AJUST)GO TO 15
      AJUST=DISTP
      JTK=I7
15    CONTINUE
16    J1=IENTR(JTK)
      J2=IENTC(JTK)
      RETURN
      END


C -- DONALD ECCLESTONE SUBPROGRAM FOR T R E K 7 --
C  CONVERTED TO PC BY: DAN GAHLINGER
C TYPE-EXACT CHECK 04/27/2000 BY: D.G.
C
C - LEGUIN -
C
      SUBROUTINE LEGUIN(J3,J4)
      COMMON /A/IT,IS,II(2),IJ(2),I3,JS,ISHAK,NOSTOP
      COMMON /C/L,A,B,I,NA,IV,I7,I8,N,DISTP,AJUST,MIN,ISTAT,JTK,KOENIG,
     *IGNORE,IO,IGOL(80)
      COMMON /D/DFLCT(4),DFLCK(8),DFLCB(2)
      COMMON /L/IENTR(4),IENTC(4),IKLNR(8),IKLNC(8),IGLER(25),IGLEC(25),
     *IBASR(2),IBASC(2),LI2(4),LI2R(5),LI2C(5),IGO(4),MINES
      COMMON /M/MAP(60,60),IBLK,IENM1(8),IEE(4),IGLE,IM(4),III,ISTAR
      COMMON /N/INAME(3,4),IENM2(4,8),ISIDE(3,2),IBASE(2)
      COMMON /R/IBPSC(4),IBPSB(8),IBPSS(2),IBPSE(25)
      COMMON /S/IBPOB(8),IBPOE(25)
      COMMON /T/ICHOE(4),ICHOS(8),ICHOB(2)
      COMMON /U/LAUNCH,NUMOUT,NUME(2)
        COMMON /TOM/ITOM
      J1=J3
      J2=J4
      IF(J1.EQ.0)CALL SIMAK(J1,J2)
      I71=J1-IKLNR(8)
      IVV=J2-IKLNC(8)
      DISTP=0.785396163
      IF(I71.EQ.0)DISTP=0.
      IF(IVV.EQ.0)DISTP=2.0*DISTP
      IF(IVV.LT.0)DISTP=3.14159265-DISTP
      IF(I71.LT.0)DISTP=-DISTP
      AJUST=0.0
      I81=1
      I8=LAUNCH+1
107   IF(I8.GT.25)GO TO 113
      I71=IFIX(1.8*SIN(DISTP+AJUST))+IKLNR(8)
      IVV=IFIX(1.8*COS(DISTP+AJUST))+IKLNC(8)
      IF(MAP(I71,IVV).EQ.IBLK)GO TO 105
101   DO 122 JTK=1,4
      IF(MAP(I71,IVV).EQ.IEE(JTK))GO TO 123
      IF(MAP(I71,IVV).EQ.IM(JTK))GO TO 102
122   CONTINUE
      GO TO 110
123   DO 124 MIN=1,4
      IF(ICHOE(MIN).EQ.0)GO TO 124
      N=MIN+4
      WRITE(N,103)I8,(INAME(IQ0,JTK),IQ0=1,3),I8,
     *(INAME(IQ0,JTK),IQ0=1,3)
103   FORMAT(' EAGLE',I3, ' CRASHED INTO ',3A4, ' ON TAKE-OFF'/
     *' EAGLE',I3,' DESTROYED'/1X,3A4,' DAMAGE REPORT-')
124   CONTINUE
      CALL RANDO(IV,1,100)
      J1=ALOG((101.-DFLCT(JTK))*IV+10.)/0.700619195-1.8185
      CALL GRUP1(J1,JTK)
      NUMOUT=NUMOUT-1
      IGLER(I8)=0
      IGLEC(I8)=0
      GO TO 106
102   DO 125 J1=1,4
      IF(ICHOE(J1).EQ.0)GO TO 125
      J2=J1+4
      WRITE(J2,104)I8
104   FORMAT(' EAGLE',I3,' DESTROYED ON COLLISION WITH A MINE')
125   CONTINUE
      MAP(I71,IVV)=IBLK
      MINES=MINES-1
      NUMOUT=NUMOUT-1
      IGLER(I8)=0
      IGLEC(I8)=0
      GO TO 106
105   MAP(I71,IVV)=IGLE
      IGLER(I8)=I71
      IGLEC(I8)=IVV
      IF(IBPOB(8).EQ.0)GO TO 1060
      IBPOB(8)=IBPOB(8)-2
      NUME(IBPSB(8))=NUME(IBPSB(8))+1
      II(IBPSB(8))=II(IBPSB(8))+1
      IBPOE(I8)=2
      IBPSE(I8)=IBPSB(8)
      GO TO 106
1060  I3=I3+1
106   I81=I81+1
      I8=I8+1
110   IF(AJUST.GT.0)GO TO 111
      AJUST=0.765398163-AJUST
      GO TO 112
111   AJUST=-AJUST
112   IF(AJUST.GT.-6.28.AND.I81.LE.5)GO TO 107
113   LAUNCH=LAUNCH+I81-1
      NUMOUT=NUMOUT+I81-1
120   RETURN
      END
