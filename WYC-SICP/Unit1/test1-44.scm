(define (repeated f n)
    (if (= n 1)
        f                  
        (lambda (x)
            (let ((fs (repeated f (- n 1))))
                (f (fs x))))))

(define dx 0.0001)

(define (square n) (* n n))

(define (smooth f)
    (lambda (x)
        (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

((repeated (smooth square) 2) 5)
