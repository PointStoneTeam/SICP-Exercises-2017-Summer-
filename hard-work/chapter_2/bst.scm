(define (entry tree)
  (car tree))

(define (left-branch tree)
  (cadr tree))

(define (right-branch tree)
  (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (join-tree x tree)
  (cond ((null? tree) (make-tree x '() '()))
        ((= x (entry tree)) tree)
        ((> x (entry tree))
         (make-tree (entry tree)
                    (left-branch tree)
                    (join-tree x (right-branch tree))))
        ((< x (entry tree))
         (make-tree (entry tree)
                    (join-tree x (left-branch tree))
                    (right-branch tree)))))

(define (in-tree? x tree)
  (cond ((null? tree) #f)
        ((= x (entry tree)) #t)
        ((< x (entry tree)) (in-tree? x (left-branch tree)))
        ((> x (entry tree)) (in-tree? x (right-branch tree)))))


