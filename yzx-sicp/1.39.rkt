#lang racket
(define (square n)
  (* n n))
(define (tan-cf x k)
    
    (define (N i)
        (if (= i 1)
            x
            (- (square x))))

    (define (D i)
        (- (* i 2) 1))

    (exact->inexact (cont-frac N D k)))
