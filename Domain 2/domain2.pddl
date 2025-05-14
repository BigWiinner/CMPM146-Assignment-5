(define (domain rooms)
    (:requirements :adl :typing)
    (:types
        key item - holdable
        character room hand ; Behold, the hand
    )

    (:predicates
        (at ?c - character ?r - room)
        (connected ?a - room ?b - room)
        (in ?i - holdable ?r - room)
        (holds ?c - character ?i - holdable)
        (free-hand ?c - character ?h - hand)
        (locked-door ?from - room ?to - room)
        (is-key ?k - key ?from - room ?to - room)
    )

    (:action move
        :parameters (?who - character ?from - room ?to - room)
        :precondition (and
            (at ?who ?from)
            (connected ?from ?to)
            (or
                (not (= ?to r1))
                (and
                    (= ?to r1)
                    (not (free-hand ?who left-hand))
                    (not (free-hand ?who right-hand))
                )
                (and
                    (= ?to r1)
                    (forall
                        (?i - item)
                        (in ?i r1))
                )
            )
        )
        :effect (and
            (not (at ?who ?from))
            (at ?who ?to)
        )
    )

    (:action pick-up
        :parameters (?who - character ?at - room ?what - holdable ?hand - hand)
        :precondition (and
            (free-hand ?who ?hand)
            (at ?who ?at)
            (in ?what ?at))
        :effect (and
            (not (free-hand ?who ?hand))
            (not (in ?what ?at))
            (holds ?who ?what))
    )

    (:action drop
        :parameters (?who - character ?at - room ?what - holdable ?hand - hand)
        :precondition (and
            (holds ?who ?what)
            (at ?who ?at))
        :effect (and
            (free-hand ?who ?hand)
            (in ?what ?at)
            (not (holds ?who ?what)))
    )

    (:action unlock
        :parameters (?who - character ?from - room ?to - room ?key - key ?hand - hand)
        :precondition (and
            (locked-door ?from ?to)
            (is-key ?key ?from ?to)
            (holds ?who ?key)
            (at ?who ?from))
        :effect (and
            (not (holds ?who ?key))
            (free-hand ?who ?hand)
            (not (locked-door ?from ?to))
            (not (locked-door ?to ?from))
            (connected ?from ?to)
            (connected ?to ?from))
    )

)