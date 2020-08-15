#lang racket

; nameless function aka lambda, define arguments then body
((lambda (num) (- num 2)) 5) 

(map
 (lambda (num) (+ num 1))
 '(1 2 3 4 5)) ; '(2 3 4 5 6)

(filter
 (lambda (num) (= (modulo num 10) 1))
 '(10 12 30 43 50)) ; '(10 30 50)
