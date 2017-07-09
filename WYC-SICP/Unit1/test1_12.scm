(define (pascal x y)
  ( if(or (= y 1) (= y x))
	 1
	 (+ (pascal (- x 1) (- y 1)) (pascal (- x 1) y))))
