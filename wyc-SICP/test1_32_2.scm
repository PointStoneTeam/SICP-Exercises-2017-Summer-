(define (accumulate combiner null-value term a next b)
    (define (iter a result)
	    (if (> a b)
			null-value
			(iter (next a) (combiner result (term a)))))
	(iter a null-value))

(define (inc n) (+ n 1))
(define (add a b) (+ a b))
(define (mul a b) (* a b))
(define (cube n) (* n n n))
(define (sum term a next b)
    (accumulate add 0 term a next b))
(define (product term a next b)
    (accumulate mul 0 term a next b))

