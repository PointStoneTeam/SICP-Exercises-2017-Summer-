#lang racket

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (square x)
  (* x x))
(define (good-enough? guess x)
  (< (abs (/ (- guess (improve guess x)) guess)) 0.001))
(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt(+ 100 37))
