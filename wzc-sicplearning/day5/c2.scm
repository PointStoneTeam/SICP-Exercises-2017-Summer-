2.1 支持负数的版本
(define (make-rat x y)
  (let ((g (gcd x y)))
    (if (< (/ x y) 0)
      (cons (/ (- x) g) (/ y g))
      (cons (/ x g) (/ y g)))))

2.2 计算中点，定义点...定义线段。。

(define (print-point p)
	(newline)
	(display "(")
	(display (x-point p))
	(display ",")
	(display (y-point p))
  (display ")")
)
(define (start-segment line)
	(car line)
)
(define (end-segment line)
	(cdr line)
)
(define (make-segment start-point end-point)
	(cons start-point end-point)
)
(define (x-point point)
	(car point)
)
(define (y-point point)
	(cdr point)
)
(define (make-point x y)
	(cons x y)
)
(define (midpoint-segment line)
	(make-point
		(/ (+ (x-point (start-segment line)) (x-point (end-segment line))) 2)
		(/ (+ (y-point (start-segment line)) (y-point (end-segment line))) 2)
	)
)

2.3 矩阵周长面积
  上一道题已经定义了线段了
(define (make-rect left-top-point right-bottom-point)
	(cons left-top-point right-bottom-point)
)
(define (one-line rect)
	(abs (- (x-point (car rect)) (x-point (cdr rect))))
)
(define (another-line rect)
	(abs (- (y-point (car rect)) (y-point (cdr rect))))
)
(define (cal-p rect)
	(* (+ (one-line rect) (another-line rect)) 2)
)
(define (cal-a rect)
	(* (one-line rect) (another-line rect))
)
(cal-p (make-rect (make-point 1 4) (make-point 2 7)))
(cal-a (make-rect (make-point 1 4) (make-point 2 7)))

2.4 很强，重新定义car cdr
(define (cons x y)
  (lambda (m) (m x y)))

(define (car l)
  (l
    (lambda(p q) p)
    ))

(define (cdr l)
  (l
    (lambda(p q) q)
    ))

2.5 假设有pow
(define (cons x y)
  (*
    (pow 2 x)
    (pow 3 y)))

2.6 lambda演算
(define zero
  (lambda (f)
   (lambda (x) x))
   )

(define (add-1 n)
  (lambda (f)
    (lambda (x)
     (f ((n f) x)))))

(define one
  (lambda (f)
    (lambda (x) (f x))))

(define two
  (lambda (f)
    (lambda (x) (f (f x)))))

(define (+ a b)
	(lambda (f)
    (lambda (x)
      ((a f) ((b f) x))))
)

2.7-2.16 扩展练习哎...暂时先偷个懒。

2.17 表最后一个元素
(define (last-pair last)
  (if (null? (cdr last))
    last
    (last-pair (cdr last))))

2.18 逆序
(define (reverse l)
  (if (null? l)
    nil
    (append (reverse (cdr l)) (list (car l)))))

2.19zhaoing
(define (first-denomination a)
	(car a)
)
(define (except-first-denomination a)
	(cdr a)
)
(define (no-more? a)
	(null? a)
)

2.20奇偶
(define (even? x)
	(= (remainder x 2) 0)
)
(define (same-parity . a)
	(define (filter b even)
		(if (not (null? b))
			(
				cond
					(even (if
            (even?
              (car b))
                (cons (car b)
                 (filter (cdr b) even))
                  (filter (cdr b) even)))
					(else (if (not (even? (car b))) ;只定义了even?
            (cons (car b)
              (filter (cdr b) even))
                (filter (cdr b) even)))
			)
			'()
		)
	)
	(cons (car a)
    (filter (cdr a) (even? (car a))))
)

2.21
(define (square-list items)
	(if (null? items)
		'()
		(cons (square (car items)) (square-list (cdr items))))
)

2.24 画图题

2.25取7
(car (cdr (car (cdr (cdr
  (list 1 3 (list 5 7) 9))))))
;Value: 7
(car (car (list (list 7))))
;Value: 7
(cadr (cadr (cadr (cadr (cadr (cadr
  (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7))))))))))))
;Value: 7

2.26

(define x (list 1 2 3))
(define y (list 4 5 6))

(append x y)
;Value: (1 2 3 4 5 6)
(cons x y)
;Value: ((1 2 3) 4 5 6)
(list x y)
;Value: ((1 2 3) (4 5 6))

2.27~树
(define (deep-reverse items)
  (cond
    ((null? items)
      nil)
    ((not (pair? items))
     items)
    (else
      (append (deep-reverse (cdr items))
              (list
                (deep-reverse (car items)))))))
