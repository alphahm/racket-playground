#lang racket

(define (my-build-list n func) ; n: number of desired items, func: function to apply to k
  (define (builder k) ; define an inner buider function that keeps being called until k == n
    (cond [(= n k) empty]
          [else (cons (func k) (builder (add1 k)))]))
  (builder 0)) ; the first time we call builder with 0


(my-build-list 5 add1) ;'(1 2 3 4 5)
(my-build-list 10 (lambda (n) (* n 9))) ;'(0 9 18 27 36 45 54 63 72 81)
