10 input"Insira a np1: ";np1
20 input "Insira a np2: ";np2
30  media = (VAL(np1) + VAL(np2))/2
40 if media > 60 THEN GOTO 100
50 if media < 30 THEN GOTO 200
60 if media <= 60 THEN GOTO 70 else GOTO 70
70 input"Insira a np3: ";np3
80 nmedia = (VAL(np3) + VAL(media))/2
90 if nmedia > 50 THEN GOTO 300 else GOTO 400

100 print "Aprovado Direto"
    GOTO 0
200 print "Reprovado Direto"
    GOTO 0
300 print "Aprovado pela NP3"
    GOTO 0
400 print "Reprovado na NP3"
0  END
