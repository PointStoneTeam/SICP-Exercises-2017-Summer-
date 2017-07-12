#lang scheme

(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cadr mobile))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (cadr branch))
(define mobile (make-mobile (make-branch 10 25)
                            (make-branch 5 20)))
(left-branch mobile)
(right-branch mobile)
(branch-length (right-branch mobile))
(branch-structure (right-branch mobile))
;;;(b)total-weight
(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))    ;计算两个分支的重量之和
     (branch-weight (right-branch mobile))))
(define (branch-weight branch)
  (if (hangs-another-mobile? branch)         ;如果这个分支吊着另一个活动体
      (total-weight (branch-structure branch));那么这个活动体的总重量就是这个分支的重量
      (branch-structure branch)));否则，分支的structure部分就是分枝的重量

(define (hangs-another-mobile? branch)
  (pair? (branch-structure branch)))
(total-weight mobile)
(define another-mobile (make-mobile (make-branch 10 mobile)
                                    (make-branch 10 20)))
(total-weight another-mobile)
;;;(c)branch-torque 力矩
(define (branch-torque branch)
  (* (branch-length branch)
     (branch-weight branch)))
(define branch (make-branch 10 20))
(branch-torque branch)
;;;mobile-balance
(define (mobile-balance? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (and                              ;mobile-balance需要满足的条件
     (same-torque? left right)
     (branch-balance? left)
     (branch-balance? right))))
(define (same-torque? left right)
  (= (branch-torque left)
     (branch-torque right)))
(define (branch-balance? branch)
  (if (hangs-another-mobile? branch)
      (mobile-balance? (branch-structure branch))
      #t))
(define balance-mobile (make-mobile (make-branch 10 10)
                                    (make-branch 10 10)))
(mobile-balance? balance-mobile)
(define unbalance-mobile (make-mobile (make-branch 0 0)
                                      (make-branch 10 10)))
(mobile-balance? unbalance-mobile)
(define mobile-with-sub-mobile (make-mobile (make-branch 10 balance-mobile)
                                            (make-branch 10 balance-mobile)))
(mobile-balance? mobile-with-sub-mobile)
;;;(d)new-selector   ;因为活动体程序是通过数据抽象的方式实现的将程序之间很好的用构造函数和选择函数隔开了所以就算
;;;make-mobile,make-branch的构造函数使用新的表示方式，我们只需要修改相应的选择函数
;;;需要修改的程序有left-branch,right-branch,branch-length,branch-structure,具体实现如下
(define (make-mobile1 left right)
  (cons left right))
(define (make-branch1 length structure)
  (cons length structure))
(define (left-branch1 mobile)
  (car mobile))
(define (right-branch1 mobile)
  (cdr mobile))
(define (branch-length1 branch)
  (car branch))
(define (branch-length1 branch)
  (cdr branch))
;.........然后后面的selector函数重新换一下构造函数名字就好








