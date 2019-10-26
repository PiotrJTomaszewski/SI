; Wersja z wykorzystaniem typów zmiennych
(define
	(domain hanoi)
	(:requirements :adl)
	(:types pole block)
	(:predicates
		(on ?obiektDol ?obiektGora)
		(clear ?x)
		(smaller ?kx ?ky)
		(on-pole ?p ?k)
	)
	(:action przesun-na-pusty
		:parameters (?palikZrodlowy ?palikDocelowy - pole ?klocek - block ?klocekPod - object)
		:precondition
		(and
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
		:parameters (?palikZrodlowy ?palikDocelowy - pole ?klocek - block ?klocekPod - object ?klocekPodDoc - block)
		:precondition
		(and
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