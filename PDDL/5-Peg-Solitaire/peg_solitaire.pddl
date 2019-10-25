(define
	(domain peg_solitaire)
	(:requirements :adl)
	(:predicates
		(trojka ?x ?y ?z)
		(zajety ?x)
	)
	(:action bij
	   :parameters(?z ?przez ?na)
	   :precondition
	   (and
			(zajety ?z)
			(zajety ?przez)
			(not (zajety ?na))
			(or
				(trojka ?z ?przez ?na)
				(trojka ?na ?przez ?z)
			)
		)
	   :effect
		(and
			(not (zajety ?z))
			(not (zajety ?przez))
			(zajety ?na)
		)
	)
)