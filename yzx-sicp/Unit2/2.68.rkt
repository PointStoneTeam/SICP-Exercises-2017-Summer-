#lang scheme
;exercise 2.68
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))


(define (make-leaf symbol weight)
  (list 'leaf symbol weight))


(define (leaf? object)
  (eq? (car object) 'leaf))


(define (symbol-leaf x) (cadr x))


(define (left-branch tree) (car tree))


(define (right-branch tree) (cadr tree))


(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))


(define (weight-leaf x) (caddr x))


(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))


(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))


(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))


(define (encode-symbol smb tree)
  (define (branch-correct? branch)
    (if (leaf? branch)
        (equal? smb (symbol-leaf branch))
        (element-of-set? smb (symbols branch))))
  (let ((lb (left-branch tree))
        (rb (right-branch tree)))
    (cond ((branch-correct? lb)
           (if (leaf? lb) '(0) (cons 0 (encode-symbol smb lb))))
          ((branch-correct? rb)
          (if (leaf? rb) '(1) (cons 1 (encode-symbol smb rb))))
    (else (error "bad symbol -- RNCODE-SYMBOL" tree)))))


;test data
(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))


(encode '(A D A B B C A) sample-tree)
;(0 1 1 0 0 1 0 1 0 1 1 1 0)