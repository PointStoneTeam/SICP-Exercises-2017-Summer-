
(define (plus? exp)
   (eq? (car exp) '+))

(define (multi? exp)
  (eq? (car exp) '*))

(define (minus? exp)
  (eq? (car exp) '-))

(define (var? var realvar)
  (eq? var realvar))

(define (make-sum a1 a2)
  (cond ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (make-minus a1 a2)
  (list '- a1 a2))

(define (make-multi a1 a2)
  (cond ((and (number? a1) (number? a2)) (* a1 a2))
        ((eq? a1 '1) a2)
        (else (list '* a1 a2))))

(define (make-division a1 a2)
  (list '/ a1 a2))


(define (deriv exp var)
  (cond ((var? exp var) 1)
        ((number? exp) 0)
        ((plus? exp) (make-sum (deriv (cadr exp) var)
                                     (deriv (caddr exp) var)))
        ((minus? exp) (make-minus (deriv (cadr exp) var)
                                  (deriv (caddr exp) var)))
        ((multi? exp) (make-sum (make-multi (deriv (cadr exp) var)
                                           (caddr exp))
                               (make-multi (deriv (caddr exp) var)
                                            (cadr exp))))))
                                     
