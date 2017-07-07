#lang racket
(define (count y x)
  (if (good-enough? y  x)
   y
(count (improve y  x) x)))
(define (good-enough? b c)
      (< (abs (- (* b (square b)) c)) 0.001))
(define (improve y  x)  
(/ (+(/ x (square y))(* 2 y)) 3))
 (define (square a)(* a a ))


