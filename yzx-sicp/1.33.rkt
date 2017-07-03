#lang scheme
;;;rec-filter-accumulate
(define (filtered-accumulate combine null-value term a next b valid?)
  (if (> a b)
      null-value
      (let ((rest-terms (filtered-accumulate combine
                                             null-value
                                             term
                                             (next a)
                                             next
                                             b
                                             valid?)))
        (if (valid? a)
            (combine (term a) rest-terms)
            rest-terms))))
;;;compute sum of primes
(define (prime-sum a b)
  (filtered-accumulate +
                       0
                       (lambda (x) x)
                       a
                       (lambda (i) (+ i 1))
                       b
                       prime?))

(define (square n)
  (* n n))

(define (divide? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= (smallest-divisor n) n))
(define (smallest-divisor n)
    (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divide? test-divisor n) test-divisor)
          (else
           (find-divisor n (+ test-divisor 1)))))
;;;判断两个整数是否互质
(define (coprime? i n)
    (and (< i n)
         (= 1 (gcd i n))))
;;;计算两个互质的数的和
(define (product-of-coprimes n)
    (filtered-accumulate *
                         1
                         (lambda (x) x)
                         1
                         (lambda (i) (+ i 1))
                         n
                         (lambda (x) (coprime? x n))))
;;;辗转相除法计算最大公因数
(define (gcd x y)
  (cond ((or (< x 0) (< y 0)) (gcd (abs x) (abs y)))
        ((< x y) (gcd y x))
        ((= y 0) x)
        ((gcd y (remainder x y)))))

;;;iter-filter-accumulate
(define (filtered-accumulate1 combine null-value term a next b)
  (define (iter i result)
    (cond ((> i b)
           result)
          ((valid? i)
           (iter (next i) (combine (term i) result)))
          (else
           (iter (next i) result))))
  (iter a null-value))
    
