(define (map proc items)
  (if (null? items) 
      ()
      (cons (proc (car items))
            (map proc (cdr items)))))
(define (square-list list1)
 (map  (lambda (x) (* x x)) list1))
(square-list (list 1 2 3 4 5 6 7))
