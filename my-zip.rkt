#lang racket

(require srfi/1)

(define (my-zip lst1 lst2)
  (cond [(empty? lst1)  ; if the first list is empty
         '()]        ; then return the empty list 
        [(empty? lst2)  ; if the second list is empty
        '()]        ; then also return the empty list 
        [else          ; otherwise
         (cons (list   ; cons a list with two elements:
                (car lst1)  ; the first from the first list
                (car lst2)) ; and the first from the second list (1st argument of the cons)
               (my-zip (cdr lst1) (cdr lst2)))])) ; advance recursion (2nd argument of the cons)


(my-zip '(1 2) '(3 4)) ; '((1 3) (2 4))

(zip '(1 2) '(3 4)) ; '((1 3) (2 4))
