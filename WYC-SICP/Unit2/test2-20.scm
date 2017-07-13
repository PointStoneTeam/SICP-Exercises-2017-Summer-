(define (reverse1 list1)
  (define (reverse-iter list1 list2)
    (if (null? list1)
        list2
        (reverse-iter (cdr list1) (cons (car list1) list2))))
        (reverse-iter list1 ()))

(define (same-parity x . y)
  (define (oddoreven list1 list2)
    (if (= (remainder (+ x (car list1)) 2) 0)
        (same-iter (cdr list1) (cons (car list1) list2))
        (same-iter (cdr list1) list2)))
  (define (same-iter list1 list2)
    (if (null? list1) 
        list2
        (oddoreven list1 list2)))
  (cons x (same-iter (reverse1 y) ())))

(same-parity 1 3 5 7 9)
