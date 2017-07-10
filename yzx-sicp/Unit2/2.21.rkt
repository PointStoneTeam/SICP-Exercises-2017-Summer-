#lang scheme
(define (square n)
  (* n n))
  ;;;first way
(define (square-list items)
    (if (null? items)
        '()
        (cons (square (car items))
              (square-list (cdr items)))))
  ;;;second way by map
(define (square-list1 items)
    (map square items))
(square-list (list 1 2 3 4))
