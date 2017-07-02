(define (sqrt x)
  sqrt-iter(1.0 x))
	
(define (sqrt-iter guess x)
  (if (good-enough? guess (improve (guess x)))
    guess
	(sqrt-iter (improve guess x) x)))

(define (good-enough? guess next-guess)
  (< (abs (- guess next-guess)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))
