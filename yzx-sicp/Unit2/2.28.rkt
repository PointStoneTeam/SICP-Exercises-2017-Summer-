#lang scheme
(define (fringe tree)
  (cond ((null? tree)
         '())
        ((not (pair? tree))
         (list tree))
        (else
         (append (fringe (car tree))
                 (fringe (cadr tree))))))
(define x (list (list 1 2) (list 3 4)))
(fringe x)
;;;better fringe-tree
(define (fringe2 tree)
    (cond ((empty-tree? tree)
            '())
          ((leaf? tree)
            (list tree))
          (else
            (append (fringe (left-branch tree))
                    (fringe (right-branch tree))))))

(define (empty-tree? tree)
    (null? tree))

(define (leaf? tree)
    (not (pair? tree)))

(define (left-branch tree)
    (car tree))

(define (right-branch tree)
    (cadr tree))         
        
;;;Full-version-fringe;for all forms of trees
(define (fringe tree)  
   (cond ((null? tree) '()) 
         ((not (pair? tree)) (list tree)) 
         (else (append (fringe (car tree)) (fringe (cdr tree)))))) 
