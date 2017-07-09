#lang racket
(define (count n)
(cond ((< n 3) n)
((= n 3) 4)
(else(+(count (- n 1))  (*(- n 2) 2)  (*(- n 3) 3)))))
