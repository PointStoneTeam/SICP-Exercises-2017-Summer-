#lang scheme
;judge whether it's a leaf
(define (leaf? object)
  (eq? (car object) 'leaf))

;define symbol-leaf
(define (symbol-leaf x) (cadr x))

;define weight-leaf
(define (weight-leaf x) (caddr x))

;define left-branch
(define (left-branch tree) (car tree))

;define right-branch
(define (right-branch tree) (cadr tree))

;define make-leaf
(define (make-leaf symbol weight);weight means quanzhong
  (list 'leaf symbol weight))

;define how to code a tree into a form of list
(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

;define symbols
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

;define weight tree
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

;build sample tree
(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))
;define decode process
(define (decode bits tree)
  (define (decode-1 bit current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
              (decode-1 (cdr bits) tree))
          (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

;define choose-branch
(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad vit -- CHOOSE-BRANHC" bit))))
        
(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))


(decode sample-message sample-tree)

