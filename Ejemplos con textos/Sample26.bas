10 COLOR 15,1,1
20 screen 1,2,0
110 B$=""
120 FORI=0TO31
121   READ A$:A=VAL("&H"+A$)
122   B$=B$+CHR$(A)
123   VPOKE K*32+I, A
129 NEXTI
130 SPRITE$(0)=B$
140 VPOKE &H2000,&HF0:VPOKE &H2001,&HF0:VPOKE &H2002,&HF0:VPOKE &H2003,&HF0:

190 PS=1:X=96:Y=48
200 ON STICK(0) GOTO 210,201,230,201,250,201,270,201
201 GOTO 300
210 Y=Y-8:VPOKE SP+32,&H20:VPOKE SP+33,&H20
219 GOTO 300
230 X=X+8:VPOKE SP,&H20:VPOKE SP+32,&H20
239 GOTO 300
250 Y=Y+8:VPOKE SP,&H20:VPOKE SP+1,&H20
259 GOTO 300
270 X=X-8:VPOKE SP+1,&H20:VPOKE SP+33,&H20
279 GOTO 300
300 'PUT SPRITE 0,(X, Y),8,0
301 SP=&H1820+X/8+(Y/8)*32
302 'VPOKE SP-1,&H20:VPOKE SP+2,&H20:VPOKE SP+31,&H20:VPOKE SP+34,&H20
303 VPOKE SP,  0 :VPOKE SP+1,2 :VPOKE SP+32,1 :VPOKE SP+33,3
310 GOTO 200

910 DATA 00,00,00,00,00,00,80,E0,70,7F,7F,BF,BF,BF,78,E0,00,00,00,00,00,00,00,00,00,00,98,FF,F8,00,00,00