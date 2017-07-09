(define (filtered-accumulate filter combiner null-value term a next b)
	(cond ((> a b) null-value)
		  ((filter a) (combiner (term a) 
		   (filtered-accumulate filter combiner null-value term (next a) next b)))))

(define (add a b) (+ a b))
(define (prime? n)
	(= (smallest-divisor n 2) n))
(define (smallest-divisor n test_divisor)
	(cond ((> (square test-divisor) n) n)
	      ((divisor? test-divisor n) test-divisor)
		  (else (smallest-divisor n (+ test-divisor 1)))))
(define (square n) (* n n))
(define (divisor? b a) (= (remainder a b) 0)
(define (inc n) (+ n 1))
(define (f x) x)

(define (sum-primes a b)
	(filtered-accumulate prime? add 0 f a inc b))


