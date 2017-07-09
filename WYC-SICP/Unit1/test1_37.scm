(define (cont-farc n d k)
    (define (iter a result)
        (if (= a 0)
            result
            (iter (- a 1) (/ (n a) (+ (d a) result ) ) )
        )
      )
    (iter k 0)
)

(cont-farc (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)
