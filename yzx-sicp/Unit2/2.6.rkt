#lang scheme
(add-1 zero)
(add-1 (lambda (f)
          (lambda (x)
            x)))
((lambda (n)
  (lambda (f)
    (lambda (x)
      (f ((n f) x)))))
 (lambda (f)
   (lambda (x)
     x)))
(lambda (f)
  (lambda (x)
    (f (
        ((lambda (f)
           (lambda (x)
             x))
         f)
        x)))
  (lambda (f)
    (lambda (x)
      (f (lambda (x) x)
         x))))
(lambda (f)
  (lambda (x)
    (f x)))
(define one
  (lambda (f)
    (lambda (x)
      (f x))))

;add-1 two
(add-1 one)
(add-1 (lambda (f)
         (lambda (x)
           (f x))))
((lambda (n)
   (lambda (f)
     (lambda (x)
       (f ((n f) x)))))
 (lambda (f)
   (lambda (x)
     (f x))))
(lambda (f)
  (lambda (x)
    (f ((
         (lambda (f)
           (lambda (x)
             (f x)))
         f)
        x))))
(lambda (f)
  (lambda (x)
    (f (f x))))

(define two
  (lambda (f)
    (lambda (x)
      (f (f x)))))

;因此我们有理由相信，three 和 four的定义很有可能如下
(define three
  (lambda (f)
    (lambda (x)
      (f (f (f x))))))

(define four
  (lambda (f)
    (lambda (x)
      (f (f (f (f x)))))))

(+ 3 2)
(+ (lambda (f)
     (lambda (x)
       (f (f (f x)))))
   (lambda (f)
     (lambda (x)
       (f (f x)))))
;...
(lambda (f)
  (lambda (x)
    (f (f (f (f (f x)))))))
;Church-count-method
(define +
  (lambda (m)
    (lambda (n)
      (lambda (f)
        (lambda (x)
          (m f (n f x)))))))

(+ 2 1)
((lambda (m)
   (lambda (n)
     (lambda (f)
       (lambda (x)
         (m f (n f x))))))
 2
 1)
;将2应用到参数m
((lambda (n)
   (lambda (f)
     (lambda (x)
       (2 f (n f x)))))
 1)
;将1应用到参数n
((lambda (f)
   (lambda (x)
     (2 f (1 f x)))))
;展开 1
(lambda (f)
  (lambda (x)
    (2 f (
         (lambda (f)
           (lambda (x)
             (f x)))
         f
         x))))
;将f应用到参数f
(lambda (f)
  (lambda (x)
    (2 f (
          (lambda (f)
            (f x))
          x))))
;将x应用到参数
(lambda (f)
  (lambda (x)
    (2 f (f x))))
;展开2
(lambda (f)
  (lambda (x)
    (
     (lambda (f)
       (lambda (x)
         (f (f x))))
     f
     (f x))))
;将f应用到参数f
(lambda (f)
  (lambda (x)
    (
     (lambda (x)
       (f (f x)))
     (f x))))
;将（f x）应用到参数x， 计算完成
(lambda (f)
  (lambda (x)
    (f (f (f x)))))



