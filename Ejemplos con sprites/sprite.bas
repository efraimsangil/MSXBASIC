05 CLS
06 PRINT "Dame codigo a analizar:":INPUT NU
10 'NU=122
20 DIM S$(7)
30 PRINT"Vamos a analizar la letra: ";CHR$(NU)
40 FOR I=0 TO 7
50 S$(I)=BIN$(VPEEK(BASE(2)+(NU*8)+I))
60 IF LEN(S$(I))<8 THEN RE=8-LEN(S$(I)) ELSE 100
70 FOR T=0 TO RE-1
80 PRINT "0";
90 NEXT T
100 PRINT S$(I)
110 NEXT I