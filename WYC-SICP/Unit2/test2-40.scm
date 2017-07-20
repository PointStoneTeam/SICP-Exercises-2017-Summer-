(define (unique-pairs n)
  (accumulate append 
              ()
              (map (lambda (i) (map (lambda (j) (list i j))
                                    (enumerate-interval 1 (- i 1))))
                   (enumerate-interval 1 n))))

(define (accumulate pro init seq)
  (if (null? seq)
      init
      (pro (car seq)
           (accumulate pro init (cdr seq)))))

(define (enumerate-interval start end)
  (if (> start end) () (list start (enumerate-interval (+ start 1) end))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))
(define (prime? n)
  (= (smallest-factor 2 n) n))
(define (smallest-factor test n)
  (cond ((= test n) n)
        ((= (remainder n test) 0) test)
        (else (smallest-factor (+1 test) n))))
