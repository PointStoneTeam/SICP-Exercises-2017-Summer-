#lang scheme
;constructor of tree

(define (make-tree entry left right)
    (list entry left right))

(define (entry tree)
    (car tree))

(define (left-branch tree)
    (cadr tree))

(define (right-branch tree)
    (caddr tree))
;make treeA
(define a (make-tree 7
                           (make-tree 3
                                      (make-tree 1 '() '())
                                      (make-tree 5 '() '()))
                           (make-tree 9
                                      '()
                                      (make-tree 11 '() '()))))
;make treeB
(define b (make-tree 3
                           (make-tree 1 '() '())
                           (make-tree 7
                                      (make-tree 5 '() '())
                                      (make-tree 9
                                                 '()
                                                 (make-tree 11 '() '())))))
;make treeC
(define c (make-tree 5
                           (make-tree 3
                                      (make-tree 1 '() '())
                                      '())
                           (make-tree 9
                                      (make-tree 7 '() '())
                                      (make-tree 11 '() '()))))

;1
(define (tree->list-1 tree)
    (if (null? tree)
        '()
        (append (tree->list-1 (left-branch tree))
                (cons (entry tree)
                      (tree->list-1 (right-branch tree))))))

;2
(define (tree->list-2 tree)
    (define (copy-to-list tree result-list)
        (if (null? tree)
            result-list
            (copy-to-list (left-branch tree)
                          (cons (entry tree)
                                (copy-to-list (right-branch tree)
                                              result-list)))))
    (copy-to-list tree '()))

(tree->list-1 a)
(tree->list-2 a)
(tree->list-1 b)
(tree->list-2 b)
(tree->list-1 c)
(tree->list-2 c)
;从前面的测试部分可以看出,对于同一棵树, tree->list-1 和 tree->list-2 都生成同一个列表。
;对于不同形状但是包含的元素相同的多棵树， tree->list-1 和 tree->list-2 也都生成同一个列表


