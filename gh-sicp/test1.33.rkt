#lang racket
(define (filtered-accumulate combiner null-value term a next b valid?)
  (if (> a b)
      null-value
      (if (valid? a)
          (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b valid?))
          (filtered-accumulate combiner null-value term (next a) next b valid?))))
(define (next n)
  (+ n 1))
(define (add a b)
  (+ a b))
(define (multi a b)
  (* a b))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((< n 2) 0)
        ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))
(define (square x)
  (* x x))
(define (gcd i n)
  (if (= n 0) i (gcd n (remainder i n))))
(define (gcd-only? a b) (= (gcd a b) 1))
(filtered-accumulate add
                     0
                     (lambda (x) x)
                     1
                     next
                     10
                     prime?)
(define (filtered-accumulate-t combiner null-value term a next b valid?)
  (if (> a (- b 1))
      null-value
      (if (valid? a b)
          (combiner (term a) (filtered-accumulate-t combiner null-value term (next a) next b valid?))
          (filtered-accumulate-t combiner null-value term (next a) next b valid?))))
(filtered-accumulate-t multi
                     1
                     (lambda (x) x)
                     1
                     next
                     10
                     gcd-only?)