05 ' Sample15.bas
06 ' Definicion de un sprite usando otro modo
10 SCREEN 2
20 SPRITE$(0)=CHR$(16)+CHR$(48)+CHR$(112)+CHR$(255)+CHR$(255)+CHR$(112)+CHR$(48)+CHR$(16)
70 PUT SPRITE 0,(100,100),15,0
80 GOTO 80

