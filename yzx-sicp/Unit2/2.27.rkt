#lang scheme
;;;deep-reverse 函数比 reverse 函数更进一步,它不仅逆序最外层的列表(树根),而且还使用递归,连内层的子树也一并进行逆序
(define (deep-reverse tree)
  (cond ((null? tree)
         '())
        ((not (pair? tree))
         tree)
        (else
         (reverse (list (deep-reverse (car tree))
                        (deep-reverse (cadr tree)))))))
(define x (list (list 1 2) (list 3 4)))
x
(reverse x)
(deep-reverse x)

(define (deep-reverse2 tree)
    (cond ((empty-tree? tree)
            '())
          ((leaf? tree)
            tree)
          (else
            (reverse (make-tree (deep-reverse (left-branch tree))
                                (deep-reverse (right-branch tree)))))))

(define (empty-tree? tree)
    (null? tree))

(define (leaf? tree)
    (not (pair? tree)))

(define (make-tree left-branch right-branch)
    (list left-branch right-branch))

(define (left-branch tree)
    (car tree))

(define (right-branch tree)
    (cadr tree))
