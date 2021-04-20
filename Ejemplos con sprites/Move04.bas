05 'MOVE04.BAS
10 SCREEN 2
20 SPRITE$(1)=STRING$(8,CHR$(255))
30 DEFINT X,Y
40 X=100:Y=170:VO=0:VA=0:VB=0:X2=10:Y1=20:Y2=0:VC=0
50 'SPRITE ON: ON SPRITE GOSUB 180 'Si hay colision de sprites saltamos a la linea 180
60 S=STICK(0)
70 IF S=1 THEN Y=Y-3
80 IF S=2 THEN Y=Y-3:X=X+3
90 IF S=3 THEN X=X+3
100 IF S=4 THEN X=X+3:Y=Y+3
110 IF S=5 THEN Y=Y+3
120 IF S=6 THEN Y=Y+3:X=X-3
130 IF S=7 THEN X=X-3
140 IF S=8 THEN X=X-3:Y=Y-3
150 PUT SPRITE 0, (X,Y), 2, 1
160 GOSUB 230 ' Movimiento de los sprites autonomos
170 GOTO 60 'Movimiento del sprite del jugador
180 SPRITE OFF:X=0:Y=0:X1=10:X2=20:X3=30:X4=40:Y1=100 ' Desactivamos colision y recolocamos todos los sprites en pantalla
190 PUT SPRITE 0, (X,Y), 2, 1
200 SPRITE ON ' Activamos colision de sprites
210 RETURN 150 ' Volvemos a la línea 60
220 'Que no se salgan de la pantalla y reboten
230 IF X1 < 200 AND VO=0 THEN X1=X1+2 ELSE VO=1
240 IF X1 = X AND TR=0 THEN TR=1:X2=X:Y2=Y1:GOSUB 300
250 IF TR=1 THEN GOSUB 300
260 IF X1 > 10 AND VO=1 THEN X1=X1-2 ELSE VO=0
270 IF Y2 = 180 THEN Y2=0:X2=10:TR=0:PUT SPRITE 2, (X2,Y2), 7, 0
280 PUT SPRITE 1, (X1,Y1), 6, 1
290 RETURN
300 ' El sprite enemigo nos dispara
310 Y2=Y2+2
320 PUT SPRITE 2, (X2,Y2), 7, 1
330 RETURN
