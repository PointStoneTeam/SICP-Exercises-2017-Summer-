
#lang racket
(define (cbrt-iter guess x)
  (if(good-enough? guess x)
     guess
     (cbrt-iter (improve guess x) x)))
(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))
(define  (cube x)
  (* x x x))
(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.000001))
(define (square x)
  (* x x))
(define (cbrt x)
  (cbrt-iter 1.0 x))

(cbrt 27)