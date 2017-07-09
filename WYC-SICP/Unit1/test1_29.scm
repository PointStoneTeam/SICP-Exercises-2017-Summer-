(define (cube n)
  (* n n n))

(define (inc n)
  (+ 1 n))

(define (sum term a next b)
  (if (> a b) 
      0
	  (+ (term a)
		 (sum term (next a) next b))))

(define (simpson f a b n)
  (define h (/ (- b a) n))

  (define (yk k) (f (+ a (* k h))))

  (define (simpson-iter k)
     (* (yk k)
	    (cond ((or (= k 0) (= k n))  1)
			  ((even? k) 2)
			  ((odd? k) 4))))
 
  (* (/ h 3.0) (sum simpson-iter 0 inc n)))

 (simpson cube 0 1 100)

