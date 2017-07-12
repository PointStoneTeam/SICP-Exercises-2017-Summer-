(define (reverse1 list1)
    (define (reverse-iter list1 list2)
        (if (null? list1)
            list2
            (reverse-iter (cdr list1) (cons (car list1) list2))))
    (reverse-iter list1 ()))
(define one-through-four (list 1 2 3 4))
(reverse1 one-through-four)
