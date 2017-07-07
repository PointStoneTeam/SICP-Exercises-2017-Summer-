#lang scheme
;(define (next x)
;  (+ x 1))
;;;1.31 rec-product
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))
(product (lambda (x) x)
         1
         (lambda (i) (+ i 1))
         10)
;;;1.31 iter-product
(define (product1 term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (* (term a) result))))
  (iter a 1))
(product1 (lambda (x) x)
         1
         (lambda (i) (+ i 1))
         10)
      
      
