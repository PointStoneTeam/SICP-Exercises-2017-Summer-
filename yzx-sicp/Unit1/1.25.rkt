#lang scheme
(define (expmod base exp m)
    (remainder (fast-expt base exp) m));fast-expt参考前面算一个数的幂的算法，先判断奇偶再来看是square／ 1/2还是* 1 （- n 1）
;;;Alyssa 的 expmod 函数在理论上是没有错的,但是在实际中却运行得不好。

;;;因为费马检查在对一个非常大的数进行素数检测的时候，可能需要计算一个很大的乘幂，比如说，求十亿的一亿次方，这种非常大的数值计算的速度非常慢，而且很容易因为超出实现的限制而造成溢出。

;;;而书本 34 页的 expmod 函数，通过每次对乘幂进行 remainder 操作，从而将乘幂限制在一个很小的范围内（不超过参数 m ），这样可以最大限度地避免溢出，而且计算速度快得多。
(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
    (cond ((= times 0)
            true)
          ((fermat-test n)
            (fast-prime? n (- times 1)))
          (else
            false)))
(define (expmod base exp m)
    (cond ((= exp 0)
            1)
          ((even? exp)
            (remainder (square (expmod base (/ exp 2) m))
                       m))
          (else
            (remainder (* base (expmod base (- exp 1) m))
                       m))))

