#lang scheme
(define size-of-set length) 
(define first-in-ordered-set car) 
(define second-in-ordered-set cadr) 
(define (subset set n) 
     (if (= n 0) 
         set  
         (subset (cdr set) (- n 1))))


(define (successive-merge tree-ordered-set) 
   (if (= (size-of-set tree-ordered-set) 1) 
       (first-in-ordered-set leaf-set) 
       (let ((first (first-in-ordered-set tree-ordered-set)) 
             (second (second-in-ordered-set tree-ordered-set)) 
             (rest (subset tree-ordered-set 2))) 
         (successive-merge (adjoin-set (make-code-tree first second) 
                                       rest))))) 
  
 


(define test-tree (generate-huffman-tree '((A 3) (B 5) (C 6) (D 6)))) 
  
(encode '(A B C D) test-tree) 