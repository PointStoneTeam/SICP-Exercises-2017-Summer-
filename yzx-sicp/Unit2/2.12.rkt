#lang scheme
(define (make-center-width c percent) 
	(make-interval (- c (* c percent)) (+ c (* c percent)))
)
