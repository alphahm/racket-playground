#lang racket

; for
(for ([i '(1 2 3 4 5)]) ; set up variable bindings
  (display i))
; 12345


; for/list: take the last value of each iteration and collects these values in a list
(for/list ([i '(1 2 3 4 5)])
  (/ 1 i))
;'(1 1/2 1/3 1/4 1/5)

; above loop rewritten using map
(map (lambda (x) (/ 1 x)) '(1 2 3 4 5))
;'(1 1/2 1/3 1/4 1/5)

; for/fold
(for/fold ([sqrs 0]) ; the value returned to each iteration is bound to sqrs which is initialised to 0
          ([i '(1 2 3 4 5 6 7 8 9 10)])
  (+ (sqr i) sqrs))
; 385

; above rewritten using foldl
(foldl (lambda (i sqrs) (+ (sqr i) sqrs))
       0
       '(1 2 3 4 5 6 7 8 9 10))

; imagine you had to type all of that instead of using a foldl...
((lambda (i sqrs) (+ (sqr i) sqrs)) 10 ((lambda (i sqrs) (+ (sqr i) sqrs)) 9 ((lambda (i sqrs) (+ (sqr i) sqrs)) 8 ((lambda (i sqrs) (+ (sqr i) sqrs)) 7 ((lambda (i sqrs) (+ (sqr i) sqrs)) 6 ((lambda (i sqrs) (+ (sqr i) sqrs)) 5 ((lambda (i sqrs) (+ (sqr i) sqrs)) 4 ((lambda (i sqrs) (+ (sqr i) sqrs)) 3 ((lambda (i sqrs) (+ (sqr i) sqrs)) 2 ((lambda (i sqrs) (+ (sqr i) sqrs)) 1 0))))))))))

; foldl and foldr - to help understand how they work
(foldr - 0 '(1 2 3 4)) ; -2 (0 is the init value)
(- 1 (- 2 (- 3 (- 4 0)))) ; -2, this is what foldr does (f 1 (f 2 (f 3 (f 4 init)))))

(foldl - 0 '(1 2 3 4)) ; 2
(- 4 (- 3 (- 2 (- 1 0)))) ; 2 this is what foldl does (f 4 (f 3 (f 2 (f 1 init))))

(foldl cons '() '(1 2 3 4)) ; '(4 3 2 1)
(cons 4 (cons 3 (cons 2 (cons 1 '())))) ; '(4 3 2 1)

(foldr cons '() '(1 2 3 4)) ; '(1 2 3 4)
(cons 1 (cons 2 (cons 3 (cons 4 '())))) ; '(1 2 3 4)

; filter iterations with #:when only if the expression following #:when evaluates to true
(for/list ([i '(1 2 3 4 5)]
           #:when (odd? i))
  i) ; '(1 3 5)

;for* or the power of nested lists with a powerful syntax
;standard nested for
(for/list ([i '(1 2 3)])
  (for/list ([j '(4 5 6)])
    (+ i j)
    )) ; '((5 6 7) (6 7 8) (7 8 9))

;same rewritten using for*
(for*/list ([i '(1 2 3)]
            [j '(4 5 6)])
  (+ i j)) ; '(5 6 7 6 7 8 7 8 9) notice how the values are collected into one list

; in-range
(for/list ([i (in-range 10)])
  i) ; '(0 1 2 3 4 5 6 7 8 9)

(for/list ([i (in-range 1 6)])
  i) ;'(1 2 3 4 5)

; build-list
(build-list 10 values) ; '(0 1 2 3 4 5 6 7 8 9)
(build-list 10 (lambda (i) (+ i 2))) ; '(2 3 4 5 6 7 8 9 10 11)

; lazy evaluation
; function consumes i, builds a list from 0 to (* 500 i)
; then returns the sum of the list - BUT doesn't immediately produce a sum
; it produces a suspended computation (or thunk) that must be run to return the sum
(define (make-lazy+ i)
  (lambda () ; wrap a no-arguments lambda around the expression
    (apply + (build-list (* 500 i) values))))


(define long-big-list (build-list 5000 make-lazy+))

(define (compute-every-1000th l)
  (for/list ([thunk l] [i (in-naturals)] ; loop will stop when the shortest list is exhausted
             #:when (zero? (remainder i 1000)))
    (thunk)))

(compute-every-1000th long-big-list) ;'(0 124999750000 499999500000 1124999250000 1999999000000)
