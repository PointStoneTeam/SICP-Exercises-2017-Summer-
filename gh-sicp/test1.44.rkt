#lang racket
(define dx 0.00001)
(define (smooth f)
  (lambda (x)
    (/ (+ (f (+ x dx)) (f x) (f (- x dx))) 3)))
(define (repeated f n)
  (if (= n 1)
      f
      (lambda (x)
        (f ((repeated f (- n 1)) x)))))
(define (cube x)
  (* x x x))
(((repeated smooth 5) cube) 3)