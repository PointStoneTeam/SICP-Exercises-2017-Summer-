#lang scheme
(define (make-rat n d)
  (if (and (< d 0) (> n 0))
      (cons (- n) (- d))
      (cons n d)))
