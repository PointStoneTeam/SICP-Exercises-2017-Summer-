(define (make-accumulator init)
	(lambda (x) (set! init (+ init x)) init)
)

(define A (make-accumulator 5))
