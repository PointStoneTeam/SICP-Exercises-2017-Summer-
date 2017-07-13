(define (fringe tree)
  (cond ((null? tree) ())
        ((not (pair? tree)) (list tree))
        (else (append (fringe (car tree))       
                      (fringe (cadr tree))))))

