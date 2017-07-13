#lang scheme
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define s (list (list 1 2 3)
                (list 4 5 6)
                (list 7 8 9)
                (list 10 11 12)))

(define (car-n seqs)
  (map car seqs))
(car-n s)

(define (cdr-n seqs)
  (map cdr seqs))
(cdr-n s)




(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (car-n seqs))
            (accumulate-n op init (cdr-n seqs)))))
(accumulate-n + 0 s)
      
