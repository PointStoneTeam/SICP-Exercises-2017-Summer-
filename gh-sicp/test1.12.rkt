#lang racket
(define (pascal n)
  (pascal-show n))
(define pascal-triangle
  (lambda (row col)
    (cond ([or (= row 0) (= col 0)] 0)
          ([= row col] 1) 
          (else (+ (pascal-triangle (- row 1) (- col 1))
                   (pascal-triangle (- row 1) col))))))
(define pascal-show
  (lambda (n)
    (let iter([i 1][j 1])
       (when (< i (+ n 1))
         (display (pascal-triangle i j))
         (display " ")
         (if (= i j)
             (begin (newline)(iter (+ i 1) 1))
             (iter i (+ j 1)))))))
(pascal 3)