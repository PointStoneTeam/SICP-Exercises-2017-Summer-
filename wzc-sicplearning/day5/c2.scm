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

2.33 map
(define (map p sequence)
  (accumulate
    (lambda (x y)
     (cons x (p y)))
       nil sequence))
(define (append seq1 seq2) (accumulate cons seq1 seq2))
(define (length sequence) (accumulate inc 0 sequence))

2.34明明是秦九昭啊
(define (accumulate op initial sequence)
	(if (null? sequence)
  initial
  (op (car sequence)
     	(accumulate op initial (cdr sequence))
  )
	)
)

(define (horner-eval x coefficient-sequence)
	(accumulate
		(lambda (this-coeff higher-terms)
			(+ this-coeff (* higher-terms x))
		)
    0
    coefficient-sequence
  )
)

2.35 计算子树
(define (accumulate op initial sequence)
	(if (null? sequence)
  initial
  (op
    (car sequence)
     	(accumulate op initial (cdr sequence))
  )
	)
)

(define (enumerate-tree tree)
	(cond ((null? tree)
   '())
	((not (pair? tree))
   (list 1))
	(else
     (append (enumerate-tree (car tree))
        (enumerate-tree (cdr tree)))))
)

(define (count-leaves t)
	(accumulate + 0 (
    map (lambda (x) x) (enumerate-tree t)))
)

2.36 map car可以取出每个list第一个元素
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    nil
    (cons (accumulate op init (map car seqs))
          (accumulate-n op init (map cdr seqs)))))

2.37 矩阵乘法

2.38 fold-left
(define (fold-left op initial sequence)
  (define (iter result rest)
(if (null? rest)
  result
        (iter (op result (car rest))
              (cdr rest))))
(iter initial sequence))

2.53 和第一题一样了
(list 'a 'b)
; (a b)

(list (list 'geroge))
;((geroge))

(cdr '((x1 x2) (y1 y2)))
;((y1 y2))

(cadr '((x1 x2) (y1 y2)))
;(y1 y2)

(pair? (car '(a short list)))
; #f

(define (memq a lat)
  (if (null? lat)
    #f
    (or (eq? a (car lat))
        (memq a (cdr lat)))))

(memq 'red '((red shoes) (blue socks)))
;#f

(memq 'red '(red shoes blue socks))
;#t

2.54递归对比就好了
(define (equal? l1 l2)
	(cond
		(
    (and (null? l1) (null? l2))
      true)
		((eq? (car l1) (car l2))
      (equal? (cdr l1) (cdr l2)))
		((not (eq?
      (car l1) (car l2)))
        false)
		(else
      false)
	)
)

2.55基础题
(car ''(abracadabra))
;相当于
(car (quote (quote (abracadabra))))

(car ''abracadabra)

;Value: quote
(cadr ''(abracadabra))
;Value: (abracadabra)
2.56-2.58符号求导...
2.59-2.66操作集合~表
2.67-2.72 哈夫曼...参考cjx，还是不会
2.73 数据导向设计，核心思想貌似是

(define (install-sum-package)
    (define (addend s)
        (car s))
    (define (augend s)
        (cadr s))
    (define (make-sum x y)
        (cond ((=number? x 0)
                y)
              ((=number? y 0)
                x)
              ((and (number? x) (number? y))
                (+ x y))
              (else
                (attach-tag '+ x y))))
    (put 'addend '+ addend)
    (put 'augend '+ augend)
    (put 'make-sum '+ make-sum)
    (put 'deriv '+
        (lambda (exp var)
            (make-sum (deriv (addend exp) var)
                      (deriv (augend exp) var))))
'done)
(define (make-sum x y)
    ((get 'make-sum '+) x y))

(define (addend sum)
    ((get 'addend '+) (contents sum)))

(define (augend sum)
    ((get 'augend '+) (contents sum)))

2.74 模块化设计...

2.80
(define install-=zero?
	(put '=zero? 'scheme-number	(lambda (x) (= x 0)))
	(put '=zero? 'rational	(lambda (x) (= (numer x) 0)))
	(put '=zero? 'complex	(lambda (x) (and (= (real-part x) 0) (= (imag-part x) 0))))
)

2.81
(define coercion-table
  (make-table))
(define get-coercion 
  (coercion-table 'lookup-proc))
(define put-coercion
  (coercion-table 'insert-proc!))
(define (apply-generic op . args)
    (let ((type-tags (map type-tag args)))
        (let ((proc (get op type-tags)))
            (if proc
                (apply proc (map contents args))
                (if (= (length args) 2)
                    (let ((type1 (car type-tags))
                          (type2 (cadr type-tags))
                          (a1 (car args))
                          (a2 (cadr args)))
                        (let ((t1->t2 (get-coercion type1 type2))
                              (t2->t1 (get-coercion type2 type1)))
                            (cond (t1->t2
                                    (apply-generic op (t1->t2 a1) a2))
                                  (t2->t1
                                    (apply-generic op a1 (t2->t1 a2)))
                                  (else
                                    (error "No method for these types"
                                            (list op type-tags))))))
                    (error "No method for these types"
                            (list op type-tags)))))))
