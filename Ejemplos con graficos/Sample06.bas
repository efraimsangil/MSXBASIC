10 REM
20 REM by chris ratcliffe
30 REM
40 REM set up for high res
50 SCREEN 2
60 COLOR11,0,0
70 REM loop to read in the data
80 REM for the first 5 standard
90 REM patterns
100 FORT=1TO5
110 READR
120 GOSUB230:REM draw pattern
130 NEXT
140 REM loop to draw random patterns
150 R=(RND(1)*5)+1.3
160 GOSUB230:REM do random pattern
170 GOTO 150
180 REM main pattern routine
190 REM clear screen and initialise
200 REM colour $ first line
210 REM black and reset scanling
220 REM factor to max
230 CLS:I=0:O=1
240 FORA=0TO2999:NEXT
250 FORA=OTO300 STEPR
260 X=130+COS(A)*120*O
270 Y=95+SIN(A)*94*O
280 REM draw line to new coordinates
290 LINE -(X,Y),I
300 REM reduce scaling factor and
310 REM set plot colourto yellow
320 O=O*.997:I=11:NEXT
330 REM pause loop after drawing
350 RETURN
360 REM data for five patterns
370 REM standard patterns
380 DATA3.1,2.11,1.58,1.24,1.832