(define (square x) (* x x)) 
	  
(define (smallest-divisor n) 
  (find-divisor n 2)) 
	  
(define (find-divisor n test-divisor) 
  (cond ((> (square test-divisor) n) n) 
		((divides? test-divisor n) test-divisor) 
		(else (find-divisor n (+ test-divisor 1))))) 
	  
(define (divides? a b) 
  (= (remainder b a) 0)) 
	  
(define (prime? n) 
  (= n (smallest-divisor n))) 
	  
(define (timed-prime-test n) 
  (start-prime-test n (runtime))) 
	  
(define (start-prime-test n start-time) 
  (if (prime? n) 
	(report-prime n (- (runtime) start-time)))) 
	  
(define (report-prime n elapsed-time) 
  (newline) 
  (display n) 
  (display " *** ") 
  (display elapsed-time)) 
	  
(define (search-for-primes first last) 
  (define (search-iter cur last) 
	(if (<= cur last) (timed-prime-test cur)) 
	(if (<= cur last) (search-iter (+ cur 2) last))) 
  (search-iter (if (even? first) (+ first 1) first) 
			   (if (even? last) (- last 1) last)))
