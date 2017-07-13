#lang sicp
(define (next-odd n);产生下一个奇数的函数
  (if (odd? n)
      (+ 2 n)
      (+ 1 n)))
(define (prime? n);检验素性
  (= n (smallest-divisor n)))
(define (smallest-divisor n);找出最小的约数
  (find-divisor n 2))
(define (find-divisor n test-divisor);
  (cond((> (square test-divisor) n)
        n)
       ((divides? test-divisor n)
        test-divisor)
       (else
        (find-divisor n (+ test-divisor 1)))))
(define (divides? a b);判断两数是否可整除
  (=(remainder b a) 0))
(define (square x) (* x x));定义平方
(define (continue-primes n count);得出连续的素数
  (cond ((= count 0)
         (display "are primes."))
        ((prime? n)
         (display n)
         (newline)
         (continue-primes (next-odd n) (- count 1)))
         (else
          (continue-primes (next-odd n) count))))
(define (search-for-primes n);计算时间 并输出三个连续的素数 最后的结果
  (let ((start-time(runtime)))
    (continue-primes n 3)
(- (runtime) start-time)))
