#lang scheme
(define (square n)
  (* n n))
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))
(define (fast-prime? n times)
  (cond ((= 0 times) true)
        ((fermat-test n)
         (fast-prime? n (- times 1)))
        (else
         false)))
(define (expmod base exp m)
  (cond ((= exp 0)
         1)
        ((even? exp)
         (remainder (square (expmod base (/ base 2) m)) m))
        (else
         (remainder (* base (expmod base (- base 1) m)) m))))
;;;重定义prime函数
(define (prime? n)
  (fast-prime? n 10))

(define (next-odd n)
    (if (odd? n)
        (+ 2 n)
        (+ 1 n)))
(define (continue-primes n count)
    (cond ((= count 0)
            (display "are primes."))
          ((prime? n)
            (display n)
            (newline)
            (continue-primes (next-odd n) (- count 1)))
          (else
            (continue-primes (next-odd n) count))))
(define (search-for-primes n)
    (let ((start-time (real-time-clock)))
        (continue-primes n 3)
        (- (real-time-clock) start-time)))
;;;DrRacket中没有real-time-clock包需要自己写或者在MIT-scheme中打开


