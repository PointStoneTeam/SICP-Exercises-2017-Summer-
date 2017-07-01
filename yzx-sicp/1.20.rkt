#lang scheme
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(gcd 2 3)
(gcd 1024 2)
