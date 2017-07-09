(define (search-for-primes beg last)
  (search-iter 
   (if (even? beg) (+ beg 1) beg)
   (if (even? last) (- last 1) last)))

;(define (even? n)
;  (and (= (remainder n 2) 0) (not (= n 2))))

(define (search-iter cur last) 
  (if (<= cur last) 
    (time-prime cur)) 
  (if (<= cur last) 
    (search-iter (+ cur 2) last)))

(define (time-prime n)
  (star-prime n (runtime)))

(define (star-prime n star-time)
  (if (prime? n)
    (print n (- (runtime) star-time))))

(define (print n time)
  (newline)
  (display n)
  (display "   ***  ")
  (display time))

(define (prime? n)
  (= (smallest-divisor n 2) n))

(define (smallest-divisor n test-divisor)
  (cond ((> (squre test-divisor) n) n)
		((divisor? test-divisor n) test-divisor)
		(else (smallest-divisor n (+ test-divisor 1)))))

(define (squre n)
  (* n n))

(define (divisor? b a)
  (= (remainder a b) 0))

