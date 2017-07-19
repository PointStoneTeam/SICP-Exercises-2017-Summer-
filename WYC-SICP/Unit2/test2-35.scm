(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
        (accumulate op initial (cdr sequence)))))
(define (count-leaves t)
  (accumulate (lambda (x y) (+ x y))
              0
              (map leaves t)))
(define (leaves tree)
  (cond ((null? tree) 0)
        ((not (pair? tree)) 1)
        (else (+ (leaves (car tree))
                 (leaves (cdr tree))))))
