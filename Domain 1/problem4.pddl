(define (problem bring-all-to-r1) (:domain rooms)
(:objects 
    c1 - character
    red-bionicle blue-bionicle green-bionicle white-bionicle black-bionicle - item
    r1 r2 r3 r4 r5 r6 hw1 hw2 hw3 hw4 - room
)

(:init 
    (connected r1 hw1)
    (connected hw1 r1)
    (connected hw1 hw2)
    (connected hw2 hw1)
    (connected hw2 r2)
    (connected r2 hw2)
    (connected hw2 r5)
    (connected r5 hw2)
    (connected hw2 hw3)
    (connected hw3 hw2)
    (connected hw3 r3)
    (connected r3 hw3)
    (connected hw3 r4)
    (connected r4 hw3)
    (connected hw3 hw4)
    (connected hw4 hw3)
    (connected hw4 r6)
    (connected r6 hw4)

    (in red-bionicle r2)
    (in blue-bionicle r3)
    (in green-bionicle r4)
    (in white-bionicle r5)
    (in black-bionicle r6)

    (at c1 r1)
    (free-hand c1)
)

(:goal (forall (?i - item) (in ?i r1)))

)
