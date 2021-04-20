10 ' MOVE07.BAS
20 'Movimiento de sprite en zig-zag hacia abajo.
30 SCREEN 2
40 SPRITE$(1)=STRING$(8,CHR$(255))
50 DEFINT X,Y
60 'Aportacion de JSJ
70 'dim incx(13)=(+1, +1, +2, +2, +3, +4, +6, -4, -3, -2, -2, -1, -1), dim incy(13)=(+1, +1, +1, +1, ...)
80 DIM IX(20)
90 FOR A=0 TO 19
100 IX(A)=SIN(A)*3.141516
110 NEXT A
120 'IX(0)=(+1):IX(1)=(+1):IX(2)=(+2):IX(3)=(+2):IX(4)=(+3):IX(5)=(+4):IX(6)=(+6)
130 'IX(7)=(-1):IX(8)=(-1):IX(9)=(-2):IX(10)=(-4):IX(11)=(-5):IX(12)=(-6)
140 DIM IY(20)
150 FOR A=0 TO 19
160 IY(A)=A*0.2
170 NEXT A
180 'IY=(+1)
190 X=100:Y=170:VO=0:VA=0:VB=0:Y1=20:VC=0:I=0:I2=0:X1=100
200 S=STICK(0)
210 IF S=1 THEN Y=Y-3
220 IF S=2 THEN Y=Y-3:X=X+3
230 IF S=3 THEN X=X+3
240 IF S=4 THEN X=X+3:Y=Y+3
250 IF S=5 THEN Y=Y+3
260 IF S=6 THEN Y=Y+3:X=X-3
270 IF S=7 THEN X=X-3
280 IF S=8 THEN X=X-3:Y=Y-3
290 PUT SPRITE 0, (X,Y), 2, 1
300 GOSUB 330 ' Movimiento de los sprites autonomos
310 GOTO 200 'Movimiento del sprite del jugador
320 'Que no se salgan de la pantalla y reboten
330 I=I+1:I2=I2+0.5
340 IF I=13 THEN I=0
350 IF X1 < 200 AND VO=0 THEN X1=X1+IX(I) ELSE VO=1
360 IF X1 > 10 AND VO=1 THEN X1=X1+IX(I) ELSE VO=0
370 IF Y1 > 100 AND VA=0 THEN Y1=Y1-2 ELSE VA=1
380 IF Y1 < 10 AND VA=0 THEN Y1=Y1+2 ELSE VA=1
390 PUT SPRITE 1, ((X1+IX(I)),(Y1+I2)), 6, 1
400 RETURN
