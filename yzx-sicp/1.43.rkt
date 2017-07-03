#lang racket
(repeated square 4)

(lambda (x)
    (square ((repeated square 3)
             x)))

(lambda (x)
    (square ((lambda (x)
                 (square ((repeated square 2)
                          x)))
             x)))

(lambda (x)
    (square ((lambda (x)
                 (square ((lambda (x)
                              (square ((repeated square 1) x)))
                          x)))
             x)))

(lambda (x)
    (square ((lambda (x)
                 (square ((lambda (x)
                              (square (square x)))
                          x)))
             x)))
(define (repeated f n)
    (if (= n 1)
        f
        (lambda (x)
            (let ((fs (repeated f (- n 1))))
                (f (fs x))))))

; 无 let 版本
;
; (define (repeated f n)
;    (if (= n 1)
;        f
;        (lambda (x)
;            (f ((repeated f (- n 1)) x)))))
(define (compose f g)
    (lambda (x)
        (f (+ g x))))

(define (repeated f n)
    (define (iter i repeated-f)
        (if (= i 1)
            repeated-f
            (iter (- i 1)
                  (lambda (x)
                      (f (repeated-f x))))))
    (iter n f))

(define (repeated0 f n)
    (if (= n 1)
        f
        (compose f
                 (repeated f (- n 1)))))

(define (repeated1 f n)
    (define (iter i repeated-f)
        (if (= i 1)
            repeated-f
            (iter (- i 1)
                  (compose f repeated-f))))
    (iter n f))