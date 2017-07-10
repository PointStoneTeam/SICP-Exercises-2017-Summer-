#lang scheme
(define (same-parity sample . others)
  (filter (if (even? sample)
              even?
              odd?)
          (cons sample others)))
(same-parity 1)
(same-parity 1 2 3 4 5 6)
(same-parity 2 3 4 5 6 7)
  

