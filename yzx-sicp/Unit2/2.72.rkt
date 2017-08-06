#lang racket
 (define (encode message tree)                                                       
   (if (null? message)                                                               
       '()                                                                           
       (append (encode-symbol (car message) tree)                                    
               (encode (cdr message) tree))))                                           
                                                                                     
 (define (encode-symbol symbol tree)                                                 
   (cond ((leaf? tree) '())                                                          
         ((member symbol (symbols (left-branch tree)))                             
          (cons 0 (encode-symbol symbol (left-branch tree))))                        
         ((member symbol (symbols (right-branch tree)))                            
          (cons 1 (encode-symbol symbol (right-branch tree))))                       
         (else (error "Symbol -- not in tree" symbol)))) 
  
 (define (generate-huffman-tree pairs)                                               
   (successive-merge (make-leaf-set pairs)))                                         
                                                                                     
 (define (successive-merge leaf-set)                                                 
   (if (null? (cdr leaf-set))                                                        
       (car leaf-set)                                                                
       (successive-merge (adjoin-set                                                 
                          (make-code-tree (car leaf-set)                             
                                          (cadr leaf-set))                           
                          (cddr leaf-set))))) 