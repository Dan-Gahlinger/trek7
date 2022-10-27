C======================================================================
C
C     TREK7 MODULE F
C
C COPYRIGHT (C) 2003 DAN GAHLINGER, LICENSED UNDER GPL
C
C   SHIP DAMAGE ROUTINES
C
C BOOM    LIRPA   GRUP1   GRUP2   GRUP3   TPAU
C OXMYX   GOTU    GOTME   FORBIN  QUARK   POS
C
C======================================================================

C -- DONALD ECCLESTONE AND DAN GAHLINGER SUBPROGRAM FOR T R E K 7 --
C
C - BOOM
C
      SUBROUTINE BOOM(J)
      COMMON /A/IT,IS,II(2),IJ(2),I3,JS,ISHAK,NOSTOP
      COMMON /C/L,A,B,I,NA,IV,I7,I8,N,DISTP,AJUST,MIN,ISTAT,JTK,KOENIG,
     *IGNORE,IO,IGOL(80)
      COMMON /E/PHASR(4),TWARP(4),IPHOT(4),NDEAD(4),ISURR(4)
      COMMON /G/ZAP(4),ICOLA(4),IROWA(4),LOCK(4),ICOIL(4)
      COMMON /H/ANGLE(4),RANG(4),LOCKT(4)
      COMMON /L/IENTR(4),IENTC(4),IKLNR(8),IKLNC(8),IGLER(25),IGLEC(25),
     *IBASR(2),IBASC(2),LI2(4),LI2R(5),LI2C(5),IGO(4),MINES
      COMMON /M/MAP(60,60),IBLK,IENM1(8),IEE(4),IGLE,IM(4),III,ISTAR
      COMMON /R/IBPSC(4),IBPSB(8),IBPSS(2),IBPSE(25)
      COMMON /S/IBPOB(8),IBPOE(25)
      COMMON /U/LAUNCH,NUMOUT,NUME(2)
      IF(ISTAT.EQ.2)GO TO 2
      MAP(IGLER(J),IGLEC(J))=IBLK
2     IGLER(J)=0
      IGLEC(J)=0
      NUMOUT=NUMOUT-1
      IF(IBPOE(J).EQ.0)GO TO 1
      IBPOE(J)=0
      II(IBPSE(J))=II(IBPSE(J))-1
      NUME(IBPSE(J))=NUME(IBPSE(J))-1
      IBPSE(J)=0
      RETURN
1     I3=I3-1
      RETURN
      END

C     -- DONALD ECCLESTONE AND DAN GAHLINGER SUBPROGRAM FOR T R E K 7 --
C
C    - LIRPA
C
      INTEGER FUNCTION LIRPA(AA,II)
      COMMON /C/L,A,B,I,NA,IV,I7,I8,N,DISTP,AJUST,MIN,ISTAT,JTK,KOENIG,
     *IGNORE,IO,IGOL(80)
      LIRPA=ALOG((101.-AA)*II*II/DISTP)/0.700619195-6.605
      RETURN
      END

C     DONALD ECCLESTONE AND DAN GAHLINGER SUBPROGRAM FOR T R E K 7
C
C     - GRUP 1
C
      SUBROUTINE GRUP1(IVV,MI)
      COMMON /D/DFLCT(4),DFLCK(8),DFLCB(2)
      COMMON /R/IBPSC(4),IBPSB(8),IBPSS(2),IBPSE(25)
      COMMON /T/ICHOE(4),ICHOS(8),ICHOB(2)
      IVA=IXIF(IVV)
      CALL GOTME(IVA,MI)
      DFLCT(MI)=DFLCT(MI)-FLOAT(IVA)*1.6
      DO 350 I71=1,4
      IF(ICHOE(I71).EQ.0)GO TO 350
      IF(I71.EQ.IBPSC(MI))GO TO 350
      CALL GOTU(IVA,I71)
350   CONTINUE
      RETURN
      END

C -- DONALD ECCLESTONE AND DAN GAHLINGER SUBPROGRAM FOR T R E K 7 --
C
C - GRUP2 -
C
      SUBROUTINE GRUP2(IVV,MI)
      COMMON /B/NDEAB(2),IPHOB(2),IONB(2),IGOB(2),IFIB(2)
      COMMON /D/DFLCT(4),DFLCK(8),DFLCB(2)
      COMMON /T/ICHOE(4),ICHOS(8),ICHOB(2)
        COMMON /TOM/ITOM
      IVA=IXIF(IVV)
      DFLCB(MI)=DFLCB(MI)-FLOAT(IVA)*1.6
      DO 351 I71=1,4
      IF(ICHOE(I71).EQ.0)GO TO 351
      CALL GOTU(IVA,I71)
351   CONTINUE
      IGOB(MI)=1
      CALL RANDO(I3,IVA/2,IVA*2)
      NDEAB(MI)=NDEAB(MI)-I8
      IF(NDEAB(MI).LT.0)NDEAB(MI)=0
      IF(IVA.GT.2)IFIB(MI)=0
      RETURN
      END

C -- DONALD ECCLESTONE AND DAN GAHLINGER SUBPROGRAM FOR T R E K 7
C
C - GRUP3 -
C
      SUBROUTINE GRUP3(IVV,MI)
      COMMON /D/DFLCT(4),DFLCK(8),DFLCB(2)
      COMMON /I/IONK(8),ISPOK(8),ION(4),ISPOT(4)
      COMMON /K/IWHO(8),DIST(8),KILLZ,KILLR,KILLD,KILLG,IGOCO(8)
      COMMON /S/IBPOB(8),IBPOE(25)
      COMMON /T/ICHOE(4),ICHOS(8),ICHOB(2)
         COMMON /TOM/ITOM
      IVA=IVV
      IF(IONK(MI).EQ.1)IVA=IVV+2
      IVA=IXIF(IVA)
      DFLCK(MI)=DFLCK(MI)-FLOAT(IVA)*1.6
      DO 352 I71=1,4
      IF(ICHOE(I71).EQ.0)GO TO 352
      CALL GOTU(IVA,I71)
352   CONTINUE
      IF(IBPOB(MI).EQ.0)GO TO 374
      CALL RANDO(I3,IVA/2,IVA)
      IBPOB(MI)=IBPOB(MI)-IS
      IF(IBPOB(MI).GT.0)GO TO 374
      CALL TPAU(MI)
      CALL OXMYX
374   IF(MI.EQ.2)KILLR=2
      IF(MI.EQ.7)KILLD=2
      RETURN
      END

C DONALD ECCLESTONE AND DAN GAHLINGER SUBPROGRAM FOR T R E K 7
C
C - TPAU -
C
      SUBROUTINE TPAU(J)
      COMMON /A/IT,IS,II(2),IJ(2),I3,JS,ISHAK,NOSTOP
      COMMON /C/L,A,B,I,NA,IV,I7,I8,N,DISTP,AJUST,MIN,ISTAT,JTK,KOENIG,
     *IGNORE,IO,IGOL(80)
      COMMON /N/INAME(3,4),IENM2(4,8),ISIDE(3,2),IBASE(2)
      COMMON /R/IBPSC(4),IBPSB(8),IBPSS(2),IBPSE(25)
      COMMON /S/IBPOB(8),IBPOE(25)
      COMMON/T/ICHOE(4),ICHOS(8),ICHOB(2)
      DO 142 IV=1,4
      IF(ICHOE(IV).EQ.0)GO TO 142
      I7=IV+4
      WRITE(I7,207)(IENM2(N,J),N=1,4)
207   FORMAT(' CONTROL OF THE ',4A4,' HAS BEEN LOST')
142   CONTINUE
      II(IBPSB(J))=II(IBPSB(J))-1
      IBPSB(J)=0
      IBPOB(7)=IBPOB(7)-1
      I3=I3+1
      IBPOB(J)=0
      RETURN
      END

C -- DONALD ECCLESTONE AND DAN GAHLINGER SUBPROGRAM FOR T R E K
C
C - OXMYX -
C
      SUBROUTINE OXMYX
      COMMON /C/L,A,B,I,NA,IV,I7,I8,N,DISTP,AJUST,MIN,ISTAT,JTK,KOENIG,
     *IGNORE,IO,IGOL(80)
      COMMON /R/IBPSC(4),IBPSB(8),IBPSS(2),IBPSE(25)
      COMMON /V/IWEB(2),IWEBZ,INVIS(4)
      DO 133 N=1,2
      IF(IWEB(N).GT.4)GO TO 134
      IF(IBPSB(3*N).EQ.(IBPSC(IWEB(N))+1)/2)IWEB(N)=0
      GO TO 133
134   IF(IWEB(N).EQ.0)GO TO 133
      IF(IBPSB(3*N).EQ.IBPSB(IWEB(N)-4))IWEB(N)=0
133   CONTINUE
      RETURN
      END

C -- DONALD ECCLESTONE AND DAN GAHLINGER SUBPROGRAM FOR T R E K 7 --
C
C - GOTU -
C
      SUBROUTINE GOTU(IVV,I71)
      L=I71+4
      GO TO (40,43,45,90,48,92,52,55,58,61,62),IVV+1
40    WRITE(L,42)
42    FORMAT(' NO DAMAGE')
      GO TO 50
43    WRITE(L,242)
242   FORMAT(' DAMAGE FACTOR I- VERY LITTLE DAMAGE SUSTAINED')
      GO TO 50
45    WRITE(L,47)
47    FORMAT(' DAMAGE FACTOR 2- MINOR DAMAGE SUSTAINED')
      GO TO 50
90    WRITE(L,91)
91    FORMAT(' DAMAGE FACTOR 3- MINOR STRUCTURAL DAMAGE'/16X,'- THERE IS
     *A DENT IN THE VESSEL')
      GO TO 50
48    WRITE(L,51)
51    FORMAT(' DAMAGE FACTOR 4- VESSEL. MODERATELY DAMAGED')
      GO TO 50
92    WRITE(L,93)
93    FORMAT(' DAMAGE FACTOR 5- LIFE SUPPORT SYSTEM BREAKDOWN IN PARTS
     *OF THE VESSEL')
      GO TO 50
52    WRITE(L,54)
54    FORMAT(' DAMAGE FACTOR 6- HEAVY INTERNAL DAMAGE TO VESSEL')
      GO TO 50
55    WRITE(L,57)
57    FORMAT(' DAMAGE FACTOR 7- HEAVY STRUCTURAL DAMAGE TO VESSEL')
      GO TO 50
58    WRITE(L,60)
60    FORMAT(' DAMAGE FACTOR 8- A NUMBER OF DECKS HAVE RUPTURED ON THE V
     *ESSEL')
      GO TO 50
61    WRITE(L,63)
63    FORMAT(' DAMAGE FACTOR 9- THE VESSEL HAS BEEN ROCKED BY AN EXP
     *LOSION')
      GO TO 50
62    WRITE(L,64)
64    FORMAT(' DAMAGE FACTOR 10- VESSEL PARTIALLY DESTROYED')
50    RETURN
      END

C -- DONALD ECCLESTONE AND DAN GAHLINGER SUBPROGRAM FOR T R E K 7 -
C
C -GOTME -
C
      SUBROUTINE GOTME(IVL,IT)
      INTEGER POS
      COMMON /C/L,A,B,I,NA,IV,I7,I8,N,DISTP,AJUST,MIN,ISTAT,JTK,KOENIG,
     *IGNORE,IO,IGOL(80)
      COMMON /D/DFLCT(4),DFLCK(8),DFLCB(2)
      COMMON /E/PHASR(4),TWARP(4),IPHOT(4),NDEAD(4),ISURR(4)
      COMMON /L/IENTR(4),IENTC(4),IKLNR(8),IKLNC(8),IGLER(25),IGLEC(25),
     *IBASR(2),IBASC(2),LI2(4),LI2R(5),LI2C(5),IGO(4),MINES
      COMMON /O/MA(4,33),K(4,14),NOMAP(4),MANUM(4),HIVEL(4,2),ITEMP(4),
     *NOMOV(4)
      COMMON /R/IBPSC(4),IBPSB(8),IBPSS(2),IBPSE(25)
         COMMON /TOM/ITOM
      IVV=IVL
      IC=0
      JJ=0
      L=IBPSC(IT)+4
      IS=(IT+1)/2
      IF(IVV.EQ.0)GO TO 110
      IF(IVV.EQ.1)GO TO 112
113   IVVV=IVV-1
1130  DO 121 J=1,33
      IF(MA(IT,J).LT.IVVV)GO TO 111
121   CONTINUE
      IVV=IVV+1
      IF(IVV.LE.10)GO TO 113
      DFLCT(IT)=-1.
      GO TO 232
111   JJ=JJ+IFIX(FLOAT(IVVV+1)*1.6+0.5)
      IF(IVVV.EQ.IC)GO TO 200
      GO TO (114,120,1200,1212,130,137,145,155,156),IVVV
110   WRITE(L,42)
42    FORMAT(' NO DAMAGE')
      GO TO 232
112   WRITE(L,242)
242   FORMAT(' DAMAGE FACTOR 1- VERY LITTLE DAMAGE SUSTAINED')
      GO TO 232
114   CALL RANDO(J,1,3)
      IF(J.NE.3)GO TO 119
      WRITE(L,4005)
4005  FORMAT(' DAMAGE FACTOR 2- TOILETS HAVE BACKED UP IN')
      GO TO 200
119   WRITE(L,117)
117   FORMAT(' DAMAGE FACTOR 2- MINOR DAMAGE TO')
      GO TO 200
120   WRITE(L,1210)
1210  FORMAT('DMG FACTR 3- MINOR STRUCTURAL DAMAGE- THERE IS A DENT IN')
      GO TO 200
1200  CALL RANDO(J,1,3)
      GO TO (123,50,4004),J
50    WRITE(L,51)
51    FORMAT(' DAMAGE FACTOR 4- POWER FAILURE IN')
      GO TO 200
4004  WRITE(L,4007)
4007  FORMAT(' DAMAGE FACTOR 4- THERE IS A BURST WATER LINE IN')
      GO TO 200
123   WRITE(L,124)
124   FORMAT(' DAMAGE FACTOR 4- MODERATE DAMAGE TO')
      GO TO 200
1212  WRITE(L,1213)
1213  FORMAT(' DAMAGE FACTOR 5- LIFE SUPPORT SYSTEM BREAKDOWN IN')
      GO TO 200
130   WRITE(L,136)
136   FORMAT(' DAMAGE FACTOR 6- HEAVY DAMAGE TO')
      GO TO 200
137   WRITE(L,143)
143   FORMAT(' DAMAGE FACTOR 7- A FIRE HAS BROKEN OUT IN')
      GO TO 200
145   WRITE(L,153)
153   FORMAT(' DAMAGE FACTOR 8- AN EXPLOSION HAS OCCURRED IN')
      GO TO 200
155   WRITE(L,163)
163   FORMAT(' DAMAGE FACTOR 9- PARTIAL DESTRUCTION OF')
      GO TO 200
156   WRITE(L,173)
173   FORMAT(' DAMAGE FACTOR 10- DESTRUCTION OF')
200   CALL RANDO(IV,1,33)
      IF(MA(IT,IV).GE.IVVV)GO TO 200
      IF(MA(IT,IV).NE.0)GO TO 701
      MANUM(IT)=MANUM(IT)+1
701   IF(IVVV.NE.9)GO TO 70
      IF(IV.LT.29)GO TO 70
      IF(IV.GT.30)GO TO 70
      MANUM(IT)=MANUM(IT)-1
70    MA(IT,IV)=IVVV
      CALL FORBIN(IS,IV,L,' ')
      IC=IVVV
      CALL RANDO(IV,1,15)
      IVVV=IVVV*IV/9
      IF(IVVV.EQ.0)IVVV=1
      IVV=IVVV+1
      IF(IV.LE.9)GO TO 1130
402   IF(IT.EQ.I)CALL QUARK(L)
4015  IF(MA(IT,14).GT.K(IT,2))PHASR(IT)=PHASR(IT)-MA(IT,14)*300.
      IF(PHASR(IT).LT.0)PHASR(IT)=0.
      K(IT,2)=MA(IT,14)
      TWARP(IT)=TWARP(IT)-FLOAT(MA(IT,29)-K(IT,4))/2.
      TWARP(IT)=TWARP(IT)-FLOAT(MA(IT,30)-K(IT,5))/2.
      K(IT,4)=MA(IT,29)
      K(IT,5)=MA(IT,30)
      IF(MA(IT,28).LT.4.OR.K(IT,6).GE.4)GO TO 657
      TWARP(IT)=TWARP(IT)-1.
      K(IT,6)=MA(IT,28)
657   IF(TWARP(IT).LT.0)TWARP(IT)=0
      J=0
      IF(IS.EQ.2)GO TO 100
      IF(IT.NE.1)GO TO 5000
      IF(K(1,10).GT.4.OR.MA(1,7).LE.4)GO TO 5000
      J=1
      WRITE(L,4010)
4010  FORMAT(' DR. MCCOY IS DEAD JIM')
C ORIGINALLY IT SAID DR. MCCOY HAS CROAKED - CHANGED NOV. 15/1999
5000  IPHOT(IT)=IPHOT(IT)-IFIX(FLOAT(IPHOT(IT))*FLOAT(MA(IT,3)-K(IT,14))
     */12.)
      K(IT,14)=MA(IT,3)
      IF(MA(IT,8).LT.4.OR.K(IT,3).EQ.1)GO TO 215
      K(IT,3)=1
      WRITE(L,4009)
4009  FORMAT(' CPU SYSTEM 2 HAS BEEN INITIALIZED AND IS TAKING OVER'/
     *' THE FUNCTIONS OF THE DISABLED CPU UNIT')
215   IF(MA(IT,23).GT.K(IT,1))DFLCT(IT)=DFLCT(IT)-(MA(IT,23)-K(IT,1))*3
      K(IT,1)=MA(IT,23)
      JJ=JJ+2*POS(MA(IT,4)-K(IT,7))+3*POS(MA(IT,5)-K(IT,8))
     *+22*POS(MA(IT,6)-K(IT,9))+12*POS(MA(IT,7)-K(IT,10))
     *+3*POS(MA(IT,21)-K(IT,11))+3*POS(MA(IT,22)-K(IT,12))
     *+2*POS(MA(IT,23)-K(lT,13))
      K(IT, 7)=MA(IT, 4)
      K(IT, 8)=MA(IT, 5)
      K(IT, 9)=MA(IT, 6)
      K(IT,10)=MA(IT, 7)
      K(IT,11)=MA(IT,21)
      K(IT,12)=MA(IT,22)
      K(IT,13)=MA(IT,23)
      NOMAP(IT)=15-MA(IT,33)
      GO TO 500
100   IPHOT(IT)=IPHOT(IT)-FLOAT(IPHOT(IT)*(MA(IT,29)+MA(IT,30)-
     *K(IT,14)))/24
      K(IT,14)=MA(IT,29)+MA(IT,30)
      IF(MA(IT,5).LT.4.OR.K(IT,3).EQ.1)GO TO 101
      K(IT,3)=1
      WRITE(L,4007)
101   IF(MA(IT,13).GT.K(IT,1))DFLCT(IT)=DFLCT(IT)-(MA(IT,13)-K(IT,1))*3
      K(IT,1)=MA(IT,13)
      JJ=JJ+I8*POS(MA(IT,8)-K(IT,7))+POS(MA(IT,10)-K(IT,8))+
     *2*POS(MA(IT,11)-K(IT,9))+4*POS(MA(IT,17)-K(IT,10))+
     *11*POS(MA(IT,19)-K(IT,11))+4*POS(MA(IT,21)-K(IT,12))+
     *9*POS(MA(IT,22)-K(IT,13))
      K(IT, 7)=MA(IT, 8)
      K(IT, 8)=MA(IT,10)
      K(IT, 9)=MA(IT,11)
      K(IT,10)=MA(IT,17)
      K(IT,11)=MA(IT,l9)
      K(IT,12)=MA(IT,21)
      K(IT,13)=MA(IT,22)
      NOMAP(IT)=I5-MA(IT,13)
500   CALL RANDO(IV,J,JJ)
      CALL RANDO(N,J,JJ)
      CALL RANDO(IC,0,JJ)
      CALL RANDO(IVVV,0,JJ)
      IF(N.GT.IV)IV=N
      NDEAD(IT)=NDEAD(IT)-IV
      IF(NDEAD(IT).GT.0)GO TO 5001
      IV=IV+NDEAD(IT)
      NDEAD(IT)=0
      IC=0
      IVVV=0
5001  IGO(IT)=0
      WRITE(L,406)IV,IC,IVVV
406   FORMAT('CASUALTIES-',I5,' KILLED',5X,I5,' WOUND',5X,I5,' MAIMED')
232   CONTINUE
      RETURN
      END

C -- DONALD ECCLESTONE AND DAN GAHLINGER SUBPROGRAM FOR T R E K 7 --
C
C - FORBIN
C
      SUBROUTINE FORBIN(J,I,L,NA)
      COMMON /W/IDEX(2,33,20)
      K=16
2     IF(IDEX(J,I,K).NE.'     ')GO TO 1
      K=K-1
      GO TO 2
1     WRITE(L,3)NA,(IDEX(J,I,M),M=1,K)
3     FORMAT(A1,1X,20A4)
      RETURN
      END

C - DONALD ECCLESTONE AND DAN GAHLINGER SUBPROGRAM FOR T R E K 7 --
C
C - QUARK -
C
      SUBROUTINE QUARK(L)
      COMMON /A/IT,IS,II(2),IJ(2),I3,JS,ISHAK,NOSTOP
      COMMON /C/L1,A,B,I,NA,IV,I7,I8,N,DISTP,AJUST,MIN,ISTAT,JTK,KOENIG,
     *IGNORE,IO,IGOL(80)
      COMMON /O/MA(4,33),K(4,14),NOMAP(4),MANUM(4),HIVEL(4,2),ITEMP(4),
     *NOMOV(4)
      COMMON /T/ICHOE(4),ICHOS(8),ICHOB(2)
         COMMON /TOM/ITOM
      CALL RANDO(IV,1,35)
      IF(IV.GT.7)GO TO 4015
      GO TO(40152,4016,4018,40150,40151,40209,4021),IV
40152 WRITE(L,4017)
4017  FORMAT(' MR. SPOCK IS MAKING OBSCENE GESTURES BEHIND YOUR BACK')
      GO TO 4015
4016  WRITE(L,4019)
4019  FORMAT('SCOTTYS MAKING RATHER DUBIOUS COMMENTS AB.T YER ANCESTRY')
      GO TO 4015
4018  WRITE(L,4020)
4020  FORMAT(' A MESSAGE HAS BEEN RECEIVED OVER SVB-SPACE RADIO. MESSAGE
     * AS FOLLOWS-'//25X,'--DIE FEDERATION PIGS--'//)
      GO TO 4015
40150 WRITE(L,40200)
40200 FORMAT(' THE ENTERPRISE''S PRIZE TURNIP HAS RUPTURED'/' DESTROYING
     * THE CREW''S MORALE')
      GO TO 4015
40151 IF(II(2)+ICHOS(1).EQ.0)GO TO 4015
      CALL RANDO(IVVV,1,30000)
      AJUST=63.*FLOAT(IVVV)
      WRITE(L,40201)AJUST
40201 FORMAT(' THE KLINGONS HAVE JUST BEAMED ABOARD ',F8.0,' TRIBBLES')
      GO TO 4015
40209 IF(K(1,10).GT.4)GO TO 4015
      WRITE(L,4022)
4022  FORMAT(' DR. MCCOY IS PASSING OUT THE CYANIDE TABLETS')
      GO TO 4015
4021  IF(K(1,10).GT.4)GO TO 4015
      WRITE(L,4023)
4023  FORMAT(' SPOCK HAS MADE DR. MCCOY AN HONOURARY VULCAN'/' BY STUFFI
     *NG HIS EARS IN A PENCIL SHARPENER')
4015  RETURN
      END

C - DONALD ECCLESTONE AND DAN GAHLINGER SUBPROGRAM FOR T R E K 7 --
C
C - POS -
C
      INTEGER FUNCTION POS(I)
      POS=I
      IF(POS.LT.0)POS=0
      RETURN
      END