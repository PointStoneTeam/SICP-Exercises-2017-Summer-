#lang scheme
 (define (type-tag datum) 
   (cond ((number? datum) datum) 
         ((pair? datum) (car datum)) 
         (else (error "Wrong datum -- TYPE-TAG" datum)))) 
  
 (define (contents datum) 
   (cond ((number? datum) datum) 
         ((pair? datum) (cadr datum)) 
         (else (error "Wrong datum -- CONTENGS" datum)))) 
  
 (define (attach-tag tag content) 
   (cond ((number? content) content) 
         ((pair? content) (cons tag content))))
