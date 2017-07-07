#lang scheme
(define (pascal row col)
  (cond ((> col row)
         (error "invalid col value"))
        ((or (= col 0) (= row col))
         1)
        (else (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col)))))
(pascal 4 1)
(pascal 42 22)
