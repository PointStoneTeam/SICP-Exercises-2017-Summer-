(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))
(define (fold-left op initial seq)
  (define iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest)))
    (iter initial seq))
(define (reverse1 seq)
  (fold-right (lambda (x y) (append y x))
              ()
              seq))
(define (reverse2 seq)
  (fold-left (lambda (x y) (cons y x))
             ()
             seq))


                
