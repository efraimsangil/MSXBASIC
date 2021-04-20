10 ' Sample20.bas
20 SCREEN 2,0
30 OPEN "GRP:" AS #1
40 DRAW "BM+8,0"
50 PRINT#1,"Regla del quinto sprite. Está seguido de los cuatro primero y no se ve. Luego lo desplazo hacia abajo para mostrar el efecto."
60 SPRITE$(0)=STRING$(8,CHR$(255))
70 PUT SPRITE 0,(20,100),15,0
80 PUT SPRITE 1,(40,100),15,0
90 PUT SPRITE 2,(60,100),15,0
100 PUT SPRITE 3,(80,100),15,0
110 FOR T=1 TO 500:NEXT T
120 FOR Y=100 TO 110
130 FOR T=1 TO 500:NEXT T
140 PUT SPRITE 4,(100,Y),15,0
150 NEXT Y
160 GOTO 110
