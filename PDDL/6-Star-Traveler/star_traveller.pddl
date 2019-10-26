(define
	(domain star_traveller)
	(:requirements :adl)
	(:types planet lever button star edge final_planet)
	(:predicates
		(on_planet ?planet)
		(lever_on_planet ?planet ?lever)
		(is_teleport ?planet1 ?planet2)
		(is_teleport_lever ?planet1 ?planet2 ?lever)
		(is_on ?lever)
		(button_on_planet ?planet ?button)
		(is_barrier ?planet ?lever)
		(star_on_edge ?edge ?star)
		(correct_edge_for_star ?edge ?star)
		(edge_empty ?edge)
		(edge_connected ?edge1 ?edge2)
		(puzzle_on_planet ?planet)
		(started_solving_puzzle)
	)
	
	(:action teleport
	 :parameters (?source ?destination - planet)
	 :precondition
	 (and
	 	(on_planet ?source)
 		(is_teleport ?source ?destination)
	 )
	 :effect
	 (and
	 	(not (on_planet ?source))
	 	(on_planet ?destination)
	 )
 	)
 	
 	(:action teleport_with_lever
 	 ;Teleportuj się wykorzystując dźwignię
	 :parameters (?source ?destination - planet ?lever - lever)
	 :precondition
	 (and
	 	(on_planet ?source)
		(is_teleport_lever ?source ?destination ?lever)
 		(is_on ?lever)
	 )
	 :effect
	 (and
	 	(not (on_planet ?source))
	 	(on_planet ?destination)
	 	(not (is_on ?lever))
	 )
 	)
 	
 	(:action teleport_to_final_planet
 	 :parameters (?source - planet ?destination - final_planet)
	 :precondition
	 (and
	 	(on_planet ?source)
 		(is_teleport ?source ?destination)
 		; Wszystkie gwiazdy są na swoich miejscach
 		(not
 			(exists
 				(?edge - edge ?star - star)
 				(and
 					(star_on_edge ?edge ?star)
 					(not (correct_edge_for_star ?edge ?star))
 				)
 			)
 		)		
	 )
	 :effect
	 (and
	 	(not (on_planet ?source))
	 	(on_planet ?destination)
	 )
 	)
 	
 	(:action teleport_to_final_planet_with_lever
	 :parameters (?source - planet ?destination - final_planet ?lever - lever)
	 :precondition
	 (and
	 	(on_planet ?source)
		(is_teleport_lever ?source ?destination ?lever)
 		(is_on ?lever)
 		; Wszystkie gwiazdy są na swoich miejscach
 		(not
 			(exists
 				(?edge - edge ?star - star)
 				(and
 					(star_on_edge ?edge ?star)
 					(not (correct_edge_for_star ?edge ?star))
 				)
 			)
 		)
	 )
	 :effect
	 (and
	 	(not (on_planet ?source))
	 	(on_planet ?destination)
	 	(not (is_on ?lever))
	 )
 	)
 	
 	(:action switch_lever
 	 :parameters (?planet - planet ?lever - lever)
 	 :precondition
 	 (and
 	 	(on_planet ?planet)
 	 	(lever_on_planet ?planet ?lever)
 	 	(not (is_on ?lever))
 	 	(not (is_barrier ?planet ?lever))
 	 )
 	 :effect
 	 (and
 	 	(is_on ?lever)
 	 )
 	)
 	
 	(:action press_button
 	 ;planet1 - Planeta na której stoimy
 	 ;planet2 - Planeta na której jest dźwignia otoczona barierią
 	 ;lever   - Dźwignia otoczona barierą
 	 :parameters (?planet1 ?planet2 - planet ?button - button ?lever - lever)
 	 :precondition
 	 (and
 	 	(on_planet ?planet1)
 	 	(button_on_planet ?planet1 ?button)
 	 	(is_barrier ?planet2 ?lever)
 	 )
 	 :effect
 	 (and
 	 	(not (is_barrier ?planet2 ?lever))
 	 )
 	)
 	
 	(:action move_star
 	 :parameters (?planet - planet ?star - star ?from ?to - edge)
 	 :precondition
 	 (and
 	 	(on_planet ?planet)
 	 	(puzzle_on_planet ?planet)
 	 	(edge_empty ?to)
 	 	(star_on_edge ?from ?star)
 	 	(edge_connected ?from ?to)
 	 )
 	 :effect
 	 (and
 	 	(not (star_on_edge ?from ?star))
 	 	(star_on_edge ?to ?star)
 	 	(edge_empty ?from)
 	 	(not (edge_empty ?to))
 	 )
 	)

)