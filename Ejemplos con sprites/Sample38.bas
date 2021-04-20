01 ' Sample38.bas
05 ' Colision de sprites. Uno puede atravesar al otro. Si se tocan las partes negras, se activa la colisión, si no, no.
10 SCREEN 2
20 SPRITE$(1) = "DDDDDDDD"
30 DEFINT x,y
40 x=0:y=0
50 SPRITE ON: ON SPRITE GOSUB 150
60 s=stick(0)
70 if s=1 THEN y=y-1
80 if s=3 THEN x=x+1
90 if s=5 THEN y=y+1
100 if s=7 THEN x=x-1
110 put sprite 0, (x,y), 1, 1
120 put sprite 1, (20,20), 1, 1
130 'FOR i=0 to 100:NEXT i      
140 GOTO 60
150 X=0:Y=0
160 RETURN 110
