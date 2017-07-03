#lang racket

(define tolerance 0.00001)

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next))))
    (try first-guess))

(define (fixed-point1 f first-guess close-enough?)
    (define (try guess)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next))))
    (try first-guess))

(define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))

(define tolerance1 0.00001)
(define (fixed-point2 f close-enough?)
    (lambda (first-guess)
        (define (try guess)
            (let ((next (f guess)))
                (if (close-enough? guess next)
                    next
                    (try next))))
        (try first-guess)))

(define (close-enough0? v1 v2)
        (< (abs (- v1 v2)) tolerance))

(define 1tolerance 0.00001)
(define (iterative-improve close-enough? improve)
    (lambda (first-guess)
        (define (try guess)
            (let ((next (improve guess)))
                (if (close-enough? guess next)
                    next
                    (try next))))
        (try first-guess)))
(define (1fixed-point f first-guess)
    (define tolerance 0.00001)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (improve guess)
        (f guess))
    ((iterative-improve close-enough? improve) first-guess))

(define (sqrt x)
    (define dx 0.00001)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) dx))
    (define (improve guess)
        (average guess (/ x guess)))
    (define (average x y)
        (/ (+ x y) 2))
    ((iterative-improve close-enough? improve) 1.0))
