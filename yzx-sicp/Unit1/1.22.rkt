#lang scheme
(define (square n)
  (* n n))
;;;生成奇数的函数
(define (next-odd n)
  (if (odd? n)
      (+ 2 n)
      (+ 1 n)))
;;;检测素数的函数
(define (prime? n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else
         (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))
;;;生成连续素数的函数
(define (continue-primes n count)
  (cond ((= count 0)
         (display "are primes"))
        ((prime? n)
         (display n)
         (newline)
         (continue-primes (next-odd n) (- count 1)))
        (else
         (continue-primes (next-odd n) count))))
;;;Search for prime
(define (search-for-prime n)
 (let ((start-time (real-time-clock)))
  (continue-primes n 3)
  (- (real-time-clock) start-time)))

  


  