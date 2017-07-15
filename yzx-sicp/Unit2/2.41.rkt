#lang scheme
(define (accumulate op initial sequence)
     (if (null? sequence) 
       initial 
       (op (car sequence) 
           (accumulate op initial (cdr sequence)))))

(define (unique-pairs n)
    (flatmap (lambda (i)
                 (map (lambda (j) (list i j))
                      (enumerate-interval 1 (- i 1))))
             (enumerate-interval 1 n)))

(define (enumerate-interval low high) 
   (if (> low high) 
       '() 
       (cons low (enumerate-interval (+ low 1) high))))
(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))
(define (unique-triples n)
    (flatmap (lambda (i)
                 (map (lambda (j)                   ; cons 起 i 元素和二元组 j ,组成三元组
                          (cons i j))
                      (unique-pairs (- i 1))))      ; 生成不大于 i 的所有相异整数二元组
             (enumerate-interval 1 n)))             ; 生成 1 至 n 的所有整数，作为 i
(unique-triples 5)

(define (triple-sum-equal-to? sum triple)
    (= sum
       (+ (car triple)
          (cadr triple)
          (caddr triple))))
(triple-sum-equal-to? 6 (list 1 2 3))
(triple-sum-equal-to? 0 (list 1 2 3))

(define (triple-sum-equal-to1? sum triple)
    (= sum
       (accumulate + 0 triple)))
(triple-sum-equal-to1? 3 (list 1 1 1))
(triple-sum-equal-to1? 0 (list 1 2 3))

(define (remove-triples-not-equal-to sum triple)
    (filter (lambda (current-triple)
                (triple-sum-equal-to? sum current-triple))
            triple))
(remove-triples-not-equal-to 5 (unique-triples 6))
(remove-triples-not-equal-to 6 (unique-triples 6))
(unique-triples 13)
(remove-triples-not-equal-to 10 (unique-triples 13))
