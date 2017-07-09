(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q cnt)
  (cond ((= cnt 0) b)
		((even? cnt)
		 (fib-iter
		   a
		   b
		   (+ (* p p) (* q q))
		   (+ (* 2 p q) (* q q))
		   (/ cnt 2)))
		(else 
		  ((+ (* a q) (* a p) (* b q))
		   (+ (* b p) (* a q))
		   p
		   q
		   (- cnt 1)))))
(define (even? n)
  (= (remainder n 2) 0))
