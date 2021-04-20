100 COLOR 15,14,0:SCREEN 2,2
105 RESTORE 105:FOR J%=0 TO 7:READ K%:LINE (0,J%*8)-STEP(255,7),K%,BF:NEXT J%:DATA 8,9,10,11,3,7,5,13
110 RESTORE 160:FOR J%=0 TO 15:K$="":FOR I%=0 TO 31:READ L$
115 K$=K$+CHR$(VAL("&H"+L$)):NEXT I%:SPRITE$(J%)=K$:NEXT J%
120 K%=8:FOR J%=0 TO 3:FOR I%=0 TO 3
125 PUT SPRITE K%,(96+16*I%,-1+16*J%),1,J%*4+I%
130 K%=K%+1:NEXT I%,J%
135 VDP(0)=VDP(0) OR 2
140 VDP(1)=VDP(1) AND &HE7
145 VDP(3)=&H9F
150 VDP(4)=0
155 GOTO 155
160 DATA 07,1f,3f,7f,70,f1,f1,f1,f1,f1,70,7f,3f,1f,07,00,c0,f0,f8,fc,1c,1e,1e,1e,1e,1e,1c,fc,f8,f0,c0,00
165 DATA 07,1f,3f,7f,78,fc,fc,fc,fc,fc,78,7f,3f,1f,07,00,c0,f0,f8,fc,7c,7e,7e,7e,7e,7e,3c,fc,f8,f0,c0,00
170 DATA 07,1f,3f,7f,70,ff,f0,f1,f1,f1,70,7f,3f,1f,07,00,c0,f0,f8,fc,1c,1e,1e,fe,1e,1e,1c,fc,f8,f0,c0,00
175 DATA 07,1f,3f,7f,78,ff,fc,ff,f1,f1,70,7f,3f,1f,07,00,c0,f0,f8,fc,1c,1e,3e,1e,1e,1e,1c,fc,f8,f0,c0,00
180 DATA 07,1f,3f,7f,71,f1,f1,f1,f0,ff,7f,7f,3f,1f,07,00,c0,f0,f8,fc,fc,1e,1e,1e,1e,1e,1c,fc,f8,f0,c0,00
185 DATA 07,1f,3f,7f,70,f1,f0,ff,f1,f1,70,7f,3f,1f,07,00,c0,f0,f8,fc,7c,fe,1e,1e,1e,1e,1c,fc,f8,f0,c0,00
190 DATA 07,1f,3f,7f,70,f1,f0,f1,f1,f1,70,7f,3f,1f,07,00,c0,f0,f8,fc,7c,fe,1e,1e,1e,1e,1c,fc,f8,f0,c0,00
195 DATA 07,1f,3f,7f,70,f1,ff,fe,fc,fc,7c,7f,3f,1f,07,00,c0,f0,f8,fc,1c,1e,1e,3e,7e,7e,7c,fc,f8,f0,c0,00
200 DATA 07,1f,3f,7f,70,f1,f8,f1,f1,f1,70,7f,3f,1f,07,00,c0,f0,f8,fc,1c,1e,3e,1e,1e,1e,1c,fc,f8,f0,c0,00
205 DATA 07,1f,3f,7f,70,f1,f0,ff,f1,f1,70,7f,3f,1f,07,00,c0,f0,f8,fc,1c,1e,1e,1e,1e,1e,1c,fc,f8,f0,c0,00
210 DATA 07,1f,3f,7f,7c,ff,f0,f1,f1,f1,70,7f,3f,1f,07,00,c0,f0,f8,fc,1c,1e,1e,1e,1e,1e,1c,fc,f8,f0,c0,00
215 DATA 07,1f,3f,7f,71,f1,f0,f1,f1,f1,70,7f,3f,1f,07,00,c0,f0,f8,fc,fc,fe,1e,1e,1e,1e,1c,fc,f8,f0,c0,00
220 DATA 07,1f,3f,7f,70,f1,f1,f1,f1,f1,70,7f,3f,1f,07,00,c0,f0,f8,fc,1c,1e,1e,fe,1e,1e,1c,fc,f8,f0,c0,00
225 DATA 07,1f,3f,7f,7f,ff,f0,f1,f1,f1,70,7f,3f,1f,07,00,c0,f0,f8,fc,1c,1e,1e,1e,1e,1e,1c,fc,f8,f0,c0,00
230 DATA 07,1f,3f,7f,70,f1,f0,f1,f1,f1,70,7f,3f,1f,07,00,c0,f0,f8,fc,1c,1e,1e,fe,1e,1e,1c,fc,f8,f0,c0,00
235 DATA 07,1f,3f,7f,7c,fc,fc,f0,fc,fc,7c,7f,3f,1f,07,00,c0,f0,f8,fc,1c,7e,7e,1e,7e,7e,7c,fc,f8,f0,c0,00
