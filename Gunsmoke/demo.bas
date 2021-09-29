screen1
@INIT:
    call speed(100)
    DEFINT A-Z
    color 15,1,1
    key off
    _GLOFF
    _GLINIT
    _DEBUGLOG("Hola estoy aqui!!")
    ON STRIG GOSUB @ActivarBala 'subrutina para activar bala
    GOSUB @SETUPSCREEN
    GOSUB @VARIABLES
    GOSUB @MONTAJEGRAFICO
    GOSUB @PLAYERINIT
    GOSUB @TEXTO
    _GLCALL(0,"PLAY") ' pone en funcionamiento el escenario y su contenido
    _GLON

@MAINGAMELOOP:
    
    S=STICK(0):STRIG(0) ON:_GLCALL(PL1,"SETPOS",X1,Y1)
    IF S=0 THEN _GLCALL(PL1,"setanimation","andar")
    IF S=1 THEN Y1=Y1-VE:_GLCALL(PL1,"setanimation","andar"):GOSUB @PLAYERSCREENLIMITS: '  _GLCALL(PL1,"setanimation","JUMP")
    IF S=2 THEN X1=X1+VE:Y1=Y1-VE:_GLCALL(PL1,"setanimation","diagonal"):_GLCALL(PL1,"SETHFLIP",0):GOSUB @PLAYERSCREENLIMITS: '  _GLCALL(PL1,"setanimation","JUMP")
    IF S=3 THEN X1=X1+VE:_GLCALL(PL1,"setanimation","andar"):GOSUB @PLAYERSCREENLIMITS
    IF S=4 THEN X1=X1+VE:Y1=Y1+VE:_GLCALL(PL1,"setanimation","diagonal"):_GLCALL(PL1,"SETHFLIP",1):GOSUB @PLAYERSCREENLIMITS
    IF S=5 THEN Y1=Y1+VE:_GLCALL(PL1,"setanimation","andar"):GOSUB @PLAYERSCREENLIMITS
    IF S=6 THEN X1=X1-VE:Y1=Y1+4:_GLCALL(PL1,"setanimation","diagonal"):_GLCALL(PL1,"SETHFLIP",0):GOSUB @PLAYERSCREENLIMITS
    IF S=7 THEN X1=X1-VE:_GLCALL(PL1,"setanimation","andar"):GOSUB @PLAYERSCREENLIMITS
    IF S=8 THEN X1=X1-VE:Y1=Y1-VE:_GLCALL(PL1,"setanimation","diagonal"):_GLCALL(PL1,"SETHFLIP",1):GOSUB  @PLAYERSCREENLIMITS:' _GLCALL(PL1,"setanimation","JUMP")
    IF (S=2 OR S=8) THEN _GLCALL(PL1,"setanimation","diagonal")
    IF SR=1 THEN:_GLCALL(PL1,"setanimation","quiet"):FOR T=1 TO 1000:NEXT T:SR=0
    GOSUB @ComprobarBalas
    ' Movimiento del stage y capa shape
    _GLCALL(P1,"incpos",0,3)
    _GLCALL(bgcol,"incpos",0,3)
    GOSUB @Collision
    _GLCALL(TEXT2,"SETTEXT",BL%(0))
    _GLCALL(TEXT3,"SETTEXT",BL%(1))
    _GLCALL(TEXT4,"SETTEXT",BL%(2))
    GOTO @MAINGAMELOOP

@ComprobarBalas:
    FOR I%=0 TO 2
        ' REM pintamos la bala en la posición que corresponda
        IF BL%(I%) <> 0 THEN _GLCALL(B1%(I%),"setanimation","shoot"):_GLCALL(B1%(I%),"setpos",BP%(I%,0),BP%(I%,1))
        ' REM modificamos la posición en X si hiciera falta
        BP%(I%,0)=BP%(I%,0)-N 
        ' REM modificamos la posición en Y si hiciera falta
        BP%(I%,1)=BP%(I%,1)-M 
        ' REM chequear los choques con el decorado, malos, etc...
        REM la bala I% es menor de 300 en el eje Y, hay que quitarla para poder reutilizarla
	    IF BP%(I%,1)<300 THEN _GLCALL(B1%(I%),"setanimation","endshoot"):BL%(I%)=0
    NEXT
    RETURN

@ActivarBala:
    C%=-1
    ' buscamos si podemos hacer más disparos
    FOR I%=0 TO 2
        IF BL%(I%) = 0 THEN C%=I%
        ' si encontramos un hueco libre, salimos del bucle. También podriamos hacer I%=5 y al hacer NEXT se sale
        IF C%<>-1 THEN BL%(C%)=1:GOTO @FINFOR
    NEXT
    
@FINFOR:    
    ' activamos la bala que toque C%, si hay espacio libre y establecemos su posición inicial en (X,Y)
    IF C%<>-1 THEN BL%(C%)=1:BP%(C%,0)=_GLCALL(PL1,"getX"):BP%(C%,1)=_GLCALL(PL1,"getY")
    RETURN

@MONTAJEGRAFICO:
    ' pantalla 1 (256X212)
    _GLCALL(P1,"addframe","graphics/GunSmoke-Round1.png")
    _GLCALL(P1,"setpos",0,-6150)
    _GLCALL(P1,"setscaleX",1.8)
    _GLCALL(P1,"setscaleY",2.2)
    _GLCALL(P1,"setpriority",2)
    bgcol = _GLNEW(st, "bgcol", "gl_sprite")
    _GLCALL(bgcol, "setvisible", 0)  ' esto es para que se vea, lo normal es que esté quitado en modo normal y puesto en modo debug
    _GLCALL(bgcol, "setflags", 4)
    _GLCALL(bgcol,"addframe","graphics/Round1_Shape.png")
    _GLCALL(bgcol, "setflags", 0)
    _GLCALL(bgcol,"setpos",0,-6150)
    _GLCALL(bgcol,"setscaleX",1.8)
    _GLCALL(bgcol,"setscaleY",2.2)
    _GLCALL(bgcol,"setpriority",3)
    ' Creacion sprites de balas
    FOR L=0 to 2
        B1%(L) = _GLNEW(st, "Bala1" + chr$(48+L), "gl_sprite")
		_GLCALL(B1%(L),"addanimationwithsheet","shoot","graphics/Bala1.png" ,0,0,0,0,32,32,-1,-1,-2)
		_GLCALL(B1%(L),"addanimationwithsheet","endshoot","graphics/Bala_Explosion-Sheet.png" ,0,3,0,0,32,32,-1,-1,-2)
		_GLCALL(B1%(L),"setscaleX",1.8)
		_GLCALL(B1%(L),"setscaleY",2.2)
		_GLCALL(B1%(L),"setpriority",3)
		_GLCALL(B1%(L), "setcollision", 1)
        _GLCALL(B1%(L), "setType", 1)		
    NEXT L
    RETURN

@VARIABLES:
    P1=_GLNEW(ST,"BG","GL_SPRITE")  ' variable (p1) para la pantalla 1
    F=INT(RND(1)*3+3) :   ' valor al azar (F) para seleccion de escenario
    X1=200:Y1=500   ' pocición inicial del player
    DX=1:DY=0:IC=5:  ' DY= incremento de salto  IC= velocidad salto
    VE=6
    SR=1
    sa=0
    DIM B1%(2)
    DIM BL%(2) ' 6 Balas. Aqui guardamos si están activas o no
    DIM BP%(2,2) ' Posición de cada bala ->  [0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]
    FOR I%=0 TO 2:BL%(I%) = 0:NEXT ' Inicializamos las tablas. 0 es false la bala no está activa
    N=0 ' Si es 0 la bala sale recta
    M=15 ' Velocidad de la bala
    RETURN

@Collision:
    GX = _GLCALL(PL1, "getX") 'Posicion actual de Player (eje X)
    GY = _GLCALL(PL1, "getY") 'Posicion actual de Player (eje Y)
    IF (ABS(GX - X1) < 10) THEN SX = 0 ELSE SX = SGN(X1-GX) 'Si vamos hacia delante, SX=0. Si vamos atrás es -1
    IF (ABS(GY - Y1) < 10) THEN SY = 0 ELSE SY = SGN(Y1-GY) 'Si vamos hacia abajo, SY=0. Si vamos arriba es -1
    W = _GLCALL(PL1, "getWF")
    H = _GLCALL(PL1, "getHF")-5
    YBG=_GLCALL(bgCol,"getY")
    C = _GLRED(_GLCALL(bgcol, "getFramePixel", 0, (GX+W/2+SX)/1.8, (-YBG+GY+H+SY)/2.2))
    IF (C = 255) THEN RETURN ELSE Y1=Y1+5:_GLCALL(PL1, "setanimation", "quiet")
    XBG=_GLCALL(bgCol,"getY")
    C = _GLRED(_GLCALL(bgcol, "getFramePixel", 0, (GX+W/2+SX)/1.8, (-XBG+GY+H+SY)/2.2))
    IF (C = 255) THEN RETURN ELSE X1=X1+5:_GLCALL(PL1, "setanimation", "quiet")
    ' C = _GLRED(_GLCALL(bgcol, "getFramePixel", 0, GX+W/2+SX, GY+H))
    ' IF (C == 255) THEN SY = 0 : _GLCALL(PL1, "setanimation", "andar")
    ' C = _GLRED(_GLCALL(bgcol, "getFramePixel", 0, GX+W/2, GY+H+SY))
    ' IF (C == 255) THEN SX = 0
    ' IF (SX = 0 AND SY = 0) THEN _GLCALL(PL1, "setanimation", "andar") : RETURN
    ' IF SX = 0 AND SY > 0 THEN _GLCALL(PL1, "setanimation", "andar")
    ' IF SX = 0 AND SY < 0 THEN _GLCALL(PL1, "setanimation", "andar")
    ' IF SX <> 0 AND SY = 0 THEN _GLCALL(PL1, "setanimation", "andar")
    ' _GLCALL(PL1,"SETPOS",SX*2,SY*2)
    RETURN

@PLAYERSCREENLIMITS:
    ' límites de pantalla izq/dcha para el sprite prota.
    IF _GLCALL(PL1,"GETX") < 5 THEN X1=X1+2
    IF _GLCALL(PL1,"GETX") > 370 THEN X1=X1-2:gosub @changestage
    RETURN

@SETUPSCREEN:
    _GLSCREEN(800,600,2)  ' resolucion+escala
    _GLCALL(0,"setbgcolor",_GLCOLOR(255,0,0,0))  ' color de fondo
    ' creamos un escenario
    ST=_GLNEW(0,"STAGE1","GL_STAGE")  ' variable (st) para el escenario
    _GLCALL(ST,"SETACTIVE") ' activamos el escenario
    _GLCALL(ST,"SETMAIN")  ' establecemos st como escenario principal
    RETURN

@PLAYERINIT:
    ' variable PL1=PLAYER
    PL1=_GLNEW(ST,"PLAYER","GL_SPRITE")  ' creamos nuestro player en el escenario
    _GLCALL(PL1,"setscale",.8)
    _GLCALL(PL1,"addanimationwithsheet","quiet","graphics/Billy_Walk_Sheet.png" ,0,0,0,0,32,32,-1,-1,-2)
    _GLCALL(PL1,"addanimationwithsheet","andar","graphics/Billy_Walk_Sheet.png" ,0,7,0,0,32,32,-1,-1,-1,0.15)
    _GLCALL(PL1,"addanimationwithsheet","diagonal","graphics/Billy_Walking_Diagonal_Sheet.png" ,0,3,0,0,32,32,-1,-1,-1)
    _GLCALL(PL1,"setscale",2)
    _GLCALL(PL1,"setpriority",5)
    _GLCALL(PL1,"setpos",x1,y1)  ' posiciona al player en pantalla
    RETURN

@CHANGESTAGE:
    '  borramos pantalla y colocamos la siguiente.
    ' _GLDELETE(ST) ' Eliminar el escenario
    _GLDELETE(PL1) ' Eliminar el sprite PL1
    _GLOFF ' Apaga la pantalla
    GOSUB @VARIABLES
    ' F=F+1:IF F>5 THEN F=3
    GOSUB @MONTAJEGRAFICO
    GOSUB @PLAYERINIT
    GOSUB @TEXTO
    _glon
    ' _GLCALL(0,"PLAY")
    RETURN

@TEXTO:
    TEXT1=_GLNEW(ST,"HUD","GL_TEXT")
    _GLCALL(TEXT1,"SETFONTNAME","computer_pixel-7.ttf")
    _GLCALL(TEXT1,"SETFONTSIZE","35")
    _GLCALL(TEXT1,"SETTEXT","DEMO DE CONCEPTO"):_GLCALL(TEXT1,"SETCOLOR",_GLCOLOR(255,255,255))
    _GLCALL(TEXT1,"SETPOS",80,10)
    TEXT2=_GLNEW(ST,"HUD","GL_TEXT")
    _GLCALL(TEXT2,"SETFONTNAME","computer_pixel-7.ttf")
    _GLCALL(TEXT2,"SETFONTSIZE","35")
    _GLCALL(TEXT2,"SETCOLOR",_GLCOLOR(255,255,255))
    _GLCALL(TEXT2,"SETPOS",400,10)
    TEXT3=_GLNEW(ST,"HUD","GL_TEXT")
    _GLCALL(TEXT3,"SETFONTNAME","computer_pixel-7.ttf")
    _GLCALL(TEXT3,"SETFONTSIZE","35")
    _GLCALL(TEXT3,"SETCOLOR",_GLCOLOR(255,255,255))
    _GLCALL(TEXT3,"SETPOS",400,30)
    TEXT4=_GLNEW(ST,"HUD","GL_TEXT")
    _GLCALL(TEXT4,"SETFONTNAME","computer_pixel-7.ttf")
    _GLCALL(TEXT4,"SETFONTSIZE","35")
    _GLCALL(TEXT4,"SETCOLOR",_GLCOLOR(255,255,255))
    _GLCALL(TEXT4,"SETPOS",400,50)

    RETURN
