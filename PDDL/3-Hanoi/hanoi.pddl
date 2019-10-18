(define
	(domain hanoi)
	(:requirements :adl)
	(:predicates
		(on ?obiektDol ?obiektGora)
		(clear ?x)
		(smaller ?kx ?ky)
		(pole ?p)
		(block ?k)
		(on-pole ?p ?k)
	)
	(:action przesun-na-pusty
		:parameters (?palikZrodlowy ?palikDocelowy ?klocek ?klocekPod)
		:precondition
		(and
			(pole ?palikZrodlowy)
			(pole ?palikDocelowy)
			(block ?klocek)
			(clear ?palikDocelowy)
			(clear ?klocek)
			(on ?klocekPod ?klocek)
			(on-pole ?palikZrodlowy ?klocek)
		)
		:effect
		(and
			(not (clear ?palikDocelowy))
			(not (on ?klocekPod ?klocek))
			(on ?palikDocelowy ?klocek)
			(clear ?klocekPod)
			(not (on-pole ?palikZrodlowy ?klocek))
			(on-pole ?palikDocelowy ?klocek)
		)
	)
	
	(:action przesun
		:parameters (?palikZrodlowy ?palikDocelowy ?klocek ?klocekPod ?klocekPodDoc)
		:precondition
		(and
			(pole ?palikZrodlowy)
			(pole ?palikDocelowy)
			(block ?klocek)
			(block ?klocekPodDoc)
			(clear ?klocek)
			(clear ?klocekPodDoc)
			(smaller ?klocek ?klocekPodDoc)
			(on ?klocekPod ?klocek)
			(on-pole ?palikZrodlowy ?klocek)
			(on-pole ?palikDocelowy ?klocekPodDoc)
		)
		:effect
		(and
			(not (clear ?klocekPodDoc))
			(clear ?klocekPod)
			(not (on ?klocekPod ?klocek))
			(on ?klocekPodDoc ?klocek)
			(not (on-pole ?palikZrodlowy ?klocek))
			(on-pole ?palikDocelowy ?klocek)
		)
	)

)