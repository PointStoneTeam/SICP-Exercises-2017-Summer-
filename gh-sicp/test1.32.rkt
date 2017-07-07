#lang racket
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))
(define (next n)
  (+ n 1))
(define (add a b)
  (+ a b))
(accumulate add
            0
            (lambda (x) x)
            1
            next
            10)
            