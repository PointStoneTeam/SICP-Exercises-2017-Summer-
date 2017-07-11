#lang racket
(define (count b n)
  (count-iter b n 1))
(define (square b) (* b b))
(define (count-iter b times a)
  (cond ((= times 0)a)
        ((even? times) (count-iter (square b) (/ times 2) a))
        (else (count-iter b (- times 1) (* a b)))))
      
      