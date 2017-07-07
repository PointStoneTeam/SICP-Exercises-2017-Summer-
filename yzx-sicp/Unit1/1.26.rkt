#lang scheme
(remainder (square (expmod base (/ exp 2) m)) m)
;;;原来的
;;;当这个数为偶数的时候
(remainder (* (expmod base (/ exp 2) m)
              (expmod base (/ exp 2) m))
           m)
;;;很明显当输入的数为一个偶数的时候这个过程的运算步骤翻了一倍

;;;原本 Θ(logn)Θ(log⁡n) 的计算过程变成了 Θ(n)