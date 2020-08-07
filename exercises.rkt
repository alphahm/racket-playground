#lang racket
(define x 100)
(define y 20)
(let ((x 2)) (+ x y)) ; 22
(let ((x 1) (y x)) (+ x y)) ; 101
(let* ((x 1) (y x)) (+ x y)) ; 2 let* allows to use previous bindings in creating later bindings

; curried function
; each function take one argument at a time
(define (curried_add n) (lambda (m) (+ m n)))

((curried_add 2) 9) ; 11

; compare with this non curried version
(define (add n m) (+ m n))
(add 2 9) ; 11

#|
curried function in JS

function add (a) {
  return function (b) {
    return a + b;
  }
}

add(2)(9)
|#

; remove the first occurrence of symbol s from list of symbols los using recursion, car and cdr
(define (remove-first s los)
  (if (null? los)
      '()
      (if (eq? (car los) s)
          (cdr los)
          (cons (car los)
                (remove-first s (cdr los))))))

(remove-first 'a '(a b c)) ; '(b c)
(remove-first 'b '(a b c b d)) ; '(a c b d)
(remove-first 'd '(a b c)) ; '(a b c)
(remove-first 'a '()) ; '()
