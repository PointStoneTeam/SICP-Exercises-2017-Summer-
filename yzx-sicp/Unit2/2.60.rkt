#lang scheme
;;;P103 element-of-set can be applied to repeated element
(define (element-of-set? x set)
  (cond ((null? set)
         false)
        ((equal? x (car set))
         true)
        (else
         (element-of-set? x (cdr set)))))
(element-of-set? 5 (list 1 3 5 7 9 7 5 3 1))
;;;adjoin-set don't need to judge wether the element has already existed in the set just add both of them together
;;;the time of adjoin-set here is O(1)
(define (adjoin-set x set)
  (cons x set))
;;;union-set can be applied in the same way
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

(define (intersection-set set another)
    (define (iter set result)
        (if (or (null? set) (null? another))
            (reverse result)
            (let ((current-element (car set))
                  (remain-element (cdr set)))
                (if (and (element-of-set? current-element another)
                         (not (element-of-set? current-element result)))
                    (iter remain-element
                          (cons current-element result))
                    (iter remain-element result)))))
    (iter set '()))

(intersection-set '() (list 1 2 3))
(intersection-set (list 1 2 3 4) (list 1 2 3 4))
(intersection-set (list 1 2 1 2) (list 1 2 1 2))




                
