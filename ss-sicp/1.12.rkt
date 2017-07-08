#lang racket
(define (pascal row line)
  (cond ((= line 0)0)
        ((= line 1)1)
        ((= line row)1)
        ((= line (+ row 1))0)
        (else (+ (pascal (- row 1) (- line 1)) (pascal (- row 1) line)))))