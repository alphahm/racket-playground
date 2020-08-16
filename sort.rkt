#lang racket

(require racket/trace)

(define (insert x lst)
    (cond [(empty? lst) (list x)] ; list empty ? return '(x)
          [else (if (< x (car lst)) ; if x is < first element list
                    (cons x lst) ; ; add x in front of the list
                    (cons (car lst) (insert x (cdr lst))))])) ; else first elenent is still the lowest so try to insert x to the cdr list and come back



(define (isort lst)
  (cond [(empty? lst) lst] ; end recursion, return '()
        [else (insert (car lst) (isort (cdr lst)))])) ; insert first element


#| output of trace for (isort '(9 4 3 10 8))
>(isort '(9 4 3 10 8))
> (isort '(4 3 10 8))
> >(isort '(3 10 8))
> > (isort '(10 8))
> > >(isort '(8))
> > > (isort '())
< < < '()
> > >(insert 8 '())
< < <'(8)
> > (insert 10 '(8))
> > >(insert 10 '())
< < <'(10)
< < '(8 10)
> >(insert 3 '(8 10))
< <'(3 8 10)
> (insert 4 '(3 8 10))
> >(insert 4 '(8 10))
< <'(4 8 10)
< '(3 4 8 10)
>(insert 9 '(3 4 8 10))
> (insert 9 '(4 8 10))
> >(insert 9 '(8 10))
> > (insert 9 '(10))
< < '(9 10)
< <'(8 9 10)
< '(4 8 9 10)
<'(3 4 8 9 10)
'(3 4 8 9 10)
|#


; alternative syntax with lambda
(define isort2
  (lambda (x)
    (if (null? x)
        x
        (insert2 (car x) (isort2 (cdr x))))))



(define insert2
  (lambda (a l)
    (cond
      [(null? l) (list a)]
      [(< a (car l)) (cons a l)]
      [else (cons (car l) (insert2 a (cdr l)))])))


(trace isort)
(trace insert)