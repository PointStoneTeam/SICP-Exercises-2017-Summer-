(define (unique-pairs n)
  (accumulate append 
              ()
              (map (lambda (i) 
                           (map (lambda (j) (list i j))
                                (enumerate-interval 1 (- i 1))))
                   (enumerate-interval 1 n))))
(define (unique-list n)
  (accumulate append
              ()
              (map (lambda (i)
                           (map (lambda (j) (cons i j))
                                (unique-pairs (- i 1))))
                   (enumerate-interval 1 n))))
(define (accumulate pro init seq)
  (if (null? seq)
      init
      (pro (car seq)
           (accumulate pro init (cdr seq)))))

(define (enumerate-interval start end)
  (if (> start end) () (cons start (enumerate-interval (+ start 1) end))))

(define (permutations s)
  (if (null? s)
      (list ())
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))

(define (flatmap proc seq)
  (accumulate append () (map proc seq)))

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
          sequence))
(define (make-three-pair s n)
  (define (sum-pair? pair) 
    (= s (+ (car pair) (cadr pair) (caddr pair))))
  (map permutations
       (filter sum-pair?
               (unique-list n))))

