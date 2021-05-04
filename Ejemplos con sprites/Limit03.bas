05 'LIMIT03.BAS
10 SCREEN 2
20 SPRITE$(1)=STRING$(8,CHR$(255))
30 DEFINT X,Y
35 LINE(50,60)-(100,65),8,BF
40 X=100:Y=100
50 DH=0:DV=0:rem Desplazamiento en la Horizontal y en la Vertical
60 S=STICK(0)
70 IF S=1 THEN DV=-3
71 IF S=2 THEN DV=-3:DH=3
80 IF S=3 THEN DH=3
81 IF S=4 THEN DH=3:DV=3
90 IF S=5 THEN DV=3
91 IF S=6 THEN DV=3:DH=-3
100 IF S=7 THEN DH=-3
101 IF S=8 THEN DH=-3:DV=-3
102 GOSUB 200 'comprueba obstaculos
109 X=X+DH:Y=Y+DV
110 PUT SPRITE 0,(X,Y),2,1
111 DV=0:DH=0
121 GOTO 60 'Movimiento del sprite del jugador
200 IF POINT(x,y)=8 OR POINT(x+7,y)=8 THEN DH=-DH :REM si chocamos en la horizontal, no movemos el sprite
201 IF POINT(x,y)=8 OR POINT(x,y+7)=8 THEN DV=-DV :REM si chocamos en la vertical, no movemos el sprite
200 'IF POINT(X-5,Y-5)=8 THEN X=X-4:Y=Y+4
250 RETURN