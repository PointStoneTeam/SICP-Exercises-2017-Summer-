(define (sqrt x)

  (define (average x y)
    (/ (+ x y) 2))

  (define (improve guess)
	(average guess (/ x guess)))

  (define (good-enough? guess)
    (< (abs (- guess (improve guess))) 0.001))

  (define (sqrt-iter guess)
    (if (good-enough? guess)
		guess
		(sqrt-iter (improve guess))))

  (sqrt-iter 1.0))
