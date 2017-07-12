#lang scheme
;;;观察2.30的两个方法可以知道两种square-tree有着共同的抽象模式也就是所谓的公共抽象模式，这里
;;;我们可以将这种模式单独抽出来称为tree-map
;first-way
(define (tree-map0 f tree)
  (cond ((null? tree)                    ;空树
         '())         
        ((not (pair? tree))              ;叶子节点
         (f tree))
        (else
         (cons (tree-map0 f (car tree))   ;递归处理左右子树
               (tree-map0 f (cdr tree))))))
;second-way
(define (tree-map1 f tree)
  (map (lambda (sub-tree)
                (if (pair? sub-tree)
                    (tree-map1 f sub-tree);处理子树
                    (f sub-tree)))       ;处理节点
       tree))
(define (square n)
  (* n n))
(define tree-test (list (list 1 2) (list 3 4)))
(tree-map0 square tree-test)