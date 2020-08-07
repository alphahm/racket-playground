#lang racket

(define (my-filter pred lst)
  (cond [(empty? lst) empty] ; well if it's empty, I guess we should just stop here...
        [(pred (first lst)) ; if first item satisifies the predicate
         (cons (first lst) (my-filter pred (rest lst)))] ; keep the element and filter the rest
        [else (my-filter pred (rest lst))])) ; element is discarded, filter the rest of the list

(my-filter even? '(2 5 4 9 0 3 21 12)) ; '(2 4 0 12)

; using filter provide by racket
(filter even? '(2 5 4 9 0 3 21 12)) ; '(2 4 0 12)