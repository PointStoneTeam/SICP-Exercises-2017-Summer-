#lang scheme
;;;1.34
(define (f g)
  (g 2))
;(f f)

;;;执行表达式(f.f)会造成错误；(f,f)展开如下：
(f (lambda (g)
     (g 2)))
((lambda (g) (g 2))
 (lambda (g)
  (g 2)))
((lambda (g)
  (g 2))
 2)
(2 2)
;执行到（2，2）这一步时，解释器试图以2作为函数进行调用，但是2并不是一个函数，所以执行出错“expected a procedure that can be applied to arguments”