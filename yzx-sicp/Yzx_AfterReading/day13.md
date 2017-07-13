<br>点石暑假集训第13天bug分析报告</br>
<br>下面我直接上代码，用代码来说话</br>
###原答案(也是一个错误答案) 
(define (fringe tree)
  (cond ((null? tree)
         '())
        ((not (pair? tree))
         (list tree))
        (else
         (append (fringe (car tree))
                 (fringe (cadr tree))))))
例如我的测试数据为（list (list 1 2) (list 3 4)),那么这个显示的结果就是（1 2 3 4）因为append那一行的第二个fringe后面是cadr，对tree取car完毕后就是(list (list 1 2)（list 3 4))这个时候取cadr和cdr是一样的效果，所以这个地方可以说cadr是滥竽充数，当然了这个例子是理想状况下的结果，输出和题意相符，但是如果你尝试一下(list 1 2 (list 3 4))这个时候你会发现car的结果是(fringe 1),cadr的结果是(fringe 2)根据pair的条件，这个时候就直接返回(list tree)那结果应该就是（1 2）这个看起来和我们的（1 2 3 4）不相符。但是这个把此处的cadr换成cdr这个时候cadr的2被替换成了取cdr的(2 (list 3 4)然后再遍历一边，然后发现两个例子都可以，说明这条路才是通用的，现在我们来改进一下我们的算法。
###改进后的答案
(define (fringe tree) 
   (cond ((null? tree) '()) 
         ((not (pair? tree)) (list tree)) 
         (else (append (fringe (car tree)) (fringe (cdr tree))))))

