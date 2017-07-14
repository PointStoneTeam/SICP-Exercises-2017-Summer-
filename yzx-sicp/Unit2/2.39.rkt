#lang scheme
(define (fold-left op initial sequence)
    (define (iter result rest)
        (if (null? rest)
            result
            (iter (op result (car rest))
                  (cdr rest))))
    (iter initial sequence))
(define (reverse sequence)
    (fold-left (lambda (x y)
                   (cons y x))
               '()
               sequence))
(reverse (list 1 2 3 4))

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define fold-right accumulate)
(define (reverse1 sequence)
    (fold-right (lambda (x y)
                    (append y (list x)))
                '()
                sequence))
(reverse1 (list 1 2 3 4 5 6 7))