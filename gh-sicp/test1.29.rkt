#lang racket
(define (sum term a next b count n)
  (cond ((= count 0) (+ (sum term (next a) next b (+ count 1) n) (term a)))
        ((= count n) (term a))
        ((even? count) (+ (* 2.0 (term a)) (sum term (next a) next b (+ count 1) n)))
        ((odd? count) (+ (* 4.0 (term a)) (sum term (next a) next b (+ count 1) n)))))

(define (integral a b f n)
  (define h (/ (- b a) n))
  (define (next x)
    (+ h x))
  (* (/ h 3.0)(sum f a next b 0 n)))

(define (cube x)
  (* x x x))

(integral 0 1 cube 100)