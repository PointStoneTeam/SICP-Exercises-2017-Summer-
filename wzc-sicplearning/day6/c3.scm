3.1
(define (make-accumulator init)
	(lambda (x) (set! init (+ init x)) init)
)

(define A (make-accumulator 5))

3.2
(define (make-monitored f)
  (let ((acc 0))
    (lambda (x)
      (cond
        ((eq? x 'how-many-calls?) acc)
        ((eq? x 'reset-count) (set! acc 0))
        (else (begin (set! acc (+ acc 1))
                     (f x)))))))

(define 我是一个名称 (make-monitored sqrt))

3.3

(define (make-account balance password)
	(define (withdraw amount)
		(if (>= balance amount)
			(begin (set! balance (- balance amount)) balance)
			"Insufficient funds")
	)
	(define (deposit amount)
		(set! balance (+ balance amount))
		balance)
	(define (dispatch p m)
		(if (eqv? p password)
			(cond
				((eq? m 'withdraw) withdraw)
				((eq? m 'deposit) deposit)
				(else (error "Unknown request: MAKE-ACCOUNT" m))
			)
			(error "Incorrect password")
		)
	)
	dispatch
)

3.4 银行账户处理系统
(define (make-account balance password)
	(define wrong-password-count 0)
	(define (withdraw amount)
		(if (>= balance amount)
			(begin (set! balance (- balance amount)) balance)
			"Insufficient funds")
	)
	(define (deposit amount)
		(set! balance (+ balance amount))
		balance)
	(define (dispatch p m)
		(if (eqv? p password)
			(cond
				((eq? m 'withdraw) withdraw)
				((eq? m 'deposit) deposit)
				(else (error "Unknown request: MAKE-ACCOUNT" m))
			)
			(begin (set! wrong-password-count (+ wrong-password-count 1))
        (if (> wrong-password-count 7) call-the-cops)
         (error "Incorrect password"))
		)
	)
	dispatch
)

3.6随机赋值
