#lang scheme
(define (make-vect xcor ycor)
    (list xcor ycor))

(define (xcor-vect v)
    (car v))

(define (ycor-vect v)
    (cadr v))

(define (add-vect vect another-vect)
    (make-vect (+ (xcor-vect vect)
                  (xcor-vect another-vect))
               (+ (ycor-vect vect)
                  (ycor-vect another-vect))))

(define (sub-vect vect another-vect)
    (make-vect (- (xcor-vect vect)
                  (xcor-vect another-vect))
               (- (ycor-vect vect)
                  (ycor-vect another-vect))))

(define (scale-vect factor vect)
    (make-vect (* factor (xcor-vect vect))
               (* factor (ycor-vect vect))))
