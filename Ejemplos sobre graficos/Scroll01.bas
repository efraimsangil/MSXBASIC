10 SCREEN 0:WIDTH 40
20 LOCATE 2,9:PRINT"Esta frase se deslocara ..."
30 FOR I=0 TO 39
50 EY=40*9 : ' Endereço inicial da linha
60 FOR X=1 TO 39
70 E=X+EY
80 VPOKE E-1,VPEEK(E)
90 NEXT X,I
