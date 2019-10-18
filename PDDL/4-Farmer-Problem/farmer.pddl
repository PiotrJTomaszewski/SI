(define
	(domain farmer)
	(:requirements :adl)
	(:types farmer)
	(:predicates
		(lokacja ?x)
		(moze_zjesc ?x ?y)
	)
	
	(:action plyn_wschod
		:parameters (?f - farmer ?x - object)
		:precondition
		(and
			(not (lokacja ?f))
			(not (lokacja ?x))
			(not (exists (?o1 ?o2)
				(and
					(not (= ?o1 ?x))
					(not (= ?o2 ?x))
					(moze_zjesc ?o1 ?o2)
					(not (lokacja ?o1))
					(not (lokacja ?o2))
				)
			))
		)
		:effect
		(and
			(lokacja ?f)
			(lokacja ?x)
		)
	)
	
	(:action plyn_zachod
		:parameters (?f - farmer ?x - object)
		:precondition
		(and
			(lokacja ?f)
			(lokacja ?x)
			(not (exists (?o1 ?o2)
				(and
					(not (= ?o1 ?x))
					(not (= ?o2 ?x))
					(moze_zjesc ?o1 ?o2)
					(lokacja ?o1)
					(lokacja ?o2)
				)
			))
		)
		:effect
		(and 
			(not (lokacja ?f))
			(not (lokacja ?x))
		)
	)
)