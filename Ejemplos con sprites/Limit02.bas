10 ' LIMIT02.BAS
20 SCREEN 2
30 SPRITE$(1)=STRING$(8,CHR$(255))
40 DEFINT X,Y
50 LINE(50,60)-(100,65),8,BF
60 X=100:Y=100
70 S=STICK(0)
80 IF S=1 AND POINT (X-4,Y-2)<>8 THEN Y=Y-3
90 IF S=2 THEN Y=Y-3:X=X+3
100 IF S=3 THEN X=X+3
110 IF S=4 THEN X=X+3:Y=Y+3
120 IF S=5 THEN Y=Y+3
130 IF S=6 THEN Y=Y+3:X=X-3
140 IF S=7 THEN X=X-3
150 IF S=8 THEN X=X-3:Y=Y-3
160 PUT SPRITE 0,(X,Y),2,1
170 GOSUB 190 'comprueba obstaculos
180 GOTO 70 'Movimiento del sprite del jugador
190 RETURN
