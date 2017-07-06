#lang scheme
;new define of cons
(define (cons x y)
  (lambda (m)
    (m x y)))
;new define of car
(define (car z)
  (z (lambda (p q) p)))
;extension of (car (cons 1 2)) like following:
(car (cons 1 2))
(car (lambda (m) (m 1 2)))
((lambda (z) (z (lambda (p q) p)))
 (lambda (m) (m 1 2)))
((lambda (m) (m 1 2))
 (lambda (p q) p))
((lambda (p q) p)
 1 2)
1
;new define of cdr
(define (cdr z)
  (z (lambda (p q) q)))
;extension of (cdr (cons 1 2)) like following:
(cdr (cons 1 2))
(cdr (lambda (m) (m 1 2)))          ; 展开 cons
((lambda (z) (z (lambda (p q) q)))  ; 展开 cdr ,代换 z
    (lambda (m) (m 1 2)))
((lambda (m) (m 1 2))               ; 代换 m
    (lambda (p q) q))
((lambda (p q) q) 1 2)              ; 代换 q
2
