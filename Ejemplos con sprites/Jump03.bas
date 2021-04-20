10 ' JUMP03.BAS
11 ' Salto direccional
20 ' V= velocidad salto
30 ' SA=0 tocando suelo
40 ' SA=1 saltando
50 ' F1= tope salto
60 SCREEN 2:X=100:Y=170:F1=100:V=2:SA=0:DRAW"c2bm80,178R48"
70 SPRITE$(0)=STRING$(8,&B11111111)
80 S=STICK(0):PUT SPRITE 0,(X,Y),15,0
90 IF SA=1 THEN GOSUB 120 ' Cursor arriba
100 IF S=1 THEN SA=1
101 'IF S=2 THEN Y=Y-3:X=X+3 ' Cursor arriba-derecha
102 IF S=3 THEN X=X+3 ' Cursor derecha
103 'IF S=4 THEN X=X+3:Y=Y+3 'Cursor abajo-derecha
104 'IF S=5 THEN Y=Y+3 'Cursor abajo
105 'IF S=6 THEN Y=Y+3:X=X-3 'Cursor abajo-izquierda
106 IF S=7 THEN X=X-3 ' Cursor izquierda
107 'IF S=8 THEN X=X-3:Y=Y-3 ' Cursor arriba-izquierda
110 GOTO 80 ' Esperando que se pulse cualquier dirección del cursor
120 Y=Y-V ' El eje Y decrementa de 2 en 2, que es lo que vale V. Luego el sprite SUBE
130 IF Y<F1 THEN V=-V ' Como el tope de subida del sprite es 100, esto comprueba que suba el sprite hasta que Y llege a ese tope y restamos 1 a V para que el sprite suba.
140 IF Y>170 THEN Y=170:SA=0:V=-V ' Limitamos que el sprite baje más de Y=170, reiniciamos la variable de salto, para poder saltar de nuevo y restamos 1 a V para que el sprite suba. 
150 RETURN
