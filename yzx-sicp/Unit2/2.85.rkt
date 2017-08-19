#lang scheme
;; add into rational package 
(put 'project 'rational 
      (lambda (x) (make-scheme-number (round (/ (numer x) (denom x)))))) 
  
;; add into real package 
(put 'project 'real 
      (lambda (x)  
        (let ((rat (rationalize  
                     (inexact->exact x) 1/100))) 
          (make-rational 
            (numerator rat) 
            (denominator rat))))) 
  
;; add into complex package 
(put 'project 'complex 
      (lambda (x) (make-real (real-part x)))) 
  
(define (drop x) 
   (let ((project-proc (get 'project (type-tag x)))) 
     (if project-proc 
       (let ((project-number (project-proc (contents x)))) 
         (if (equ? project-number (raise project-number)) 
           (drop project-number) 
           x)) 
       x))) 
  
;; apply-generic 
;; the only change is to apply drop to the (apply proc (map contents args))  
(drop (apply proc (map contents args))) 
