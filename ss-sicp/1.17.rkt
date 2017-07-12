#lang racket
(define (halve a) (/ a 2))
(define (plus a b)
  (cond ((or (= a 0) (= b 0)) 0)
        ((even? a)(double (plus (halve a) b)))
        (else (+ b (plus (- a 1) b)))))
 (define (double a) (+ a a))