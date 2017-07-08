(define tolerance 0.00001)
(define (fixed-point f first-guess)
	(define (close-enough? v1 v2)
		(< (abs (- v1 v2)) tolerance))
	(define (try guess)
		(let ((next (f guess)))
			(if (close-enough? guess next)
			 next
			 (try next))))
	(try first-guess))

(define (gold x) (+ 1 (/ 1 x)))

(fixed-point gold 1.0)
