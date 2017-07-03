#lang racket
(define dx 0.00001)

(define (smooth f)
    (lambda (x)
        (/ (+ (f (- x dx))
              (f x)
              (f (+ x dx)))
            3)))


(define (smooth-n-times f n)
    (if (= n 0)
        f
        (smooth (smooth-n-times f (- n 1)))))

(define (smooth-n-times1 f n)
    (define (iter i smoothed-f)
        (if (= i 0)
            smoothed-f
            (iter (- i 1)
                  (smooth smoothed-f))))
    (iter n f))

(define (repeated f n)
    (if (= n 1)
        f
        (lambda (x)
            (let ((fs (repeated f (- n 1))))
                (f (fs x))))))

(repeated smooth 3)

(lambda (f)
    (smooth (repeated smooth 2)))

(lambda (f)
    (smooth (smooth (repeated smooth 1))))

(lambda (f)
    (smooth (smooth (smooth f))))

(define (smooth-n-times0 f n)
    (let ((n-times-smooth (repeated smooth n)))
        (n-times-smooth f)))

