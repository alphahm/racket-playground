#lang racket

(struct monster (health)) ; by default structure types are opaque
(monster 0) ; #<monster>
; inheritance
(struct hydra monster ()) ; hydra is like a monster
(struct orc monster (club))  ; orc is like a monster with club as an additional field

; transparent fields 
(struct avocado (ripe) #:transparent)
(avocado #t) ; (avocado #t)

(define avocado1 (avocado #f))
avocado1 ; (avocado #f)

; mutable for all the fields
(struct orange (country) #:mutable #:transparent)
(define orange1 (orange 'morocco))
orange1 ; (orange 'morocco)
(set-orange-country! orange1 'spain) ; notice we'be given access to mutator set-orange-country!

; accessor: access a field this way
(orange-country orange1) ; 'spain

; predicates are given for free as well
(orange? orange1) #t

; mutable for one field
(struct apple (country [variety #:mutable]) #:transparent)
(define apple1 (apple 'france 'gala))
apple1 ; (apple 'france 'gala)
(set-apple-variety! apple1 'golden)
apple1 ; (apple 'france 'golden)
; (set-apple-country! apple1 'golden) will result in unbound identifier

; local definition with let
(let ((apple1 (apple 'uk 'golden)))
  (set-apple-variety! apple1 'fuji )) ; let body with a sequence of expressions

(equal? apple1 (let ((apple1 (apple 'france 'fuji))) ; hovering over apple1 inside let in DrRacket will 
  (set-apple-variety! apple1 'golden)                ; clearly show the local scope of it
                 apple1)) ; #t

(eq? apple1 (let ((apple1 (apple 'france 'fuji)))
  (set-apple-variety! apple1 'golden)
                 apple1)) ; #f, with eq? we're not comparing values