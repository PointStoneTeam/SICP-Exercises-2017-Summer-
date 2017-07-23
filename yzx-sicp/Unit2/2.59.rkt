#lang scheme
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else
         (element-of-set? x (cdr set)))))
(define (union-set set1 set2)
  (iter (append set1 set2) '()))
(define (iter input result)
  (if (null? input)
      (reverse result)
      (let ((current-element (car input))
            (remain-element (cdr input)))
        (if (element-of-set? current-element result)
            (iter remain-element result)
            (iter remain-element
                  (cons current-element result))))))
(union-set '(1 2 3) '(3 4 5 6))