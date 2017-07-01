(define (f x y z) 
        (cond ((and (< x y) (< x z)) (+ y z))
			  ((and (< y z) (< y x)) (+ x z))
			  ((and (< z x) (< z y)) (+ x y))))
