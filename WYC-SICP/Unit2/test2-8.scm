(define (make-interval a b) (cons a b))
(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))

(define (add-interval x y)
    (make-interval (+ (lower-bound x) (lower-bound y))
                   (+ (upper-bound x) (upper-bound y))))
(define (sub-bound x y)
    (add-interval x
                  (make-interval (- 0 (upper-bound y))
                                 (- 0 (lower-bound y)))))

