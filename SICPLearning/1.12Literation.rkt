#lang scheme
(define (factorial n)
  (fact-iter 1 1 n))
(define (fact-iter product counter max-counter)
  (if (> counter max-counter)
      product
      (fact-iter (* product counter) (+ 1 counter) max-counter)))
(define (pascal row col)
  (/ (factorial row)
     (* (factorial col) (factorial (- row col)))))
(pascal 4 1)
(pascal 42 22)