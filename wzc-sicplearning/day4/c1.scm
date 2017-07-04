1.1直接扔进去跑
10
(+ 5 3 4)
(- 9 1)
(/ 6 2)
(+ (* 2 4) (- 4 6))
(define a 3)
(define b (+ a 1))
(+ a b (* a b))
(= a b)
(if (and (> b a) (< b (* a b)))
    b
    a)
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
(+ 2 (if (> b a) b a))
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))

1.2 没看清中间那个字符是什么，如果是4
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 1 3)))))
 (* 3 (- 6 2) (- 7 2)))

1.3 返回三个数中最大俩数平方和
(define (sum-squire a b c)
  (define l (sort (list a b c) >))
    (+ (* (car l) (car l))
      (* (car (cdr l)) (car (cdr l)))))

注意 不能'(a b c)，因为'(a b c)=(a b c)!=(1 2 3),假设
a=1 b=2 c=3.

1.4 意思是可以返回一个操作符

1.5 normal-order evaluatio 正常顺序求值？怎么翻译的..
applicative-order evaluation 应用顺序求值？
第二种会无限循环，第一种返回0
当然mit-scheme肯定是第二种，这也是为什么下一道题崩的原因

1.6因为上面的原因，自己定义的if，真假两个条件都会被求值，
然后就递归的太深了，解释器弄崩溃了
但不是很缺定，因为函数求值顺序都是可能的，有的从左向右，有的从右向左

1.7应该是改算法增加精确度的问题，当x非常大或者非常小时，不能得到正确结果，
方法是比较新旧两者的差值。
(define (good-enough? old new)
    (> 0.001
       (/ (abs (- new old))
          old)))
(define (sqrt-iter old x)
    (let ((new (improve old x)))
        (if (good-enough? old new)
            new
            (sqrt-iter new x))))

1.8写一个求三次方跟的：

;应该有精度问题
(define (cube-root x)
    (cube-root-iter 1.0 x))

(define (cube-root-iter guess x)
    (if (good-enough? guess x)
        guess
        (cube-root-iter (improve guess x)
                        x)))

(define (good-enough? guess x)
    (< (abs (- (cube guess) x))
       0.0001))

(define (improve guess x)                   ; 套公式
    (/ (+ (/ x (square guess)) (* 2 guess))
       3))
1.9 两种函数，两种递归方式，第二种在返回时计算值，尾递归
第一种在递归过程求值，吃资源。

1.10 这个 Ackermann函数 卡yzc好久，应该是和进制有关系
(define (A x y)
    (cond ((= y 0)
            0)
          ((= x 0)
            (* 2 y))
          ((= y 1)
            2)
          (else
            (A (- x 1)
               (A x (- y 1))))))

 (A 1 10)
;Value: 1024
 (A 2 4)
;Value: 65536
(A 3 3)
;Value: 65536
显然可得，
(A 0 x) = 2*x
(A 1 x) = 2^x

1.11 递归求解，这里直接给出迭代法
(define (f-iter n count a b c)
  (cond
    ((< n 3) n)
    ((= n count) a)
    (else
      (f2-iter n (+ count 1) (+ a (* 2 b) (* 3 c)) a b))))

(define (f n)
  (f-iter n 2 2 1 0))
;仔细查找abc规律即可

1.12杨辉三角，帕斯卡你妹
1
1  1
1  2  1
1  3  3  1
1  4  6  4  1
1  5  10  10  5  1
1  6  15  20  15  6  1
1  7  21  35  35  21  7  1
1  8  28  56  70  56  28  8  1
1  9  36  84  126  126  84  36  9  1
1  10  45  120  210  252  210  120  45  10  1
1  11  55  165  330  462  462  330  165  55  11  1
1  12  66  220  495  792  924  792  495  220  66  12  1
1  13  78  286  715  1287  1716  1716  1287  715  286  78  13  1
1  14  91  364  1001  2002  3003  3432  3003  2002  1001  364  91  14  1
1  15  105  455  1365  3003  5005  6435  6435  5005  3003  1365  455  105  15  1
1  16  120  560  1820  4368  8008  11440  12870  11440  8008  4368  1820  560  120  16  1
......

(define (YHtriangle row col)
  (cond
    ((= col 1) 1)
    ((= row col) 1)
    (else
      (+ (YHtriangle (- row 1) (- col 1))
         (YHtriangle (- row 1) col)))))

1.13 数学证明题，没看懂

1.14 这道题要画很大的一张图。

1.15 (看答案，实在不会求复杂度)求sin(a)近似，求复杂度。
  求近似已经给出来公式，先定义下
(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
    (if (not (> (abs angle) 0.1))
        angle
        (p (sine (/ angle 3.0)))))
有一个trace or trace-entry函数可以追踪p...
所以一共调用了5次，复杂度O(log n)

1.16 根据题意定义即可
(define (fast-expt-iter p n a)
    (cond
        ((= n 0) a)
        ((even? n) (fast-expt-iter (square p) (/ n 2) a))
        (else (fast-expt-iter p (- n 1) (* a p)))))
(define (fast-expt2 p n)
    (fast-expt-iter p n 1))

1.17 没有乘法了，要自己写一个了
(define (cheng a b)
  (cond
    ((= b 1) a)
    ((even? b) (cheng (* 2 a) (/ b 2)))
    ((odd? b)
      (+ a (cheng a (- b 1))))))

1.18 这道题要强制用迭代写乘法了

(define (mul a b)
  (mul-i a b 0))
(define (mul-i a b n)
  (cond ((= b 0)
		 n)
		((even? b)
		 (mul-i (* 2 a) (/ b 2) n))
		(else (mul-i a (- b 1) (+ n a)))))
(define (even? n)
  (= (remainder n 2) 0)) ;求余很屌

1.19
(define (even? n)
	(= (remainder n 2) 0))
(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
 (cond ((= count 0) b)
        ((even? count)
         (fib-iter a b (+ (square p) (square q)) (+ (* 2 p q) (square q)) (/ count 2)))
				(else
          (fib-iter (+ (* b q) (* a q) (* a p))
           (+ (* b p) (* a q)) p q (- count 1)))))

1.20辗转相除
(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

1.21-1.28 素数

1.29 求积分
;;;作者:wyc
(define (cube n)
  (* n n n))

(define (inc n)
  (+ 1 n))

(define (sum term a next b)
  (if (> a b)
      0
	  (+ (term a)
		 (sum term (next a) next b))))

(define (simpson f a b n)
  (define h (/ (- b a) n))

  (define (yk k) (f (+ a (* k h))))

  (define (simpson-iter k)
     (* (yk k)
	    (cond ((or (= k 0) (= k n))  1)
			  ((even? k) 2)
			  ((odd? k) 4))))

  (* (/ h 3.0) (sum simpson-iter 0 inc n)))

 (simpson cube 0 1 100)

1.30(留一个线性递归凑数)
(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
        (sum term (next a) next b))))

1.31 过程抽象
(define (product a term b next)
  (if (> a b)
    1
    (* (term a)
       (product (next a) term b next))))

(define (identity x) x)
(define (inc x) (+ x 1))

(define (factorial n)
  (product 1 identity n inc))


(define (pi a b)
  (define (pi-term n)
    (if (even? n)
      (/ (+ n 2) (+ n 1))
      (/ (+ n 1) (+ n 2))))
  (* 4.0
     (product a pi-term b inc)))

(pi 1 100)
