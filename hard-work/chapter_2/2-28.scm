(define (fringe-iter x result)
  (cond ((null? x) result)
        ((not (pair? (car x))) x)
        (else 
          (fringe-iter (cdr x) 
           (append result  (fringe-iter (car x) '()))))))

(define (fringe tree) (fringe-iter tree '()))
