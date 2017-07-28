#lang racket
(define (repeated f n)
   (define (compose f g)
  (lambda (x) (f (g x))))
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))
(define (smooth f)
  (lambda (x) (/ (+ (f x) (f (- x dx)) (f (+ x dx))) 3)))
(define dx 0.00001)
(define (square x) (* x x))
(define (smooth-n-times f n)
 (if  (= n 0)
       f
   (repeated (smooth f) n)))