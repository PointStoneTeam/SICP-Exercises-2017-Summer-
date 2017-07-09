(define (filtered-accumulate filter combiner null-value term a next b)
    (cond ((> a b) null-value)
          ((filter a) (combiner (term a)
           (filtered-accumulate filter combiner null-value term (next a) next b)))))

(define (mul a b) (* a b))
(define (gcd-prime? a b) (= (gcd a b) 1))
(define (gcd a b)
	(if (= b 0) a (gcd b (remainder a b))))
(define (inc n) (+ 1 n))
(define (f x) x)

(define (mul-prime n)
	(filtered-accumulate gcd-prime? mul 1 f 1 inc (- n 1)))

