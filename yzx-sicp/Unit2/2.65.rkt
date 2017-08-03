#lang scheme
;make tree
(define (make-tree entry left right)
  (list entry left right))
(define (entry tree)
  (car tree))
(define (left-branch tree)
  (cadr tree))
(define (right-branch tree)
  (caddr tree))
;tree to list
(define (tree->list-1 tree)
    (if (null? tree)
        '()
        (append (tree->list-1 (left-branch tree))
                (cons (entry tree)
                      (tree->list-1 (right-branch tree))))))
;list to tree
(define (list->tree elements)
    (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
    (if (= n 0)
        (cons '() elts)
        (let ((left-size (quotient (- n 1) 2)))
            (let ((left-result (partial-tree elts left-size)))
                (let ((left-tree (car left-result))
                      (non-left-elts (cdr left-result))
                      (right-size (- n (+ left-size 1))))
                    (let ((this-entry (car non-left-elts))
                          (right-result (partial-tree (cdr non-left-elts)
                                                      right-size)))
                        (let ((right-tree (car right-result))
                              (remaining-elts (cdr right-result)))
                            (cons (make-tree this-entry left-tree right-tree)
                                  remaining-elts))))))))
;union-set
(define (union-set set another)
    (cond ((and (null? set) (null? another))
            '())
          ((null? set)
            another)
          ((null? another)
            set)
          (else
            (let ((x (car set)) (y (car another)))
                (cond ((= x y)
                        (cons x (union-set (cdr set) (cdr another))))
                      ((< x y)
                        (cons x (union-set (cdr set) another)))
                      ((> x y)
                        (cons y (union-set set (cdr another)))))))))

(define (element-of-set? x set)
    (cond ((null? set)
            #f)
          ((equal? x (car set))
            #t)
          (else
            (element-of-set? x (cdr set)))))

;insersection-set
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

;insertion tree
(define (insersection-tree tree another)
    (list->tree
        (intersection-set (tree->list-1 tree)
                          (tree->list-1 another))))
(define it (insersection-tree (list->tree '(1 2 3 4 5))
                              (list->tree '(1 3 5 7 9))))
;union tree
(define (union-tree tree another)
    (list->tree
        (union-set (tree->list-1 tree)
                   (tree->list-1 another))))
;test data
(define ut (union-tree (list->tree '(1 2 3 4 5))
                             (list->tree '(1 3 5 7 9))))
