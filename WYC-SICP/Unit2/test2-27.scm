(define (reverse1 list1)
  (define (reverse-iter list1 list2)
    (if (null? list1)
        list2
        (reverse-iter (cdr list1) (cons (car list1) list2))))
  (reverse-iter list1 ()))

(define (deep-reverse x)
  (define (deep-reverse-iter list1 list2)
    (cond((null? list1) list2)
         ((not (pair? list1)) list1)
         (else (deep-reverse-iter (cdr list1) (cons (deep-reverse (car list1)) list2)))))
  (deep-reverse-iter x ()))
(define y (list 1 2 (list 3 4) (list 5 6)))
(deep-reverse y)


