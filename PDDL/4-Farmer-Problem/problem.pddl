(define (problem p1)
	(:domain farmer)
	(:objects farmer - farmer owca wilk kapusta)
	(:init
		(moze_zjesc wilk owca)
		(moze_zjesc owca kapusta)
		(not (lokacja farmer))
		(not (lokacja owca))
		(not (lokacja wilk))
		(not (lokacja kaputsta))
	)
	(:goal
		(and
			(lokacja farmer)
			(lokacja owca)
			(lokacja wilk)
			(lokacja kapusta)			
		)
	)
)