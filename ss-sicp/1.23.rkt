#lang racket
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b)
  (= (remainder b a ) 0))
(define (square x) (* x x))
(define (next x)
  (cond ((= x 2) 3)
  (else (+ x 2))))
   
