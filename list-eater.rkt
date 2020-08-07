#lang racket

#|
  Recursively call itself to find length of a list
  Here rest is same as cdr 
|#

(define (my-length a-list)
  (if (empty? a-list)
      0
      (add1 (my-length (rest a-list)))))

#|
> (my-length '(1 2 3))
3
|#
