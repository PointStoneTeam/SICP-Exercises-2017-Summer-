(define tolerance 0.00001)
(define dx 0.0000001)
(define (newton-method g guess)
    (fixed-point (newton-transform g) guess))

(define (fixed-point g first-guess)
    (define (close-enough? v1 v2)
        (if (< (abs v1 v2)) tolerance))
    (define (try guess)
        (let((next (f guess)))
            if(close-enough? guess next)
                next
                (try next)))
    (try first-guess))

(define (newton-transform g)
  (lambda (x) 
        (- x (/ (g x) ((deriv g) x)))))

(define (deriv g)
    (lambda (x) 
        (/ (- (g (+ x dx)) (g x))
           dx)))

(define (cubic a b c)
    (lambda (n) (+ (* n n n) (* a n n) (* b n) c)))

(newton-method (cubic a b c) guess)
