#lang racket
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))
(define (next n)
  (+ n 1))
(define (quarter-pi-iter x)
  (cond ((even? x) (/ (* 2 (+ 1 (/ x 2))) (+ 1 (* 2 (/ x 2)))))
        ((odd? x) (/ (* 2 (+ 1 (/ (- x 1) 2))) (+ 1 (* 2 (+ 1 (/ (- x 1) 2)))))))) 
        
(define (quarter-pi x)
  (product quarter-pi-iter
           1
           next
           x))
(quarter-pi 30)