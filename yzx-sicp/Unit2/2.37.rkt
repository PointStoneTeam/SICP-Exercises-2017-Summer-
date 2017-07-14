#lang scheme
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;matrix*vector
(define (matrix-*-vector m v)
  (map (lambda (row)
         (dot-product row v))
       m))

(define m (list (list 1 2 3 4)
                (list 4 5 6 7)
                (list 6 7 8 9)))
(define v (list 1 2 3 4))
(matrix-*-vector m v)


;transpose-of-matrix
(define (car-n seqs)
  (map car seqs))

(define (cdr-n seqs)
  (map cdr seqs))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (car-n seqs))
            (accumulate-n op init (cdr-n seqs)))))

(define (transpose mat)
  (accumulate-n cons '() mat))
(transpose m)


;matrix*matrix
(define (matrix-*-matrix m n)
    (let ((cols (transpose n)))
        (map (lambda (col-of-m)
                 (map (lambda (col-of-cols)
                          (dot-product col-of-m 
                                       col-of-cols))
                      cols))
             m)))
(define n (transpose m))
(matrix-*-matrix m n)
;second-way
(define (matrix-*-matrix1 m n)
    (let ((trans-n (transpose n)))
        (map (lambda (row-of-m)
                (matrix-*-vector trans-n row-of-m))
                m)))
(matrix-*-matrix1 m n)