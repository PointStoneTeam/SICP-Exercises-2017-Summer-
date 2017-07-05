#lang racket
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))
(define (next n)
  (+ n 1))
(define (factorial x)
  (product (lambda (n) n)
           1
           next
           x))
(factorial 3)
