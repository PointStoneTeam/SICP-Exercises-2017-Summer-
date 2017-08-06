#lang racket
                     {a b c d e} 31
                     /           \
                {a b c d} 15      e 16
                 /     \
           {a b c} 7    d 8
             /    \
        {a b} 3    c 4
         /   \
      a 1    b 2
;The tree for n=10 looks similar, only larger.

;The minimum number of bits to construct a symbol (i.e. the minimum depth to reach a leaf) for such trees is 1, for the symbol of weight 2^n-1.

;The maximum number of bits will be n-1, for the two symbols of least weight.