#lang scheme
(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q n)
  (cond ((= n 0)
         b)
        ((even? n)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (* 2 p q) (square q))
                   (/ n 2)))
        (else
         (fib-iter (+ (* p q) (* a q) (* a p))
                   (+ (* b p) (* a q))
                   p
                   q
                   (- n 1)))))
(define (square n)
  (* n n))
(fib 100)


(define (fib1 n)
  (cond ((= n 0)
         0)
        ((= n 1)
         1)
        (else
         (+ (fib1 (- n 1)) (fib1 (- n 2))))))
(fib1 100)