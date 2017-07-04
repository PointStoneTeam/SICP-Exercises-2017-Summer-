(define (inc n) (+ n 1))

(define (product term a next b)
    (define (iter a result)
	    (if (> a b) 1
		    (iter (next a) (* result (term a)))))
	(iter a 1))

(define (factorial n)
   (define (f i)
	  (/ (if (even? i) (+ i 2) (+ i 1))
	     (if (even? i) (+ i 1) (+ i 2))))
   (product f 1 inc n))

 (factorial 2)
