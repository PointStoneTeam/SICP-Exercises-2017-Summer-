#lang racket
(define (product term a next b)
  (if (> a b)
      1
  (* (term a)
     (product term (next a) next b))))
(define (factorial n)
  (define (add n) (+ n 1))
  (define (plus x) x)
  (if (= n 1)
      1
      (product  plus 1 add n)))