(define
	(domain sokoban)
	(:requirements :adl)
	(:predicates
		(paczka ?x)
		(cel ?x)
		(robot ?x)
		(poziomo ?x ?y)
		(pionowo ?x ?y)
	)
	(:action idz
	   :parameters(?x ?y)
	   :precondition
	   (and
			(robot ?x)
			(not (paczka ?y))
			(or
				(poziomo ?x ?y)
				(pionowo ?x ?y)
			)
		)
	   :effect
		(and
			(not (robot ?x))
			(robot ?y)
		)
	)
	
	(:action pchaj
		:parameters(?x ?y ?z)
		:precondition
		(and
			(robot ?x)
			(paczka ?y)
			(not (= ?x ?z))
			(not (= ?y ?z))
			(not (paczka ?z))
			(or
				(and
					(poziomo ?x ?y)
					(poziomo ?y ?z)
				)
				(and
					(pionowo ?x ?y)
					(pionowo ?y ?z)
				)
			)
		)
		:effect
		(and
			(not (robot ?x))
			(robot ?y)
			(not (paczka ?y))
			(paczka ?z)
		)
	)
)