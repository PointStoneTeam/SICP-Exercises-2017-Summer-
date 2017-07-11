#lang scheme
(define (for-each p lst)
  (cond ((not (null? lst))
        (p (car lst))
        (for-each p (cdr lst)))))
(for-each (lambda (x) (newline) (display x) (list 57 321 88)))

