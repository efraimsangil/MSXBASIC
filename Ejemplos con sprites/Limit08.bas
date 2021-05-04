10 'LIMIT08.bas
20 'Varios puntos a tener en cuenta:
30 '-el salto solo debe gestionar la acción de subir, la bajada debe controlarla una subrutina aparte (300)
40 '-para poder saltar deben darse las condiciones: pulsar arriba, que no esté saltando antes y que tenga suelo debajo (140)
50 '-IS es un índice que apunta a un array con la velocidad de salto. En condiciones normales, vale 1, cuyo valor de decremento de Y es 0 (no salto)
60 '-no está terminado de controlar durante el salto el control de choque con la pared, igual bastaría con un 193 if point(x+11,y)<>1 then return
70 '-la caída es lineal. quedaría mejor hacer algo parecido al salto con un indice que incremente, hasta un límite, y que apunte al array IN, pero en lugar de restar a la Y, lo sumaría, siempre que el IC, indice de caida sea >1
80 DIM IN(6)
90 IN(6)=16
100 IN(5)=12
110 IN(4)=8
120 IN(3)=4
130 IN(2)=2
140 IN(1)=0
150 COLOR 12,1,1:SCREEN 2
160 DRAW"BM00,150":DRAW"C4R28U30R28U30R28U30R28U30R28"
180 DRAW"BM00,151":DRAW"C4R29U30R28U30R28U30R28U30R28"
200 DRAW"BM00,152":DRAW"C4R30U30R28U30R28U30R28U30R28"
220 DRAW"BM00,153":DRAW"C4R31U30R28U30R28U30R28U30R28"
231 DRAW"BM00,154":DRAW"C4R32U30R28U30R28U30R28U30R28"
233 DRAW"BM00,155":DRAW"C4R33U30R28U30R28U30R28U30R28"
235 DRAW"BM00,156":DRAW"C4R34U30R28U30R28U30R28U30R28"
240 SPRITE$(0)=STRING$(8,CHR$(255))
250 X=8
260 Y=142
270 F1=100
280 IS=1:'indice salto
290 PUT SPRITE 0,(X,Y),12,0
300 D=STICK(0)
310 IF IS>1 THEN GOSUB 540:REM ARRIBA
320 IF D=1 AND IS=1 AND POINT(X,Y+8)<>1 THEN IS=6
330 IF D=3 THEN GOSUB 370:REM DERECHA
340 IF D=7 THEN GOSUB 500:REM IZQUIERDA
350 GOSUB 580 :REM caida
360 GOTO 290
370 'Derecha
440 IF POINT(X+8,Y)<>1 THEN RETURN
450 IF POINT(X+9,Y)<>1 THEN RETURN
460 IF POINT(X+10,Y)<>1 THEN RETURN
470 IF POINT(X+11,Y)<>1 THEN RETURN
480 X=X+4
490 RETURN
500 'Izquierda
501 IF POINT(X,Y)<>1 THEN RETURN
503 IF POINT(X-2,Y)<>1 THEN RETURN
520 X=X-4
530 RETURN
540 'Salto
550 Y=Y-IN(IS)
560 IS=IS-1
570 RETURN
580 'caida
590 IF IS>1 THEN RETURN:'si esta saltando no puede caer
600 IF POINT(X,Y+8)<>1 THEN RETURN
610 Y=Y+1
620 RETURN
