10 Y=INT(RND(1)*10)
20 CLS
30 PRINT "ADIVINA MI NUMERO"
40 PRINT "-----------------":PRINT
50 INPUT "DAME UN NUMERO (0-9)";X
60 IF X < Y THEN PRINT:PRINT "DEBE SER MAYOR":FOR I=1 TO 300:NEXT I:GOTO 20
65 IF X > Y THEN PRINT:PRINT "DEBE SER MENOR":FOR I=1 TO 300:NEXT I:GOTO 20
70 IF Y = X THEN PRINT:PRINT "ACERTASTE MI NUMERO!!"
80 PRINT:PRINT "Mi numero era:";Y