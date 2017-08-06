#lang scheme
(define tree (generate-huffman-tree '((A 1) (NA 16) (BOOM 1) (SHA 3) (GET 2) (YIP 9) (JOB 2) (WAH 1))))
(define msg-1 '(Get a job))
(encode msg-1 tree)
;result: (1 1 0 0 1 1 1 1 0 1 1 1 1 1)