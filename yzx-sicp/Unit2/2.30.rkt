#lang scheme
;;;use "cond" to define
(define (square n)
  (* n n))
(define (square-tree0 tree)
  (cond ((null? tree)
         '())
        ((not (pair? tree))
         (square tree))
        (else
         (cons (square-tree (car tree))
               (square-tree (cdr tree))))))
;;;使用map遍历
(square-tree0 (list (list 1 2) (list 3 4)))
(define (square-tree1 tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree1 tree)
             (square sub-tree)))
       tree))
;;;感觉上面两种方式都有着相同的抽象模式
