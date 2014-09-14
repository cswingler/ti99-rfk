
10 DIM Q$(19),CQ(19)
15 RANDOMIZE
20 REM  *************************** 
30 REM  RobotFindsKitten 
40 REM  TI 99/4A TI BASIC Version 
50 REM  By Walid Maalouli 
60 REM  May 2007 
70 REM   ***************************    
80 GOSUB 2190
90 GOSUB 2060
100 REM  SCREEN SETUP 
110 CALL CLEAR
120 H$=""
130 CALL CHAR(128,"00000000000000FF")
140 CALL CHAR(129,"0101010101010101")
150 CALL CHAR(130,"8080808080808080")
160 CALL CHAR(131,"FF00000000000000")
170 CALL CHAR(136,"E7FFFFFF7E7E3C18")
180 CALL CHAR(144,"00247E24247E2400")
190 CALL COLOR(13,16,2)
200 CALL COLOR(14,7,2)
210 CALL COLOR(15,15,2)
220 C=5
230 FOR N=1 TO 12
240 IF (N<5)+(N>8)<0 THEN 270
250 CALL COLOR(N,4,2)
260 GOTO 280
270 CALL COLOR(N,C,2)
280 C=C+1
290 NEXT N
300 CALL SCREEN(2)
310 CALL HCHAR(2,2,128,30)
320 CALL VCHAR(3,1,129,19)
330 CALL VCHAR(3,32,130,19)
340 CALL HCHAR(22,2,131,30)
350 S$="ROBOTFINDSKITTEN TI 99/4A"
360 Y=1
370 X=4
380 GOSUB 1280
390 REM  MAIN PROGRAM 
410 FOR N=1 TO 21
420 SX=INT((29-2+1)*RND)+2
430 SY=INT((18-3+1)*RND)+3
440 CALL GCHAR(SY,SX,CC)
450 IF CC<>32 THEN 420
460 IF N<21 THEN 490
470 SC=144
480 GOTO 570
490 SC=INT(94*RND)+33
500 IF SC=35 THEN 490
510 IF (SC>64)+(SC<91)=-2 THEN 490
520 FOR C=1 TO LEN(H$)
530 IF CHR$(SC)=SEG$(H$,C,1)THEN 490
540 NEXT C
550 H$=H$&CHR$(SC)
560 CQ(N-1)=SC
570 CALL HCHAR(SY,SX,SC)
580 NEXT N
590 R=INT(LEN(H$)*RND)+1
600 SK=ASC(SEG$(H$,R,1))
610 RX=SX
620 RY=SY
630 CALL KEY(0,K,S)
640 IF S=0 THEN 630
650 IF (K<>81)+(K<>113)=-2 THEN 670
660 END
670 CALL SOUND(1,4897,20,-4,20)
680 CALL HCHAR(24,1,32,32)
690 CALL HCHAR(23,1,32,32)
700 IF (K<8)+(K>11)=-1 THEN 630
710 ON K-7 GOTO 720,860,1000,1140
720 RX=RX-1
730 IF RX>=2 THEN 760
740 RX=SX
750 GOTO 630
760 CALL GCHAR(RY,RX,CC)
770 IF CC<>32 THEN 820
780 CALL HCHAR(RY,SX,32)
790 CALL HCHAR(RY,RX,144)
800 SX=RX
810 GOTO 630
820 IF CC=SK THEN 1350
830 GOSUB 1710
840 RX=SX
850 GOTO 630
860 RX=RX+1
870 IF RX<=31 THEN 900
880 RX=SX
890 GOTO 630
900 CALL GCHAR(RY,RX,CC)
910 IF CC<>32 THEN 960
920 CALL HCHAR(RY,SX,32)
930 CALL HCHAR(RY,RX,144)
940 SX=RX
950 GOTO 630
960 IF CC=SK THEN 1350
970 GOSUB 1710
980 RX=SX
990 GOTO 630
1000 RY=RY+1
1010 IF RY<=21 THEN 1040
1020 RY=SY
1030 GOTO 630
1040 CALL GCHAR(RY,RX,CC)
1050 IF CC<>32 THEN 1100
1060 CALL HCHAR(SY,RX,32)
1070 CALL HCHAR(RY,RX,144)
1080 SY=RY
1090 GOTO 630
1100 IF CC=SK THEN 1350
1110 GOSUB 1710
1120 RY=SY
1130 GOTO 630
1140 RY=RY-1
1150 IF RY>=3 THEN 1180
1160 RY=SY
1170 GOTO 630
1180 CALL GCHAR(RY,RX,CC)
1190 IF CC<>32 THEN 1240
1200 CALL HCHAR(SY,RX,32)
1210 CALL HCHAR(RY,RX,144)
1220 SY=RY
1230 GOTO 630
1240 IF CC=SK THEN 1350
1250 GOSUB 1710
1260 RY=SY
1270 GOTO 630
1280 REM  TEXT DISPLAY ROUTINE    
1290 FOR N=1 TO LEN(S$)
1300 L=ASC(SEG$(S$,N,1))
1310 CALL HCHAR(Y,X,L)
1320 X=X+1
1330 NEXT N
1340 RETURN
1350 REM  ROBOT FINDS KITTEN ROUTINE 
1360 GOSUB 2400
1370 FOR Y=6 TO 14
1380 CALL HCHAR(Y,2,32,30)
1390 NEXT Y
1400 S$="YOU HAVE FOUND KITTEN!"
1410 X=6
1420 Y=7
1430 GOSUB 1280
1440 S$="WAY TO GO ROBOT!"
1450 X=9
1460 Y=13
1470 GOSUB 1280
1480 CALL HCHAR(10,10,144)
1490 CALL HCHAR(10,11,136)
1500 CALL HCHAR(10,21,136)
1510 CALL HCHAR(10,22,SK)
1520 X1=11
1530 X2=21
1540 FOR N=1 TO 5
1550 CALL HCHAR(10,X1,32)
1560 CALL HCHAR(10,X2,32)
1570 X1=X1+1
1580 X2=X2-1
1590 CALL HCHAR(10,X1,136)
1600 CALL HCHAR(10,X2,136)
1610 NEXT N
1620 S$="PLAY AGAIN? (Y/N)"
1630 X=8
1640 Y=24
1650 GOSUB 1280
1660 CALL KEY(0,K,S)
1670 IF S=0 THEN 1660
1680 IF (K=89)+(K=121)=-1 THEN 90
1690 IF (K<>78)+(K<>110)=-2 THEN 1660
1700 END
1710 REM  ZEN STATEMENTS ROUTINE  
1720 FOR N=0 TO 19
1730 IF CQ(N)<>CC THEN 1760
1740 QL=N
1750 GOTO 1770
1760 NEXT N
1770 IF LEN(Q$(QL))<33 THEN 1880
1780 IF SEG$(Q$(QL),32,1)<>" " THEN 1930
1790 S$=SEG$(Q$(QL),1,32)
1800 X=1
1810 Y=23
1820 GOSUB 1280
1830 S$=SEG$(Q$(QL),33,LEN(Q$(QL))-32)
1840 X=1
1850 Y=24
1860 GOSUB 1280
1870 RETURN
1880 S$=Q$(QL)
1890 X=1
1900 Y=23
1910 GOSUB 1280
1920 RETURN
1930 C=31
1940 IF SEG$(Q$(QL),C,1)=" " THEN 1970
1950 C=C-1
1960 GOTO 1940
1970 S$=SEG$(Q$(QL),1,C)
1980 X=1
1990 Y=23
2000 GOSUB 1280
2010 S$=SEG$(Q$(QL),C+1,LEN(Q$(QL))-C)
2020 X=1
2030 Y=24
2040 GOSUB 1280
2050 RETURN
2060 REM  QUOTE LOADING ROUTINE   
2070 CALL CLEAR
2080 PRINT " Meditating. Please wait..."
2090 N=0
2100 READ Q$(N)
2110 IF Q$(N)<>"*" THEN 2140
2120 RESTORE 2480
2130 GOTO 2100
2140 R=INT(20*RND)+1
2150 IF R>2 THEN 2100
2160 N=N+1
2170 IF N<20 THEN 2100
2180 RETURN
2190 REM  INTRO ROUTINE 
2200 CALL CLEAR
2210 PRINT "  *** robotfindskitten ***":::
2220 PRINT "     TI 99/4A version by:"
2230 PRINT "  Walid Maalouli - May 2007"::
2240 PRINT "In this game, you are"
2250 PRINT "robot (#). Your job is to"
2260 PRINT "find kitten. This task is"
2270 PRINT "complicated by the existance"
2280 PRINT "of various things which are"
2290 PRINT "not kitten. Robot must touch"
2300 PRINT "items to determine if they"
2310 PRINT "are kitten or not."
2320 PRINT "The game ends when"
2330 PRINT "robotfindskitten."
2340 PRINT "Alternatively, you may end"
2350 PRINT "the game by pressing 'Q'."::
2360 PRINT " Press any key to start..."
2370 CALL KEY(0,K,S)
2380 IF S=0 THEN 2370
2390 RETURN
2400 REM  SIREN SOUND 
2410 FOR F=700 TO 900 STEP 5
2420 CALL SOUND(-99,F,0)
2430 NEXT F
2440 FOR F=900 TO 700 STEP -8
2450 CALL SOUND(-99,F,0)
2460 NEXT F
2470 RETURN
2480 DATA "THIS IS A LAGRANGE POINT. DON'T GET TOO CLOSE NOW."
2490 DATA "ON THIS SPOT IN 1962, HENRY WINKLER WAS SICK."
2500 DATA "A SIGNPOST SAYS 'TO KITTEN' BUT LEADS NOWHERE..."
2510 DATA "VLADIMIR LENIN'S CASKET LIES HERE."
2520 DATA "THIS PARTICULAR MONSTROSITY APPEARS TO BE ENIAC."
2530 DATA "A DIGITAL CLOCK. IT'S STUCK AT 2:17 PM."
2540 DATA "JUST THE EMPTY HUSK OF A LOCUST."
2550 DATA "IT'S AN ORDINARY BUST OF BEETHOVEN, PAINTED GREEN??"
2560 DATA "'NO!' SAYS THE BIT."
2570 DATA "IT'S THE HORIZON. NOW THAT'S WEIRD..."
2580 DATA "IT'S NOTHING BUT A G-THANG, BABY."
2590 DATA "YOU FOUND KITTEN! NO, JUST KIDDING."
2600 DATA "THIS WAS NO BOATING ACCIDENT!"
2610 DATA "ANOTHER RABBIT? THAT'S THREE TODAY!"
2620 DATA "A COUPON FOR ONE FREE STEAK-FISH AT YOUR LOCAL DINER."
2630 DATA "A PUDDLE OF MUD."
2640 DATA "YOU HAVE NEW MAIL IN /VAR/SPOOL/ROBOT."
2650 DATA "A LARGE SNAKE BARS YOUR WAY."
2660 DATA "GRIND'EM UP, SPIT'EM OUT. THEY'RE TWIGS."
2670 DATA "THINGY???"
2680 DATA "YOU'VE FOUND THE FABLED AMERICA ONLINE CD GRAVEYARD!"
2690 DATA "A MERE COLLECTION OF PIXELS."
2700 DATA "A BUTTERTONSILS BAR."
2710 DATA "A MARIJUANA BROWNIE."
2720 DATA "A HISTORICAL MARKER SHOWING THE ACTUAL LOCATION OF /DEV/NULL."
2730 DATA "THAT'S MOBIUS DICK, THE CONVOLUTED WHALE. ARRR!"
2740 DATA "YOU'VE FOUND THE FISH. NOT MUCH HELP HERE THOUGH..."
2750 DATA "A TOILET BOWL OCCUPIES THIS SPACE."
2760 DATA "A PILE OF COAXIAL PLUMBING LIES HERE."
2770 DATA "COULD IT BE...A BIG UGLY BOWLING TROPHY?"
2780 DATA "IT'S A CARDBOARD BOX FULL OF 8-TRACKS."
2790 DATA "IT'S A SOLITARY VACCUM TUBE."
2800 DATA "IT'S A CLOUD SHAPED LIKE AN OX."
2810 DATA "NOT KITTEN!"
2820 DATA "IT'S A SET OF WIND-UP CHATTER TEETH."
2830 DATA "IT'S THE WORLD FAMOUS CHAIN OF JOCKSTRAPS."
2840 DATA "NE'ER BUT A POTTED PLANT."
2850 DATA "THIS SUBWOOFER HAS BLOWN-OUT IN 1974."
2860 DATA "JUST A PINCUSHION."
2870 DATA "A 'GET OUT OF JAIL FREE' CARD."
2880 DATA "IT'S 'FINDING KITTEN' BY O'REILLY AND ASSOCIATES."
2890 DATA "IT'S NOTHING BUT A CORRUPTED FLOPPY. COASTER ANYONE?"
2900 DATA "IT'S A RIM SHOT. BA-DA-BOOM!"
2910 DATA "A BOX OF FUMIGATION PELLETS."
2920 DATA "AH, THE UNIFORM OF A REVOLUTIONARY ERA MINUTEMAN."
2930 DATA "A TEAM OF ARCTIC EXPLORERS IS CAMPED HERE."
2940 DATA "IT'S A COPY OF 'ZEN AND THE ART OF ROBOT MAINTENANCE'."
2950 DATA "THIS JAR OF PICKLES EXPIRED IN 1957."
2960 DATA "IT'S A CHARCOAL BRIQUETTE, SMOKING AWAY."
2970 DATA "ONE HUNDRED THOUSAND CARPET FIBERS!!!"
2980 DATA "A DODECAHEDRON BARS YOUR WAY."
2990 DATA "PLENTY OF NOTHING."
3000 DATA "THIS CORRODED ROBOT IS CLUTCHING A MITTEN."
3010 DATA "A PIZZA, MELTING IN THE SUN."
3020 DATA "IT'S A ZEN SIMULATION, TRAPPED WITHIN AN ASCII CHARACTER."
3030 DATA "A TRAIN OF THOUGHT CHUGS THROUGH HERE."
3040 DATA "A SIGN READS: 'NO ROBOTS ALLOWED'."
3050 DATA "A BLACK HOLE. DON'T FALL IN!"
3060 DATA "A BRAIN CELL. ODDLY ENOUGH, IT SEEMS TO BE FUNCTIONING."
3070 DATA "IT'S A LIMBO BAR. HOW LOW CAN YOU GO?"
3080 DATA "A PATCH OF MUSHROOMS GROWS HERE."
3090 DATA "A TEXAS INSTRUMENTS OF DESTRUCTION CALCULATOR."
3100 DATA "IT'S A HANDHELD ROBOTFINDSKITTEN, BY TIGER."
3110 DATA "IT'S KITT, THE TALKING CAR."
3120 DATA "IT'S CREEPY AND IT'S KOOKY."
3130 DATA "WHAT IN THE BLAZES IS THIS?"
3140 DATA "THIS IS A REMOTE CONTROL."
3150 DATA "AN 80286 MACHINE."
3160 DATA "THE WORLD'S BIGGEST MOTZAH BALL!"
3170 DATA "IT'S THE ASTOUNDING META OBJECT."
3180 DATA "HEART OF DARKNESS BRAND OF PISTACHIO NUTS."
3190 DATA "A MAGICAL...MAGIC THING."
3200 DATA "A HELICOPTER HAS CRASHED HERE."
3210 DATA "THIS KIND OF LOOKS LIKE KITTEN, BUT IT'S NOT."
3220 DATA "ONE OF THE FEW REMAINING DISCOES."
3230 DATA "SEVEN 1/4 INCH SCREWS AND A PIECE OF PLASTIC."
3240 DATA "IT'S A HUNDRED DOLLAR BILL."
3250 DATA "IT'S THE MISSING CHAPTER OF 'A CLOCKWORK ORANGE'."
3260 DATA "IT'S A DVORAK KEYBOARD."
3270 DATA "A TRASH COMPACTOR, COMPACTING AWAY."
3280 DATA "IT'S AN AUTOMATED ROBOT DISDAINER."
3290 DATA "A CAN OF SPAM LITE."
3300 DATA "JUST A MOLDY LOAF OF BREAD."
3310 DATA "EMPTY JEWEL BOXES LITTER THE LANDSCAPE."
3320 DATA "A HERD OF WILD COFFEE MUGS SLUMBERS HERE."
3330 DATA "A TRIBE OF CANNIBALS LIES HERE. THEY'RE EATING CEREAL."
3340 DATA "AN AUTOMATED ROBOT LIKER. IT SMILES AT YOU."
3350 DATA "IT'S ANOTHER MORE ADVANCED ROBOT, STRANGELY IMMOBILE."
3360 DATA "THIS IS A TASTY LOOKING BANANA CREAM PIE."
3370 DATA "IT'S A SEGMENTATION FAULT. CORE DUMPED BY THE WAY."
3380 DATA "IT'S A FLY ON THE WALL."
3390 DATA "A GEYSER SPRAYS WATER HIGH INTO THE AIR."
3400 DATA "IT'S THE PROVERBIAL WET BLANKET."
3410 DATA "AN EMPTY SHOPPING BAG. PAPER OR PLASTIC?"
3420 DATA "IT'S THE BASS-MATIC '76. NOW THAT'S GOOD BASS!"
3430 DATA "A WILLING RIPE TOMATO BEMOANS YOUR INABILITY TO DIGEST FRUIT."
3440 DATA "A STACK OF 7 INCH FLOPPIES WOBBLES PRECARIOUSLY."
3450 DATA "A NON-DESCRIPT BOX OF CRACKERS."
3460 DATA "IT'S A ROLL OF INDUSTRIAL STRENGTH COPPER WIRE."
3470 DATA "IT'S THE CONSTELLATION PISCES."
3480 DATA "THIS IS AN ANAGRAM."
3490 DATA "A SET OF KEYS TO A 2001 ROLLS ROYCE. WORTHLESS."
3500 DATA "A HAMMOCK STRETCHED BETWEEN A TREE AND A VOLLEYBALL POLE."
3510 DATA *
