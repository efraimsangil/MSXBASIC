05 ' MOVE01.BAS
10 SCREEN 2
20 SPRITE$(1)=STRING$(8,CHR$(255))
30 DEFINT X,Y
40 X=0:Y=0:VO=0:VA=0:VB=0:X2=10:Y1=100:VC=0
50 SPRITE ON: ON SPRITE GOSUB 180 'Si hay colision de sprites saltamos a la linea 180
60 S=STICK(0)
70 IF S=1 THEN Y=Y-3
71 IF S=2 THEN Y=Y-3:X=X+3
80 IF S=3 THEN X=X+3
81 IF S=4 THEN X=X+3:Y=Y+3
90 IF S=5 THEN Y=Y+3
91 IF S=6 THEN Y=Y+3:X=X-3
100 IF S=7 THEN X=X-3
101 IF S=8 THEN X=X-3:Y=Y-3
110 PUT SPRITE 0, (X,Y), 2, 1
120 GOSUB 200 ' Movimiento de los sprites autonomos
121 GOTO 60 'Movimiento del sprite del jugador
180 SPRITE OFF:X=0:Y=0:X1=10:X2=20:X3=30:X4=40:Y1=100 ' Desactivamos colision y recolocamos todos los sprites en pantalla
181 PUT SPRITE 0, (X,Y), 2, 1
182 PUT SPRITE 1, (X1,20), 6, 1
183 PUT SPRITE 2, (X2,40), 7, 1
184 PUT SPRITE 3, (X3,60), 8, 1
185 PUT SPRITE 4, (X4,Y1), 9, 1 ' Sprite que nos persigue a muerte
186 SPRITE ON ' Activamos colision de sprites
190 RETURN 110 ' Volvemos a la línea 60
191 'Control del movimiento de los sprites 1 2 3
192 'Que no se salgan de la pantalla y reboten
200 IF X1 < 200 AND VO=0 THEN X1=X1+2 ELSE VO=1
210 IF X1 > 10 AND VO=1 THEN X1=X1-2 ELSE VO=0
220 IF X2 < 200 AND VA=0 THEN X2=X2+3 ELSE VA=1
230 IF X2 > 10 AND VA=1 THEN X2=X2-3 ELSE VA=0
240 IF X3 < 200 AND VB=0 THEN X3=X3+6 ELSE VB=1
250 IF X3 > 10 AND VB=1 THEN X3=X3-6 ELSE VB=0
260 IF X4 >= X THEN X4=X4-1 ELSE X4=X4+1
270 IF Y1 >= Y THEN Y1=Y1-1 ELSE Y1=Y1+1
280 PUT SPRITE 1, (X1,20), 6, 1
290 PUT SPRITE 2, (X2,40), 7, 1
300 PUT SPRITE 3, (X3,60), 8, 1
310 PUT SPRITE 4, (X4,Y1), 9, 1 ' Sprite que nos persigue a muerte
320 RETURN
