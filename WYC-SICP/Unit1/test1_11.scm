(define (f n)
  (if (>= n 3)
    (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))
	n))

(define (F n)
  (define (ff a b c cnt)
    (if (< cnt 0)
	  c
	  (ff b c (+ (* 3 a) (* 2 b) c) (- cnt 1))))

  (ff 0 1 2 (- n 3)))
