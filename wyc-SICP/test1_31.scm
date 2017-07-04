(define (inc n) (+ n 1))

(define (product term a next b)
    (if (> a b) 1.0
	    (* (term a)
	       (product term (next a) next b))))

(define (factorial n)
   (define (f i)
	  (/ (if (even? i) (+ i 2) (+ i 1))
	     (if (even? i) (+ i 1) (+ i 2))))
   (product f 1 inc n))

 (factorial 2)
