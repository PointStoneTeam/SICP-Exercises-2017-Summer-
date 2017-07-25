#lang sicp
(define (smooth f)
  (lambda (x) (/ (+ (f x) (f (- x dx)) (f (+ x dx))) 3)))
(define dx 0.00001)
(define (square x) (* x x))
(define (smooth-n-times f n)
  (if  (= n 0)
       f
       (smooth-n-times (smooth f) (- n 1)))) 