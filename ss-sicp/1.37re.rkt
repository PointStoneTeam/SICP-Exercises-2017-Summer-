#lang racket
(define (cont-frac N D k)
  (define (cf i)
    (if (= k i)
        (/ (D k) (N k))
        (/ (N i)
           (+ (D i) (cf (+ i 1))))))
  (cf 1))