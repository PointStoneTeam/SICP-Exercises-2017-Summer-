#lang scheme
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
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(map1 square (list 1 2 3))

