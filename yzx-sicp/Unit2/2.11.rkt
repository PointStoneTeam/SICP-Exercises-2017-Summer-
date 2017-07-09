#lang scheme
(define (pos x)
	(> x 0)
)

ß(define (mul-interval x y)
	(cond ((and (pos (upper-bound x)) (pos (lower-bound x)) (pos (upper-bound y)) (pos (lower-bound y))) (make-interval (* (lower-bound x) (lower-bound y)) (* (upper-bound x) (upper-bound y))))

				((and (pos (upper-bound x)) (pos (lower-bound x)) (pos (upper-bound y)) (not (pos (lower-bound y)))) (make-interval (* (upper-bound x) (lower-bound y)) (* (upper-bound x) (upper-bound y))))

				((and (pos (upper-bound x)) (pos (lower-bound x)) (not (pos (upper-bound y))) (not (pos (lower-bound y)))) (make-interval (* (upper-bound x) (lower-bound y)) (* (lower-bound x) (power-bound y))))

				((and (pos (upper-bound x)) (not (pos (lower-bound x))) (pos (upper-bound y)) (pos (lower-bound y))) (make-interval (* (lower-bound x) (upper-bound y)) (* (upper-bound x) (upper-bound y))))

				((and (pos (upper-bound x)) (not (pos (lower-bound x))) (pos (upper-bound y)) (not (pos (lower-bound y)))) (let ((p1 (* (lower-bound x) (lower-bound y)))
				(p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

				((and (pos (upper-bound x)) (not (pos (lower-bound x))) (not (pos (upper-bound y))) (not (pos (lower-bound y)))) (make-interval (* (lower-bound x) (lower-bound y)) (* (upper-bound x) (lower-bound y))))

				((and (not (pos (upper-bound x))) (not (pos (lower-bound x))) (pos (upper-bound y)) (pos (lower-bound y))) (make-interval (* (lower-bound x) (upper-bound y)) (* (upper-bound x) (lower-bound y))))

				((and (not (pos (upper-bound x))) (not (pos (lower-bound x))) (pos (upper-bound y)) (not (pos (lower-bound y)))) (make-interval (* (lower-bound x) (upper-bound y)) (* (lower-bound x) (lower-bound y))))

				((and (not (pos (upper-bound x))) (not (pos (lower-bound x))) (not (pos (upper-bound y))) (not (pos (lower-bound y)))) (make-interval (* (upper-bound x) (upper-bound y)) (* (lower-bound x) (lower-bound y))))
	)
)


