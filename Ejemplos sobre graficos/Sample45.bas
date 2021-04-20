05 'http://msx.tipolisto.es/tilesbasic/
10 screen 2
1' Definimos los 8 bits de nuestro tile para la tabla de tiles
1' o base (12) en basic
30 vpoke 0, 255
40 vpoke 1, 255
50 vpoke 2, 255
60 vpoke 3, 255
70 vpoke 4, 255
80 vpoke 5, 255
90 vpoke 6, 255
100 vpoke 7, 255
1' Definimos los 8 bits de nuestro tile para la tabla de color tiles
1' o base (11) en basic
120 vpoke 8192, 176
130 vpoke 8193, 176
140 vpoke 8194, 128
150 vpoke 8195, 128
160 vpoke 8196, 128
170 vpoke 8197, 128
180 vpoke 8198, 176
190 vpoke 8199, 176
1' Definimos el byte de nuestro tile para la tabla de mapa o nombre de tile
1' Como es el tile 0 le ponemos 0
1' o base (10) en basic
300 vpoke 6144, 0
301 vpoke 6145, 0
302 vpoke 6146, 0
303 vpoke 6147, 0
304 vpoke 6148, 0
305 vpoke 6149, 0
306 vpoke 6150, 0

500 goto 500