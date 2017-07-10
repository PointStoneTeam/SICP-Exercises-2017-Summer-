#lang scheme
;;;Louis first definition
(define (square n)
  (* n n))
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '()))
(square-list (list 1 2 3 4))
;;;process of above is following:
;(square-list (list 1 2 3 4)
;(iter (list 1 2 3 4) '())
;(iter (list 2 3 4)(cons (square 1) '()))
;(iter (list 3 4)(cons (square 2) '(1)))
;(iter (list 4) (cons (square 3) '(4 1)))
;(iter '() (cons (square 4) '(9 4 1)))
;'(16 9 4 1)
;把square去掉就是之前的2.18的答案
(define (reverse lst)
    (iter lst '()))
(define (iter remained-items result)
    (if (null? remained-items)
        result
        (iter (cdr remained-items)
              (cons (car remained-items) result))))
;;;Louis second definition
(define (square-list1 items)
  (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things)  
                  (cons answer (square (car things))
                        ))))
    (iter items '()))
(square-list1 (list 1 2 3 4))
(square-list (list 1 2 3 4))
;;;second process is following:
;(iter (list 1 2 3 4) '())
;(iter (list 2 3 4) (cons '() (square 1)))
;(iter (list 3 4) (cons (cons '() 1)
                       ;(square 2)))
;(iter (list 4)  (cons (cons (cons '() 1) 4)
                      ;(square 3)))

;(iter '() (cons (cons (cons (cons '() 1) 4) 9)
                ;(square 4)))

;(iter '() (cons (cons (cons (cons '() 1) 4) 9) 16))

;(cons (cons (cons (cons '() 1) 4) 9) 16)
;;;real iteration version square-list
(define (square-list2 items)
    (define (iter things answer)
        (if (null? things)
            (reverse answer) ; 修改
            (iter (cdr things)  
                  (cons (square (car things))
                        answer))))
    (iter items '()))
(square-list2 (list 1 2 3 4))

