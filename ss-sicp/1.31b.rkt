#lang racket
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))
     (define (factorial n)
  (define (add n) (+ n 1))
  (define (plus x) x)
  (if (= n 1)
      1
      (product  plus 1 add n)))