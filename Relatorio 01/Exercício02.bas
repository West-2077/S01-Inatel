10 x = RND(100)
20 input "Adivinhe o numero aleatorio: "; A
30 if A < x THEN GOTO 100
40 if A > x THEN GOTO 200 else GOTO 300

100 print "Numero muito baixo"
101 GOTO 30
200 print "Numero muito alto"
201 GOTO 30
300 print "Parabens amigo, voce e um guerreiro"
0  END
