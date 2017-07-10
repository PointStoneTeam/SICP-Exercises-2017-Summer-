#lang scheme
(define (last-pair lst)
  (cond ((null? lst)
         (error "list empty -- LAST-PAIR"))
        ((null? (cdr lst))
         lst)
        ((else
          (last-pair (cdr lst))))))
