#lang racket
(define (cont-frac n d k)
  (define (cf i)
    (if (= k i)
        (/ (n k) (d k))
        (/ (n i)
           (+ (d i) (cf (+ i 1))))))
  (cf 1))
(define (D k)
  (+ 1 (* (- k 1) 2)))

(define (tan k x)
  (define (C k)
    (if (= k 1)
        x
        (- (* x x))))
  (cont-frac C D k))
(tan 100 10.0)