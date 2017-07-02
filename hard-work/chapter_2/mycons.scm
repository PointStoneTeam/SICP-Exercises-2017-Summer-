(define (mycons x y)
  (lambda (m) (m x y)))

(define (mycar z)
  (z (lambda (x y) x)))

(define (mycdr z)
  (z (lambda (x y) y)))
