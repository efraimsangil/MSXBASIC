10 COLOR15,2,1:SCREEN2:DEFINTA-Z:OPEN"GRP:"FOR OUTPUT AS#1
12 GOSUB 2000
15 GOSUB 500
20 FOR C=0TO15:PI=C*8:READ MS$
30 FC=C:IF C=0 THEN FC=15
40 LINE(0,32+PI)-(4*C+23,39+PI),FC,BF:LINE(4*C+24,32+PI)-(4*C+39,39+PI),15,BF:LINE(4*C+40,32+PI)-(255,39+PI),FC,BF
50 PSET(0,33+PI),FC:CL=FC:IF C= 0 OR C=15 THEN COLOR 14:CL=14 ELSE COLOR 15
60 PRINT#1,C
70 LINE(4*C+28,35+PI)-(4*C+31,34+PI),CL:LINE(4*C+31,34+PI)-(4*C+31,37+PI),CL:LINE(4*C+31,37+PI)-(4*C+28,36+PI),CL:PSET(4*C+30,35+PI),CL:PSET(4*C+30,36+PI),CL
80 LINE(4*C+32,33+PI)-(4*C+39,32+PI),CL:LINE(4*C+32,38+PI)-(4*C+39,39+PI),CL
90 IF CL=14 THEN LINE(4*C+40,32+PI)-(4*C+40,39+PI),CL
100 PSET(4*C+48,32+PI),FC:PRINT#1,MS$
120 NEXT
130 FOR T=0 TO 2
140 READ D$:X=32-LEN(D$):PSET(X*4,164 + T*10),2:COLOR15:PRINT#1,D$
150 NEXT
160 GOTO 3000
500 FOR L=1 TO 2
510 FOR X=0 TO 13
520 FOR B=0 TO 7
530 READ A$:V=VAL("&H"+A$)
540 VPOKE(256*L+X*8+B+64),V
550 NEXTB,X,L
990 RETURN
1000 DATA "01","01","03","03","07","07","0f","0f","e0","e0","f0","f0","f8","f8","fc","fc"
1010 DATA "07","07","0f","0f","1f","1f","3f","3f","e0","e0","f0","f0","f8","f8","fc","fc"
1020 DATA "3f","7f","ff","f8","f0","f0","f8","ff","ff","ff","ff","00","00","00","00","fc"
1030 DATA "f0","f8","f8","7c","3c","1e","1f","0f","0f","1f","1e","3c","3c","78","f8","f0"
1040 DATA "3f","7f","ff","f8","f0","f0","f8","ff","ff","ff","ff","00","00","00","00","fc"
1050 DATA "ff","ff","ff","00","00","00","00","00","ff","ff","ff","1e","1e","1e","1e","1e"
1060 DATA "df","bf","bf","78","f0","f0","f0","f0","f8","fc","fe","1f","0f","00","00","00"
1070 DATA "1f","1f","3e","3e","7c","7c","f8","f8","7e","7e","3f","3f","1f","1f","0f","0f"
1080 DATA "7e","7e","fc","fc","f8","f8","f0","f0","7e","7e","3f","3f","1f","1f","0f","0f"
1090 DATA "7f","1f","00","00","80","ff","ff","ff","fe","ff","1f","0f","1f","ff","fe","fc"
1100 DATA "0f","1f","1e","3c","3c","78","f8","f0","f0","f8","78","3c","3c","1e","1f","0f"
1110 DATA "7f","1f","00","00","80","ff","ff","ff","fe","ff","1f","0f","1f","ff","fe","fc"
1120 DATA "00","00","00","00","78","7f","7f","1f","1e","1e","1e","1e","3e","fe","fc","f8"
1130 DATA "f0","f0","f0","f0","78","3f","3f","1f","00","00","00","0f","1f","fe","fc","f8"
2000 DIM MM$(6)
2010 PLAY "v8t100s0m5000l8o5d4c+r16o4b16a4r8gf+4e4d4r8"
2020 MM$(1)="ab4r8bo5c+4r8c+d4r8"
2030 MM$(2)="ddc+o4baar16g16f+"
2040 MM$(3)="o5ddc+o4baar16g16f+"
2050 MM$(4)="f+f+f+f+f+16g16a4r8"
2060 MM$(5)="g16f+16eeee16f+16g4r8"
2070 MM$(6)="f+16e16do5d4o4bar16g16f+gf+4e4d2"
2080 MS=0:ON INTERVAL=25 GOSUB 5000:INTERVAL ON:RETURN
3000 COLOR,,RND(1)*16:A$=INKEY$:IF A$="" THEN 3000 ELSE COLOR15,1,1:END
3020 DATA "","feliz Natal","e otimo Ano Novo!","","merry Christmas","and happy New Year","","buon Natale","e felice Anno Nuovo!","","joyeux Noel","et bonne Annee!","","feliz Navidad","y feliz Ano Nuevo!",""
3030 DATA "Seasons Greetings from Brazil!","code by Rudolf Gutlich","music by Parn"
5000 IF PLAY(0)=-1 THEN RETURN
5010 MS=MS+1: IF MS=7 THEN MS=1
5020 PLAYMM$(MS):RETURN