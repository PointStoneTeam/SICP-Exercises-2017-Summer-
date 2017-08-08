#lang scheme
 (define (install-rectangular-package) 
   ;; ... 
   (put 'equ? '(rectangular rectangular) 
        (lambda (x y) (and (= (real-part x) (real-part y)) 
                           (= (imag-part x) (imag-part y))))) 
   'done) 
  
 (define (install-polar-package) 
   ;; ... 
   (put 'equ? '(polar polar) 
        (lambda (x y) (and (= (magnitude x) (magnitude y)) 
                           (= (angle x) (angle y))))) 
   'done) 
  
 (define (equ? x y) (apply-generic 'equ? x y)) 
  
 (define (install-complex-packages) 
   ;; ... 
   (put 'equ? '(complex complex) equ?) 
   'done) 
