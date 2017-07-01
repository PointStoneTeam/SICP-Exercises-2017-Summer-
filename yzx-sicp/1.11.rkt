#lang scheme
(define (fib3 n)
  (if (< n 3)
      n
      (+ (fib3 (- n 1)) (* 2 (fib3 (- n 2))) (* 3 (fib3 (- n 3))))))
(fib 3)
(define (fib n) (iter 2 1 0 0 n))
(define (iter a b c i n)
  (if (= i n)
      c
      (iter (+ a (* b 2) (* c 3))
            a
            b
            (+ i 1)
            n)))
(fib 3)

