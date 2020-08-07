#lang racket

#|
  Let the computer between x y
  Calling (guess) will default to 0 and 100
  With (start x y), it is possible to specify lower and upper
|#

(define (start n m)
  (set! lower (min n m))
  (set! upper (max n m))
  (guess))
        
(define lower 1)
(define upper 100)

(define (guess)
  (quotient (+ lower upper) 2))

(define (smaller)
  (set! upper (max lower (sub1 (guess))))
  (guess))

(define (bigger)
  (set! lower (min upper (add1 (guess))))
  (guess))