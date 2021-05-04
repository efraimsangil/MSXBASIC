20 cls:screen 2,1
1' Rellenamos la tabla de tiles
30 gosub 100
1' Rellenamos la tabla de color tiles
40 gosub 200
1' Rellenamos la tabla de nombre
50 gosub 300
60 goto 60

1' Vamos a introducir los datos en la tabla tiles
1 '--------------------------------------------------------------'
100 '           Subrutina escribir bytes en tablas tiles
1 '--------------------------------------------------------------'
1' 4 tiles por 8 bytes cada tile menos el 1 byte que no se cuenta
   101 for i=0 to (4*8)-1
        102 read a
        103 vpoke i, a
    104 next i
105 return

1' Vamos a introducir los datos en la tabla color tiles
1 '--------------------------------------------------------------'
200 '           Subrutina escribir bytes en tablas color tiles
1 '--------------------------------------------------------------'
1' Si quisiermaos poner todos los tiles tendríamos que poner 8192+((4*8)-1)
1' 4 tiles por 8 bytes cada color tile menos el 1 byte que no se cuenta
    201 for i=8192 to 8192+((4*8)-1)
        203 read a
        204 vpoke i, a
    205 next i
206 return

1' Vamos a escribir los datos de la tabla map o nombres
1 '--------------------------------------------------------------'
300 '           Subrutina escribir bytes en tabla map o nombres
1 '--------------------------------------------------------------'
1' El 1 banco son 256 bytes
    301 for i=6144 to 6144+(256-1)
        303 read a
        304 vpoke i, a
    305 next i
406 return

1 'BANK_PATTERN_0:
1' tile 0 sonlos ladrillos
10000 data  0, 127, 127, 0, 159, 143, 159, 0
1' Tile 1 es el de color azul
10001 data  0, 127, 127, 0, 159, 143, 159, 0
1' Tile 2 es el suelo
10002 data  255, 255, 255, 255, 0, 0, 0, 0
1' Tile 3 son las nubes
10003 data  195, 142, 0, 0, 0, 1, 99, 32

1 'BANK_COLOR_0:
10768 data  48, 192, 48, 48, 0, 192, 48, 48
10769 data  119, 119, 119, 119, 119, 119, 119, 119
10770 data  115, 115, 195, 195, 115, 115, 115, 115
10771 data  255, 247, 247, 247, 247, 247, 247, 255

1 'SCREEN_0_0:
15000 data  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  3,  3,  1
15001 data  1,  1,  1,  1,  1,  1,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  1,  1,  1,  1,  1,  1,  1,  1,  1,  3,  3,  3,  3
15002 data  1,  3,  1,  1,  1,  1,  1,  3,  3,  3,  3,  3,  3,  3,  3,  3,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  3
15003 data  1,  3,  1,  1,  1,  1,  1,  1,  1,  1,  1,  3,  3,  1,  1,  1,  1,  1,  1,  1,  1,  1,  3,  3,  3,  3,  1,  1,  1,  1,  1,  1
15004 data  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  3,  3,  3,  3,  1,  1,  1,  1,  1,  1
15005 data  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1
15006 data  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1
15007 data  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1
