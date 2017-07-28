#lang racket
(define (repeated f n)
   (define (compose f g)
  (lambda (x) (f (g x))))
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if(close-enough? guess next)
         next
         (try next))))
  (try first-guess))
(define tolerance 0.00001)
(define (average-damp f)
 (define (average a b) (/ (+ a b) 2))
   (lambda (x)  (average x (f x))))
(define (plus a n)
  (define (plusa n result)
    (if (= n 0)
        result
        (plusa (- n 1) (* a result))))
  (plusa n 1))
(define (count-n-times x n m)
(fixed-point
 ( repeated
   (average-damp (lambda (y) (/ x (plus y (- n 1)))))
   m);m 表示平均阻尼的次数 ，n表示求x的n次方
 2.0))