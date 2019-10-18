(define
	(domain farmer)
	(:requirements :adl)
	(:types farmer)
	(:predicates
		(zachod ?x)
		(moze_zjesc ?x ?y)
	)
	
	(:action plyn_wschod
		:parameters (?f - farmer ?x - object)
		:precondition
		(and
			(not (zachod ?f))
			(not (zachod ?x))
			(not (exists (?o1 ?o2)
				(and
					(not (= ?o1 ?x))
					(not (= ?o2 ?x))
					(moze_zjesc ?o1 ?o2)
					(not (zachod ?o1))
					(not (zachod ?o2))
				)
			))
		)
		:effect
		(and
			(zachod ?f)
			(zachod ?x)
		)
	)
	
	(:action plyn_zachod
		:parameters (?f - farmer ?x - object)
		:precondition
		(and
			(zachod ?f)
			(zachod ?x)
			(not (exists (?o1 ?o2)
				(and
					(not (= ?o1 ?x))
					(not (= ?o2 ?x))
					(moze_zjesc ?o1 ?o2)
					(zachod ?o1)
					(zachod ?o2)
				)
			))
		)
		:effect
		(and 
			(not (zachod ?f))
			(not (zachod ?x))
		)
	)
)