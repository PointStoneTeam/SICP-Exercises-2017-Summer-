#lang scheme
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
          
;origin definition of map
;p is the procedure
(define (map p sequence)
  (if (null? sequence)
      '()
      (cons (p (car sequence))
            (map p (cdr sequence)))))
;accumulate-map definition
(define (map1 p sequence)
  (accumulate (lambda (x y)
                (cons (p x) y))
              '()
              sequence))
(define (square b)
  (* b b))

(map1 square (list 1 2 3))

(define (append seq1 seq2)
    (accumulate cons seq2 seq1))

(define (length sequence)
    (accumulate (lambda (x y) (+ 1 y))
                0
                sequence))
