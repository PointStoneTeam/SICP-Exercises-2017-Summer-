#lang scheme
(define (square n)
  (* n n))

(define (expmod base exp m)
    (cond ((= exp 0)
            1)
          ((nontrivial-square-root? base m)                 ; 新增
            0)                                              ;
          ((even? exp)
            (remainder (square (expmod base (/ exp 2) m))
                       m))
          (else
            (remainder (* base (expmod base (- exp 1) m))
                       m))))

(define (nontrivial-square-root? a n)
    (and (not (= a 1))
         (not (= a (- n 1)))
         (= 1 (remainder (square a) n))))

(define (non-zero-random n)
    (let ((r (random n)))
        (if (not (= r 0))
            r
            (non-zero-random n))))

(define (Miller-Rabin-test n)
    (let ((times (ceiling (/ n 2))))
        (test-iter n times)))

(define (test-iter n times)
    (cond ((= times 0)
            #t)
          ((= (expmod (non-zero-random n) (- n 1) n)
              1)
            (test-iter n (- times 1)))
          (else
            #f)))