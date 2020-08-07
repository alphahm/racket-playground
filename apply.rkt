#lang racket

(define (sum lon) (apply + lon))
(sum '(1 2 3 4 5 6)) ; 21

(define (highest lon) (apply max lon))
(highest '(58 64 77 77 22 93 94 78)) ; 94