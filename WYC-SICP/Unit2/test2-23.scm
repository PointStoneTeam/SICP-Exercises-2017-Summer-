(define (for-each porc list1)
  (cond ((not (null? list1))
         (porc (car list1))
         (for-each porc (cdr list1)))))
(for-each (lambda (x) (newline) (display x)) (list 233 566 820))
