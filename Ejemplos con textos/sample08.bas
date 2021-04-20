10 CLS
20 FOR X=1 TO 6
30 LOCATE X,2
40 PRINT"NOMBRE"
50 FOR T=1 TO 100:NEXT T                                                      
60 LOCATE X,2                                                                 
70 IF X < 6 THEN PRINT " "                                                    
80 NEXT X
90 FOR X=30 TO 20 STEP -1                                                     
100 LOCATE X,2                                                                 
110 PRINT "APELLIDO"                                                           
120 FOR T=1 TO 100:NEXT T                                                      
130 LOCATE X+7,2                                                              
140 IF X>20 THEN PRINT " "                                                    
150 NEXT X
