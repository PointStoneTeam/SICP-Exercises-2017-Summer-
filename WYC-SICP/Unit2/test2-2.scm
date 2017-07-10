(define (make-point x y) (cons x y))
(define (get-x pos) (car pos))
(define (get-y pos) (cdr pos))

(define (make-segment star-pos end-pos) (cons star-pos end-pos))
(define (star-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (midpoint-segment seg)
  (cons (/ (+ (get-x (star-segment seg)) (get-x (end-segment seg))) 2)
        (/ (+ (get-y (star-segment seg)) (get-y (end-segment seg))) 2)))

(define (print-point p)
    (newline)
    (display "(")
    (display (get-x p))
    (display ",")
    (display (get-y p))
    (display ")"))

(define p1 (make-point 1 2))
(define p2 (make-point 3 4))
(print-point (midpoint-segment (make-segment p1 p2)))
