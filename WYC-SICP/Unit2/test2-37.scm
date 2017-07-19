(define (car-n seq)
  (map car seq))
(define (cdr-n seq)
  (map cdr seq))


(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      ()
      (cons (accumulate op init   (car-n seqs))
            (accumulate-n op init (cdr-n seqs)))))


(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (dot-product v w)
  (accumulate + 0 (map * v m)))
(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product v x)) m))
(define (transpose mat)
  (accumulate-n cons () mat))
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x))
         m)))
                
                
