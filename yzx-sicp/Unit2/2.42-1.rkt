#lang scheme
;定义一个空棋盘
(define empty-board '())
(define (rest-of-queens queen) (cdr queen))
;添加一个皇后
(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))
(define (iter-check row-of-new-queen rest-of-queens i)
  (if (null? rest-of-queens)
      #t
      (let ((row-of-current-queen (car rest-of-queens)))
        (if (or (= row-of-new-queen row-of-current-queen)
                (= row-of-new-queen (+ i row-of-current-queen))
                (= row-of-new-queen (- i row-of-current-queen)))
            #f
            (iter-check row-of-new-queen
                        (cdr rest-of-queens)
                        (+ i 1))))))

(define (accumulate op initial sequence)
     (if (null? sequence) 
       initial 
       (op (car sequence) 
           (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (enumerate-interval low high) 
   (if (> low high) 
       '() 
       (cons low (enumerate-interval (+ low 1) high))))

(define (safe? k position)
  (iter-check (car position)
              (cdr position)
              1))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

