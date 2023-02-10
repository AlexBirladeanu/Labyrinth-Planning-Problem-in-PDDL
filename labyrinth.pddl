(define (domain labyrinth)
  (:predicates
    (isMinotaur ?character)
    (isTheseus ?character)
    (justMoved ?character)
    (characterAt ?character ?r ?c)
    (wallAt ?r ?c)
    (nextr ?r1 ?r2)
    (nextc ?c1 ?c2)
    (theseusVisited ?r ?c)
  )

  (:action minotaur-move-up
    :parameters (?minotaur ?theseus ?oldr ?c ?newr)
    :precondition (and (characterAt ?minotaur ?oldr ?c) (nextr ?oldr ?newr) (isMinotaur ?minotaur) (isTheseus ?theseus) (not (wallAt ?newr ?c)) (not (justMoved ?minotaur)))
    :effect (and (characterAt ?minotaur ?newr ?c) (not (characterAt ?minotaur ?oldr ?c)) (justMoved ?minotaur) (not (justMoved ?theseus)))
  )

  (:action minotaur-move-down
    :parameters (?minotaur ?theseus ?oldr ?c ?newr)
    :precondition (and (characterAt ?minotaur ?oldr ?c) (nextr ?newr ?oldr) (isMinotaur ?minotaur) (isTheseus ?theseus) (not (wallAt ?newr ?c)) (not (justMoved ?minotaur)))
    :effect (and (characterAt ?minotaur ?newr ?c) (not (characterAt ?minotaur ?oldr ?c)) (justMoved ?minotaur) (not (justMoved ?theseus)))
  )
  
  (:action minotaur-move-right
    :parameters (?minotaur ?theseus ?r ?oldc ?newc)
    :precondition (and (characterAt ?minotaur ?r ?oldc) (nextc ?oldc ?newc) (isMinotaur ?minotaur) (isTheseus ?theseus) (not (wallAt ?r ?newc)) (not (justMoved ?minotaur)))
    :effect (and (characterAt ?minotaur ?r ?newc) (not (characterAt ?minotaur ?r ?oldc)) (justMoved ?minotaur) (not (justMoved ?theseus)))
  )
  
  (:action minotaur-move-left
    :parameters (?minotaur ?theseus ?r ?oldc ?newc)
    :precondition (and (characterAt ?minotaur ?r ?oldc) (nextc ?newc ?oldc) (isMinotaur ?minotaur) (isTheseus ?theseus) (not (wallAt ?r ?newc)) (not (justMoved ?minotaur)))
    :effect (and (characterAt ?minotaur ?r ?newc) (not (characterAt ?minotaur ?r ?oldc)) (justMoved ?minotaur) (not (justMoved ?theseus)))
  )
  
  
  
  (:action theseus-move-up
    :parameters (?minotaur ?theseus ?oldr ?c ?newr)
    :precondition (and (characterAt ?theseus ?oldr ?c) (nextr ?oldr ?newr) (isTheseus ?theseus) (isMinotaur ?minotaur) (not (wallAt ?newr ?c)) (not (justMoved ?theseus)))
    :effect (and (theseusVisited ?newr ?c) (characterAt ?theseus ?newr ?c) (not (characterAt ?theseus ?oldr ?c)) (justMoved ?theseus) (not (justMoved ?minotaur)))
  )

  (:action theseus-move-down
    :parameters (?minotaur ?theseus ?oldr ?c ?newr)
    :precondition (and (characterAt ?theseus ?oldr ?c) (nextr ?newr ?oldr) (isTheseus ?theseus) (isMinotaur ?minotaur) (not (wallAt ?newr ?c)) (not (justMoved ?theseus)))
    :effect (and (theseusVisited ?newr ?c) (characterAt ?theseus ?newr ?c) (not (characterAt ?theseus ?oldr ?c)) (justMoved ?theseus) (not (justMoved ?minotaur)))
  )
  
  (:action theseus-move-right
    :parameters (?minotaur ?theseus ?r ?oldc ?newc)
    :precondition (and (characterAt ?theseus ?r ?oldc) (nextc ?oldc ?newc) (isTheseus ?theseus) (isMinotaur ?minotaur) (not (wallAt ?r ?newc)) (not (justMoved ?theseus)))
    :effect (and (theseusVisited ?r ?newc) (characterAt ?theseus ?r ?newc) (not (characterAt ?theseus ?r ?oldc)) (justMoved ?theseus) (not (justMoved ?minotaur)))
  )
  
  (:action theseus-move-left
    :parameters (?minotaur ?theseus ?r ?oldc ?newc)
    :precondition (and (characterAt ?theseus ?r ?oldc) (nextc ?newc ?oldc) (isTheseus ?theseus) (isMinotaur ?minotaur) (not (wallAt ?r ?newc)) (not (justMoved ?theseus)))
    :effect (and (theseusVisited ?r ?newc) (characterAt ?theseus ?r ?newc) (not (characterAt ?theseus ?r ?oldc)) (justMoved ?theseus) (not (justMoved ?minotaur)))
  )

  (:action theseusFoundMinotaur
  :parameters (?minotaur ?theseus ?r ?c ?r1 ?r2 ?r3 ?r4 ?r5 ?r6 ?r7 ?c1 ?c2 ?c3 ?c4 ?c5 ?c6 ?c7 ?c8)
  :precondition (and(isMinotaur ?minotaur) (isTheseus ?theseus) (characterAt ?minotaur ?r ?c) (characterAt ?theseus ?r ?c) 
                (nextr ?r1 ?r2) (nextr ?r2 ?r3) (nextr ?r3 ?r4) (nextr ?r4 ?r5) (nextr ?r5 ?r6) (nextr ?r6 ?r7)
                (nextc ?c1 ?c2) (nextc ?c2 ?c3) (nextc ?c3 ?c4) (nextc ?c4 ?c5) (nextc ?c5 ?c6) (nextc ?c6 ?c7) (nextc ?c7 ?c8)
                )
  :effect (and 
            (theseusVisited ?r2 ?c2)
            (theseusVisited ?r2 ?c3)
            (theseusVisited ?r2 ?c4)
            (theseusVisited ?r2 ?c5)
            (theseusVisited ?r2 ?c6)
            (theseusVisited ?r2 ?c7)
            (theseusVisited ?r3 ?c2)
            (theseusVisited ?r3 ?c6)
            (theseusVisited ?r4 ?c2)
            (theseusVisited ?r4 ?c4)
            (theseusVisited ?r4 ?c5)
            (theseusVisited ?r4 ?c6)
            (theseusVisited ?r4 ?c7)
            (theseusVisited ?r5 ?c2)
            (theseusVisited ?r5 ?c4)
            (theseusVisited ?r6 ?c2)
            (theseusVisited ?r6 ?c3)
            (theseusVisited ?r6 ?c4)
            (theseusVisited ?r6 ?c5)
            (theseusVisited ?r6 ?c6)
            (theseusVisited ?r6 ?c7)
          )
  )
)
