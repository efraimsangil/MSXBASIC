10 ' MOVE06.BAS
11 'Movimiento de sprite en zig-zag hacia abajo.
20 SCREEN 2
30 SPRITE$(1)=STRING$(8,CHR$(255))
40 DEFINT X,Y
50 'Aportacion de JSJ
60 'dim incx(13)=(+1, +1, +2, +2, +3, +4, +6, -4, -3, -2, -2, -1, -1), dim incy(13)=(+1, +1, +1, +1, ...)
70 DIM IX(13)
80 IX(0)=(+1):IX(1)=(+1):IX(2)=(+2):IX(3)=(+2):IX(4)=(+3):IX(5)=(+4):IX(6)=(+6)
90 IX(7)=(-1):IX(8)=(-1):IX(9)=(-2):IX(10)=(-2):IX(11)=(-4):IX(12)=(-6)
100 DIM IY(13)
110 IY=(+1)
120 X=100:Y=170:VO=0:VA=0:VB=0:Y1=20:VC=0:I=0:I2=0
140 S=STICK(0)
150 IF S=1 THEN Y=Y-3
160 IF S=2 THEN Y=Y-3:X=X+3
170 IF S=3 THEN X=X+3
180 IF S=4 THEN X=X+3:Y=Y+3
190 IF S=5 THEN Y=Y+3
200 IF S=6 THEN Y=Y+3:X=X-3
210 IF S=7 THEN X=X-3
220 IF S=8 THEN X=X-3:Y=Y-3
230 PUT SPRITE 0, (X,Y), 2, 1
240 GOSUB 310 ' Movimiento de los sprites autonomos
250 GOTO 140 'Movimiento del sprite del jugador
300 'Que no se salgan de la pantalla y reboten
310 I=I+1:I2=I2+1
320 IF I=13 THEN I=0
330 IF X1 < 200 AND VO=0 THEN X1=X1+IX(I) ELSE VO=1
340 IF X1 > 10 AND VO=1 THEN X1=X1+IX(I) ELSE VO=0
350 IF Y1 > 100 AND VA=0 THEN Y1=Y1-2 ELSE VA=1
360 IF Y1 < 10 AND VA=0 THEN Y1=Y1+2 ELSE VA=1
380 PUT SPRITE 1, (X1+IX(I),Y1+I2), 6, 1
390 RETURN