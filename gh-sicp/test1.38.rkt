#lang racket
(define (cont-frac n d k)
  (define (cf i)
    (if (= k i)
        (/ (n k) (d k))
        (/ (n i)
           (+ (d i) (cf (+ i 1))))))
  (cf 1))

(define (D k)
  (if (= 0 (remainder (+ k 1) 3))
      (* 2 (/ (+ k 1) 3))
      1))
(define (e k)
  (+ 2 
  (cont-frac (lambda (n) 1.0)
           D
           k)))
(e 11)


