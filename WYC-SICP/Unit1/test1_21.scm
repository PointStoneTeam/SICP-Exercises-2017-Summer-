(define (smallest-divisor n)
  (find-smallest-divisor 2 n))

(define (find-smallest-divisor test-divisor n)
  (cond ((> (squre test-divisor) n) 
		  n)
        ((divisor? test-divisor n) 
		  test-divisor)
		(else 
		  (find-smallest-divisor (+ test-divisor 1) n))))

(define (squre n) 
 (* n n))

(define (divisor? b a)
  (= (remainder a b) 0))

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)
