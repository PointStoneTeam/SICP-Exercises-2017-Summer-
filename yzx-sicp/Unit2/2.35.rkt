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

(define (count-leaves tree)
    (accumulate +
                0
                (map (lambda (sub-tree)
                         (if (pair? sub-tree)           ; 如果这个节点有分支
                             (count-leaves sub-tree)    ; 那么这个节点调用 count-leaves 的结果就是这个节点的树叶数量
                             1))                        ; 遇上一个叶子节点就返回 1
                     tree)))
