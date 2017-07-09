(define (mark-rat n d) 
    (define N (- 0 n))
    (define D (- 0 d))
    (cond ((and (< n 0) (< d 0))
          ((let ((g (gcd N D)))
                (cons (/ N g) (/ D g)))))
          ((and (> n 0) (> d 0))
          ((let ((g (gcd n d))) 
                 (cons (/ n g) (/ d g)))))
          ((and (< n 0) (> d 0))
          ((let ((g (gcd N d)))
                 (cons (/ N g) (/ d g)))))
          ((and (> n 0) (< d 0))
          ((let ((g (gcd n D)))
                 (cons (/ N g) (/ D g)))))))
(define (number x) (car x))
(define (denom x) (cdr x))

