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
  (if (fast-prime? n 100)
	(print n (- (runtime) star-time))))

(define (print n time)
  (newline)
  (display n)
  (display "   ***  ")
  (display time))

(define (fast-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+1 (random (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 
		 1)
		((even? exp) 
		 (remainder (square (expmod base (/ exp 2) m)) m))
		(else
		 (remainder (* base (expmod base (- exp 1) m)) m))))

(define (square n)
  (* n n))

(define (fast-prime? n cnt)
  (cond ((- cnt 0) true)
        ((fast-test n) (fast-prime? n (- cnt 1)))
		(else flase)))
