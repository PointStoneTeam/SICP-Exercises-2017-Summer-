#lang scheme
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (fringe tree)
  (cond ((null? tree)
         '()
         ((not (pair? tree))
          (list tree))
         (
          (append (fringe (car tree))
                  (fringe (cadr tree)))))))
          
(define (count-leaves tree)
  (accumulate (lambda (current-leave remained-leaves-count)
                (+ 1 remained-leaves-count))
              0
              (fringe tree)))

(define (count-leaves2 tree)
  (length (fringe tree)))
(count-leaves2 (list (list 1 2) (list 3 4)))

