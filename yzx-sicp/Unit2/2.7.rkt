#lang scheme
(define (make-interval a b) (cons a b))
(define (upper-bound x)
  (+ (car x) (* (car x) (cdr x))))
(define (lower-bound x)
  (- (car x) (* (car x) (cdr x))))

