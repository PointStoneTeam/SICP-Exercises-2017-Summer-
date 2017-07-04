(define (accumulate combiner null-value term a next b)
    (if (> a b)
	    null-value
		(combiner (term a) (accumulate combiner null-value term (next a) next b))))
(define (inc n) (+ n 1))
(define (add a b) (+ a b))
(define (mul a b) (* a b))
(define (cube n) (* n n n))
(define (sum term a next b)
	(accumulate add 0 term a next b))
(define (product term a next b)
	(accumulate mul 0 term a next b))

