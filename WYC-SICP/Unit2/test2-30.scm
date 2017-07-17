(define (map proc tree)
    (cond ((null? tree) ())
          ((not (pair? tree)) (proc tree)) 
          (else (cons (map proc (car tree)) 
                      (map proc (cdr tree))))))
(define (square-tree tree)
   (map (lambda (x) (* x x)) tree))

(square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))

