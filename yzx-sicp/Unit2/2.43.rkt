
;练习 2.42 的 queens 函数对于每个棋盘 (queen-cols k) ,使用 enumerate-interval 产生 board-size 个棋盘。
;而 Louis 的 queens 函数对于 (enumerate-interval 1 board-size) 的每个 k ，都要产生 (queen-cols (- k 1)) 个棋盘。
;因此， Louis 的 queens 函数的运行速度大约是原来 queens 函数的 board-size 倍，也即是 T * board-size 。
