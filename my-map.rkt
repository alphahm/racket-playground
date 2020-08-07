#lang racket

(define (my-map func lst)
  (cond [(empty? lst) empty]
        [else (cons (func (first lst))
                    (my-map func (rest lst)))])) ; because we love recursion

(my-map add1 '(1 2 3 4 5)) ; '(2 3 4 5 6)

;using map provided by racket
(map add1 '(1 2 3 4 5)) ; '(2 3 4 5 6)